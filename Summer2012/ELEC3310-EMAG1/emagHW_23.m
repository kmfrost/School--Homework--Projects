% Problem 1
% The plane z = 0 seperates two magnetic media. Media 1 (z < 0) has ur1 =
% 3.0 and media 2 (z > 0) has ur2 = 9.0. A sheet current k = (1/u0) ay A/m
% exists at the interface (in the x-y plane) and B1 = 3.0ay + 6.0az Wb/m^2.
% Find B2. (Do this problem using a21 x (H1 - H2) = K
clc

u0  = 4*pi*1e-7;
a21 = [0;0;-1];
K   = [0;1/u0;0];
B1  = [0;3;6];
u1  = 3;
u2  = 9;
H1  = B1/u1;
B1n = B1(3);
B1t = B1(2);
H1n = H1(3);
H1t = H1(2);
H2t = H1t;
syms H2n;
H2 = [0;H2t;H2n]
