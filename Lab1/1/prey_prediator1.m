%setting up matlab
clear ;
clc;
close all

%constant parameters
a = 0.8;
b = 0.5;
c = 0.5;
d = 0.2;

%timestep 
t = 0:0.01:50;
h = 0.01;

%initial cnditon 
x_t = zeros(2, length(t));
x_t(:, 1) = [0.1; 0.5];

%RK4 method
f = @(t, y)[a*y(1) - (b*y(1)*y(2)); c*y(1)*y(2) - d*y(2)];

for i = 1:length(t)-1
    rk4_k1 = h*f(t(i), x_t(:,i));
    rk4_k2 = h*f(t(i) + h/2, x_t(:,i) + (rk4_k1)/2);
    rk4_k3 = h*f(t(i) + h/2,x_t(:,i) + (rk4_k2)/2);
    rk4_k4 = h*f(t(i) + h, x_t(:, i) + rk4_k3);
    rk4_k =(rk4_k1 + 2*rk4_k2 + 2*rk4_k3 + rk4_k4);

    x_t(:,i+1) = x_t(:,i) + rk4_k/6;

end

%ODE45 

f = @(t_ode45, y)[a*y(1) - (b*y(1)*y(2)); c*y(1)*y(2) - d*y(2)];

[t_ode45, y] = ode45(f, [0, 50], [0.1; 0.5]);

%graph plots
subplot(1,4,1);

plot(t,x_t);
title("RK-4");
xlabel("t");
ylabel("x");
legend('x1', 'x2');

subplot(1,4,2);
plot(x_t(2, :), x_t(1, :));
title("RK-4")
xlabel("x2");
ylabel("x1");

subplot(1,4,3);
plot(t_ode45,y);
title("ODE45");
xlabel("t");
ylabel("X");
legend('x1', 'x2');

subplot(1,4,4);
plot(y(:, 2), y(:, 1));
title("ODE 45")
xlabel("x2");
ylabel("x1");