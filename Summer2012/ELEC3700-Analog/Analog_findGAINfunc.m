function [AV,AVDB,RIN,ROUT,GM,RPI] =  Analog_findGAINfunc(R1,R2,RC,RE,Beta,VCC,VEE,VA,RS,RL)
            % Constants:
            VT      = 0.0258;
            VBE     = 0.7;
            % DC Analysis (Find Q-point)

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
            RTH     = parallel(RS,RBB);
            GM      = (IC/VT);
            RPI     = (Beta / GM);
            AV      = -GM*(parallel(RC,RL)*(parallel(RBB,RPI)))/(parallel(RBB,RPI)+RS);
            AVDB    = 20*log10(abs(AV));
            RIN     = parallel(RBB,(RPI*(1+GM*RE)));
            temp1   = RO*(1+((Beta*parallel(RL,RE))/(parallel(RL,RE)+RTH+RPI)));
            temp2   = parallel(parallel(RE,RL),(RTH + RPI));
            temp3   = temp1 + temp2;
            ROUT    = parallel(RC,temp3);
            
        end
