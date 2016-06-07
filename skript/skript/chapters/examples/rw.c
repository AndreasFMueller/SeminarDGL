/*
 * rw.c -- Loesung des Randwertproblems mit der GSL
 *
 * (c) 2016 Prof Dr Andreas Mueller, Hochschule Rapperswil
 */
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <gsl/gsl_errno.h>
#include <gsl/gsl_odeiv2.h>

static double	g = 9.81;

static long	fcounter = 0;

static int	f(double x, const double y[], double f[], void *params) {
	fcounter++;
	double	g = *(double *)params;
	f[0] =  y[2];
	f[1] =  y[3];
	f[2] =     0;
	f[3] =    -g;
	return GSL_SUCCESS;
}

static long	dfcounter = 0;

static int	df(double x, const double y[], double *dfdy, double dfdx[],
			void *params) {
	dfcounter++;

	dfdy[0 * 4 + 0] = 0;
	dfdy[1 * 4 + 0] = 0;
	dfdy[2 * 4 + 0] = 0;
	dfdy[3 * 4 + 0] = 0;

	dfdy[0 * 4 + 1] = 0;
	dfdy[1 * 4 + 1] = 0;
	dfdy[2 * 4 + 1] = 0;
	dfdy[3 * 4 + 1] = 0;

	dfdy[0 * 4 + 2] = 1;
	dfdy[1 * 4 + 2] = 0;
	dfdy[2 * 4 + 2] = 0;
	dfdy[3 * 4 + 2] = 0;

	dfdy[0 * 4 + 3] = 0;
	dfdy[1 * 4 + 4] = 1;
	dfdy[2 * 4 + 4] = 0;
	dfdy[3 * 4 + 4] = 0;

	dfdx[0] = 0;
	dfdx[1] = 0;
	dfdx[2] = 0;
	dfdx[3] = 0;

	return GSL_SUCCESS;
}

static long	Fcounter = 0;

static int	F(double x, const double J[], double F[], void *params) {
	Fcounter++;
	for (int i = 0; i < 2; i++) {
		for (int j = 0; j < 4; j++) {
			F[i * 4 + j] = J[(i + 2) * 4 + j];
		}
	}
	for (int i = 2; i < 4; i++) {
		for (int j = 0; j < 4; j++) {
			F[i * 4 + j] = 0;
		}
	}
	return GSL_SUCCESS;
}

int	main(int argc, char *argv[]) {
	gsl_odeiv2_system	system = { f, df, 4, &g };
	gsl_odeiv2_system	Jsystem = { F, NULL, 16, NULL };

	gsl_odeiv2_driver	*driver
		= gsl_odeiv2_driver_alloc_y_new(&system, gsl_odeiv2_step_rk8pd,
			1e-6, 1e-6, 0.0);
	gsl_odeiv2_driver	*Jdriver
		= gsl_odeiv2_driver_alloc_y_new(&Jsystem, gsl_odeiv2_step_rk8pd,
			1e-6, 1e-6, 0.0);
	

	double	t = 0.0;
	double	vx = 8;
	double	vy = 7;
	double	tnext = 20 / vx;
	double	delta;
	int	counter = 0;
	printf(" n     v_y        t        x        y        dy/dv_y        vynew          delta\n");
	do {
		
		// compute the solution up to x = 1.5
		t = 0;
		double	y[4] = { 0.0, 0.0, vx, vy };
		int	status = gsl_odeiv2_driver_apply(driver, &t, tnext, y);
		if (status != GSL_SUCCESS) {
			fprintf(stderr, "error: return value = %d\n", status);
		}

		// compute the jacobi matrix up to x = 1.5
		t = 0;
		double	J[16] = {	1.0, 0.0, 0.0, 0.0,
					0.0, 1.0, 0.0, 0.0,
					0.0, 0.0, 1.0, 0.0,
					0.0, 0.0, 0.0, 1.0 };
		status = gsl_odeiv2_driver_apply(Jdriver, &t, tnext, J);
		if (status != GSL_SUCCESS) {
			fprintf(stderr, "error: return value = %d\n", status);
		}

		// the derivative is J_{24}
		double	 derivative = J[1 * 4 + 3];

		// compute the newton correction
		double	vynew = vy - y[1] / derivative;
		delta = vy - vynew;
		printf("%2d%8.4f %8.4f %8.4f %10.6f %12.8f %12.8f %14.10f\n",
			 counter, vy, t, y[0], y[1], derivative, vynew, delta);
		vy = vynew;
		counter++;
	} while ((fabs(delta) > 1e-6) && (counter <= 50));
	printf("calls to f: %ld, to df: %ld, to F: %ld\n",
		fcounter, dfcounter, Fcounter);
	return EXIT_SUCCESS;
}
