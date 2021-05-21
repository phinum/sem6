function [ndot,T,V,x,y] = drum_dynamics(n,F,TF,z,L)
global Ant Cp Hv P;

N=sum(n);
x=n/N;
[T,y] = bubble_temperature(x,P);
CpF=Cp*z'; CpLL=Cp*x'; CpLV=Cp*y'; Hvap=Hv*y';
V = F*(CpF*TF - CpLL*T)/((CpLV-CpLL)*T + Hvap);
ndot = F*z - V*y -L*x;
end
