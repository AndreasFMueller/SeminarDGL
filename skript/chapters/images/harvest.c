/*
 * harvest.c -- compute solutions of harvest equation
 *
 * (c) 2016 Prof Dr Andreas Mueller,  Hochschule Rapperswil
 */
#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <gsl/gsl_errno.h>
#include <gsl/gsl_odeiv2.h>

typedef struct param_s {
	double	a;
	double	h;
} param_t;

param_t	p0 = { .a = 5, .h = 0.8 };

int	f(double x, const double y[], double f[], void *params) {
	param_t	*p = (param_t *)params;
	f[0] = p->a * y[0] * (1 - y[0]) - p->h * (1 + sin(2 * M_PI * x));
	return GSL_SUCCESS;
}

int	singlecurve(FILE *out, const char *name, double x0, double y0,
		int direction) {
	printf("%s: %f\n", name, y0);
	gsl_odeiv2_system	system = { f, NULL, 1, &p0 };
	gsl_odeiv2_driver	*driver
		= gsl_odeiv2_driver_alloc_y_new(&system, gsl_odeiv2_step_rk8pd,
			1e-6 * direction, 1e-6, 0.0);
	fprintf(out, "path %s;\n", name);
	double	x = x0;
	double	y[1] = { y0 };
	fprintf(out, "%s = (%.3f,%.3f)", name, x, y[0]);
	for (int i = 1; i < 500; i++) {
		double	xnext = x + 0.01 * direction;
		int	status = gsl_odeiv2_driver_apply(driver, &x, xnext, y);
		if (status != GSL_SUCCESS) {
			fprintf(stderr, "error: rc = %d\n", status);
			fprintf(out, ";\n");
			return -1;
		}
		if (fabs(y[0]) > 100) {
			goto end;
		}
		fprintf(out, "\n    --(%.3f,%.3f)", x, y[0]);
	}
end:
	fprintf(out, ";\n");
	gsl_odeiv2_driver_free(driver);
	return 1;
}

int	centercurve(FILE *out, const char *name, double y0) {
	printf("%s: %f\n", name, y0);
	gsl_odeiv2_system	system = { f, NULL, 1, &p0 };
	gsl_odeiv2_driver	*driver
		= gsl_odeiv2_driver_alloc_y_new(&system, gsl_odeiv2_step_rk8pd,
			-1e-6, 1e-6, 0.0);
	fprintf(out, "path %s;\n", name);
	double	x = 2.5;
	double	y[1] = { y0 };
	// integrate backwards to the initial value
	int	status = gsl_odeiv2_driver_apply(driver, &x, 0, y);
	gsl_odeiv2_driver_free(driver);
	driver = gsl_odeiv2_driver_alloc_y_new(&system, gsl_odeiv2_step_rk8pd,
			1e-6, 1e-6, 0.0);
	if (fabs(y[0]) > 100) {
		goto end;
	}
	fprintf(out, "%s = (%.3f,%.3f)", name, x, y[0]);
	for (int i = 1; i < 501; i++) {
		double	xnext = x + 0.01;
		int	status = gsl_odeiv2_driver_apply(driver, &x, xnext, y);
		if (status != GSL_SUCCESS) {
			fprintf(stderr, "error: rc = %d\n", status);
			fprintf(out, ";\n");
			return -1;
		}
		if (fabs(y[0]) > 100) {
			goto end;
		}
		fprintf(out, "\n    --(%.3f,%.3f)", x, y[0]);
	}
end:
	fprintf(out, ";\n");
	gsl_odeiv2_driver_free(driver);
	return 1;
}

int	limitcurve(FILE *out, const char *name, int direction) {
	gsl_odeiv2_system	system = { f, NULL, 1, &p0 };
	gsl_odeiv2_driver	*driver
		= gsl_odeiv2_driver_alloc_y_new(&system, gsl_odeiv2_step_rk8pd,
			direction * 1e-6, 1e-6, 0.0);
	double	x = 0;
	double	y[1] = { 0.5 };
	double	xnext = 1000 * direction;
	int	status = gsl_odeiv2_driver_apply(driver, &x, xnext, y);
	printf("integration from %f to %f: %f (%d)\n", x, xnext, y[0], status);
	gsl_odeiv2_driver_free(driver);
	// now use this as the initial value
	singlecurve(out, name, 2.5 * (1 - direction), y[0], direction);
}

int	main(int argc, char *argv[]) {

	FILE	*out = fopen("harvest.mp", "w");
	char	suffix = 'a';
	char	curvename[10];
	for (int i = 0; i < 5; i++) {
		snprintf(curvename, sizeof(curvename), "path%c", suffix++);
		double	y0 = 0.7 + 0.2 * i;
		singlecurve(out, curvename, 0, y0, 1);
	}
	snprintf(curvename, sizeof(curvename), "path%c", suffix++);
	singlecurve(out, curvename, 0, 0.318, 1);
	snprintf(curvename, sizeof(curvename), "path%c", suffix++);
	singlecurve(out, curvename, 0, 0.315, 1);
	snprintf(curvename, sizeof(curvename), "path%c", suffix++);
	singlecurve(out, curvename, 0, 0.300, 1);
	for (int i = 0; i < 5; i++) {
		snprintf(curvename, sizeof(curvename), "path%c", suffix++);
		double	y0 = 0.3 - 0.2 * i;
		singlecurve(out, curvename, 5, y0, -1);
	}
	snprintf(curvename, sizeof(curvename), "path%c", suffix++);
	singlecurve(out, curvename, 5, 0.892, -1);
	snprintf(curvename, sizeof(curvename), "path%c", suffix++);
	singlecurve(out, curvename, 5, 0.895, -1);
	snprintf(curvename, sizeof(curvename), "path%c", suffix++);
	singlecurve(out, curvename, 5, 0.91, -1);
	for (int i = -3; i <= 3; i++) {
		snprintf(curvename, sizeof(curvename), "path%c", suffix++);
		double	y0 = 0.395 + 0.0945 * i;
		centercurve(out, curvename, y0);
	}

	snprintf(curvename, sizeof(curvename), "path%c", suffix++);
	limitcurve(out, curvename, -1);
	snprintf(curvename, sizeof(curvename), "path%c", suffix++);
	limitcurve(out, curvename, 1);

	fclose(out);

	return EXIT_SUCCESS;
}
