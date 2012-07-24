clc
clear
% CC Amp HW
R1 = 120e3;
R2 = 91e3;
RE = 3.3e3;
RC = 0;
RL = 1e3;
RI = 1e3;
Beta = 80;
VA = 60;
VBE = 0.7;
VCC = 15;
VEE = 0;

%[VCE,IC] = findQP(R1,R2,RC,RE,Beta,VCC,VEE);
[AV,AVDB,RIN,ROUT] = findCCGAIN(R1,R2,RC,RE,Beta,VCC,VEE,VA,RI,RL)