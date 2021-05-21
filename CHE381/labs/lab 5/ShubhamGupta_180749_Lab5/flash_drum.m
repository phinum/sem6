clear all 
global Ant Cp Hv P; 

z = [1/3 1/3 1/3] ;
TF=200 ; P = 100 ;F = 1 ;
Cp = [133 157 186.6] ;
Hv = [33800 38000 35570] ;
Ant(1,:) = [13.8594 14.0098 14.0045] ;
Ant(2,:) = [2773.78 3103.01 3279.47] ;
Ant(3,:) = [220.07 219.79 213.20] ;
[V0, L0 , y0 , x0 , T0] = flash_drum_ss(F, z , TF , P);


N0 = 10;
n0 = x0*N0;
Kc = 2*L0/N0;
Ti=20; 

dz = 0; dF = 0; dTF = 5 ; 

F0=F; z0=z; TF0=TF;

dt = 0.05;
tf = 50;
t = [0:dt:tf]';
N = zeros(length(t),1);
x = zeros(length(t),3);
y=x; n=x;
T=N; V=N; L=N; TF=N;
N(1,1)=N0; x(1,:)=x0; y(1,:)=y0; T(1,1)=T0; V(1,1)=V0; L(1,1)=L0; n(1,:)=N0*x0;

flag=1; idx=1; currtime=0;
while (flag)
    if idx==1
        F=F0; 
        z=z0; 
        TF(idx,1)=TF0;
    else
        F=F0+dF; z=z0 + [-0.5 1 -0.5]*dz;
        TF(idx,1) = TF0 + (1 - exp((-1/2)*t(idx)))*dTF;
    end
    L(idx,1) = L0 + Kc*(sum(n(idx,:))-N0);
    [ndot, T(idx,1), V(idx,1), x(idx,:), y(idx,:)] = drum_dynamics(n(idx,:),F,TF(idx,1),z,L(idx,1));
    idx = idx+1;
    n(idx,:) = n(idx-1,:) + ndot*dt;
    currtime = currtime+dt;
    if currtime >tf
        flag = 0;
    end
end

