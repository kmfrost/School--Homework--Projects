% HW 4
% Assigned Problem 3
% Wentworth Problem 6.21
% 2012/08/26
clc;
clear all;
fprintf('\nWentworth Problem 6.21\n');
fprintf('Markus Kreitzer\n');
fprintf('%s\n\n',date);


f         = [1 1e3 1e6 1e9];
u         = 4*pi*1e-7;
sigma     = 1.45e7;
mu_r      = 600;
epsln_0   = 1e-9/(36*pi);
epsln_r   = 1.0403;
epsln     = epsln_0 * epsln_r;
c         = 2.998e8; % (m/s)

for n = 1:length(f)
    alpha = sqrt(pi*f(n)*mu_r*u*sigma);
    fprintf('Freq:   %0.0f Hz\n',f(n));
    fprintf('Alpha:  %f Np/m\n',alpha);
    fprintf('Beta:   %f rad/m\n',alpha);
    fprintf('Delta:  %f mm\n',(1/alpha)*1e3);
    etta = sqrt(2)*(alpha/sigma);
    fprintf('Etta:   %f * exp(j45 deg) u-Ohms\n',etta*1e6);
    velocity = c/sqrt(mu_r*epsln_r);
    fprintf('u_p:    %f (m/s)\n\n',velocity);
end
fprintf('\n');

%Output:
% Wentworth Problem 6.20
% 
% delta:	2.072021 um
% delta:	2.021270 um
% delta:	2.372542 um
% delta:	0.173652 um
