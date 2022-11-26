%% lista 2 - Simulação de Sistemas %%
%%%  Método Runge-Kutta 2a Ordem - Ralston
clear
close all
clc

#Parametros
R = 1;
C = 1;
L = 1;
Vf = @(t)sin(t);

#Dados Simulacao
Dt = 0.1;
Vc(1,1) = 0;
iL(1,1) = 0;

t0 = 0;
tf = 2;

t = t0:Dt:tf;
na = size(t,2);

#Space State
A = [0  -1/L;
    1/C  -1/R*C];
B = [1/L;  0];
C = [0  1];
D = [0];

for k = 1:na

  m11 = A(1,1)*iL(k) + A(1,2)*Vc(k) + B(1,1)*Vf((k-1)*Dt);
  m12 = A(2,1)*iL(k) + A(2,2)*Vc(k) + B(2,1)*Vf((k-1)*Dt);
  #----------------------------------
  m21 = A(1,1)*(iL(k)+m11*Dt/2) + A(1,2)*(Vc(k)+m12*Dt/2) + B(1,1)*Vf((k-0.5)*Dt);
  m22 = A(2,1)*(iL(k)+m11*Dt/2) + A(2,2)*(Vc(k)+m12*Dt/2) + B(2,1)*Vf((k-0.5)*Dt);
  #----------------------------------
  m31 = A(1,1)*(iL(k)+m21*Dt/2) + A(1,2)*(Vc(k)+m22*Dt/2) + B(1,1)*Vf((k-0.5)*Dt);
  m32 = A(2,1)*(iL(k)+m21*Dt/2) + A(2,2)*(Vc(k)+m22*Dt/2) + B(2,1)*Vf((k-0.5)*Dt);
  #----------------------------------
  m41 = A(1,1)*(iL(k)+m31*Dt) + A(1,2)*(Vc(k)+m32*Dt) + B(1,1)*Vf(k*Dt);
  m42 = A(2,1)*(iL(k)+m31*Dt) + A(2,2)*(Vc(k)+m32*Dt) + B(2,1)*Vf(k*Dt);


  iL(k+1) = iL(k) + ((m11/6)+(m21/3)+(m31/3)+(m41/6))*Dt;
  Vc(k+1) = Vc(k) + ((m12/6)+(m22/3)+(m32/3)+(m42/6))*Dt;

end
iL
Vc
