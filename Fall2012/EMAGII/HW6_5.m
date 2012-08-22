format long;
clc
clear all
epsilon_0   = (1e-9/(36*pi));
epsilon_r   = 2;
epsilon     = epsilon_0 * epsilon_r
sigma       = 1e-5;
f           = 10e6;
mu_0        = 4*pi*1e-7;
mu_r        = 50;
mu          = mu_r * mu_0
w           = 2*pi*f

gamma       = sqrt(1j*w*mu*(sigma + 1j*w*epsilon))
eta         = sqrt((1j*w*mu)/(sigma+1j*w*epsilon)) 
