% HW # 2
% Finds the H field from 3 currents at H (1,2,1) in Cartesian coordinates: 
% 1) A line current of 4 A flows on the z-axis in the + z direction 
% 2) a surface current of 4 A/ m flowing in the x direction at z =0 in the 
%    x-y 
% 3)  A line current of 5 A flowing in the y -direction at z = 3.


%% Given Parameters:
POO = [1;2;1]; % Point Of Observation
%% I1 for Line
I1mag  = 4;
a1_I   = [0;0;1];
rho1   = POO - a_I;
a1_rho = rho1/norm(rho1);
a1_phi = cross(a1_I,a1_rho);
H1     = ( I1mag * a1_phi ) / (2*pi*norm(rho1))

%% I2 for Sheet
K  = [4;0;0];
a_N = [0;0;1];
H2 = 0.5*cross(K,a_N)

%% I3
I3mag = 5;
a3_I   = [0;1;0];
rho3   = POO - [0;2;3]
a3_rho = rho1/norm(rho1);
a3_phi = cross(a1_I,a1_rho);
H3     = ( I1mag * a1_phi ) / (2*pi*norm(rho1))

%% Sum
HT = H1 + H2 + H3
