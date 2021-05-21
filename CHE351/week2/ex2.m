k = 10;
y0 = 1;
tspan = [0 1];
options = [];
[t, y] = ode45(@rhs2, tspan, y0, options, k);
plot(t, y);