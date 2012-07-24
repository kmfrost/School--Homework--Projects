% Matlab Homework 4.12
% Markus Kreitzer
% 2012/07/10
clc
clear all;

%% Parameters Given:
N = 200;
h = 10e-2;
r = 1e-2;
I = 1;
dz = 1e-6;
z = (-h/2)-.02:dz:(h/2)+.02;
H = ((N*I)/(2*h))*((z+(h/2))./sqrt((z+(h/2)).^2+r^2) - (z-(h/2))./sqrt((z-(h/2)).^2+r^2));

plot(z.*1e2,H);
xlabel (' z-axis (cm)');
ylabel ('H-field (A)');
title('H-field moving along z-axis');
grid on;