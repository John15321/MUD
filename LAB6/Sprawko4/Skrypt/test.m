
clear;

%x''+2*ksi*w*x'+w^2 * x=b*u

u=1;
ksi=0.1;
w=5;
b=1;

[t]=sim('testt');
subplot(2,2,2);
plot(t,x);
grid on;




lambda1 = -ksi*w+w*sqrt(ksi*ksi-1)
lambda2 = -ksi*w-w*sqrt(ksi*ksi-1)








%------------------------------------------------------------

%Petla ksi, dla narysowania biegunow
figure;
%wartosci roznych ksi oraz kolory dla ich biegonow
ksi_all=[1,-1,0.9,-0.1]
ksi_colors=["bo","mo","go","ro"]

hold on;
grid on;
for i=1:1:(length(ksi_all))
    lambda1 = -ksi_all(i)*w+w*sqrt(ksi_all(i)*ksi_all(i)-1);
    lambda2 = -ksi_all(i)*w-w*sqrt(ksi_all(i)*ksi_all(i)-1);
    
    plot(real(lambda1),imag(lambda1),ksi_colors(i));
    plot(real(lambda2),imag(lambda2),ksi_colors(i));
    
    line([0,(2*real(lambda1))],[0,0],'Color','k');
    line([0,(2*real(lambda2))],[0,0],'Color','k');
    
    line([0,-0.2*real(lambda1)],[0,0],'Color','k');
    line([0,-0.2*real(lambda2)],[0,0],'Color','k');
    
    line([0,0],[0,(2*imag(lambda1))],'Color','k');
    line([0,0],[0,(2*imag(lambda2))],'Color','k');
end
legend('\xi ....');