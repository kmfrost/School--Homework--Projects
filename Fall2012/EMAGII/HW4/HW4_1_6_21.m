% HW 4
% Assigned Problem 3
% Wentworth Problem 6.21
% 2012/08/26
clc;
clear all;
fprintf('\nWentworth Problem 6.21\n');
fprintf('Markus Kreitzer\n');
fprintf('%s\n\n',date);
%% Constants
c         = 2.998e8; % (m/s)
epsln_0   = 1e-9/(36*pi);
u_0         = 4*pi*1e-7;
f         = 10e6; % (10 MHz)
w         = 2*pi*f;

%% Code
% Region 1
epsln_r   = 72;
epsln     = epsln_0 * epsln_r;
u_r       = 1;
u         = u_r*u_0;
sigma_1   = 5;
gamma     = sqrt(1j * w * u * (sigma + 1j * w * epsln));
alpha     = real(gamma);
beta      = imag(gamma);

fprintf('a) Region 1:\n\talpha:\t%f\n\tbeta:\t%f\n',alpha,beta);



% Region 2
epsln_2  = 1;
sigma    = 0;
u_r      = 1;


