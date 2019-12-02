clear all;
g=9.81;
A1=4;
A2=4;
Aw1=4;
Aw2=4;
h_max=6;
fwe_max=Aw1*sqrt(2*g*h_max);
fwe=0*fwe_max;
dfwe=0.1*fwe_max;
h10=(fwe^2)/((Aw1^2)*2*g);
h20=((Aw1^2)*h10)/(Aw2^2);
[t]=sim('schemat_nieliniowy');
hold on;
plot(t,h1,'b');
plot(t,h2,'r');
legend('h1','h2');
xlabel('t');
ylabel('h')
