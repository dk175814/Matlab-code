%QUESTION 1:
clc;
clear;
k = 1;
m = 1;
damp = [0.01 0.04 0.06]; % damping ratio
wn = sqrt(k/m); %Natural frequency
wd = wn*sqrt(1-damp.^2); %Damped Frequency
u1 = 1; %Initial Displacement

for i = 1:3
    figure();
    fplot(@(t) exp(-damp(i)*wn*t)*(u1*cos(wd(i)*t)+damp(i)*u1/sqrt(1-damp(i)^2)*sin(wd(i)*t)),[0 100]); %Closed form solution
end

