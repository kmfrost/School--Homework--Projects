% Problem 6.15
% Applied Electromagnetics - Wentworth
% (c) Markus Kreitzer 2012
% 2012/08/21
clc;
clear all;
f           = logspace(0, 9, 1e5);
w           = 2*pi*f;
perc_err    = 0.02;

epsln_0     = 1e-9/(36*pi);
epsln_r1    = 3;
epsln_r2    = 0.015;
epsln       = epsln_0*(epsln_r1 + 1j*epsln_r2);

mu_0        = 4*pi*1e-7;
mu_r        = 1;
mu          = mu_0 * mu_r;

sigma_r     = 1e-3;
sigma       = sigma_r + w.*epsln_r2.*epsln_0;

% Method using eqn. 6.52
%alpha_1 = abs( w.*((mu.*epsln./2).*sqrt(1 + (sigma./(w.*epsln).^2))-1).^(1/2));
alpha_1 =  abs( w.*((mu.*epsln./2).*(( 1 + (sigma./(w.*epsln)).^2).^(1/2) - 1)).^(1/2));

% Method using eqn 6.54
alpha_2 = abs((sigma./2).*(mu./epsln).^(1/2));
cnt = 1;
error = (abs((alpha_1 - alpha_2))./alpha_2);
while 1
    if error(cnt) < perc_err
        fprintf('alpha1: %d\nalpha2: %d\nFreq:   %d\nw:      %d\n',alpha_1(cnt),alpha_2(cnt),f(cnt),w(cnt))
        break
    end
    cnt = cnt + 1;
end


loglog(f,alpha_1,f,alpha_2,f,error)
legend('eqn 5.52','eqn 5.54','% error');
xlabel('Freq (Hz)');
ylabel('\alpha (Np/m)');
