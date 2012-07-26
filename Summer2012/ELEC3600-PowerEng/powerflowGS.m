function [ V,cnt ] = powerflowGS( epsilon,Ybus,V,S )
%powerflowGS Calculates the voltages at busses specified.
%   Inputs:
%   epsilon: Tolerance to iterate to, i.e. the difference between iterative
%            values will be less than to this value.
%   Ybus:    Bus admittance matrix.
%   V:       These are the known and guessed voltages at each node.
%            Typically, the initial guess will be 1.
%   S:       This is the net complex power flowing in and out of each bus.
%            To construct this vector, create a vector of all the generated
%            complex powers, Sgen, another vector of the supplied complex
%            power, Ssup, and subtract them. e.g. S = Sgen - Ssup.
%   Outputs:
%            V is the calculated bus voltages.
%            cnt is the number of iterations it took to calculate V to an
%            epsilon tolerance.

Vprev = V;
epsicalc = epsilon + 1;         % Tolerance when the while loop stops. Set to 1 to make it bigger than our tolerance to start off with.
cnt = 1;              % Iteration count.
N        =  length(V);

while (epsicalc > epsilon)
    for k = 2:N % Since V(1) is known.
        SoV = 0;
        for n = 1:N
            if k ~= n
                SoV = SoV + Ybus(k,n)* V(n);
            end
        end
        % V(k) = (1/Y(k,k))*((P(k)-j*Q(k))/conj(V(k)) - SoV); % I think this
        % is just conj(S(k)/V(k)) as seen below:
        V(k) = (1/Ybus(k,k))*(conj(S(k)/V(k))   - SoV);
    end
    cnt = cnt + 1;      % Increment iteration count.
    epsicalc = max(abs(abs(V) - abs(Vprev)));     % Calculate the difference between iterations.
    Vprev = V;
end     % End of while loop / Iteration
