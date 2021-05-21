y0 = [1 673.2];
Zspan = [0 1];

[z,y] = ode45(@rateSO2,Zspan,y0);
subplot(2,1,1);
plot(z,y(:,1),'g');
hold on
subplot(2,1,2);
plot(z,y(:,2),'k');