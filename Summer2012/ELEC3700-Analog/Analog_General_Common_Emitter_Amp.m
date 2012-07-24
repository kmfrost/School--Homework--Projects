function [AV,AVDB,RIN,ROUT] = GeneralCEAmp(RE1)
% Set all these values as specified in the problem.
% To Do: Instead of RE being grounded, what if there was a voltage such as
% -VCC or something?

% Voltages and Stuff
Beta    = 100;
VCC     = 12;
VBE     = 0.7;
VT      = 0.02585;
VA      = 100;

% Resistances Given
RS      = 1e3;
RL      = 10e3;
R1      = 25e3;
R2      = 75e3;
RC      = 5e3;
RE2     = 2e3;

% DC Analysis (Find Q-point)
RE  = RE1 + RE2;
RBB     = parallel(R1,R2);
VBB     = ((RBB * VCC) / R2);
IB      = ((VBB - VBE)/(RBB + RE*(1+Beta)));
IC      = (IB * Beta);
IE      = IB*(1+Beta);
VRC     = (IC*RC);
VRE     = (IE*RE);
VCE     = VCC - VRC - VRE;

% Now on to AC Analysis...
% AC Values
RO      = ((VA + VCE)/IC);
RTH     = parallel(RS,RBB);
GM      = (IC/VT);
RPI     = (Beta / GM);

%AC Calcs
AV      = (-Beta*parallel(RC,RL)/(parallel(RS,RBB) + RPI + (Beta + 1)*RE1))*(RBB/(RBB + RS));
AVDB    = 20*log10(abs(AV));
RIN     = parallel(RBB,(RPI*(1+GM*RE1)));
temp1   = RO*(1+((Beta*RE1)/(RE1+RTH+RPI)));
temp2   = parallel(RE1,(RTH + RPI));
temp3   = temp1 + temp2;
ROUT    = parallel(RC,temp3);