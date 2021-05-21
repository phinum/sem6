syms kc TD s
kp = 2;
kd = -2;
thetap = 1;
thetad = 2;
tp = 5;
ti = 5;
td = 8;
gp = kp*exp(-thetap*s)/(tp*s + 1);
gd = kd*exp(-thetad*s)/(td*s + 1);
gc = kc*(TD*s+1)*(ti*s+1)/((ti*s)*(0.1*TD*s+1));
TD = [0:0.05:2];
k = zeros(length(TD),1); 
for j=1:length(TD)
    kc = 0.1;
    lm = -20;
    dkc = 0.0001;
    t_d = TD(j);
    while abs(lm-2)>0.005
        w = [0.1:0.005:10];
        s = 1i*w;
        gcl = (kc*kp*exp(-(thetap).*s).*(t_d.*s + 1)./((ti.*s).*(0.1*t_d.*s+1)))./(1+(kc*kp*exp(-(thetap).*s).*(t_d.*s + 1)./((ti.*s).*(0.1*t_d.*s+1))));
        a = 20*log10(abs(gcl));
        lm = max(a);
        if lm>2
            kc = kc-dkc;
        else
            kc = kc+dkc;
        end        
    end
    k(j) = kc;
end
[kcm,index] = max(k);
disp(kcm)
disp(TD(index))
plot(TD,k,'r');
grid on
xlabel('\tau_D')
ylabel('K_C')
title('K_C vs \tau_D')
gtext('Shubham Gupta 180749')