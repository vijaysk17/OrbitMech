global B;
global atm_alt;
global atm_dens;
global mu;
global j;
a = 200 : 1 : 1000;
B = (50*10^6 : 25*10^6 : 300*10^6)';
atm_alt = table2array(data(:,1));
atm_dens = table2array(data(:,2));
mu = 398600;
for j = 1 : length(B)
   t0 = 0;
   [y,time] = ode45(@(y,t) f(y,t),[200 100],t0);
   t(j,1) = max(time);
   for i = 2 : length(a)
      i
      [yt,tim] = ode45(@(y,t) f(y,t),[a(i) 100],t0);
      t(j,i) = max(tim);
   end    
end
t = t/(24*3600);

figure
plot(a,t(1,:),a,t(3,:),a,t(5,:),a,t(7,:),a,t(9,:),a,t(11,:));
xlabel('Orbit size in kms');
ylabel('Life time in days');
legend('B = 50 kg/m^2','B = 100 kg/m^2','B = 150 kg/m^2','B = 200 kg/m^2','B = 250 kg/m^2','B = 300 kg/m^2');

figure 
plot(time,y)
xlabel('Time in days');
ylabel('Altitude in km');
title('Altitude vs. time for spacecraft with alt = 200 km, and B = 300 kg/m^2');

figure
plot(B*10^-6,t(:,1),B*10^-6,t(:,201),B*10^-6,t(:,401),B*10^-6,t(:,601),B*10^-6,t(:,651),B*10^-6,t(:,701),B*10^-6,t(:,751),B*10^-6,t(:,801),0,0);
xlabel('Ballistic coefficient in kg/m^2');
ylabel('Life time in days');
legend('a = 200 km','a = 400 km','a = 600 km','a = 800 km','a = 850 km','a = 900 km','a = 950 km','a = 1000 km');

function tdot = f(y,t)
   global B
   global atm_alt
   global atm_dens
   global mu
   global j
   if y<=900
   density = interp1((atm_alt),(atm_dens),y,'linear');
   else
   density = interp1((atm_alt),(atm_dens),y,'linear','extrap');
   end
   tdot = -B(j)/(sqrt(mu*y)*density) + 0*t;  
end