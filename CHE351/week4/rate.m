global K Vel Km;
K = 0.3;
Vel = 0.5;
Km = 0.2;
y0 = [2 0 2];
z_span = [0 2.4];
[z,y] = ode45(@rate1_mass,z_span,y0);
plot(z,y);
xlabel('x');
ylabel('Conc');
legend('A','B','C');