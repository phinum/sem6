fun = @solve2eq;
x0 = [2.5 2.5];
x = fsolve(fun,x0);
disp(x)