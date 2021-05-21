global k;
k = 10;
y0 = 1;
tspan = [0 1];
[t, y] = ode45(@rhs1, tspan, y0);
plot(t, y);
