%Question 4:
m = 100;
zeta = 0.02; %damping ratio
load elcentro.mat %load exciting force data (file should be in the same folder)

%newmark's beta method
T = 1:0.01:20;
k = m*(2*pi./T).^2;
wn = 2*pi./T;
c = 2*m*wn*zeta; %damping coefficient
ga = 0.5; %gamma
be = 0.25; %beta
dt = t(2)-t(1); %time interval
C1 = m/(be*dt) + (c*ga)/be; %coefficient of velocity in incrementation equation
C2 = m/(2*be) + (c*dt)*(ga/(2*be)-1); %coefficient of acceleration in incrementation equation
kc = k + (c*ga)/(be*dt) + m/(be*dt*dt); %coefficient of change in displacement in incrementation equation
for j=1:length(T)
    x(1)=0; %initial displacement
    u(1)=0; %initial velocity
    a(1)=(y(1)-k(j)*x(1)-c(j)*u(1))/m; %initial acceleration
    for i=1:(length(t)-1)
	    dp=y(i+1)-y(i)+C1(j)*u(i)+C2(j)*a(i); %change in excitation
	    dx=dp/kc(j); %change in displacement
	    du=(dx*ga)/(be*dt) - (u(i)*ga)/be + a(i)*dt*(1 - ga/(2*be)); %change in velocity
	    da=dx/(be*dt*dt) - u(i)/(be*dt) - a(i)/(2*be); %change in acceleration
	    x(i+1)=x(i)+dx; %increment displacement
	    u(i+1)=u(i)+du; %increment velocity
	    a(i+1)=a(i)+da; %increment acceleration
    end
    xRes(j) = max(abs(x));%peak displacement response
    uRes(j) = max(abs(u));%peak velocity response
    aRes(j) = max(abs(a));%peak acceleration response
end
figure();
plot(T,xRes);
figure();
plot(T,uRes);
figure();
plot(T,aRes);
