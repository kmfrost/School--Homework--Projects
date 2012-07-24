% Homework 15.4
% ELEC 3700
% (c) 2012 Markus Kreitzer

clc;
clear all;

%% Given Parameters:
VCC  = 12;
VEE  = -12;
REE  = 270e3;
RC   = 47e3;
VBE  = 0.7;
VT   = 0.0258;
Beta = 100;
VA   = Inf;
IEE  = 400e-6;

%% Q-point Calculations:
VRE = 0 - VBE
IE  = IEE/2
IC = (Beta/(Beta + 1))*IE
VRC = IC*RC
VC = VCC - VRC
VCE = VC - VRE

fprintf('Q(%0.3g V, %0.3g uA)\n',VCE,IC*1e6); 

%% Small Signal Parameter Calculations
gm  = IC/VT
rpi = Beta/gm
ro  = ((VA + VCE)/IC)

%% Differential Mode Calculations
AvDiff = -0.5*gm*RC
AvDiffdb = 20*log10(abs(AvDiff))
Rin    = 2*rpi
Rout   = 2*RC

%% Common Mode Calculations
AvComm = -(Beta*RC)/(rpi + 2*(Beta + 1)*REE)
AvCommdb = 20*log10(abs(AvComm))

%% CMRR
CMRR   = abs(AvDiff/AvComm)
CMRRdB = 20*log10(CMRR)