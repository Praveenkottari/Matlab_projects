%setting up matlab
clear ;
clc;
close all

%constant parametrs
a = -0.8;
b = 0.5;
c = 0.5;
d = 0.2;

%timespan
t = [0, 50];

y01 = [0; 0];
y02 = [0; d/c];
y03 = [a/b; 0];
y04 = [a/b; d/c]

f = @(t, y)[a*y(1) - (b*y(1)*y(2)); c*y(1)*y(2) - d*y(2)];
[t1, y1] = ode45(f, t, y01);
[t2, y2] = ode45(f, t, y02);
[t3, y3] = ode45(f, t, y03);
[t4, y4] = ode45(f, t, y04);

%graph plots

subplot(4,1,1);
plot(t1, y1);
xlabel('t');
ylabel('x');
legend('x1','x2');

subplot(4,1,2);
plot(t2, y2);
xlabel('t');
ylabel('x');
legend('x1','x2');

subplot(4,1,3);
plot(t3, y3);
xlabel('t');
ylabel('x');
legend('x1','x2');

subplot(4,1,4);
plot(t4, y4);
xlabel('t');
ylabel('x');