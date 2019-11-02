clear;
close all;


%x_sz=Ae^alpha*t+x0;
x_sz=0:0.001:2;
t=0:0.001:2;
a=-2;
xw=-0.5;







%A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1
subplot(2,2,1);
A1=2;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'m-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A1=5;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'b-');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A1=-3;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'r-');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A1=0;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'k--');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
title('\alpha=-2, x_{0}=-0.5');
legend('A=2','A=5','A=-3','A=0, x_{0}=-0.5');
xlabel('t');
ylabel('x');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






%a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a

subplot(2,2,2);

A1=-2;
xw=-3;

a=1;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'m-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=0.5;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'b-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=-2;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'r-');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=0;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'k-');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A1=0;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'k--');
title('A=-2, x_{0}=-3');
legend({'\alpha = 1','\alpha = 0.5','\alpha = -1','\alpha=0','x_{0}=-3'},'Location','southwest');
xlabel('t');
ylabel('x');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%














%A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
subplot(2,2,1);
A2=2;
for i=1:1:(length(t))
    x_sz(i)=A2*exp(a*t(i))+xw;
end
plot(t,x_sz,'m-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A2=5;
for i=1:1:(length(t))
    x_sz(i)=A2*exp(a*t(i))+xw;
end
plot(t,x_sz,'b-');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A2=-3;
for i=1:1:(length(t))
    x_sz(i)=A2*exp(a*t(i))+xw;
end
plot(t,x_sz,'r-');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A2=0;
for i=1:1:(length(t))
    x_sz(i)=A2*exp(a*t(i))+xw;
end
plot(t,x_sz,'k--');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
title('\alpha=-2, x_{0}=-0.5');
legend('A2=2','A2=5','A2=-3','A2=0, x_{0}=-0.5');
xlabel('t');
ylabel('x');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%








%a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a

subplot(2,2,3);

A1=-2;
xw=-3;

a=1;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'m-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=0.5;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'b-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=-2;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'r-');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=0;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'k-');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A1=0;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'k--');
title('A=-2, x_{0}=-3');
legend({'\alpha = 1','\alpha = 0.5','\alpha = -1','\alpha=0','x_{0}=-3'},'Location','southwest');
xlabel('t');
ylabel('x');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%









