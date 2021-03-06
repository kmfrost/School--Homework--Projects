% Matlab Project II (?)
% 2012/07/23
% Dr. Aleck Leedy
% Problem 1.

% Clear up workspace.
clear all;
clc;

% Set up parameters.
epsilon = 0.001;
epsicalc = 1;

Y = [
 3 - 1j*9,    -2.000 + 1j*6,      -1.000 + 1j*3,   0;
-2 + 1j*6,     3.666 - 1j*11 ,    -0.666 + 1j*2,  -1 + 1j*3;
-1 + 1j*3,    -0.666 + 1j*2,       3.666 - 1j*11, -2 + 1j*6;
       0,    -1.000 + 1j*3,      -2.000 + 1j*6,    3 - 1j*9
];

V        =  [1.04;1;1;1]; % Known and initial guesses.
S1gen    =  0;
S2gen    =  0.5 - 1j*0.2;
S3gen    = -1.0 + 1j*0.5;
S4gen    =  0.3 - 1j*0.1;
Sgen     =  [S1gen;S2gen;S3gen;S4gen]; % Per the diagram, these are the complex powers generated.
Ssup     =  [0;0;0;0]; % Complex power supplied (None.)
S        =  Sgen - Ssup;
N        =  length(V);

% Print output information
fprintf('ELEC 3600 Power Project\n');
fprintf('%s\n',datestr((now)));
fprintf('Dr. Aleck Leedy\n');
fprintf('Markus Kreitzer\n\n');
fprintf('Problem (1.)\n\n');

Vprev = V;
epsicalc = 1;         % Tolerance when the while loop stops. Set to 1 to make it bigger than our tolerance to start off with.
cnt = 1;              % cnt starting

while (epsicalc > epsilon)     % Start of while loop
    for i = 2:N
        SoV = 0;
        for k = 1:N
            if i ~= k
                SoV = SoV + Y(i,k)* V(k);  % Vk * Yik
            end
        end
        % V(i) = (1/Y(i,i))*((P(i)-j*Q(i))/conj(V(i)) - SoV); % I think this
        % is just conj(S)
        V(i) = (1/Y(i,i))*(conj(S(i)/V(i))   - SoV);
    end
    cnt = cnt + 1;      % Increment cnt count.
    epsicalc = max(abs(abs(V) - abs(Vprev)));     % Calculate epsicalcance.
    Vprev = V;
end     % End of while loop / Iteration

fprintf('Total Iterations: %d\n\n',cnt);       % Total cnts.
for bus = 1:length(V)
    fprintf('Voltage at bus %d:\t%0.3f V at %0.2g degrees\n',bus, abs(V(bus)), degrees(angle(V(bus))) );
end

fprintf('\n');
