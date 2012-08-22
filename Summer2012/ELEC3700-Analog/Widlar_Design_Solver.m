%% 2.) Alternate method based on Wikipedia Article for Widlar Current Source
clear all; % Cleanliness is next to Godliness as my Ouma used to say.
clc;
fprintf('2.)\n\n');

% Given Parameters:
VT  = 0.02585;
VCC = 9;
VEE = -9;
R  = 8.3e3;
RE  = 12e3;
Beta1 = 300; % Assumption since Beta is BIG. In real life it wouldn't be that big.
Beta2 = Beta1;
IS1   = 1e-14; % Since it wasn't given, I assumed this for a typical silicon NPN transistor, per Wikipedia.

% Set desired current here.
IC2    = 51.8e-6;

syms IR1 VBE1 IC1 RE
eqn1 = IR1 - ((VEE - VBE1)/R);
eqn2 = VBE1 - (VT*ln(IC1/IS1));
eqn3 = IC1 - ((Beta1/(Beta1 + 1))*((VEE - VBE1)/R - (IC2/Beta2)));
eqn4 = IC2 - ((VT/(RE*(1+(1/Beta2))))*ln(IC1/IC2));

solset = solve(eqn1,eqn2,eqn3,eqn4);

RE = abs(eval(solset.RE));

fprintf('Therefore,\n\t\tRE = %0.2f kOhms\n',RE*1e-3);
fprintf('\n');
