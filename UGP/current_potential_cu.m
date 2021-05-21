%x = linspace(0,1,20) ;
%n = length(x) ;
global iL a1 b1 i0 R T beta Enot F V1 n;
%consideration of mass transfer
%im = iL*(1-C(o,s)/C(o,b))
n = 2 ; %no of electrons transferred
F = 96500 ;
%iL = n*F*Dm*Cmb/dm  ,  km = Dm/dm
km = 2e-6 ;  %using sherwood approximation
%km = 7.54*D/2*h where D = 2e-9m/s and h = 5mm
Cmb = 600 ; %bulk copper concentration in mol/m3 (0.6M)

iL = 150 ;

% assuming i to be 80% of iL
% i=0.8*iL ;

%Anodic Overpotential 
%using tafel equation
a1 = 0.303 ; b1 = 0.12 ;
%eta_a = a1 + b1*log10(i) ;

% Cathodic Overpotential 
% Using butler-Volmer equation with symmetric factor
% beta =1 and also incorporates overpotential due to conecentration
% (Nerst-Planck)

%i = i0*(Cs/Cb)*exp(-n*F*eta_c/R*T)
%i0 == echange current is taken to be 245A/m2
i0 = 0.2 ;
%eta_c = (R*T/n*beta*F)*(ln(i0) - ln(i) - ln(iL/(iL-i)))
R = 8.314 ;  % gas constant
T = 298 ;   %at 25 C
beta=1 ;
%eta_c = (R*T/(n*beta*F))*(log(i0) - log(i) - log(iL/(iL-i)) ) ;

%calculating the cell potential
Enot = -0.4 ;
%Vnet = Enot + eta_a - eta_c ;
x = linspace(0 , 1 , 60) ;
n = length(x) ;
V = Enot ;
Vnet = zeros(n,1);
inet = zeros(n,1);
for i=1:n
   V1 = V + x(i) ;
   Vnet(i) = V1 ;
   inet(i) = fsolve(@fun , 0.01) ;
end

plot(inet , Vnet , 'linewidth' ,2 ) ;
xlabel('Current (in A)') ;
ylabel('Volatge' ) ;
title('Variation of Current with potential for Cu electro-deposition') ;
grid on ;
function y = fun(i)
  global iL a1 b1 i0 R T beta Enot F V1 n ;
  y = Enot + (a1 + b1*log10(i)) - (R*T/(n*beta*F))*(log(i0) - log(i) - log(iL/(iL-i)) )-V1 ;
end
