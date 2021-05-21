syms K w;
y = 2*K/sqrt((5*w - 2*K*sin(w))^2 + (1+2*K*sin(w))^2);
DF = diff(y, w);
disp(DF);


-(2*(5*w - 2*K*sin(w))*(2*K*cos(w) - 5) - 4*K*cos(w)*(2*K*sin(w) + 1))/(2*((5*w - 2*K*sin(w))^2 + (2*K*sin(w) + 1)^2)^(1/2));