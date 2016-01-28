/*
 * dgl.c -- Loesung einer DGL mit der GNU scientific library
 *
 * (c) 2016 Prof Dr Andreas Mueller, Hochschule Rapperswil 
 */
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <gsl/gsl_errno.h>
#include <gsl/gsl_odeiv2.h>

int	f(double x, const double y[], double f[], void *params) {
	double	omega = *(double *)params;
	f[0] = y[0];
	f[1] = -y[1] + sin(omega * x);
	return GSL_SUCCESS;
}

int	main(int argc, char *argv[]) {
	double	omega = 0.1;
	gsl_odeiv2_system	sys = { f, NULL, 2, &omega };
	gsl_odeiv2_driver	*driver
		= gsl_odeiv2_driver_alloc_y_new(&sys, gsl_odeiv2_step_rk8pd,
			1e-6, 1e-6, 0.0);
	double	x = 0.0;
	double	y[2] = { 0.0, 0.0 };
	for (int i = 1; i <= 10000; i++) {
		double	xnext = i;
		int	status = gsl_odeiv2_driver_apply(driver, &x, xnext, y);
		if (status != GSL_SUCCESS) {
			fprintf(stderr, "error: return value = %d\n", status);
		}
		double yexakt = (omega * sin(x) - sin(omega * x))
					/ (omega*omega-1);
		double delta = y[0] - yexakt;
		printf("%5.0f %12.8f %12.8f %12.8f\n",
			 x,    y[0],  yexakt, delta);
	}
	return EXIT_SUCCESS;
}
