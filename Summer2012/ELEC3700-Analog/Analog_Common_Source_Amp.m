RG = 1e6;
RD = 30e3;
RS = 32e3;
RI = 10e3;
C1 = 100e-6;
C2 = 100e-6;
RL = 300e3;
CS = 100e-6;
VDD = 10;
VSS = -10;
VTN = 1;
lambda = 0.0133;
KN  = 500e-6;

% VDS >= (VGS - VTN) >= 0
VG = 0;

%VS = (-(ID*RS + VSS))
%VGS = VG - VS
%ID = KN/2 * (VGS - VTN)^2 * (1 + 2*(VDD - ID*RD))
%ID = KN/2 * (VGS - VTN)^2 * (1 + 2*(VDD - ID*RD))
%ID = (KN/2 * (VGS - VTN)^2 * (1 + lambda * VDD))/(1 + lambda*RD*(KN/2)*(VGS - VTN)^2)
%VDS = VDD - ID*RD

%Solve
% VGS^2 + (2/(KN*RS) - 2*VTN)*VGS + (VTN^2 + (2*VSS)/(KN*RS) = 0

% VGS = 2

%ID = KN/2 * (VGS - VTN )^2; % =  0.25mA

% VDS = VDD - ID*(RD + RS) - VSS; % = 4.5 V
% VDS = 4.5;
%======================================================================
% let,
% KNPRIME = KN*(1+lambda*VDS) % = 529.9 uA/V^2

% use KNPRIME in place of KN in Quadratic
% 2nd Iteration
% VGS = 1.973
% ID = 0.2508
% VDS = 4.448
% KNPRIME = 529.6

%3rd ITeration

VGS = 1.973;
ID  = 0.2508e-3; % mA
VDS = 4.448;
% Small Signal

gm = sqrt(2 * KN * ID ) %= 500.8
RO = (VDS + (1/lambda))/ID % = 317.5 kohm;

VO = -gm * VGS*parallel(RO,RD,RL);

AV = -gm * parallel(RO,RD,RL)* (RG/(RG + RI)) % -12.45










