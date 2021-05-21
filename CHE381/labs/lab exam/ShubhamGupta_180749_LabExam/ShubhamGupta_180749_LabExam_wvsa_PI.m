syms kc TD s
kp = 2;
kd = -2;
kc = 1.7527;
thetap = 1;
thetad = 2;
tp = 5;
ti = 5;
td = 8;
gp = kp*exp(-thetap*s)/(tp*s + 1);
gd = kd*exp(-thetad*s)/(td*s + 1);
gc = kc*(ti*s+1)/(ti*s);
w = [0.1:0.005:10];
s = 1i*w;
gcl = (kc*kp*exp(-(thetap).*s))./((ti.*s))./(1+(kc*kp*exp(-(thetap).*s))./((ti.*s)));
a = 20*log10(abs(gcl));
plot(log10(w), a, 'r');
grid on
xlabel('log(w)')
ylabel('L_C_L')
title('L_C_L vs log(w) for PI control')
gtext('Shubham Gupta 180749')