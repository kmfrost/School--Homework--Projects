%% HW 7 Problem 1
clc;
clear all;
Ei0 = 2;
B1  = 1;
C1  = sqrt(3)/2;
C2  = 1/2;
% eqn1 = Ei0*exp(-1j*B1*( y*sin(theta) + z*cos(theta) ));
% eqn2 = Ei0*exp(-1j*B1*( y*(sqrt(3)/2) + z*(1/2) ));
% sol = solve(eqn1,eqn2)

c_0 = 299792458; % (m/s)
u_0 = pi*4e-7;   % (H/m)
e_0 = 1/(c_0^2 * u_0);

theta = asind(C1)
w1     = B1/sqrt(u_0*e_0)
w2     = B1/c_0

lambda = (2*pi)/B1

etta   = sqrt( u_0 / e_0)

H0 = (1/etta)*2

%% Problem 2
clc;
clear all;
%% HW 7 Problem 1
clc;
clear all;
c_0 = 299792458; % (m/s)
u_0 = pi*4e-7;   % (H/m)
e_0 = 1/(c_0^2 * u_0);
u_r = 1;
e_r = 2.25;
sigma = 0;
E_i0 = 2;
sin_theta_i = 4;
cos_theta_i = 3;

theta_t = angle(asin(sqrt(1/e_r)*4))
degrees(theta_t)

etta1 = 120*pi;
etta2 = sqrt( (u_r*u_0)/(e_0*e_r))

GammaTE = (etta2 * cos_theta_i - etta1 * cos(theta_t))/(etta2 * cos_theta_i + etta1 * cos(theta_t))

E_r0 = GammaTE * E_i0
E_t0 = E_i0 - E_r0
H_t0 = (1/etta2)*E_t0

%% Problem 3
clc
clear all;
theta_i = 45;
e_r1    = 4.5;
e_r2    = 2.25;
theta_t1 = asin(sind(theta_i)/sqrt(e_r1));
degrees(theta_t1)
theta_t2 = asin(sin(theta_t1)/sqrt(e_r2));
degrees(theta_t2)





















