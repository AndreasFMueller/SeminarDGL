double  x = 0.0;
double  y[2] = { 0.0, 0.0 };
long    lastcounter = evalcounter;
for (int i = 1; i <= 10000; i++) {
        double  xnext = i;
        int     status = gsl_odeiv2_driver_apply(driver, &x, xnext, y);
        if (status != GSL_SUCCESS) {
                fprintf(stderr, "error: return value = %d\n", status);
                return EXIT_FAILURE;
        }
        /* Output */
        ...
}
