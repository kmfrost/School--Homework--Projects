clc
clear
% CB Amp HW
R1 = 5e3;
R2 = 80e3;
RE = 200;
RC = 5e3;
RL = 1e3;
RI = 0;
Beta = 200;
VA = Inf;
VBE = 0.7;
VCC = 20;
VEE = 0;
%[VCE,IC] = findQP(R1,R2,RC,RE,Beta,VCC,VEE);
[AV,AVDB,RIN,ROUT] = findCBGAIN(R1,R2,RC,RE,Beta,VCC,VEE,VA,RI,RL);
