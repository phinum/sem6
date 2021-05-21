Q=2.2;
cin=1;
V=50;
k=2;
K1=4;
fzero(@(c) Q*(c-cin) + V*k*c/(1+ K1*c)^2, 2)