yo=[2 0 2];
Zspan=[0 2.4];
[z,y] = ode45(@rate1,Zspan,yo);
plot(z,y,'LineWidth',2)
legend('A','B','C');