function [FreqL,FreqH] =  findCaps(R1,R2,RC,RE,Beta,VCC,VEE,VA,RS,RL,C1,C2,CE,CPI,CMU)
            % Constants:
            VT      = 0.0258;
            VBE     = 0.7;
            % DC Analysis (Find Q-point)
            RI      = RS; % Frequently interchanced. I is for input and S is for Source. Same thing.
            RBB     = parallel(R1,R2);
            VBB     = (R1*VCC + R2*VEE)/(R1+R2);
            IB      = (VBB - VBE - VEE)/(RBB + (Beta + 1)*RE);
            IC      = (IB * Beta);
            IE      = IB*(1+Beta);
            VRC     = (IC*RC);
            VRE     = (IE*RE);
            VCE     = VCC - VRC - VRE - VEE;
            % Small Signal Parameters:
            RO      = ((VA + VCE)/IC);
            RTH     = parallel(RS,RBB);
            GM      = (IC/VT);
            RPI     = (Beta / GM);
            % Capacitor Stuff
            RC1     = RS + parallel(RBB,RPI);
            RC2     = RC + RS;
            RCE     = parallel(RE,((parallel(RI,RBB)+RPI)/(Beta + 1)));
            % Calculated below two from class notes but followed a
            % different method for finding f_high. Not sure what RCU is
            % used for.
            RCPI    = parallel(RI,RBB,RPI);
            RCU     = RCPI + parallel(RO,RC,RL) + GM*RCPI*parallel(RO,RC,RL);
            RLPRIME = parallel(RO,RC,RL);
            OmegaL  = ((1/(RC1*C1))+(1/(RC2*C2))+(1/(RCE*CE))); %SCTC
            CIN     = CPI+CMU*(1+GM*RLPRIME);
            OmegaH  = 1/(CIN*RCPI);
            FreqL   = OmegaL/(2*pi);
            FreqH   = OmegaH/(2*pi);
        end