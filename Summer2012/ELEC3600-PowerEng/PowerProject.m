% Matlab Project II
% 2012/07/23
% Dr. Aleck Leedy
% Problem 1.

% Clear up workspace.
clear all;
clc;

% Set up parameters.
epsilon = 0.001;
k = 0;
x = 1;

% Print output information
fprintf('ELEC 3600 Power Project XX\n');
fprintf('%s\n',datestr((now)));
fprintf('Dr. Aleck Leedy\n');
fprintf('Markus Kreitzer\n\n');
fprintf('Problem (1.)\n\n');

while 1
    xnext = (1/6)*x^2 + (2/6);
    epsicalc = abs(abs(xnext) - abs(x));
    fprintf('k = %d\tx = %f\tepsilon = %f\n',k,xnext,epsicalc);
    if  epsicalc < epsilon
        break;
    end
    k = k+1;
    x = xnext;
end
fprintf('\n');