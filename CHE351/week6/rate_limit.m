function ydot = rate_limit(t,y)
ydot = zeros(2,1);
global beta gamma Damk Lewis Tin ;
c = y(1);
T = y(2);
rate = c*Damk*exp(gamma*(1-1/T));
ydot(1) = 1-c-rate;
ydot(2) = (Tin - T + beta*rate)/Lewis;