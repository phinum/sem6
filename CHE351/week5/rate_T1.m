function ydot = rateSO2(y)
%format long
c = y(1);
T=y(2);
Q=0.06555;
Ct=0.0203;
alpha=26900;
V=6e-4;
M=30;
Cp=1070;
delH=-1e10;
Tin=600;
yin=0.02;
k1=6.7e10*exp(-12556/T);
k2=exp(961/T);
r = 0.05*k1*c/(T*((1+ k2*c)^2));
ydot(1) = Q*Ct*(yin-c) - alpha*r;
ydot(2) = Q*Ct*M*Cp*(T-Tin) - alpha*V*(-delH)*r;
end