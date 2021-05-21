% voltammogram for copper elctrowinning

% Governing Equations
% Ni = zi*ui*F*ci*del(phi) - Di*del(ci) + Vi*ci
% mui = R*T*ln(del(ci)) + zi*F*del(phi)    %electrochemical potential
% Ji = -Di*ci*del(mui)/R*T  %fiffusion
% dci/dt = -del(Ni) + Ri 
% sum(z*c) = 0              %charge balance
% eta = Eeq - E             the overpotential
% eta = a + b*log(i)        the tafel Equation

% Butler Volmer Equation
% i = i0*(exp(alpha*F*eta/R*T) - exp(-(1-alpha)*F*eta/R*T))

clear ;
                     %global iL i0 R T beta F  n;


                     %im = iL*(1-C(o,s)/C(o,b))
n = 2 ;              %no of electrons transferred
F = 96485 ;          %Faraday's Constant
                     %iL = n*F*Dm*Cmb/dm  ,  km = Dm/dm
km = 1.54e-6 ;       %using sherwood approximation
                     %km = 7.54*D/2*h where D = 2e-9m/s and h = 5mm
Cmb = 600 ;          %bulk copper concentration in mol/m3 (0.6M)
                     %iL = n*F*km*Cmb ;

                     %i = i0*(Cs/Cb)*exp(-n*F*eta_c/R*T)
            
i0 = 245 ;           %i0 == echange current is taken to be 245A/m2
                     %eta_c = (R*T/n*beta*F)*(ln(i0) - ln(i) - ln(iL/(iL-i)))
R = 8.314 ;          % gas constant
T = 298 ;            %at 25 C
beta=0.5 ;
%eta_c = (R*T/(n*beta*F))*(log(i0) - log(i) - log(iL/(iL-i)) ) ;
eta = linspace(-0.4 ,0.3 ,100);
t = length(eta);
i = zeros(1,t);

for iL = 150:50:350

   for itr = 1:t    
        i(itr) = (iL*i0)/((iL*exp((eta(itr)*beta*n*F)/(R*T)))+i0);
   end

    plot(eta , i , 'linewidth' ,1.5 ) ;
    hold on;
end

xlabel('Overpotential') ;
ylabel('Current density (in m/A^2)' ) ;
title('Voltammograms for different DLC') ;
legend('150' ,'200' , '250' , '300' , '350');
grid on ;