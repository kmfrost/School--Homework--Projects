Adb = 100
R1  = 5.6e3
R2  = 47e3
A   = 10^(Adb/20)
Beta = R1/(R1 + R2);
AV  = A/(1+A*(R1/(R1+R2)))
GE  = (1/Beta) - (A/(1+A*Beta))
FGE = 1/(1+A*Beta)