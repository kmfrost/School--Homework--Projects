% HW 4
% Assigned Problem 1
% Wentworth Problem 6.25
% 2012/08/26
clc;
clear all;
fprintf('\nWentworth Probelm 6.25\n\n');

%% DC
sigma_cu    = 5.9e7;
diam        = 0.004;
rad         = diam/2;

RDC = 1/(sigma_cu * pi * rad^2);
fprintf('DC Resistance: %f Ohms/meter\n',RDC);

%% AC
u           = 4*pi*1e-7;
f           = 1e9;
delta       = 1/sqrt(pi*f*u*sigma_cu);
area        = pi * (rad^2 - (rad - delta)^2 );
RAC         = 1/(sigma_cu * area);
fprintf('AC Resistance: %f Ohms/meter\n\n',RAC);
