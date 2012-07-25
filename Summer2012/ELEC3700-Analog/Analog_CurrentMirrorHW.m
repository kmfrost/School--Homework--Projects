% Analog
% Summer 2012
% Stuart Wentworth
% Current Mirror Problem

% Clean up
clc;
clear all;

%% 1.a.)

% Given Parameters:
VCC     = 9;
I0      = 1e-3; % Assumed for (a).
VA      = Inf;
VBE     = 0.7;
Beta    = 100;



% Assuming that,
% Beta is very large.
% I0 is about equal to Iref.
% Q3 is t

R   = (VCC - 2*VBE) / I0;

fprintf('\n');
fprintf('1.a.) R = %0.2f kOhms\n\n',R*1e-3);

% 1.b.)
Iref    = (VCC - 2*VBE)/R;
I0      = Iref/(1+2/(Beta*(Beta + 1)));

fprintf('1.b.) I0 = %0.5f mA\n\n',I0*1e3);

%% 2.) 
fprintf('2.)\n\n');
clear all; % Cleanliness is next to Godliness as my Ouma used to say.
% Given Parameters:
VCC     = 9;
VBE     = 0.7;
R       = 8.3e3;
RE      = 12e3;
Beta    = Inf;
VA      = Inf;
VT      = 0.02585;
epsilon = 1e-9;
epsicalc = 1;
cnt     = 1;
I0      = 1; %Initial Guess. I was going to do 0, but you can't divide by 0.
I0prev  = 0;
syms    Iref;
Iref    = eval(solve(VCC - Iref*R - VBE))

% Using the Gauss-Seidel Method from Dr. Leedy's Power Eng. Class:
cnt = 1;
while epsicalc > epsilon
    I0 = abs((VT/RE)*ln(Iref/I0));
    epsicalc = abs(abs(I0) - abs(I0prev));
    fprintf('Iteration Number = %d\tI0 = %f uA\tepsilon = %f x 1e-6\n',cnt,I0*1e6,epsicalc*1e6);
    cnt = cnt+1;
    I0prev = I0;
end
fprintf('\n\nTherefore,\n\t\tI0 = %0.2f uA\n',I0*1e6);
fprintf('\n');
