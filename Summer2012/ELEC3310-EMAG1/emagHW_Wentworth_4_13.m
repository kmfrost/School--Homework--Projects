% Matlab Homework 4.12
% Markus Kreitzer
% 2012/07/10
clc
clear all;

a = 2;
syms x
K = [0;2*pi;0]; % Got a dimension mismatch so just pulled out and cancelled.
d0 = 0;
d1 = 4;

soln = int(cross([0;0;1],[-x;a;0])/((x^2 + a^2)),x,d0,d1);

H = eval(soln);
eval(soln)
fprintf('H = { %0.3f , %0.3f , %0.3f } A/cm\n',H(1),H(2),H(3));