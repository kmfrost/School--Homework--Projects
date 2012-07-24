%function [VCE,IC] = findQpoint(R1,R2,RC,RE,Beta,VCC,VEE)
% (c) Markus Kreitzer 2012
% Homework for Monday, June 25 2012.
%
% What are Av, Rin, Rout, and maximum input signal amplitude for the 
% amplifier in Fig. P14.1(a) if RI = 500, R1 = 100k, R2 = 100k, 
% R3 = 24k, RE = 4.7k, RC =2k, 
% VA = 50V.
%
% Choose values for C1, C2, and C3 so that they can be neglected at a 
% frequency of 250 Hz.
% (b)Choose C3 to set the lower cutoff frequency to 1000 Hz assuming C1 
%      and C2 remain unchanged.

classdef findQpoint
    properties (Dependent = true)
        VCE
        IC
    end
    properties (Constant)
        VBE     = 0.7;
        VT      = 0.025;
    end
    properties
        % Resistances Given
        R1      = 100e3;
        R2      = 100e3;
        RC      = 2e3;
        RE      = 4.7e3;
        %
        % Voltages and Stuff
        Beta    = 125;
        VCC     = 12;
        VEE     = -12;
        VA      = 50;
    end
    properties (setaccess = private)
        RBB
        VBB
        IB
        IE
        VRC
        VRE
    end
    methods
        function obj =  calc(R1, R2, RC, RE, Beta, VCC, VEE)
            % DC Analysis (Find Q-point)
            obj.R1      = R1;
            obj.R2      = R2;
            obj.RE      = RE;
            obj.RC      = RC;
            obj.VCC     = VCC;
            obj.VEE     = VEE;
            obj.Beta    = Beta;
            obj.RBB     = parallel(obj.R1,obj.R2);
            obj.VBB     = (R1*VCC + R2*VEE)/(R1+R2);
            obj.IB      = (VBB - VBE - VEE)/(RBB + (Beta + 1)*RE);
            obj.IC      = (IB * Beta);
            obj.IE      = IB*(1+Beta);
            obj.VRC     = (IC*RC);
            obj.VRE     = (IE*RE);
            obj.VCE     = VCC - VRC - VRE - VEE;
        end
    end
end