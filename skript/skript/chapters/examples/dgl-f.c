int f(double x, const double y[], double f[], void *params) {
        double  omega = *(double *)params;
        f[0] = y[1];
        f[1] = -y[0] + sin(omega * x);
        return GSL_SUCCESS;
}
