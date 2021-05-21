T = 333;                %   K
R = 8.314;              %   J/molK
pH2 = 1.265;          %   atm
pO2 = 2.527;          %   atm
F = 96485;              %   Faraday's Constant
alphaA = 0.5;
alphaC = 1;
iC0 = 1e-11;
iA0 = 1e-3;
LB = 125*(1e-6);        %   meter


E0 = 1.23 - 0.9*0.001*(T - 298) + (R*T*log(pH2*pH2*pO2))/(4*F);
disp(E0)

delH0 = -52.3;
lambH = 349.8;
Eu = 14;
q = 1.5;
del = 5.5;
lamb = 1.9;
Kacref = 6.2;

eB = lamb/((537/18)+lamb);
Kac = Kacref*exp(-delH0*(1/T - 1/298)/R);
