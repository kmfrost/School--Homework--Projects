% HW 5
% Assigned Problem 1
% Baginski Problem 1
% 2012/08/28
clc;
clear all;
fprintf('\nBaginski Problem 1\n');
fprintf('Markus Kreitzer\n');
fprintf('%s\n\n',date);
%% Constants
c         = 2.998e8; % (m/s)
epsln_0   = (1e-9/(36*pi));
u_0         = pi*4e-7;
f         = 100e6; % (100 MHz)
w         = 2*pi*f;

%% Code
% Region 1
epsln_1r   = 72;
epsln_1     = epsln_0 * epsln_1r;
u_r       = 1;
u_1         = u_r*u_0;
sigma_1   = 5;
gamma_1     = sqrt(1j * w * u_1 * (sigma_1 + 1j * w * epsln_1));
alpha_1     = real(gamma_1);
beta_1      = imag(gamma_1);
etta_1      = sqrt((1j*w*u_1)/(sigma_1 + 1j*w*epsln_1));

fprintf('a) Region 1:\n\talpha:\t%f\n\tbeta:\t%f\n\n',alpha_1,beta_1);

fprintf('b) Phasor Form of H-incident:\n');

syms z;
E0 = 2;
E  = [0;E0*exp(-alpha_1*z)*exp(-1j*beta_1*z);0] %Vector Form of E-incident
H  = cross((1/etta_1)*[0;0;1],E)


% Region 2
epsln_2  = 1;
sigma    = 0;
u_r      = 1;


