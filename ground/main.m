#import <AppKit/AppKit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property(nonatomic, assign) CGFloat alpha;
@property(nonatomic, strong) NSMutableArray<dispatch_source_t> *signals;
@property(nonatomic, strong) NSMutableArray<NSWindow *> *windows;

@end

static void displayReconfigurationCallback(CGDirectDisplayID, CGDisplayChangeSummaryFlags, void *);

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	NSArray<NSString *> *args = [[NSProcessInfo processInfo] arguments];
	self.alpha = 0.2f;

	if ([args count] == 1)
		NSLog(@"trace: alpha set to '%.2f'", self.alpha);
	else if ([args count] == 2) {
		float alpha;
		NSScanner *scanner = [NSScanner scannerWithString:args[1]];

		if ([scanner scanFloat:&alpha] && [scanner isAtEnd] && alpha >= 0.0 && alpha <= 1.0)
			self.alpha = alpha;
		else {
			NSLog(@"fatal: alpha '%@' not in [0.0, 1.0]", args[1]);
			[NSApp terminate:nil];
			return;
		}
	} else {
		NSLog(@"usage: %@ [<alpha>]", args[0]);
		[NSApp terminate:nil];
		return;
	}

	[self setupSignalHandlers];

	/* Create the initial set of windows. */
	self.windows = [NSMutableArray array];
	[self createWindows];

	/* Register a callback for screen (dis)connects. */
	CGDisplayRegisterReconfigurationCallback(displayReconfigurationCallback, (__bridge void *)self);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
	/* Unregister the screen (dis)connect callback. */
	CGDisplayRemoveReconfigurationCallback(displayReconfigurationCallback, (__bridge void *)self);

	[self cleanWindows];
}

- (void)cleanWindows
{
	/* Hide all windows. */
	[self.windows makeObjectsPerformSelector:@selector(orderOut:) withObject:nil];

	/* Allow ARC to deallocate via the removal of our strong references. */
	[self.windows removeAllObjects];
}

- (void)createWindows
{
	NSLog(@"trace: window refresh initiated");

	[self cleanWindows];

	for (NSScreen *screen in [NSScreen screens]) {
		NSWindow *window = [[NSWindow alloc] initWithContentRect:screen.frame
		                                               styleMask:NSWindowStyleMaskBorderless
		                                                 backing:NSBackingStoreBuffered
		                                                   defer:NO];

		[window setBackgroundColor:[NSColor colorWithCalibratedWhite:0.0 alpha:self.alpha]];

		[window setOpaque:NO];
		[window setIgnoresMouseEvents:YES];

		/* Float windows above other windows. */
		[window setLevel:CGWindowLevelForKey(kCGOverlayWindowLevelKey)];

		/* Place the window onto all Spaces. */
		window.collectionBehavior = NSWindowCollectionBehaviorCanJoinAllSpaces
		                            | NSWindowCollectionBehaviorStationary
		                            | NSWindowCollectionBehaviorIgnoresCycle;

		[self.windows addObject:window];
		[window orderFront:nil];
	}
}

- (void)setupSignalHandlers
{
	self.signals = [NSMutableArray array];
	NSArray<NSNumber *> *handledSignals = @[ @(SIGHUP), @(SIGINT), @(SIGTERM), @(SIGQUIT) ];

	for (NSNumber *signalNumber in handledSignals) {
		int sig = [signalNumber intValue];

		/* Listen for signals via a GCD dispatch. */
		dispatch_source_t source =
		    dispatch_source_create(DISPATCH_SOURCE_TYPE_SIGNAL, (uintptr_t)sig, 0, dispatch_get_main_queue());

		dispatch_source_set_event_handler(source, ^{
		  NSLog(@"trace: caught signal '%d'", sig);
		  [NSApp terminate:nil];
		});

		/* Ignore the signal at the C level to allow the dispatch to
		 * handle it. */
		signal(sig, SIG_IGN);

		[self.signals addObject:source]; /* Keep the source alive. */
		dispatch_resume(source);         /* Monitor the source. */
	}
}

@end

static void displayReconfigurationCallback(
    __unused CGDirectDisplayID display, __unused CGDisplayChangeSummaryFlags flags, void *userInfo
)
{
	NSLog(@"trace: display reconfiguration received");

	AppDelegate *delegate = (__bridge AppDelegate *)userInfo;

	/* Dispatch to the main thread. */
	dispatch_async(dispatch_get_main_queue(), ^{
	  [delegate createWindows];
	});
}

int main(void)
{
	NSLog(@"trace: program initiated");

	@autoreleasepool {
		NSApplication *application = [NSApplication sharedApplication];
		AppDelegate *delegate = [[AppDelegate alloc] init];
		application.delegate = delegate;
		[application run];
	}
}
