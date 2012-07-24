R1  = 30e3;
R2  = 60e3;
RD  = 5e3;
KN  = 400e-6;
VTN = 1;
lambda = 0.010;
VS  = 0;
VDD = 9;


% Saturation VDS >= (VGS - VTN) >= 0



VG = (VDD * R1) /( R1 + R2)
VGS = VG - VS

%ID = KN/2 * (VGS - VTN)^2 * (1 + 2*(VDD - ID*RD))

ID = (KN/2 * (VGS - VTN)^2 * (1 + lambda * VDD))/(1 + lambda*RD*(KN/2)*(VGS - VTN)^2)
VDS = VDD - ID*RD






