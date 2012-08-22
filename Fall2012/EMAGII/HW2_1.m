% Homework 2
% Problem 1
% ELEC 3320
% 2012/08/20
% An electric field is given as E(y) = 2.e^-(alpha)*y * e^j((beta)*y) ay V/m. 
% What is ap? If ? = 5.8 x107 ? (copper where ? >>??, ?r =?r =1 ) and f = 1 MHz
% What is the phasor form of H(y)?
% (you need the intrinsic impedance)? 
% The time domain form of the electric field?
clc
clear all;
f       = 1e6;
w       = 2*pi*f;
sigma   = 5.8e-7;
epsilon = (1e-9/(36*pi));
mu      = 4*pi*1e-7;
gamma   = sqrt(1j*w*mu*(sigma + 1j*w*epsilon));
a       = real(gamma);
B       = imag(gamma);
fprintf('a = %f\tB = %f\n',a*1e3,B);
n       = sqrt((1j*w*mu)/(sigma + 1j*w*epsilon))
syms y
E = 2*exp(-a*y)*exp(1j*B*y);
H = E/n;
eval(E)
eval(H)
