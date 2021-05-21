function y = mass_rxn(Cs,Ca)
global K  Km;
y = Km*(Ca-Cs) - K*Cs*Cs;