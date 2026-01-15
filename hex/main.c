#include <stdio.h>
#include <stdlib.h>

#define B 6

#define ux 0.5000000000000000f
#define uy 1.7320508075688772f
#define uY 0.8660254037844386f

struct Move { float x, y; } ms[B] = {
    {  ux ,  uY },
    {  1  ,  0  },
    {  ux , -uY },
    { -ux , -uY },
    { -1  ,  0  },
    { -ux ,  uY },
};

int r(void)
{
	int limit = RAND_MAX - (RAND_MAX % B), result = 0;
	do result = rand(); while (result >= limit);
	return result % B;
}

#define F(f, r)                                                                                                                         \
	int f(struct Move m)                                                                                                            \
	{                                                                                                                               \
		float dx = m.x / (float)(r), dy = m.y / (float)(r);                                                                     \
		return dy >= -uY && dy <= uY && uy * dx + uy >= dy && uy * dx - uy <= dy && -uy * dx + uy >= dy && -uy * dx - uy <= dy; \
	}

F(f, 2)
F(g, 4)

#undef F

#define M 1048576
#define N 1048576

#define mu(...) ((float)(__VA_ARGS__) / (float)M)
#define over(x, a, b) for (size_t (x) = (a); (x) < (b); (x) += 1)

int main(void)
{
	srand(42);

	size_t *F = calloc(M + 1, sizeof *F), *G = calloc(M + 1, sizeof *G);
	struct Move m = {0}; float x = 0, y = 0; int ff = 0;

	over (i, 0, M) { ff = 0; x = 0; y = 0; over (j, 1, N) {
		m = ms[r()]; x += m.x; y += m.y; m = (struct Move){.x = x, .y = y};
		if (!g(m))        { G[i] = j; break; }
		if (!f(m) && !ff) { F[i] = j; ff = 1; }
	}}

	over (i, 0, M) { F[M] += F[i]; G[M] += G[i]; }
	printf("radius := 2 => %f\nradius := 4 => %f\n", mu(F[M]), mu(G[M]));

	free(F); free(G);
}
