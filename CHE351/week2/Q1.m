 cin = 2;
Vr = [0 2000];
k = 0.198;
v = 3.8;
Q = 50;
[V, c] = ode45(@(V,c) -(k*c)/(Q*(c+v)), Vr, cin);
plot(V,c);