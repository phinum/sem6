function ydot = rateSO2(z,y)
ydot = zeros(2,1);
X=y(1);
T=y(2);
k1=exp(-14.96 +11070/T);
k2=exp(-1.331 + 2331/T);
Keq=exp(-11.02 +11570/T);

Term1=X*sqrt(1-0.167*(1-X));
Term2=2.2*(1-X)/Keq;
Denom=(k1+k2*(1-X))^2;

Rate = (Term1-Term2)/Denom;
ydot(1)=-50*Rate;
ydot(2)=-4.1*(T-673.2) + 1.02e4*Rate; 