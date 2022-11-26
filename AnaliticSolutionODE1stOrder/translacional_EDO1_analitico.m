#Modelagem de Sistema Translacional de Primeira Ordem

clear
clc
close all

# Valores arbitrários para observar o comportamento
M = 1/5;
B = 1/5; #B=1 --> B=1/5 aumenta o Gcc em 5
%vo = 10;

Gcc = 1/B;
Ta = 5*M/B;

tf = 10; #tempo final
ts = 5e-1; #passo de simula��o
to = 0; #tempo inicial

t = [to:ts:tf];

% Entrada degrau (ex.)

u = @(t) 1;
xo = 10; #cond. inicial

% ODE

dx = @(t,x) -B/M*x + (1/M)*u(t);

% Solu��o

[t,x] = ode45(dx, t, xo);

plot(t,x,'x', 'linewidth', 2)
grid
xlabel('Tempo (s)')
ylabel('Velocidade (m/s)')
title('Example 1')

#####################################
####### Resposta Anal�tica ##########
#####################################

Vrc = @(t) 1/B-1/B*exp(-B*t/M) + xo*exp(-B*t/M);
analitica = Vrc(t);

plot(t,x,'x', 'linewidth', 2)
hold on
plot(t,analitica, 'o', 'linewidth', 2)
grid
xlabel('Tempo (s)')
ylabel('Velocidade (m/s)')
title('Example 1')
legend('ODE45', 'Anal�tica')
