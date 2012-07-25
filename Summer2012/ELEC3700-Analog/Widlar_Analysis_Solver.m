%% 2.) Alternate method based on Wikipedia Article for Widlar Current Source
clear all; % Cleanliness is next to Godliness as my Ouma used to say.
clc;
fprintf('2.)\n\n');

% Given Parameters:
VT  = 0.02585;
VCC = 9;
R1  = 8.3e3;
R2  = 12e3;
Beta1 = 1e9;
Beta2 = Beta1;
IS1   = 1e-12;

syms IR1 VBE1 IC1 IC2
eqn1 = IR1 - ((VCC - VBE1)/R1);
eqn2 = VBE1 - (VT*ln(IC1/IS1));
eqn3 = IC1 - ((Beta1/(Beta1 + 1))*((VCC - VBE1)/R1 - (IC2/Beta2)));
eqn4 = IC2 - ((VT/(R2*(1+(1/Beta2))))*ln(IC1/IC2));

solset = solve(eqn1,eqn2,eqn3,eqn4);

I0 = abs(eval(solset.IC2));

fprintf('Therefore,\n\t\tI0 = %0.2f uA\n',I0*1e6);
fprintf('\n');
