% HW 5
% Assigned Problem 1
% Baginski Problem 1
% 2012/08/28
clc;
clear all;
fprintf('\nBaginski: HW 5, Problem 1\n');
fprintf('Markus Kreitzer\n');
fprintf('%s\n\n',date);
%% Constants
c         = 2.998e8; % (m/s)
epsln_0   = 1e-9/(36*pi);
u_0         = 4*pi*1e-7;
f         = 10e6; % (10 MHz)
w         = 2*pi*f;

% Code
%% Region 1
epsln_1r   = 72;
epsln_1     = epsln_0 * epsln_1r;
u_r       = 1;
u_1         = u_r*u_0;
sigma_1   = 5;
gamma_1     = sqrt(1j * w * u_1 * (sigma_1 + 1j * w * epsln_1));
alpha_1     = real(gamma_1);
beta_1      = imag(gamma_1);
etta_1      = sqrt((1j*w*u_1)/(sigma_1 + 1j*w*epsln_1));

fprintf('a) Region 1:\n\talpha:\t%0.2f\n\tbeta:\t%0.2f\n\n',alpha_1,beta_1);
fprintf('\n Since alpha is approx. equal to beta, we can conclude that the\n');
fprintf(' material in Region 1 is a good conductor.\n\n');

fprintf('b) Phasor Form of H-incident:\n\n');
fprintf('  Step 1: Find etta:\n');
fprintf('\t\tetta: %0.2f angle %0.2f degrees (approx. 45 degrees)\n\n',abs(etta_1),degrees(angle(etta_1)));

% Exact Matlab Solution gives some ugly numbers so we'll just do it
% manually.
% syms z;
E0 = 2;
% E  = [0;E0*exp(-alpha_1*z)*exp(-1j*beta_1*z);0]; %Vector Form of E-incident
% H  = cross((1/etta_1)*[0;0;1],E);

H0 = E0/abs(etta_1);
fprintf('  Step 2:');
fprintf(' H-Field:\n');
fprintf('\t\tH = %0.2f * exp(-%0.2f * z ) * exp(-j * %0.2f * z) * exp(j45)\n\n',H0,alpha_1,beta_1);

%% Region 2
epsln_2r  = 1;
sigma_2   = 0;
epsln_2     = epsln_0 * epsln_2r;
u_r       = 1;
u_2         = u_r*u_0;
gamma_2     = sqrt(1j * w * u_2 * (sigma_2 + 1j * w * epsln_2));
alpha_2     = real(gamma_2);
beta_2      = imag(gamma_2);
etta_2      = sqrt((1j*w*u_2)/(sigma_2 + 1j*w*epsln_2));

fprintf('c) Region 2:\n\talpha:\t%0.2f\n\tbeta:\t%0.2f\n\n',alpha_2,beta_2);
fprintf('\t\tetta: %0.2f angle %0.2f degrees (~ free space)\n\n',abs(etta_2),degrees(angle(etta_2)));

Gamma = (etta_2 - etta_1)/(etta_2 + etta_1);

fprintf('\tGamma = %0.2f angle %0.2f degrees\n\n',abs(Gamma),degrees(angle(Gamma)));

tau   = 1 + Gamma;
fprintf('\ttau = %0.2f angle %0.2f degrees\n\n',abs(tau),degrees(angle(tau)));

