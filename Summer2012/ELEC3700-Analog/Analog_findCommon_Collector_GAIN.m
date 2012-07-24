function [AV,AVDB,RIN,ROUT] =  findGAIN(R1,R2,RC,RE,Beta,VCC,VEE,VA,RS,RL)
% Constants:
VT      = 0.0258;
VBE     = 0.7;
% DC Analysis (Find Q-point)
RI      = RS;
RBB     = parallel(R1,R2);
VBB     = (R1*VCC + R2*VEE)/(R1+R2);
IB      = (VBB - VBE - VEE)/(RBB + (Beta + 1)*RE);
IC      = (IB * Beta);
IE      = IB*(1+Beta);
VRC     = (IC*RC);
VRE     = (IE*RE);
VCE     = VCC - VRC - VRE - VEE;
% AC Calcs
RO      = ((VA + VCE)/IC);
RTH     = parallel(RS,RBB)
GM      = (IC/VT);
RPI     = (Beta / GM);
RLPRIME = parallel(RE,RL)
% Calculate values.
AV      = ((Beta + 1)*parallel(RO,RLPRIME)*RBB)/((RBB + RS)*((Beta + 1)*parallel(RO,RLPRIME)+RTH+RPI))
AVDB    = 20*log10(abs(AV));

RIN     = parallel(((Beta+1)*(parallel(RO,RLPRIME)+RPI)),RBB)

%             temp1   = RO*(1+((Beta*parallel(RL,RE))/(parallel(RL,RE)+RTH+RPI)));
%             temp2   = parallel(parallel(RE,RL),(RTH + RPI));
%             temp3   = temp1 + temp2;
%             ROUT    = parallel(RC,temp3);
ROUT        = parallel(RO,RE,((RTH/(Beta + 1)) + (1/GM)));

end