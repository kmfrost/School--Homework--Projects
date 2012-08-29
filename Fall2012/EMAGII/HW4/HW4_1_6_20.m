% HW 4
% Assigned Problem 3
% Wentworth Problem 6.20
% 2012/08/26
clc;
clear all;
fprintf('\nWentworth Problem 6.20\n\n');
f         = 1e9;
u         = 4*pi*1e-7;
sigma_r   = [ 5.9 6.2 4.5 1.4 ] * 1e7;
mu_r      = [ 1   1   1   600 ];

for n = 1:length(sigma_r)
    delta = 1/sqrt(pi*f*mu_r(n)*u*sigma_r(n));
    fprintf('delta:\t%f um\n',delta*1e6);
end
fprintf('\n');

%Output:
% Wentworth Problem 6.20
% 
% delta:	2.072021 um
% delta:	2.021270 um
% delta:	2.372542 um
% delta:	0.173652 um
