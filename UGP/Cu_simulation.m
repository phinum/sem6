% Modeling and simulation of electrodeposition: Effect of electrolyte current density and
% conductivity on electroplating thickness

% Governing Equations
% Ni = zi*ui*F*ci*del(phi) - Di*del(ci) + Vi*ci
% mui = R*T*ln(del(ci)) + zi*F*del(phi)
% Ji = -Di*ci*del(mui)/R*T
% dci/dt = -del(Ni) + Ri 
% i_d = -sigma*del(phi)
% sum(z*c) = 0
% eta = Eeq - E
% eta = a + b*log(i)

% Butler Volmer Equation
% i = i0*(exp(alpha*F*eta/R*T) - exp(-(1-alpha)*F*eta/R*T))
%x = linspace(0,1,20) ;
%n = length(x) ;

%consideration of mass transfer
%im = iL*(1-C(o,s)/C(o,b))
n = 2 ; %no of electrons transferred
F = 96500 ;
%iL = n*F*Dm*Cmb/dm  ,  km = Dm/dm
km = 1.54e-6 ;  %using sherwood approximation
%km = 7.54*D/2*h where D = 2e-9m/s and h = 5mm
Cmb = 600 ; %bulk copper concentration in mol/m3 (0.6M)
iL = n*F*km*Cmb ;

%assuming i to be 80% of iL
i=0.8*iL ;

%Anodic Overpotential 
%using tafel equation
a1 = 0.303; b1 = 0.12;
eta_a = a1 + b1*log10(i);

% Cathodic Overpotential 
% Using butler-Volmer equation with symmetric factor
% beta =1 and also incorporates overpotential due to conecentration
% (Nerst-Planck)

i = i0*(Cs/Cb)*exp(-n*F*eta_c/R*T) ;
%i0 == echange current is taken to be 245A/m2
i0 = 245 ;
%eta_c = (R*T/n*beta*F)*(ln(i0) - ln(i) - ln(iL/(iL-i)))
R = 8.314 ;  % gas constant
T = 298 ;   %at 25 C
beta = 1 ;
eta_c = (R*T/(n*beta*F))*(log(i0) - log(i) - log(iL/(iL-i)) ) ;

%calculating the cell potential
Enot = 0.337;
Vnet = Enot + eta_a - eta_c ;


