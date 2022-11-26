#Sistema Translacional 2a Ordem - Analítico
clear
close all
clc

M = 1;
K = 2;
B = 0.5;

########## Parâmetros de interesse ###########
wn = sqrt(K/M)
csi = B/M*sqrt(M/K)*1/2
Kcc = 1/K

tau =wn*csi %%tau = alpha

wd = wn*sqrt(1-csi^2)
ta = 5/tau
##############################################

fa = @(t) 1; % entrada
t = [0:1e-3:40];
xo = [0;0] % condição inicial

% ODEs
% montando modelo de espaço de estados
dx1 = @(t,x) x(2);
dx2 = @(t,x) -B/M*x(2) -K/M*x(1)+fa(t)/M;

dxdt = @(t,x) [dx1(t,x);dx2(t,x)];

%%% Solução Sistema

[t,x] = ode45(dxdt, t, xo);

figure
plot(t, x, 'linewidth', 2)
legend('Posição (m)', 'Velocidade (m/s)')
xlabel('Time')
grid

% 13.389 --> 17.856  período da senóide T = 4,467
% freq. --> 0,2239
% wd = 2*pi*f --> 1,407
% Portanto os polos de sistema serão: P = alpha +/- j*betha %%% P1,2 = 5/40 +/- j*1,407 %%%
