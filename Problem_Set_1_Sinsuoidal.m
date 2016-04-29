%this code generates a n oscillating T(z)
%written by kfw 1/13/2016

clear all
clf

%% intialize

Ts_bar=-10; %degrees C
kappa=1e-6; % diffusivity m2/s
DT=15;%change in temperature
DT_daily=10;

dz=0.05; %m
zmax=15; %m
z=0:dz:zmax; %array of z's

dt=30*3600*24;%change in time, 10 days a year
dt_daily=6*3600;%change in time, every 6 hours
P=365*24*3600;
P_daily=3600*24;
tmax=1*P;
tmax_daily=1*P_daily;
t=0:dt:tmax;
t_daily=0:dt_daily:tmax;

tplot=dt;
tplot_daily=dt_daily;

zstar=sqrt(kappa*P/pi);
zstar_daily=sqrt(kappa*P_daily/pi);

Tenv_hot=Ts_bar+DT*exp(-z/zstar)+DT_daily*exp(-z/zstar_daily); %envelope
Tenv_cold=Ts_bar-DT*exp(-z/zstar)-DT_daily*exp(-z/zstar_daily); %envelope

Tzero=zeros(size(z));
imax=length(t);
imax_daily=length(t_daily);

nframe=0;
%% Run


for i=1:imax_daily

    Tannual=Ts_bar+DT*exp(-z./zstar)...
    .*sin((2*pi*t_daily(i)/P)-(z./zstar));  
    
    Tdaily=Tannual+DT_daily*exp(-z./zstar_daily)...
        .*sin((2*pi*t_daily(i)/P_daily)-(z./zstar_daily));
    
    if(rem(t_daily(i),tplot_daily)==0)
        nframe = nframe+1;
    
        figure(1)
        
        plot(Tannual,z,'linewidth',2)
        plot(Tdaily,z,'linewidth',2)
  
        xlabel('Temperature (C)','fontname','arial','fontsize',23)
        ylabel('Depth (m)','fontname','arial','fontsize',23)
        set(gca,'fontsize',18,'fontname','arial')
        set(gca,'YDIR','reverse') 
        axis([Ts_bar-DT-1 Ts_bar+DT+1 0 zmax])
        
        hold on
        
        plot(Tzero,z,'g--','linewidth',4)
        plot(Tenv_hot,z,'r','linewidth',4)
        plot(Tenv_cold,z,'c','linewidth',4)
    
        M(:,nframe)=getframe(gcf);
    
        pause(0.1)
        
       hold off
    
    end
    
end

movie2avi(M,'Tprofile_daily','fps',24) 



