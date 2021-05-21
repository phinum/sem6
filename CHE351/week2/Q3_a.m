Q=50;
cin=2;
V=2000;
k=0.198;
v=3.8;
fzero(@(c) Q*(c-cin) + V*k*c/(c+v), 2)