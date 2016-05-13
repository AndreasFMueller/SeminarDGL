/*
 * cube.c -- solutions of a cubic system
 *
 * (c) 2016 Prof Dr Andreas Mueller, Hochschule Rapperswil
 */
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <gsl/gsl_errno.h>
#include <gsl/gsl_odeiv2.h>

int	f(double x, const double y[], double f[], void *params) {
	f[0] = (y[0] - 1) * y[0] * (y[0] + 1);
	return GSL_SUCCESS;
}

int	singlecurve(FILE *out, const char *name, double x0, double y0) {
	printf("%s: %f\n", name, y0);
	gsl_odeiv2_system	system = { f, NULL, 1, NULL };
	gsl_odeiv2_driver	*driver
		= gsl_odeiv2_driver_alloc_y_new(&system, gsl_odeiv2_step_rk8pd,
			1e-6, 1e-6, 0.0);
	fprintf(out, "path %s;\n", name);
	double	x = x0;
	double	y[1] = { y0 };
	fprintf(out, "%s = (%.3f,%.3f)", name, x, y[0]);
	for (int i = 1; i <= 400; i++) {
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

int	centercurve(FILE *out, const char *name, double y0) {
	gsl_odeiv2_system	system = { f, NULL, 1, NULL };
	gsl_odeiv2_driver	*driver
		= gsl_odeiv2_driver_alloc_y_new(&system, gsl_odeiv2_step_rk8pd,
			-1e-6, 1e-6, 0.0);
	double	x = 0;
	double	y[1] = { y0 };
	double	xnext = -2;
	// integrate backwards to the initial value
	int	status = gsl_odeiv2_driver_apply(driver, &x, xnext, y);
	gsl_odeiv2_driver_free(driver);
	driver = gsl_odeiv2_driver_alloc_y_new(&system, gsl_odeiv2_step_rk8pd,
			1e-6, 1e-6, 0.0);
/*
	if (fabs(y[0]) > 100) {
		return -1;
	}
*/
	singlecurve(out, name, -2, y[0]);
	return 1;
}

int	main(int argc, char *argv[]) {
	FILE	*out = fopen("cube.mp", "w");
	char	suffix = 'a';
	char	pathname[6];

	for (int i = 0; i < 16; i++) {
		double	y0 = -1.5 + i * 0.2;
		snprintf(pathname, sizeof(pathname), "path%c", suffix++);
		centercurve(out, pathname, y0);
	}
		
	return EXIT_SUCCESS;
}
