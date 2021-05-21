syms kc TD s
kp = 2;
kd = -2;
kc = 0.1;
thetap = 1;
thetad = 2;
tp = 5;
ti = 5;
td = 8;
gp = kp*exp(-thetap*s)/(tp*s + 1);
gd = kd*exp(-thetad*s)/(td*s + 1);
gc = kc*(ti*s+1)/(ti*s);
lm = -20;
dkc = 0.0001;
while abs(lm-2)>0.005
    w = [0.1:0.005:10];
    s = 1i*w;
    gcl = (kc*kp*exp(-(thetap).*s))./((ti.*s))./(1+(kc*kp*exp(-(thetap).*s))./((ti.*s)));
    a = 20*log10(abs(gcl));
    lm = max(a);
    if lm>2
        kc = kc-dkc;
    else
        kc = kc+dkc;
    end        
end
disp(kc);