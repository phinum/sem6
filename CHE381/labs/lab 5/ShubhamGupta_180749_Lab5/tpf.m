function [v,y,x] = tpf(T,P,z)

global Ant

v=0.5 ; alpha = 0.5 ;
flag=1 ;
count=0 ;
while flag
 
   P_sat = exp(Ant(1,:)-Ant(2,:)./(Ant(3,:)+T)) ; 
   K=P_sat/P ;
   y = K.*z./((K-1)*v+1) ;
   x = z./((K-1)*v+1) ;
   fy = sum(y) ;
   fx = sum(x) ;
   f = fy-fx ;
   
   if abs(f)<1e-10
       flag=0;
   else
       dfdv =-sum(( (K-1).^2).*z./(((K-1)*v+1)).^2) ;
       dv=-1/dfdv*f*alpha ;
       v = v + dv ;
       count = count+1 ;
   end
   
end
end