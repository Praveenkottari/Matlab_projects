%setting up matlab
clear ;
clc;
close all

%constant parametrs
a = -0.8;
b = 0.5;
c = 0.5;
d = 0.2;

tspan = [0, 50];
y0 = [0.1; 0.5];

f1 = @(t, y)[-0.8*y(1) - (0.5*y(1)*y(2)); 0.5*y(1)*y(2) - 0.2*y(2)];
f2 = @(t, y)[0.8*y(1)  - (0.5*y(1)*y(2)); 0.5*y(1)*y(2) + 0.2*y(2)];
f3 = @(t, y)[-0.8*y(1) - (-0.5*y(1)*y(2)); -0.5*y(1)*y(2) + 0.2*y(2)];

[t_a, y_a] = ode45(f1, tspan, y0);
[t_d, y_d] = ode45(f2, tspan, y0);
[t_all, y_all] = ode45(f3, tspan, y0);

%graph plots

subplot(1,3,1);
plot(t_all, y_all);
title("all are -ve");
xlabel("t");
ylabel("X");
legend("x1", "x2");

subplot(1,3,2);
plot(t_a, y_a);
title("a is -ve");
xlabel("t");
ylabel("X");
legend("x1", "x2");

subplot(1,3,3);
plot(t_d, y_d);
title("d is -ve");
xlabel("t");
ylabel("X");
legend("x1", "x2");





