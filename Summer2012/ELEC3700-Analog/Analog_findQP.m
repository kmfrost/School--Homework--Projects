function [VCE,IC] =  findQP(R1,R2,RC,RE,Beta,VCC,VEE);
            % Constants:
            VBE     = 0.7;
            
            % DC Analysis (Find Q-point)
            RBB     = parallel(R1,R2);
            VBB     = (R1*VCC + R2*VEE)/(R1+R2);
            IB      = (VBB - VBE - VEE)/(RBB + (Beta + 1)*RE);
            IC      = (IB * Beta);
            %IC1 = (((R1*VCC + R2*VEE)/(R1+R2) - VBE - VEE)/(parallel(R1,R2) + (Beta + 1)*RE)) * Beta
            %IC3 = -(Beta * (VBE + VEE - (R1*VCC + R2*VEE)/(R1 + R2)))/(RE*(Beta + 1) + (R1*R2)/(R1 + R2))
            IE      = IB*(1+Beta);
            VRC     = (IC*RC);
            VRE     = (IE*RE);
            VCE     = VCC - VRC - VRE - VEE;
end