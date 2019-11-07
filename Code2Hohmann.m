global total_del_v_h
global time_h
mu = 398600;
R_E = 6378;
h_I = 1000;
r_I = h_I+R_E;
r_F = [1000 : 1000 : 300000]+R_E;
v_r_I = sqrt(mu*(1/r_I));
a_T = (r_I+r_F)/2;
v_r_T_p = sqrt(mu*((2/r_I)-(1./a_T)));
del_v_1 = v_r_T_p-v_r_I;
v_r_T_a = sqrt(mu*((2./r_F)-(1./a_T)));
v_r_F = sqrt(mu*(1./r_F));
del_v_2 = v_r_F-v_r_T_a;
time_h = pi*sqrt((a_T.^3)/mu);
disp("Hohmann Transfer to 125000 km orbit:");
if del_v_1(125) >= 0
    fprintf('The first velocity impulse is %f km/s in the direction of velocity.\n',del_v_1(125));
else
    fprintf('The first velocity impulse is %f km/s opposite to the direction of velocity.\n',abs(del_v_1(125)));
end
if del_v_2(125) >= 0
    fprintf('The second velocity impulse is %f km/s in the direction of velocity.\n',del_v_2(125));
else
    fprintf('The second velocity impulse is %f km/s opposite to the direction of velocity.\n\n\n',abs(del_v_2(125)));
end
disp("Hohmann Transfer to 200000 km orbit:");
if del_v_1(200) >= 0
    fprintf('The first velocity impulse is %f km/s in the direction of velocity.\n',del_v_1(200));
else
    fprintf('The first velocity impulse is %f km/s opposite to the direction of velocity.\n',abs(del_v_1(200)));
end
if del_v_2(200) >= 0
    fprintf('The second velocity impulse is %f km/s in the direction of velocity.\n',del_v_2(200));
else
    fprintf('The second velocity impulse is %f km/s opposite to the direction of velocity.\n\n\n',abs(del_v_2(200)));
end
disp("Hohmann Transfer to 300000 km orbit:");
if del_v_1(300) >= 0
    fprintf('The first velocity impulse is %f km/s in the direction of velocity.\n',del_v_1(300));
else
    fprintf('The first velocity impulse is %f km/s opposite to the direction of velocity.\n',abs(del_v_1(300)));
end
if del_v_2(300) >= 0
    fprintf('The second velocity impulse is %f km/s in the direction of velocity.\n',del_v_2(300));
else
    fprintf('The second velocity impulse is %f km/s opposite to the direction of velocity.\n\n\n',abs(del_v_2(300)));
end
total_del_v_h = abs(del_v_1)+abs(del_v_2);
figure
plot(r_F-R_E,del_v_1);
xlabel("Final orbit altitude in km");
ylabel("First velocity impulse in km/s in positive direction");
title("Hohmann Transfer from 1000 km altitude orbit");
figure
plot(r_F-R_E,del_v_2);
xlabel("Final orbit altitude in km");
ylabel("Second velocity impulse in km/s in positive direction");
title("Hohmann Transfer from 1000 km altitude orbit");
figure
plot(r_F-R_E,total_del_v_h);
xlabel("Final orbit altitude in km");
ylabel("Total velocity impulse in km/s");
title("Hohmann Transfer from 1000 km altitude orbit");
figure
plot(r_F-R_E,time_h);
xlabel("Final orbit altitude in km");
ylabel("Total time for transfer in seconds");
title("Hohmann Transfer from 1000 km altitude orbit");