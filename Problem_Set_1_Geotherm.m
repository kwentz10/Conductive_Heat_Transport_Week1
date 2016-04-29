%this code generates a linear geotherm
%written by kfw 1/13/2016

clear all
clf

%% intialize

Ts=-12; %degrees C
k=2.5; %W/(m-K)
% k2=1.2;
Qm=0.045; %W/m2

dz=10;
zmax=800; 
z=0:dz:zmax;
 
% k=k1*ones(size(z));
% top=find(z<=30); %find outputs the index number
% k(top)=k2;


 
T = Ts+(Qm/k)*z;





Tzero=zeros(size(z));

figure(1)
plot(T,z,'r','linewidth',2)
hold on
plot(Tzero,z,'g--','linewidth',2)

xlabel('Temperature (C)','fontname','arial','fontsize',21)
ylabel('Depth (m)','fontname','arial','fontsize',21)
set(gca,'fontsize',18,'fontname','arial')
set(gca,'YDIR','reverse')

