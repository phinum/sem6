function fn = rate_T(c)
global beta gamma flowvol;
beta = 0.25; 
gamma = 30;
flowvol = 25;
T = 1 + beta*(1-c);
rate = c*exp(gamma*(1-1/T));
fn = flowvol*(1-c) - rate;