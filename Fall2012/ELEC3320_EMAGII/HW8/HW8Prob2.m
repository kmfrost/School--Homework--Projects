%% Calculate the Cutoff Frequency and Impedence for TM Waveguide.
%% Info
% *  EMAG II - Dr. Baginski
% *  2012/09/11
% *  HW 8, Problem 2, Baginski
% *  *Markus Kreitzer* <mailto:markus.kreitzer@auburn.edu markus.kreitzer {at} auburn.edu>

% Add the line below at the top of the file to execute as an Octave script:
%   #!/usr/bin/env octave -q

%% Constants
e_0 		= (1e-9/(36*pi));
u_0 		= (4e-7*pi);

%% Given Parameters
f 			= 8e9;
a			= 2.286e-2; % (cm)
b 			= 1.016e-2; % (cm)
m			= 1;
n 			= 1;

%% Calculations

% Cutoff Frequency
% $$f_{c}$$
% $$f_{c} = 1/2*sqrt(u_{0}*e_{0})) * sqrt((1/a)^2 + (1/b)^2)$$
%
f_c	 	= 0.5 * (1/sqrt(u_0*e_0)) * sqrt((1/a)^2 + (1/b)^2);
fprintf('Cutoff Frequency:\n\t\t %0.3f GHz\n',f_c*1e-9);

% Impedence.
etta_u	= 120*pi;
Z_TM		= etta_u*sqrt(1 - (f_c/f)^2);
fprintf('Transverse Magnetic (TM) wave impedence (Z_TM):\n\t\t %0.3f Ohms, angle %0.3f degrees\n',abs(Z_TM),(180/pi) * angle(Z_TM));


fprintf('\n\n');
