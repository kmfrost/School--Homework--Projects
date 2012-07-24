ID = 300e-6/2;
VDD = 15;
VSS = -15;
RSS = 160e3;
RD  = 75e3;
KN = 400e-6;
VTN  = 1;
lambda = 0.02;
syms VGS;
eqn = ID - 0.5*KN*(VGS - VTN)^2;
VGS = solve(eqn);
VGS = 1.866;
VDS = VDD - ID*RD - (-VGS)

gm = KN*(VGS - VTN)
ro = (VDS - 1/lambda)/ID


db(-gm*parallel(ro,RD))