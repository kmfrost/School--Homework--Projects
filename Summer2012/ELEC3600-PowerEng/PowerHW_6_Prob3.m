% Homework 6
% 2012/07/05
% Dr. Aleck Leedy
% Problem 3

% Clear up workspace.
%clc;
clear;

% Print output 
fprintf('Homework 6\n');
fprintf('2012/07/05\n');
fprintf('Dr. Aleck Leedy\n');
fprintf('Markus Kreitzer\n');
fprintf('Problem 3\n\n');

% Parameters given by Problem 3.
Ya  = -j*0.8;
Yb  = -j*4;
Yc  = -j*4;
Yd  = -j*8;
Ye  = -j*5;
Yf  = -j*2.5;
Yg  = -j*0.8;
I1  = 0;
I2  = 0;
I3  = -1j;
% I4  = -0.480832611207 - 0.480832611207*j (This is from my TI-89 for
% comparison.
I4  = pol2rect(0.68,-136) % Gives -0.4892 - 0.4724i

% Define a vector with all the currents.
I = [I1; I2; I3; I4]

% Matrix Ybus, as found in Problem 2.
Ybus = [Yc+Yd+Yf,       -Yd,       -Yc,       -Yf;
             -Yd,  Yb+Yd+Ye,       -Yb,       -Ye;
             -Yc,       -Yb,  Ya+Yb+Yc,         0;
             -Yf,       -Ye,         0,  Ye+Yf+Yg;
        ]

% All three of the below methods work to solve for I = Ybus * V.
V = Ybus\I
%V = inv(Ybus)*I;
%V = linsolve(Ybus,I);

% Nicely formatted output in polar form.
 for n = [1 2 3 4]
     fprintf('V%d: %6.3f Angle: %5.2f degrees\n',n,abs(V(n)),degrees(angle(V(n))));
 end
fprintf('\n\n');