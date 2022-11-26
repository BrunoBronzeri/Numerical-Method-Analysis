###### Espa�o de Estados ######
##            &              ##
### Fun��o de Trnasfer�ncia ###

%%Necessário:
 # pkg list
 # pkg install -forge control
 # pkg load control

clear
clc
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Espa�o de Estados %%%%%%%%%%%%%%%%%%%%%%%%%%
A = [1 -2; -4 5];
B = [1;2;];
C = [1 0];
D = [0];

% Fun��o Octave para Space State
sys1 = ss(A,B,C,D) ;

# ssdata(sys1)
[Ad,Bd,Cd,Dd] = ssdata(sys1) ;

polos = pole(sys1) # o sistema � inst�vel, portanto na linha 82 o gr�fio
# gerado ter� comportamento inst�vel.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Fun��o de Transfer�ncia %%%%%%%%%%%%%%%%%%%%%%%

num1 = [1 1 2];
den1 = [1 0 1 1 5];

FT1 = tf(num1,den1) ;

%%% Forma Alternativa %%%

s = tf([1 0],[1]) ;

FT2 = (s^2 + s + 2)/(s^4 + s^2 + s + 5) ;


[num2, den2] = tfdata(FT2) ;
FT1*FT2

%%% Realiza��o M�nima %%%

TF3 = (s+1)/((s+1)*(s+2)) ;
TF3 = minreal(TF3) ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% Convers�o de Representa��es %%%%%%%%%%%%%%%%%%%%%%%%
# SS --> TF
# De SS para TF

[num4,den4] = ss2tf(sys1) ;
FT4 = tf(num4, den4) ;

% TF --> SS

[A4,B4,C4,D4] = tf2ss(FT4) #janlea de comandos --> help tf2ss#

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Simula��o %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Fun��o Step %%%
# step(TF3)    Gera um gr�fico j� formatado (grid, collor e os cacete)
t = [0:1e-3:5];
[y,t] = step(TF3,t);

plot(t,y)

%%% Fun��o Impulso %%%
t = [0:1e-3:5];
[y2,t] = impulse(TF3,t);

figure
plot(t,y2)

%%% Simula��o de Sistemas Lineares %%%
t = [0:1e-3:5];
u = sin(10*t)+2*sin(30*t);

[y3,t] = lsim(sys1,u,t,[10; 0;]); #atentar � condi��o inicial que � = ordem

figure
plot(t,y3)



