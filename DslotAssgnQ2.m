clc;
clear;
damp = [0.01 0.05 0.2 0.5]; % damping ratio
for i = 1:4
    figure();
    fplot(@(x) 1/sqrt((1-x^2)^2+(2*damp(i)*x)^2),[0 5]);
end

