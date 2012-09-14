% HW 5
% Assigned Problem 3
% Baginski Problem 1
% 2012/08/28
clc;
clear all;
fprintf('\nBaginski HW 5, Problem 3\n');
fprintf('Markus Kreitzer\n');
fprintf('%s\n\n',date);

%% Constants
c         = 2.998e8; % (m/s)
epsln_0   = (1e-9/(36*pi));
u_0         = pi*4e-7;
f         = 100e6; % (100 MHz)
w         = 2*pi*f;

%% Code
syms etta sigma
alpha   = 100;
beta    = alpha;
% epsln = epsln_0 * epsln_r;

eqn1 = etta - sqrt( (1j * w * u_0)/sigma );
eqn2 = alpha - sqrt(pi * f * u_0 * sigma);
sol = solve(eqn1,eqn2);
etta = eval(sol.etta);
sigma = eval(sol.sigma);
E0 = 10;
H0 = E0/abs(etta);
fprintf('\tH = %0.2f * exp(-%0.2f * z) * exp(-j * %0.2f) * exp(j * %0.2f) * -a_y\n',H0,alpha,beta,degrees(angle(etta)));
Pavg = 0.5 * E0^2 / abs(etta);
fprintf('\tPavg = %0.2f\n',Pavg);

