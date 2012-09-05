clc;
clear all;
%% Dr. Roppel's Original Code (To Be Removed)
%simulation of trajectory for the case in which
%both wheels are turning at a constant rate.
r   = 1; %wheel radius
c2  = 1; %wheel 2 (left wheel) angular rate (phi2-dot)
a   = 1; %ratio of wheel 1 (right wheel) to wheel 2 speed
l   = 1; %half the wheelbase
x0  = 0; %inital global x position
y0  = 0; %initial global y position
t   = 0:.1:20;
x   = x0+l*((a+1)/(a-1))*sin((r/2/l)*(a-1)*c2*t);
y   = y0-l*((a+1)/(a-1))*(cos((r/2/l)*(a-1)*c2*t)-1);
figure
plot(x,y); %produces a 2-D plot
%axis equal
xlabel('x')
ylabel('y')
figure
scatter3(x,y,t); %produces a 3-D trajectory plot
xlabel('x')
ylabel('y')
zlabel('time')
