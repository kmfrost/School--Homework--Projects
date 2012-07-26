% Matlab Project II (?)
% 2012/07/23
% Dr. Aleck Leedy

%% Problem 1.

% Clear up workspace.
clear all;
clc;

% Set up parameters.
epsilon = 0.001;

Y = [
 3 - 1j*9,    -2.000 + 1j*6,      -1.000 + 1j*3,   0;
-2 + 1j*6,     3.666 - 1j*11 ,    -0.666 + 1j*2,  -1 + 1j*3;
-1 + 1j*3,    -0.666 + 1j*2,       3.666 - 1j*11, -2 + 1j*6;
       0,    -1.000 + 1j*3,      -2.000 + 1j*6,    3 - 1j*9
];

V        =  [1.04;1;1;1]; % Known and initial guesses.
S1gen    =  0;            % No power generated specified at bus 1.
S2gen    =  0.5 - 1j*0.2; 
S3gen    = -1.0 + 1j*0.5;
S4gen    =  0.3 - 1j*0.1;
Sgen     =  [S1gen;S2gen;S3gen;S4gen]; % Per the diagram, these are the complex powers generated.
Ssup     =  [0;0;0;0]; % Complex power supplied (None.)
S        =  Sgen - Ssup;

% Print output information
fprintf('ELEC 3600 Power Project\n');
fprintf('%s\n',datestr((now)));
fprintf('Dr. Aleck Leedy\n');
fprintf('Markus Kreitzer\n\n');
fprintf('Problem (1.)\n\n');

[V,cnt] = powerflowGS(epsilon,Y,V,S);

fprintf('Total Iterations: %d\n\n',cnt);       % Total cnts.
for bus = 1:length(V)
    fprintf('Voltage at bus %d:\t%5.3f V at %5.2f degrees\n',bus, abs(V(bus)), degrees(angle(V(bus))) );
end

fprintf('\n');

%% Problem 2.

clear all
clc
% Initiate a N-bus system.
N = 4; % Set N to size.
Y = zeros(N,N); % Create Ybus matrix.

% Given Parameters from Problem
% Bus 1:
Ya     = pol2rect(4.3914e-3,90);
Yb     = pol2rect(1.4304e-4,90);
% The values below are connected to ground. Node-to-Node 
Y(1,1) = Ya + Yb;

% Bus 2:
Yc     = pol2rect(1.4304e-4,90);
Yd     = pol2rect(8.1177e-4,90);
Y(2,2) = Yc + Yd;

% Bus 3:
Ye     = pol2rect(4.3914e-3,90);
Yf     = pol2rect(8.1177e-4,90);
Yg     = pol2rect(3.3171e-3,89.95);
Y(3,3) = Ye + Yf + Yg;

% Bus 4:
Yh   = pol2rect(3.3141e-3,89.95);
Y(4,4) = Yh;

% Nodal Relations:
Z13  = pol2rect(61.4414,87.53);
Z12  = pol2rect(20.4941,87.11);
Z23  = pol2rect(28.3965,87.53);
Z34  = pol2rect(48.4066,87.63);

% Convert given parameters to Admittances.
Y(1,3)  = 1/Z13;
Y(1,2)  = 1/Z12;
Y(2,3)  = 1/Z23;
Y(3,4)  = 1/Z34;

% Find what N in the N-bus system is.
N = length(Y);

for col = 1:N
    for row = 1:N
        Y(row,col)  =  Y(col,row); % Fill in missing values.
    end
end

for diag = 1:N
    %fprintf('(row,column) = (%d,%d)\n',diag,diag);
    Y(diag,diag)  = sum(Y(diag,:));
end

for col = 1:N
    for row = 1:N
        if(row ~= col)
            Y(row,col) = -Y(row,col);
        end
    end
end

format short;

fprintf('Problem (2.)\n\n');
Y
