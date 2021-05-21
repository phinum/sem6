G = tf(2*[-2,1],conv(conv([2 1],[1 1]),[1/4 1 1]));
rlocus(G, 'k')
hold on
%plot([0 -0.5], [0 0.5*sqrt(3)], 'b')
hold on
a = fzero(@(x) (atan(sqrt(3)*x/(0.5-x)) + atan(sqrt(3)*x/(1-x)) + 2*(atan(sqrt(3)*x/(2-x))) -(pi - atan(sqrt(3)*x/(0.5+x))))*180/pi,0.3);
s = -a + sqrt(3)*a*j;
mG = (2*(-2*s + 1))/((2*s + 1)*(s+1)*(0.5*s + 1)^2);
Kc = abs(1/mG);
hold on
%plot(-a, sqrt(3)*a,'g*')
grid on
hold on
%gtext('Shubham Gupta 180749')