P = 20*746;
VL = 480;
f = 60;
wm = (1728 / 9.55);
R1 = 0.5;
R2 = 0.35;
X1 = 1.2;
X2 = 1.2;
Xm = 25
Poles = 4;

V1 = 480/sqrt(3)
ws = (4*pi*f)/Poles
s = (ws - wm)/ws
Z1 = R1+j*X1+parallel(j*Xm,j*X2+(R2/s))
I1 = V1/Z1