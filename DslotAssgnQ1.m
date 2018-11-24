clc;
clear;
k = 1;
m = 1;
damp = [0.01 0.04 0.06]; % damping ratio
wn = sqrt(k/m);
wd = wn*sqrt(1-damp.^2);
u1 = 1;

for i = 1:3
    figure();
    fplot(@(t) exp(-damp(i)*wn*t)*(u1*cos(wd(i)*t)+damp(i)*u1/sqrt(1-damp(i)^2)*sin(wd(i)*t)),[0 100]);
end

