k = 3600;
m = 100;
zeta = 0.02; %damping ratio
wn = sqrt(k/m); %natural frequency
load elcentro.mat %load exciting force data (file should be in the current folder)

%duhamel's integral 
wd = wn*sqrt(1-zeta*zeta); %frequency of vibration with damping
h = (exp(-1*zeta*wn*t).*sin(wd*t))./(m*wd); %response for unit impulse
dt = t(2)-t(1); %sampling time
X(1) = 0; %initial condition
for i=2:1:length(t)
	X(i)=sum(p(1:i-1).*flip(h(1:i-1)))*dt; %integration (p multiplied with fliped h and summed up)
end
plot(t,X); %plot