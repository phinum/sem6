syms c(x) t(x)

ode1 = (1/96)*diff(diff(c)) - diff(c) - 3.817*c*c == 0;
ode2 = (1/96)*diff(diff(t)) - diff(t) + 0.056*3.817*c*c == 0;
odes = [ode1; ode2];

S = dsolve(odes);

cSol(x) = S.c;
tSol(x) = S.t;

[cSol(t), tSol(t)] = dsolve(odes);

cond1 = -(1/96)*diff(c(0)) == 1 - c(0);
cond2 =  diff(c(1)) == 0;
cond3 = -(1/96)*diff(t(0)) == 1 - t(0);
cond4 =  diff(t(1)) == 0;
conds = [cond1; cond2; cond3; cond4];
[cSol(x), tSol(x)] = dsolve(odes,conds);

fplot(cSol)
hold on
fplot(tSol)
grid on