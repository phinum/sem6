function [V, L , y , x , T] = flash_drum_ss(F, z , TF , P)
 global Ant Cp Hv
 Tsat = Ant(2,:)./(Ant(1,:) - log(P)) - Ant(3,:) ;
 T = z*Tsat' ;
 flag=1 ; dT=0.1 ;
 Nmax=200 ; count=0 ;
 
 while flag
      [v,y,x] = tpf(T,P,z) ;
      [vp]=    tpf(T+dT,P,z) ;
      dvdT = (vp-v)/dT ;
      V = v*F ;
      L = (1-v)*F ;
      CpLV = y*Cp' ;
      CpLL = x*Cp' ;
      CpF= z*Cp' ;
      Hvap = y*Hv' ;
      ve = (CpF*TF-CpLL*T)/((CpLV-CpLL)*T + Hvap) ;
      vep = (CpF*TF-CpLL*(T+dT))/((CpLV-CpLL)*(T+dT) + Hvap) ;
      dvedT = (vep-ve)/dT ;
      f = v - ve ;
      dfdT = dvdT-dvedT ;
      Tnew = T-0.5*1/dfdT*f ;
      
      if abs(f)<1e-6
          flag=0 ;
      else
          count = count+1;
          T = Tnew ;
      end
      
      if count > Nmax
          disp('Did not Converge') ;
          break ;
      end    
 end
end