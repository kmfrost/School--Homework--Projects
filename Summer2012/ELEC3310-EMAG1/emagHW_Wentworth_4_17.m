I = 2;
a = 3e-3;
rho1 = 0:1e-5:a;
rho2 = a:1e-5:9e-3;
H1 = I.*rho1/(pi*a^2);
H2 = I./(pi.*rho2);
plot(rho1,H1,rho2,H2);
grid on;
ylabel('H-field (A/m)');
xlabel('Radial Distance (m)');
title('H-field plotted for a solid wire centered on the z-axis.');