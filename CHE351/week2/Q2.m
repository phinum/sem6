cin = 1;
Vr = [0 50];
k = 2;
K = 4;
Q = 2.2;
[V, c] = ode45(@(V,c) -(k*c)/(Q*(K*c+1)*(K*c+1)), Vr, cin);
plot(V,c);