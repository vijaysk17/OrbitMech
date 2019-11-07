global time_h
mu = 398600;
R_E = 6378;
h_I = 1000;
r_I = h_I+R_E;
r_F = [1000 : 1000 : 300000]+R_E;
v_r_I = sqrt(mu*(1/r_I));
r_T = [150000 : 1000 : 500000]';
a_T_1 = (r_I+r_T)/2;
a_T_2 = (r_F+r_T)/2;
time_bi = pi*sqrt((a_T_2.^3)/mu)+pi*sqrt((a_T_1.^3)/mu);
time_bi = time_bi/(24*3600);
time_h = time_h/(24*3600);
v_r_T_1_p = sqrt(mu*((2/r_I)-(1./a_T_1)));
del_v_1 = v_r_T_1_p-v_r_I;
v_r_T_1_a = sqrt(mu*((2./r_T)-(1./a_T_1)));
v_r_T_2_a = sqrt(mu*((2./r_T)-(1./a_T_2)));
del_v_2 = v_r_T_2_a-v_r_T_1_a;
v_r_T_2_p = sqrt(mu*((2./r_F)-(1./a_T_2)));
v_r_F = sqrt(mu*(1./r_F));
del_v_3 = v_r_F-v_r_T_2_p;
disp("Bielliptic Transfer to 125000 km orbit:");
if del_v_1(151,1) >= 0
    fprintf('The first velocity impulse is %f km/s in the direction of velocity.\n',del_v_1(151,1));
else
    fprintf('The first velocity impulse is %f km/s opposite to the direction of velocity.\n',abs(del_v_1(151)));
end
if del_v_2(151,125) >= 0
    fprintf('The second velocity impulse is %f km/s in the direction of velocity.\n',del_v_2(151,125));
else
    fprintf('The second velocity impulse is %f km/s opposite to the direction of velocity.\n\n\n',abs(del_v_2(151,125)));
end
if del_v_3(151,125) >= 0
    fprintf('The third velocity impulse is %f km/s in the direction of velocity.\n',del_v_3(151,125));
else
    fprintf('The third velocity impulse is %f km/s opposite to the direction of velocity.\n\n\n',abs(del_v_3(151,125)));
end
disp("Bielliptic Transfer to 200000 km orbit:");
if del_v_1(151) >= 0
    fprintf('The first velocity impulse is %f km/s in the direction of velocity.\n',del_v_1(151));
else
    fprintf('The first velocity impulse is %f km/s opposite to the direction of velocity.\n',abs(del_v_1(151)));
end
if del_v_2(151,200) >= 0
    fprintf('The second velocity impulse is %f km/s in the direction of velocity.\n',del_v_2(151,200));
else
    fprintf('The second velocity impulse is %f km/s opposite to the direction of velocity.\n\n\n',abs(del_v_2(151,200)));
end
if del_v_3(151,200) >= 0
    fprintf('The third velocity impulse is %f km/s in the direction of velocity.\n',del_v_3(151,200));
else
    fprintf('The third velocity impulse is %f km/s opposite to the direction of velocity.\n\n\n',abs(del_v_3(151,200)));
end
disp("Bielliptic Transfer to 300000 km orbit:");
if del_v_1(151) >= 0
    fprintf('The first velocity impulse is %f km/s in the direction of velocity.\n',del_v_1(151));
else
    fprintf('The first velocity impulse is %f km/s opposite to the direction of velocity.\n',abs(del_v_1(151)));
end
if del_v_2(151,300) >= 0
    fprintf('The second velocity impulse is %f km/s in the direction of velocity.\n',del_v_2(151,300));
else
    fprintf('The second velocity impulse is %f km/s opposite to the direction of velocity.\n\n\n',abs(del_v_2(151,300)));
end
if del_v_3(151,300) >= 0
    fprintf('The third velocity impulse is %f km/s in the direction of velocity.\n',del_v_3(151,300));
else
    fprintf('The third velocity impulse is %f km/s opposite to the direction of velocity.\n\n\n',abs(del_v_3(151,300)));
end
total_del_v = abs(del_v_1)+abs(del_v_2)+abs(del_v_3);
figure
plot(r_T,del_v_1);
xlabel("Intermediate orbit radius in km");
ylabel("First velocity impulse in km/s in positive direction");
title("Bielliptic Transfer from 1000 km altitude orbit");
figure
plot(r_F-R_E,del_v_2(1,:),r_F-R_E,del_v_2(51,:),r_F-R_E,del_v_2(101,:),r_F-R_E,del_v_2(201,:),r_F-R_E,del_v_2(301,:),r_F-R_E,del_v_2(351,:));
xlabel("Final orbit altitude in km");
ylabel("Second velocity impulse in km/s in positive direction");
title("Bielliptic Transfer from 1000 km altitude orbit");
legend("150000 km Intermediate orbit radius","200000 km Intermediate orbit radius","250000 km Intermediate orbit radius","350000 km Intermediate orbit radius","450000 km Intermediate orbit radius","500000 km Intermediate orbit radius");
figure
plot(r_F-R_E,del_v_3(1,:),r_F-R_E,del_v_3(51,:),r_F-R_E,del_v_3(101,:),r_F-R_E,del_v_3(201,:),r_F-R_E,del_v_3(301,:),r_F-R_E,del_v_3(351,:));
xlabel("Final orbit altitude in km");
ylabel("Third velocity impulse in km/s in positive direction");
title("Bielliptic Transfer from 1000 km altitude orbit");
legend("150000 km Intermediate orbit radius","200000 km Intermediate orbit radius","250000 km Intermediate orbit radius","350000 km Intermediate orbit radius","450000 km Intermediate orbit radius","500000 km Intermediate orbit radius");
figure
plot(r_F-R_E,total_del_v(1,:),r_F-R_E,total_del_v(51,:),r_F-R_E,total_del_v(101,:),r_F-R_E,total_del_v(201,:),r_F-R_E,total_del_v(301,:),r_F-R_E,total_del_v(351,:),r_F-R_E,total_del_v_h);
xlabel("Final orbit altitude in km");
ylabel("Total velocity impulse in km/s");
title("Bielliptic Transfer from 1000 km altitude orbit");
legend("150000 km Intermediate orbit radius","200000 km Intermediate orbit radius","250000 km Intermediate orbit radius","350000 km Intermediate orbit radius","450000 km Intermediate orbit radius","500000 km Intermediate orbit radius", "Hohmann Transfer");
plot(r_F-R_E,time_bi(1,:),r_F-R_E,time_bi(51,:),r_F-R_E,time_bi(101,:),r_F-R_E,time_bi(201,:),r_F-R_E,time_bi(301,:),r_F-R_E,time_bi(351,:),r_F-R_E,time_h);
xlabel("Final orbit altitude in km");
ylabel("Total transfer time in days");
title("Bielliptic Transfer from 1000 km altitude orbit");
legend("150000 km Intermediate orbit radius","200000 km Intermediate orbit radius","250000 km Intermediate orbit radius","350000 km Intermediate orbit radius","450000 km Intermediate orbit radius","500000 km Intermediate orbit radius", "Hohmann Transfer");
