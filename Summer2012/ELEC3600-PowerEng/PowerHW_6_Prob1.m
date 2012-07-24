% Homework 6
% 2012/07/05
% Dr. Aleck Leedy
% Problem 1. a.

% Clear up workspace.
clc;
clear;

% Print output 
fprintf('Homework 6\n');
fprintf('2012/07/05\n');
fprintf('Dr. Aleck Leedy\n');
fprintf('Markus Kreitzer\n\n');
fprintf('Problem 1. a.\n');

% Given parameters and conversions.
f = 60;
L = 125; %(201 km; medium length transm.-line)
pf = 0.9;
S3mag = 30e6;
ANGLE = acos(pf);

Z = 30+120*1i;
%Y = pol2rect(930e-6,90);
Y = 0.00093j;
VLine = 220e3;
VR = VLine/sqrt(3);

% Finding IR
%IR = S3mag / (sqrt(3) * VLine * pf);
%IR = conj(S3/VLine); % Not sure why this is incorrect.
fprintf('IR = (%0.4g angle %0.3gº) A\n\n',abs(IR),degrees(-ANGLE));

fprintf('Problem 1. b.\n');
%Find IS and VS
% First, ABCD parameters
A = 1 + (Y*Z)/2
B = Z
C = Y * (1 + (0.25 * Y * Z));
D = A;
% Check if they are correct. (They are!)
% reciprocity = A*D - B*C

% Equations given:
VS = A*VR + B*IR
IS = C*VR + D*IR;

fprintf('IS = (%0.4g angle %0.3gº) A\n',abs(IS),degrees(angle(IS)));
fprintf('VS = (%0.4g angle %0.3gº) kV\n\n',abs(VS)*10^-3,degrees(angle(VS)));
VSMAG = sqrt(real(VS).^2 + imag(VS).^2)

