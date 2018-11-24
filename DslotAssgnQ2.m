%QUESTION 2:
clc;
clear;
damp = [0.01 0.05 0.2 0.5]; % damping ratio
for i = 1:4
    figure();
    fplot(@(y) 1/sqrt((1-y^2)^2+(2*damp(i)*y)^2),[0 5]); %Formula for DAF
end

