# See <https://github.com/jnurmine/Zenburn/blob/master/colors/zenburn.vim>.
# Each face is commented with its respective Vim highlighter, if applicable.
# If manipulations are mentioned without a face given, the manipulation is performed on `Normal`.

# Vanilla Kakoune.

# set-face global Default                        rgb:dcdccc,rgb:3f3f3f     # `Normal`; for transparency, comment out if your termcolors match.
set-face global PrimarySelection                 ,rgb:727272+g             # `<bg>` piped to `pastel lighten 0.2`.
set-face global SecondarySelection               ,rgb:585858+g             # `<bg>` piped to `pastel lighten 0.1`.
set-face global PrimaryCursor                    rgb:000d18,rgb:8faf9f+fg  # `Cursor`, with no bold.
set-face global SecondaryCursor                  rgb:000d18,rgb:719a86+fg  # `cursor`, with no bold, and with `<bg>` piped to `pastel darken 0.1`.
set-face global PrimaryCursorEol                 PrimaryCursor
set-face global SecondaryCursorEol               SecondaryCursor
# set-face global LineNumbers                    rgb:5d6262,rgb:353535     # `LineNr`, with `zenburn_subdued_lineNr` enabled; uncomment and comment the line below for non-transparent line numbers.
set-face global LineNumbers                      rgb:767c7c                # As above, but with `<fg>` piped to `pastel lighten 0.1`, to account for the darker-background.
set-face global LineNumberCursor                 rgb:d2d39b,rgb:262626     # `CursorLineNr`.
set-face global LineNumbersWrapped               rgb:353535@LineNumbers    # `LineNr`, with `zenburn_subdued_lineNr` enabled, and `<fg>` set to `<bg>`.
set-face global MenuForeground                   rgb:d0d0a0,rgb:242424+b   # `PmenuSel`.
set-face global MenuBackground                   rgb:9f9f9f,rgb:2c2e2e     # `Pmenu`.
set-face global MenuInfo                         rgb:d2d2d2@MenuBackground # `Pmenu`, with `<fg>` piped to `pastel lighten 0.2`.
set-face global Information                      ,,
set-face global InlineInformation                MenuInfo
set-face global Error                            rgb:e37170,rgb:664040+b   # `ErrorMsg`, with `zenburn_alternative_Error` enabled.
set-face global DiagnosticError                  ,,rgb:e37170+c            # A curly underline colored via `<fg>` from `ErrorMsg`.
set-face global DiagnosticWarning                ,,rgb:f0dfaf+c            # A curly underline colored via `<fg>` from `Conditional`.
# set-face global StatusLine                     rgb:ccdc90,rgb:313633     # `StatusLine`; uncomment and comment the line below for a green statusline.
set-face global StatusLine                       ,,
set-face global StatusLineMode                   rgb:ffcfaf                # `ModeMsg`.
set-face global StatusLineInfo                   rgb:a78198                # `<fg>` from `SpellRare`, piped to `pastel desaturate 0.2`.
set-face global StatusLineValue                  rgb:848484                # `<fg>` from `SpellCap`, piped to `pastel lighten 0.2`.
set-face global StatusCursor                     PrimaryCursor
set-face global Prompt                           ,,
set-face global MatchingChar                     rgb:ffffe0,rgb:284f28+b   # `MatchParen`.
set-face global Whitespace                       rgb:c7c7ae                # `<fg>` piped to `pastel darken 0.1`.
set-face global WrapMarker                       rgb:93b3a3                # `FoldColumn`.
set-face global BufferPadding                    rgb:5b605e+Fb             # `NonText`.

set-face global title                            rgb:efefef+b              # `Title`.
set-face global header                           rgb:efefef+i              # `Title`, with italics rather than bold.
set-face global mono                             ,rgb:585858               # `<bg>` piped to `pastel lighten 0.1`.
set-face global block                            rgb:cc9393                # `String`.
set-face global link                             +u
set-face global bullet                           rgb:e89393                # `Tag`.
set-face global list                             ,,

# LSP.

set-face global DiagnosticHint                   ,,rgb:bc6c9c+c            # A curly underline colored via `<fg>` from `SpellRare`.
set-face global DiagnosticInfo                   ,,rgb:6c6c9c+c            # A curly underline colored via `<fg>` from `SpellCap`.
set-face global DiagnosticTagDeprecated          +s
set-face global DiagnosticTagUnnecessary         rgb:b2b28f                # `<fg>` piped to `pastel darken 0.2`.
set-face global InlayDiagnosticError             rgb:e37170                # `<fg>` from `ErrorMsg`.
set-face global InlayDiagnosticHint              rgb:bc6c9c                # `<fg>` from `SpellRare`.
set-face global InlayDiagnosticInfo              rgb:6c6c9c                # `<fg>` from `SpellCap`.
set-face global InlayDiagnosticWarning           rgb:f0dfaf                # `<fg>` from `Conditional`.
set-face global LineFlagError                    InlayDiagnosticError
set-face global LineFlagHint                     InlayDiagnosticHint
set-face global LineFlagInfo                     InlayDiagnosticInfo
set-face global LineFlagWarning                  InlayDiagnosticWarning
set-face global Reference                        MatchingChar
set-face global ReferenceBind                    +u@Reference
set-face global InlayHint                        rgb:82a282+i              # `SpecialComment`, with `zenburn_italic_Comment` enabled, but with no bold.
set-face global InlayCodeLens                    InlayHint

set-face global InfoDefault                      ,,
set-face global InfoBlock                        block
set-face global InfoBlockQuote                   InfoBlock
set-face global InfoBullet                       bullet
set-face global InfoHeader                       header
set-face global InfoLink                         link
set-face global InfoLinkMono                     InfoMono
set-face global InfoMono                         mono
set-face global InfoRule                         rgb:2e3330,rgb:688060     # `VertSplit`.
set-face global InfoDiagnosticError              InlayDiagnosticError
set-face global InfoDiagnosticHint               InlayDiagnosticHint
set-face global InfoDiagnosticInformation        InlayDiagnosticInfo
set-face global InfoDiagnosticWarning            InlayDiagnosticWarning

# Tree-sitter.

set-face global ts_attribute                     rgb:cfbfaf                # `Special`.
set-face global ts_comment                       rgb:7f9f7f+i              # `Comment`, with `zenburn_italic_Comment` enabled.
set-face global ts_comment_block                 ts_comment
set-face global ts_comment_line                  ts_comment
set-face global ts_conceal                       rgb:8f8f8f,rgb:484848     # `Conceal`.
set-face global ts_constant                      rgb:dca3a3+b              # `Constant`.
set-face global ts_constant_builtin_boolean      rgb:dca3a3                # `Boolean`.
set-face global ts_constant_character            rgb:dca3a3+b              # `Character`.
set-face global ts_constant_character_escape     rgb:dca3a3+b              # `SpecialChar`.
set-face global ts_constant_macro                rgb:ffcfaf+b              # `Macro`.
set-face global ts_constant_numeric              rgb:8cd0d3                # `Number`.
set-face global ts_constant_numeric_float        rgb:c0bed1                # `Float`.
set-face global ts_constant_numeric_integer      ts_constant_numeric
set-face global ts_constructor                   ts_function
set-face global ts_diff_plus                     rgb:709080,rgb:313c36+b   # `DiffAdd`.
set-face global ts_diff_minus                    rgb:ecbcbc,rgb:41363c+b   # `DiffText`.
set-face global ts_diff_delta                    ,rgb:333333               # `DiffChange`.
set-face global ts_diff_delta_moved              ,rgb:4d4d4d               # `DiffChange`, with `<bg>` piped to `pastel lighten 0.1`.
set-face global ts_error                         InlayDiagnosticError
set-face global ts_function                      rgb:efef8f                # `Function`.
set-face global ts_function_builtin              ts_function
set-face global ts_function_macro                rgb:ffcfaf+b              # `Macro`.
set-face global ts_function_method               ts_function
set-face global ts_function_method_private       ts_function
set-face global ts_function_special              ts_function
set-face global ts_hint                          InlayDiagnosticHint
set-face global ts_info                          InlayDiagnosticInfo
set-face global ts_keyword                       rgb:f0dfaf+b              # `Keyword`.
set-face global ts_keyword_control               ts_keyword
set-face global ts_keyword_conditional           rgb:f0dfaf+b              # `Conditional`.
set-face global ts_keyword_control_conditional   ts_keyword_conditional
set-face global ts_keyword_control_directive     ts_keyword_directive
set-face global ts_keyword_control_import        ts_keyword_control_directive
set-face global ts_keyword_control_repeat        rgb:ffd7a7+b              # `Repeat`.
set-face global ts_keyword_control_return        rgb:e3ceab                # `Statement`.
set-face global ts_keyword_control_except        rgb:c3bf9f+b              # `Exception`.
set-face global ts_keyword_control_exception     ts_keyword_control_except
set-face global ts_keyword_directive             rgb:ffcfaf+b              # `PreProc`.
set-face global ts_keyword_function              ts_keyword
set-face global ts_keyword_operator              rgb:f0efd0                # `Operator`.
set-face global ts_keyword_special               rgb:cfbfaf                # `Special`.
set-face global ts_keyword_storage               rgb:c3bf9f+b              # `StorageClass`.
set-face global ts_keyword_storage_modifier      ts_keyword_storage
set-face global ts_keyword_storage_modifier_mut  ts_keyword_storage
set-face global ts_keyword_storage_modifier_ref  ts_keyword_storage
set-face global ts_keyword_storage_type          rgb:dfdfbf+b              # `Type`.
set-face global ts_label                         rgb:efdcbc                # `Identifier`.
set-face global ts_markup_bold                   +b
set-face global ts_markup_heading                header
set-face global ts_markup_heading_1              ts_markup_heading
set-face global ts_markup_heading_2              rgb:e2e2e2+i              # As above, but with `<fg>` piped to `pastel darken 0.05`.
set-face global ts_markup_heading_3              rgb:d5d5d5+i              # ... `pastel darken 0.10`.
set-face global ts_markup_heading_4              rgb:c9c9c9+i              # ... `pastel darken 0.15`.
set-face global ts_markup_heading_5              rgb:bcbcbc+i              # ... `pastel darken 0.20`.
set-face global ts_markup_heading_6              rgb:afafaf+i              # ... `pastel darken 0.25`.
set-face global ts_markup_heading_marker         rgb:e89393                # `Tag`.
set-face global ts_markup_italic                 +i
set-face global ts_markup_list_checked           rgb:cfbfaf                # `Special`.
set-face global ts_markup_list_numbered          list
set-face global ts_markup_list_unchecked         rgb:cfbfaf                # `Special`.
set-face global ts_markup_list_unnumbered        list
set-face global ts_markup_link_label             +u
set-face global ts_markup_link_url               +u
set-face global ts_markup_link_uri               +u
set-face global ts_markup_link_text              +u
set-face global ts_markup_quote                  ts_string
set-face global ts_markup_raw                    mono
set-face global ts_markup_raw_block              ,,
set-face global ts_markup_raw_inline             ts_markup_raw
set-face global ts_markup_strikethrough          +s
set-face global ts_namespace                     rgb:efdcbc                # `Identifier`.
set-face global ts_operator                      rgb:f0efd0                # `Operator`.
set-face global ts_property                      rgb:efdcbc                # `Identifier`.
set-face global ts_punctuation                   rgb:8f8f8f                # `Delimiter.
set-face global ts_punctuation_bracket           ts_punctuation
set-face global ts_punctuation_delimiter         ts_punctuation
set-face global ts_punctuation_special           ts_punctuation
set-face global ts_special                       rgb:cfbfaf                # `Special`.
set-face global ts_spell                         rgb:dc8c6c                # `SpellBad`.
set-face global ts_string                        rgb:cc9393                # `String`.
set-face global ts_string_regex                  ts_string
set-face global ts_string_regexp                 ts_string
set-face global ts_string_escape                 ts_string
set-face global ts_string_special                ts_string
set-face global ts_string_special_path           ts_string
set-face global ts_string_special_symbol         ts_string_symbol
set-face global ts_string_symbol                 ts_constant_character_escape
set-face global ts_tag                           rgb:e89393                # `Tag`.
set-face global ts_tag_error                     InlayDiagnosticError
set-face global ts_text                          ,,
set-face global ts_text_title                    title
set-face global ts_type                          rgb:dfdfbf+b              # `Type`.
set-face global ts_type_builtin                  ts_type
set-face global ts_type_enum_variant             ts_type
set-face global ts_unknown                       ,,
set-face global ts_variable                      rgb:efdcbc                # `Identifier`.
set-face global ts_variable_builtin              ts_variable
set-face global ts_variable_other_member         ts_variable
set-face global ts_variable_other_member_private ts_variable
set-face global ts_variable_parameter            ts_variable
set-face global ts_warning                       InlayDiagnosticWarning
