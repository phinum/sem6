function ydot = rhs1(t,y)
global k;
ydot = -k*y;