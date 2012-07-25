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
k = 0;
x = 1;

Y = [
 3 - 1j*9,    -2.000 + 1j*6,      -1.000 + 1j*3,   0;
-2 + 1j*6,     3.666 - 1j*11 ,    -0.666 + 1j*2,  -1 + 1j*3;
-1 + 1j*3,    -0.666 + 1j*2,       3.666 - 1j*11, -2 + 1j*6;
       0,    -1.000 + 1j*3,      -2.000 + 1j*6,    3 - 1j*9
];
V       =  [1.04;1;1;1]; % Known and initial guess.
S2in    =  0.5 - 1j*0.2;
S3in    = -1.0 + 1j*0.5;
S4in    =  0.3 - 1j*0.1;
Sin     = [0;S2in;S3in;S4in];
Sout    = [0;0;0;0];
S       = Sin - Sout;
N       = length(V);

% Print output information
fprintf('ELEC 3600 Power Project\n');
fprintf('%s\n',datestr((now)));
fprintf('Dr. Aleck Leedy\n');
fprintf('Markus Kreitzer\n\n');
fprintf('Problem (1.)\n\n');

Vprev = V;
epsicalc = 1;         % Tolerence.
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
    Vprev = V; % Vprev is required for next cnt,  V(i) = pol2rect(abs(Vprev(i)), angle(V(i)));
end     % End of while loop / Iteration

cnt       % Total cnts.
V               % Bus Voltages in Complex form.
Vmag = abs(V)   % Final Bus Voltages.
Ang = (180/pi)*angle(V)    % Final Bus Voltage Angles in Degree.


fprintf('\n');
