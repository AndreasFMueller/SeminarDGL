double  omega = 0.1;	/* Parameter fuer f */
gsl_odeiv2_system       system = { f, NULL, 2, &omega }; /* DG-System */
gsl_odeiv2_driver       *driver
        = gsl_odeiv2_driver_alloc_y_new(&system, gsl_odeiv2_step_rk8pd,
                1e-6, 1e-6, 0.0);
