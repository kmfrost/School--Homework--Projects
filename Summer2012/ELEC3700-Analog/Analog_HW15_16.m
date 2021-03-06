% Homework 15.16
% This solves a PNP amp with REE connected to VCC at the top and connected
% to the emitters of the transistors. Two RC's are connected to each
% collector terminal. They are then connected to VEE. VOD is measured from the the two collectors as VC1 (left) and
% VC2 (right). V1 and V2 are connected to the left and right base terminals
% respectively.
% (c) Markus A.R. Kreitzer 2012
clc;
clear all;

%% Heading
fprintf('\n\nHomework Problem 15.16\n');
fprintf('           %s\n',datestr(date));
fprintf('  Markus A.R. Kreitzer\n\n');

%% Parameters:
%Given:
VCC     = 10;
VEE     = -VCC;
REE     = 430e3;
REPrime = 2*REE;
RC      = 560e3;
Beta    = 100;
V1      = 1;
V2      = 0.99;

%Constant:
VEB     = 0.7;
VT      = 25.85e-3;
%% Qpoint:
syms VCE IE IC IB
eqn1 = VCC - REPrime*IE - VCE - IC*RC - VEE;
eqn2 = VCC - REPrime*IE - VEB;
eqn3 = IC - IB*Beta;
eqn4 = IE -1*(IC + IB);

soln = solve(eqn1, eqn2, eqn3, eqn4);

IC  = eval(soln.IC);
VCE = eval(soln.VCE);

fprintf('Q-point: (%0.2f V, %0.2f uA)\n\n',VCE, IC*1e6);

%% Small Signal Parameter Calcs:
gm      = IC/VT; 
ro      =  Inf;
rpi     = Beta/gm;

fprintf('Small Signal Parameters:\n');
fprintf('gm      = %0.2f m-Mho  \n', gm*1e3);
fprintf('rpi     = %0.2f k-Ohms \n\n',rpi*1e-3);

%% Gain Calcs:
% Common Mode
Ric  = rpi/2 + REPrime*(Beta + 1);
Acm  = Beta*RC/(rpi + 2*(Beta + 1)*REPrime);

fprintf('Common Mode:\n');
fprintf('Ric     = %0.2f M-Ohm \n',Ric*1e-5);
fprintf('Acm     = %0.2f V/V   \n',Acm);
fprintf('Acm(dB) = %0.2f dB    \n\n',db(abs(Acm)));

% Differential Mode
Adm  = gm*RC;
Adm1 = 0.5*Adm;
Rin  = 2*rpi;

fprintf('Differential Mode:\n');
fprintf('Rin      = %0.2f k-Ohm \n',Rin*1e-3);
fprintf('Adm1     = %0.2f V/V   \n',Adm1);
fprintf('Adm1(dB) = %0.2f dB    \n',db(abs(Adm1)));
fprintf('Adm      = %0.2f V/V   \n',Adm);
fprintf('Adm(dB)  = %0.2f dB    \n\n',db(abs(Adm)));

%% CMRR
CMRR = abs(Adm1/Acm);
fprintf('CMRR     = %0.2f   \n',CMRR);
fprintf('CMRR(dB) = %0.2f dB\n\n',db(CMRR));

%% Output Voltage Calcs (specific to problem 15.16)
VC1 = ( gm*RC*V1 )/2;
VC2 = ( gm*RC*V2 )/2;

VOD = VC1 - VC2;

fprintf('Output Voltage Calcs:\n');
fprintf('VC1\t=\t%0.2f V\n',VC1);
fprintf('VC2\t=\t%0.2f V\n',VC2);
fprintf('VOD\t=\t%0.2f V\n\n',VOD);

















