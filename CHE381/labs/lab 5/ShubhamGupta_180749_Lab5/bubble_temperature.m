function [T,y] = Bubble_temperature(x,P)
 global Ant;

 T = fsolve(@(t)fun(x,P,t) , 0);
 P_sat = exp(Ant(1,:)-Ant(2,:)./(Ant(3,:)+T));
 y = (P_sat.*x)/P ;
 
 function y = fun(x,P,t)
 y = sum(exp(Ant(1,:)-Ant(2,:)./(Ant(3,:)+t))*x')-P;
 end

end