clear;
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NOMINALNE WARTOSCI
T_zewN = -1;  % 'C
T_zN = 24;    % 'C
T_pN = 19;    % 'C
T_wewN = 21;  % 'C
f_pN = 1;     % m^3/s
c_p = 1000; % J/(kg*K)
ro_p = 1.2; % kg/m^3
dl = 20;   % m
szer = 10; % m
h_w = 5;   % m
h_p = 1.5; % m
V_w = dl*szer*h_w;   % m
V_p = dl*szer*h_p/3; % m dach jest ostroslupem
C_vw = c_p*ro_p*V_w;   % J/K
C_vp = c_p*ro_p*V_p;   % J/k
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do zmniejszenia zapisu
a=c_p*ro_p*f_pN;
% Proporcja K
p=0.25;
% Obliczanie wspolczynnikow K
A = [(T_wewN-T_pN), (T_wewN-T_zewN); 
     (T_wewN-T_pN), (-p*(T_pN-T_zewN))];
B = [a*(T_zN-T_wewN); 0];
K_matrix = inv(A)*B;
% Wspolczynniki przenikalnosci cieplnej K
K_1=K_matrix(1,1); % W/K
K_w=K_matrix(2,1); % W/K
K_p=p*K_w;         % W/K
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T_z1 = T_zN;
T_zew1= T_zewN;
f_p1 = f_pN;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STATE SPACE STATE SPACE STATE SPACE STATE SPACE STATE SPACE 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Wyzerowanie 
steptime=1000;
d_T_z = 0;
d_f_p = 0;
d_T_zew = 0;



% x'= Ax + Bu
% y = Cx + Du 
A =[ -(a+K_1+K_w)/C_vw,    K_1/C_vw    ;
          K_1/C_vp    , -(K_1+K_p)/C_vp];
            
B =[ c_p*ro_p*f_pN/C_vw, K_w/C_vw ;
             0        , K_p/C_vp ];
C=[1,0;
   0,1];

D=[0,0;
   0,0];
% Warunki poczatkowe dla syulacji w state space
% wartosci poczatkowe2
T_zew1 = T_zewN;                                                   
T_wew1 = T_wewN;                                                   
T_p1 = T_pN;                                                     
f_p1 = f_pN;
T_z1 = T_zN;                                                     
M=1/(K_1+K_p);
T_wew0 = (c_p*ro_p*f_p1*T_z1+K_1*K_p*T_zew1*M +K_w*T_zew1)/(c_p*ro_p*f_p1+K_1+K_w-(K_1^2)*M);  
T_p0 = (K_1*T_wew0+K_p*T_zew1)*M;

State_Space_Init=[T_wew0; T_p0];
sim('my_dom_state_space');

figure
plot(T_wew_state_space)
hold on;
plot(T_p_state_space)
grid on;
title('Test prostej kreski, STATE SPACE')
xlabel('Czas [s]')
ylabel("Temperatura [{\circ}C]")
legend('T_{wew}','T_{p}')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NOMINALNE NOMINALNE NOMINALNE NOMINALNE NOMINALNE NOMINALNE
% dla nominalnego pozostaja te same
figure
%-----------------------------------
% T_z
subplot(2,2,1)
d_T_z = 5;
d_T_zew = 0;

sim('my_dom_state_space');
plot(T_wew_state_space)
xlabel('Czas [s]')
ylabel("T_{wew} [^{\circ}C]")
hold on;
grid on
title('Skok dT_{z}=5')

subplot(2,2,2)
plot(T_p_state_space)
grid on;
xlabel('Czas [s]')
ylabel("T_{p} [^{\circ}C]")
% legend('T_{wew}','T_{p}')
title('Skok dT_{z}=5')
hold on
%-----------------------------------
% T_zew
subplot(2,2,3)
d_T_z = 0;
d_T_zew = 2;

sim('my_dom_state_space');
plot(T_wew_state_space)
xlabel('Czas [s]')
ylabel("T_{wew} [^{\circ}C]")
hold on;
grid on
title('Skok dT_{zew}=2')
hold on

subplot(2,2,4)
plot(T_p_state_space)
grid on;
xlabel('Czas [s]')
ylabel("T_{p} [^{\circ}C]")
% legend('T_{wew}','T_{p}')
title('Skok dT_{zew}=2')
hold on
%-----------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zmienione T_zew i T_z
% figure

% % wartosci poczatkowe2
% T_zew1 = T_zewN-5;                                                   
% T_wew1 = T_wewN;                                                   
% T_p1 = T_pN;                                                     
% f_p1 = f_pN;
% T_z1 = T_zN+5;                                                     
% cfp = c_p*ro_p*f_pN;
% M=1/(K_1+K_p);
% T_wew0 = (c_p*ro_p*f_p1*T_z1+K_1*K_p*T_zew1*M +K_w*T_zew1)/(c_p*ro_p*f_p1+K_1+K_w-(K_1^2)*M);  
% T_p0 = (K_1*T_wew0+K_p*T_zew1)*M;

% Warunki poczatkowe dla syulacji w state space
% wartosci poczatkowe2
T_zew1 = T_zewN+5;                                                   
T_wew1 = T_wewN;                                                   
T_p1 = T_pN;                                                     
f_p1 = f_pN;
T_z1 = T_zN-3;                                                     
M=1/(K_1+K_p);
T_wew0 = (c_p*ro_p*f_p1*T_z1+K_1*K_p*T_zew1*M +K_w*T_zew1)/(c_p*ro_p*f_p1+K_1+K_w-(K_1^2)*M);  
T_p0 = (K_1*T_wew0+K_p*T_zew1)*M;

State_Space_Init=[T_wew0; T_p0];
sim('my_dom_state_space');
%-----------------------------------
% T_z
subplot(2,2,1)
d_T_z = 5;
d_T_zew = 0;

sim('my_dom_state_space');
plot(T_wew_state_space)
xlabel('Czas [s]')
ylabel("T_{wew} [^{\circ}C]")
hold on;
grid on
title('Skok dT_{z}=5')
hold on;
legend('Nominalne','\Delta T_{zew} i \Delta T_{z}')

subplot(2,2,2)
plot(T_p_state_space)
grid on;
xlabel('Czas [s]')
ylabel("T_{p} [^{\circ}C]")
% legend('T_{wew}','T_{p}')
hold on;
title('Skok dT_{z}=5')
hold on;
legend('Nominalne','\Delta T_{zew} i \Delta T_{z}')
%-----------------------------------
% T_zew
subplot(2,2,3)
d_T_z = 0;
d_T_zew = 2;

sim('my_dom_state_space');
plot(T_wew_state_space)
xlabel('Czas [s]')
ylabel("T_{wew} [^{\circ}C]")
hold on;
grid on
title('Skok dT_{zew}=2')
hold on;
legend('Nominalne','\Delta T_{zew} i \Delta T_{z}')

subplot(2,2,4)
plot(T_p_state_space)
grid on;
xlabel('Czas [s]')
ylabel("T_{p} [^{\circ}C]")
% legend('T_{wew}','T_{p}')
title('Skok dT_{zew}=2')
hold on
legend('Nominalne','\Delta T_{zew} i \Delta T_{z}')
%-----------------------------------


