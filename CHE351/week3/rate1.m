function ydot = rate1(z,y)
ydot = zeros(3,1);
CA = y(1);
Rate = 2*0.3*CA*CA;
ydot(1) = -2*Rate;
ydot(2) = Rate;
ydot(3) = 0;