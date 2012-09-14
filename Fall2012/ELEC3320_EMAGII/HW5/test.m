%% Test
clear all
clc
syms etta sigma
u_0     = pi*4e-7;
alpha   = 100;
beta    = alpha;
f       = 100e6;
w       = 2*pi*f;
epsln_0 = 1e-9/(36*pi);
% epsln = epsln_0 * epsln_r;

eqn1 = etta - sqrt( (1j * w * u_0)/sigma )
eqn2 = alpha - sqrt(pi * f * u_0 * sigma)
sol = solve(eqn1,eqn2);
etta = eval(sol.etta)
etta_mag = abs(etta)
etta_ang = degrees(angle(etta))
sigma = eval(sol.sigma)

