% Non-Inverting Real Opamp
clear
sprintf('Problem 11.18')
Adb = 100;
R1  = 5.6e3;
R2  = 47e3;
RID = 500e3;
RO  = 300;
%
A     = 10^(Adb/20);
Beta  = R1/(R1 + R2);
T     = A*Beta;
AV    = (1+(R2/R1))*(T/(T+1))
AVDB  = 20*log10(abs(AV))
Rin   = RID*(1+T)
Rout  = RO/(1+T)
GE    = (1/Beta) - (A/(1+A*Beta))
FGE   = 1/(1+A*Beta)
clear
%Inverting Real Opamp
sprintf('Problem 11.19')
Adb   = 100;
R1    = 2.7e3;
R2    = 47e3;
RID   = 300e3;
RO    = 200;
%
A     = 10^(Adb/20)
Beta  = R1/(R1 + R2);
T     = A*Beta;
AV    = (-R2/R1)*(T/(1+T))
AVDB  = 20*log10(abs(AV))
Rin   = R1
Rout  = RO/(1+T)
GE  = (1/Beta) - (A/(1+A*Beta))
FGE = 1/(1+A*Beta)