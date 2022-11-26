######### Método de Euler Explícito ###########

clear
close all
clc

## Parâmetros do Modelo ##
Vco = 5;
R = 200000;
C = 10e-6;

## Parâmetros da Simulação ##
Dt = 0.8;
Vca(1) = Vco;
Vcap(1) = Vco;
Vc(1) = Vco; #ou
##Vc = [Vco];

######################################################******
t0 = 0;
tf = 6;

t = t0:Dt:tf; #vetor de tempo
na = size(t,2); #vetor coluna
## na = tf/Dt + 1;

######################################################******

########## k são n° de amostras

for k = 1:na-1 ##colocar 1:4******

  Vc(k+1) = (1-Dt/(R*C))*Vc(k); #Explicito

  Vcap(k+1) = (1/(1+(Dt/(R*C))))*Vcap(k); #Implicito

  Vca(k+1) = Vco*e^((-Dt*k)/(R*C));

end
Vc;
Vcap;
Vca;

#t = 0:Dt:k; #habilitar******
plot(t,Vc, 'd', 'linewidth',2)
title('Tensão Capacitor VS Tempo')
xlabel('N° Amostras')
ylabel('Tensão (V)')
grid on
hold on

plot(t, Vcap, 'gd', 'linewidth', 2)
plot(t, Vca, 'rd', 'linewidth', 2)
legend('Euler Explícito', 'Euler Implícito', 'Solução Analítica')
