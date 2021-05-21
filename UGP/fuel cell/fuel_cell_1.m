T = 333;                %   60^C
R = 8.314;              %   J/molK
pH2O = 2.931;           %   atm
pH2 = 1.265;            %   atm
pO2 = 2.527;            %   atm
F = 96485;              %   Faraday's Constant
i0 = 10^(-6.912) ;       %   A/cm2
al = 0.5;
b = (R*T)/(2*al*F);
c = (R*T)/(2*F);
iL = 1.4;               %   A/cm2
Resistance = 0.19;      %   Ωcm2
Er = 1.229 ;

i = linspace(0.0001 , 1.4 , 10000) ;
E = zeros(1, length(i));

for itr=1: length(i)
    
    E(itr) =   Er+(- b*log(i(itr)/i0) - c*log(iL/(iL-i(itr)) ) - i(itr)*Resistance);
    
end

plot(i , E , 'linewidth' , 2);
grid on;
xlabel('Current Density (A/cm^2)');
ylabel('Voltage (in V)');
title('Proton Exchange Membrane Fuel Cell Polarisation Curve');