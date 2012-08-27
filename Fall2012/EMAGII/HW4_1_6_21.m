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

% Wentworth Problem 6.21
% Markus Kreitzer
% 27-Aug-2012
% 
% Freq:   1 Hz
% Alpha:  185.327341 Np/m
% Beta:   185.327341 rad/m
% Delta:  5.395858 mm
% Etta:   18.075341 * exp(j45 deg) u-Ohms
% u_p:    11999874.501357 (m/s)
% 
% Freq:   1000 Hz
% Alpha:  5860.565102 Np/m
% Beta:   5860.565102 rad/m
% Delta:  0.170632 mm
% Etta:   571.592459 * exp(j45 deg) u-Ohms
% u_p:    11999874.501357 (m/s)
% 
% Freq:   1000000 Hz
% Alpha:  185327.340983 Np/m
% Beta:   185327.340983 rad/m
% Delta:  0.005396 mm
% Etta:   18075.340627 * exp(j45 deg) u-Ohms
% u_p:    11999874.501357 (m/s)
% 
% Freq:   1000000000 Hz
% Alpha:  5860565.102086 Np/m
% Beta:   5860565.102086 rad/m
% Delta:  0.000171 mm
% Etta:   571592.458658 * exp(j45 deg) u-Ohms
% u_p:    11999874.501357 (m/s)
