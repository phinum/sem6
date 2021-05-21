syms kc TD s
kp = 2;
kd = -2;
kc = 2.1981; 
thetap = 1;
thetad = 2;
tp = 5;
ti = 5;
td = 8;
TD = 0.3500;
gp = kp*exp(-thetap*s)/(tp*s + 1);
gd = kd*exp(-thetad*s)/(td*s + 1);
gc = kc*(TD*s+1)*(ti*s+1)/((ti*s)*(0.1*TD*s+1));
w = [0.1:0.005:10];
s = 1i*w;
gcl = (kc*kp*exp(-(thetap).*s).*(TD.*s + 1)./((ti.*s).*(0.1*TD.*s+1)))./(1+(kc*kp*exp(-(thetap).*s).*(TD.*s + 1)./((ti.*s).*(0.1*TD.*s+1))));
a = 20*log10(abs(gcl));
plot(log10(w), a, 'r');
grid on
xlabel('log(w)')
ylabel('L_C_L')
title('L_C_L vs log(w) for PID control')
gtext('Shubham Gupta 180749')