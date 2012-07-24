% Given:
clc;
clear all;
syms rho phi;

munot = 4*pi*1e-7;
I1 = 2;
I2 = 1e-3;
% Calculate the B-Field for the vertical current.
B = [0;munot*I1/(2*pi);0]

%% D -> A
dL4 = [-1;0;0];
F12DA  = eval(int((1/rho)*cross(I2*dL4,B),rho,5,3))

%% B -> C
dL2 = [1;0;0];
F12BC  = eval(int((1/rho)*cross(I2*dL2,B),rho,5,3))

%% A -> B
rho = 5e-2;
dL1 = [0;rho;0];
F12AB  = int(cross(I2*dL1,B),phi,0,pi/2)

%% C -> D
rho = 3e-2;
dL3 = [0;rho;0];
F12CD  = int(cross(I2*dL3,B),phi,pi/2,0)
