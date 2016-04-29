%this code generates ten depth T(t) plots
%written by kfw 1/13/2016

clear all
clf

%% intialize

Ts_bar=-10; %degrees C
kappa=1e-6; % diffusivity m2/s
DT=15;%change in temperature
P=365*24*3600;
zstar=sqrt(kappa*P/pi);

dt=10*3600*24;%change in time, 10 days a year
tmax=1*P;
t=0:dt:tmax;

%% Run

z=1:1.5:15;

%plotStyle = {'b-','k-','r-','c-','y-','g-','m-','b--','r--','k--'};

for i=1:10 
   
    Tannual=Ts_bar+DT*exp(-z(i)./zstar)...
    .*sin((2*pi*t/P)-(z(i)./zstar));  
   
    figure(1)
    
    %subplot(5,2,i)
    
    plot(t,Tannual,'linewidth',2)
    xlabel('Time (s)','fontname','arial','fontsize',15)
    ylabel('Temperature (C)','fontname','arial','fontsize',15)
    set(gca,'fontsize',18,'fontname','arial')
    title('T(t) at Various Depths','fontsize',21)
    
    hold on

end

l=legend('Depth=1 m','Depth=2.5 m','Depth=4 m','Depth=5.5 m','Depth=7 m',...
    'Depth=8.5 m','Depth=10 m','Depth=11.5 m','Depth=13 m','Depth=14.5 m',...
    'fontsize',10);

set(l,'FontSize',14);



