function J=ISTAE(x,filename,yf)
global Y TP TD Theta Kc Ti Td Kp Kd
Kc=x(1);
Ti=x(2);
Td=x(3);
TP=x(4);
TD=x(5);
Theta=x(6);
Kp=x(6);
Kd=x(7);
sim(filename);
J=sum(abs((Y(:,2)-yf)*0.1).*Y(:,1).^2);
end