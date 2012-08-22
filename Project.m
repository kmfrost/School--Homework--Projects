%Project
clc
clear all

%Givens
alpha1 = [0:46];    %Angles and distances
O2O1   = 4;
AO2    = 2;
BA     = 1;
O1B    = 2;

%Animation
n = 1;
while n<=length(alpha1)
    
    pO2    = [0,0,0];    %Points
    pO1    = [O2O1,0,0];
    pA     = pO2 + AO2*[cosd(alpha1(n)),sind(alpha1(n)),0];

    %Solve for alpha2
    theta2 = acosd(((O1B)^2 + (BA)^2 - (norm(pO1-pA)^2))/(2*O1B*BA));
    theta3 = asind(BA*sind(theta2)/norm(pO1-pA));
    alpha2 = asind(AO2*sind(alpha1(n))/norm(pO1-pA))+theta3;

    pB              = pO1 + O1B*[-cosd(alpha2),sind(alpha2),0];
    pP              = pA+(pB-pA)/2;
    Ptrack(1,n)     = alpha1(n);
    Ptrack([2:4],n) = pA+(pB-pA)/2;
    
    rO2A = (pO2-pA);    %Vectors
    rAB  = (pA-pB);
    rBO1 = (pB-pO1);
    
    link1x = [pO2(1):norm(rO2A)/50:pA(1)];
    link1y = linspace(pO2(2),pA(2),length(link1x));
    
    link2x = [pA(1):norm(rAB)/50:pB(1)];
    link2y = linspace(pA(2),pB(2),length(link2x));
    
    link3x = [pB(1):norm(rBO1)/50:pO1(1)];
    link3y = linspace(pB(2),pO1(2),length(link3x));
    
    hold off
    plot(link1x,link1y,'r','linewidth',2)
    hold on
    plot(link2x,link2y,'g','linewidth',2)
    plot(link3x,link3y,'b','linewidth',2)
    plot(pO2(1),pO2(2),'ok','linewidth',4)
    plot(pA(1),pA(2),'ok','linewidth',4)
    plot(pB(1),pB(2),'ok','linewidth',4)
    plot(pO1(1),pO1(2),'ok','linewidth',4)
    plot(pP(1),pP(2),'ok','linewidth',4)
    plot(Ptrack(2,[1:n]),Ptrack(3,[1:n]),'m')
    axs = [0,4,0,2];
    axis(axs)
    
    a = norm(pB-pA);
    b = norm(pO2-pA);
    c = norm(pO1-pB);
    %fprintf('Link 1: %3f  Link 2: %3f  Link 3: %3f \n',b,c,a)
    if theta2<=0
        break
    end
    
    pause(0.25)
    
    n = n+1;
end