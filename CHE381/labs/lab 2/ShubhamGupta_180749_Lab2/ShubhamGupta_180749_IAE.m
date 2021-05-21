function J=IAE(x,filename,yf)
global y Kc  
Kc=x(1);
%Ti=x(2);
%Td=x(3);
sim(filename);
J=sum(abs(y(:,3)-yf)*0.1);
end