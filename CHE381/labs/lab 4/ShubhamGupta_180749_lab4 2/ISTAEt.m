function J=IAE(x,filename,yf)
global y Kc Ti Td D;
Kc=x(1,1);
Ti=x(1,2);
Td=x(1,3);
D=x(1,4);
sim(filename);
J=sum(abs((y(:,3)-yf)*0.1).*y(:,1).^2);
end