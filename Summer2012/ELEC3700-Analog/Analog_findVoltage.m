function [VBA] = findVoltage(Q,A,B)
%     enot    = (10e-9/(36*pi));
%     r       = B - A;
%     R       = norm(r);
%     ar      = r/R;
%     dr      = [dx dy];
%     %E       = Q/(4*pi*enot*R^2
%     dl      = 
%     VBA = integral(func,A,B);
% end

k=1000;
dl = norm((A-B))/k;
dlv = dl*[0 -1 0]; 
for n=1:k
    y(n)=(n-1)*dl+dl/2;
    R=[3 y(n) 0];
    Rmag = norm(R);
    E=90*R/Rmag^3;
    V(n)=dot(E,dlv);
end
VBA=sum(-V);
    