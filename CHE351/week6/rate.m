global beta gamma Damk Lewis Tin
beta = 0.15;
gamma = 30;
Lewis = 1080;
Damk = 0.115;
Tin = 1;
[t, y] = ode45(@rate_limit, [0 2], [0.7 1.0]);
plot(t,y(:,1),'*-b',t,y(:,2),'o-g');
%plot(y(:,1),y(:,2),'o-g');
xlabel("TIME");
legend("Concentration","Temperature");
