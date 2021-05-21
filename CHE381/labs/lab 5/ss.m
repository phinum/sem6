clear ;
clc ;
global Ant Cp Hv P

Cp = [133 157 186.6] ;
Hv = [33800 38000 35570] ;
Ant(1,:) = [13.8594 14.0098 14.0045] ;
Ant(2,:) = [2773.78 3103.01 3279.47] ;
Ant(3,:) = [220.07 219.79 213.20] ;

F0=1 ;
z0=[1/3 1/3 1/3] ;
TF0=200 ;
P=100 ;

N = zeros(1000,1) ;
x = zeros(1000,3) ;
y=x ; n=x ;
T=N ; V=N ; L=N ; TF=N ;


flag = 1 ; idx=1 ; currtime=0 ;
inc=0 ;

while (idx < 1001)
    T(idx,1) = TF0+inc ;
    [V0,L0,y(idx,:),x0,T1]=flash_drum_ss(F0,z0, TF0+inc, P) ;
    inc = inc + 0.1 ;
    idx = idx+1 ;
    
end
plot(T , y(:,1) ,'r', 'Linewidth' , 2)
hold on;
plot(T , y(:,2) ,'b', 'Linewidth' , 2)
hold on;
plot(T , y(:,3) ,'m','Linewidth' , 2) 
title("Vapour Steady State Variation")
xlabel("Feed Temperature")
ylabel("Vapour Phase Mole Fraction")
legend("Benzene","Tolune","Ethyl Benzene")
gtext("Shubham Gupta 180749")
grid on