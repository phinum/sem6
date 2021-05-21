function ydot = rate1_mass(Vr,y)
global Kc Vel K;
ydot = zeros(3,1);
Ca = y(1);
options = [];
Cg = Ca;
Cs = fzero(@mass_rxn, Cg, options, Ca);
Rate = K*Cs*Cs;
ydot(1) = -2*Rate/Vel;
ydot(2) = Rate/Vel;
ydot(3) = 0;