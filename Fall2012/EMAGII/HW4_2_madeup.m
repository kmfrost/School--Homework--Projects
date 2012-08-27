% HW 4
% Assigned Problem 2
% Baginski made-up problem
% 2012/08/26
clc;
clear all;
fprintf('\nBaginski Probelm 2\n\n');
%% Constants
sigma_cu    = 5.8e7;
sigma_st    = 5.8e6;
u_cu       = 1;
u_st       = 1000;
u           = 4*pi*1e-7;
f           = 10^8;
a           = 0.0005;
b           = 0.001;
c           = 0.004;
%
delta_inner       = 1/sqrt(pi*f*u*sigma_cu);
area_inner        = pi * (a^2 - (a^2 - delta_inner)^2 );
RAC_inner         = 1/(sigma_cu * area_inner);

delta_outer       = 1/sqrt(pi*f*u_st*u*sigma_st);
area_outer        = pi * (b^2 - (b - delta_outer)^2 );
RAC_outer         = 1/(sigma_st * area_outer);

RAC         = RAC_inner + RAC_outer;
fprintf('AC Resistance: %f Ohms/meter\n\n',RAC);
