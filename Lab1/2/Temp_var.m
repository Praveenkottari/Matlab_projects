%setting up matlab
clear all;
clc;
close all

%given parametrs
alpha = 0.05;
alpha_h = 0.0036;
alpha_e = 0.008;
Th = 100;
Te = 15;

tspan = [0, 50];
temp0 = [10; 15; 20; 25; 30];

f = @(t, temp)[alpha*(temp(2) - temp(1))+alpha_e *(Te - temp(1));

    alpha*(temp(1) - temp(2)) + alpha*(temp(3) - temp(2)) + alpha*(temp(4)-temp(2)) + alpha*(temp(5)-temp(2))+alpha_h*(Th - temp(2));

    alpha*(temp(2) - temp(3)) + alpha_e*(Te - temp(3));

    alpha*(temp(2) - temp(4)) + alpha_e*(Te - temp(4));

    alpha*(temp(2) - temp(5)) + alpha_e*(Te - temp(5))];

[t, temp] = ode45(f, tspan, temp0);

plot(t, temp);
title('Temp-time')
xlabel('t');
ylabel('temp');
legend('T1','T2','T3','T4','T5');