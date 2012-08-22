% Problem 6.15
% Applied Electromagnetics - Wentworth
% 2012/08/21

perc_err = 0.02;

epsln_0 = 1e-9/(36*pi);
epsln_r1 = 3;
epsln_r2 = 0.015;
epsln = epsln_0*(epsln_r1 + 1j*epsln_r2);

mu_0    = 4*pi*1e-7;
mu_r    = 1;
mu      = mu_0 * mu_r;

sigma   = 1e-3;

f       = 1:1:1e9;
w = 2*pi*f;

% Method using eqn. 6.52
alpha_1 = w*sqrt((mu*epsln/2)*sqrt(1+(sigma/(w*epsln)^2))-1)

% Method using eqn 6.54
alpha_2 = (sigma/2)*sqrt(mu/epsln)
