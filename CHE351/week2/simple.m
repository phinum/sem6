y0 = 1;
tspan = [0 1];
[t, y] = ode45(@(t,y) -10*y, tspan, y0);
plot(t,y);