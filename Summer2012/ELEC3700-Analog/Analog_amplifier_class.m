classdef findQpoint
    properties
        % Voltages and Stuff
        Beta    = 125;
        VCC     = 12;
        VEE     = -12;
        VBE     = 0.7;
        VT      = 0.025;
        VA      = 50;
    end
    properties
        % Resistances Given
        R1      = 100e3;
        R2      = 100e3;
        RC      = 2e3;
        RE      = 4.7e3;
    end
    methods
        function [VCE,IC] =  findQP(R1,R2,RC,RE,Beta,VCC,VEE);
            % DC Analysis (Find Q-point)
            RBB     = parallel(R1,R2);
            VBB     = (R1*VCC + R2*VEE)/(R1+R2);
            IB      = (VBB - VBE - VEE)/(RBB + (Beta + 1)*RE);
            IC      = (IB * Beta);
            IE      = IB*(1+Beta);
            VRC     = (IC*RC);
            VRE     = (IE*RE);
            VCE     = VCC - VRC - VRE - VEE;
        end
    end
end

classdef amplifier_class
    % All the values we need
    properties (Dependent)
        R1
        R2
        RE
        RC
        Beta
        VA
        IS
    end
    properties (Constant)
        VBE=0.7;
        VT=0.0258;
    end
    properties %(GetAccess=Private)
        VCE
        IB
        IC
        IE
    end
end


