clc;
clear;
R1 = 500e3;
R2 = 1.4e6;
RS = 33e3;
RD = 82e3;
VDD = 15;
VSS = 0;
KN = 250e-6;
VTN = 1.2;
RL  = 470e3;
RI  = 1e3;

% Find Av, Ai, Rin, Rout
% Compare AV to our rule-of-thumb estimate and discuss the reasons for any
% discrepancy.

%% (1) Find Q-point:
syms ID VGS; %You have two unknowns

lambda = 0;
VG = (VDD*R1)/(R1+R2);
RG = parallel(R1,R2);
VS = ID*RS - VSS;
% ID = (KN/2)*(VGS-VTN)^2;
% VGS = VG - ID*RS;
% 2*ID/KN = (VG - ID*RS - VTN)^2
% 2*ID/KN = (VG - VTN)^2 - 2*(VG-VTN)*RS*ID + RS^2*ID^2;
eqn = RS^2*ID^2 + (-2*(VG-VTN)*RS - 2/KN)*ID + (VG - VTN)^2;
ID = solve(eqn,ID)
VGS = VG - RS*ID
eval(VGS)


% 
% VGS1  = ((2*KN*RS*VG - 2*KN*RS*VSS - 2*KN*RS*VTN + 1)^(1/2) + KN*RS*VTN - 1)/(KN*RS);
% VGS2 = -((2*KN*RS*VG - 2*KN*RS*VSS - 2*KN*RS*VTN + 1)^(1/2) - KN*RS*VTN + 1)/(KN*RS);
% eqn = VGS^2 + (-2*VTN + 2/(RS*KN))*VGS + (VTN^2 - (2/(RS*KN))*VG)
% me = solve(eqn,VGS)
% eval(me(1))
% 
% if (VGS1 - VTN) > 0
%     VGSNum = VGS1
% end
% if (VGS2 - VTN) > 0
%     VGSNum = VGS2
% end
% 
% ID = KN/2 * (VGSNum - VTN )^2
% 
% VDS = VDD - ID*(RD + RS) - VSS
% 
% gm = sqrt(2 * KN * ID ) %= 500.8
% RO = (VDS + (1/lambda))/ID % = 317.5 kohm;
% 
% VO = -gm * VGS*parallel(RO,RD,RL);
% 
% AV = -gm * parallel(RO,RD,RL)* (RG/(RG + RI)) % -12.45
% AVDB = 20*log10(abs(AV))


%You have two equations
% eqn1 = (VGS -( VG - VS));
% eqn2 = (ID - (KN/2)*(1+lambda*VGS)*(VGS - VTN)^2);

%So, you solve once
%SolutionSet = solve(eqn1,eqn2); %This will produce a structure

%This picks the data out of the structure
% VGS = eval(SolutionSet.VGS)
% ID  = eval(SolutionSet.ID)
% num = 0;
% 
% if(VGS(1) - VTN) > 0
%     vgs = number;
%     fprintf('VGS = %g\n', vgs)
% else
%     vgs = VGS(2)
%     fprintf('VGS = %g\n',vgs)
% end
% 
% 
