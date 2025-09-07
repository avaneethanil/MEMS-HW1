%% MEMS - Homework 1
% © Avaneeth Anil 2025
clc;
clear all;
close all;

% System Parameters
k = 3;
m = 2;
b = 0.5;
time_span = [0 50];
initial_conditions = [0 0];

% ODE 
[t,y] = ode45(@(t,x) msd(t,x,[],m,k,b), time_span, initial_conditions);
x1 = y(:,1);
x2 = y(:,2);

% Defining the ODE Function
function dx = msd(t,x,flag,m,k,b)
    dx = zeros(2,1);
    dx(1) = x(2);
    equation = -(k/m)*x(1) - (b/m)*x(2) + 1/m;
    dx(2) = equation;
end

% Plots of the state variables vs time

figure;
plot(t,x1,'LineWidth',2);
grid on;
xlabel('Time (s)');
ylabel('x1')
title('State Variable x1 versus Time')
legend('x_1(t)','Location','best')

figure;
plot(t,x2,'LineWidth',2);
grid on;
xlabel('Time (s)');
ylabel('x2')
title('State Variable x2 versus Time')
legend('x_2(t)','Location','best');
