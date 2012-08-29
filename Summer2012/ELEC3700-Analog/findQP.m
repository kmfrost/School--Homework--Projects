function [VCE IC] =  findQP(R1,R2,RC,RE,Beta,VCC,VEE,VA,RS,RL)
            % Constants:
            VT      = 0.0258;
            VBE     = 0.7;
            % DC Analysis (Find Q-point)

            RBB     = parallel(R1,R2);
            VBB     = (R1.*VCC + R2.*VEE)./(R1+R2);
            IB      = (VBB - VBE - VEE)./(RBB + (Beta + 1).*RE);
            IC      = (IB .* Beta);
            IE      = IB.*(1+Beta);
            VRC     = (IC.*RC);
            VRE     = (IE.*RE);
            VCE     = VCC - VRC - VRE - VEE;            
        end
