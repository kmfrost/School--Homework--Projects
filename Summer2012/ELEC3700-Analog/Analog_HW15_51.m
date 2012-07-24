gm2 = 0.99008;
gm3 = 24.224;
R   = 24e3;
RC  = 28.28;
rpi3 = (100/gm3);
ro2  = 3.03e3;
ro3  = 120;

Adm1 = 1/2*gm2*gm3*R*parallel(RC,rpi3)
Adm  = (gm2*parallel(RC,ro2)/2)*((100*parallel(RC,ro3))/(parallel(RC,ro2)+rpi3))

Adm1dB = db(Adm1)
Adm    = db(Adm)

