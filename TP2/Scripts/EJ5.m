% EJERCICIO 5, TP2 SyS 2
Kp = 1;
Tr = 0.1;
s = tf([1,0],1);

% Funciones transferencia
C = Kp*(1+1/(Tr*s));
Gs = 100/(s+100);
Gp = 400/(s^2+20*s+200);

% G de lazo abierto
Gla = C*Gp*Gs;

% G de lazo cerrado
Glc = feedback(C*Gp,Gs);

%% Lugar de las raíces
rlocus(Gla);

% Sobre la gráfica identificamos los puntos que pide el enunciado
%[Kcruce,Pcruce] = rlocfind(Gla);

%% Sistema estable, un polo (real negativo) dominante:
%Respuesta de órden 1
%Pcruce = (-100.13 + 0i) (-9.63 +- 0.1031i) (-0.61 + 0i)

K1 = 0.0304;
C1 = C*K1;
Glc1 = feedback(C1*Gp,Gs);
%step(Glc1); 

%% Sistema estable, dos polos complejos dominantes:
%Pcruce = (-110.05 + 0i) (-0.35 +- 0.3315i)(-9.25 + 0.0i)
%Respuesta de órden 2, bastante subamortiguada

K2 =  2.7950;
C2 = C*K2;
Glc2 = feedback(C2*Gp,Gs);
%step(Glc2);

%% Sistema estable, tre polos dominantes con parte real similar:
%Pcruce = (-101.69 + 0i) (-0.06.19 +- 0.1504i) (-0.05.92 + 0i)
%Respuesta de órden 2 poco oscilante

K3 = 0.3984;
C3 = C*K3;
Glc3 = feedback(C3*Gp,Gs);
%step(Glc3);

%% Diagrama de BODE para Kp = 1
%bode(Gla);

%% Diagrama de Nyquist para Kp = 1
% Se ve bastante feito, pero se entiende... creo... 
%nyquist(Gla);

%%  Margenes de fase y ganancia
% Para k = 1: Gm = 3.0126; Pm = 26.1760; Wgm = 34.2181; Wpm = 19.7852
% Nótese que Gm es 3 y el necesario para que los polos complejos 
% conjugados sean los dominantes, dejando al sistema al borde de la
% inestabilidad, es 2.79
[Gm,Pm,Wgm,Wpm] = margin(Gla);

%% Diagrama de BODE para Kp = K3
%bode(K3*Gla);

%% Diagrama de Nyquist para Kp = K3
% Se ve bastante feito, pero se entiende... creo... 
%nyquist(K3*Gla);

%%  Margenes de fase y ganancia
% Para k = k3: Gm = 7.5618; Pm = 65.7117; Wgm = 34.2181; Wpm = 10.0312
% Nótese que Gm3 es mayor que Gme. Esto sucede porque el K en cuestión
% es menor a 1, así que los márgenes aumentaron.
[Gm3,Pm3,Wgm3,Wpm3] = margin(K3*Gla);

% Puede que un problema sea la tendencia a oscilar del sistema.
% Al aumentar K, el sistema se vuelve más y más oscilante, o bien
% se inestabiliza para grandes vcalores de K
% Con un control derivativo, se resuelve todo esto y más!
% Observar el lugar de las raíces de C = Kp*(1+1/(Tr*s)+s);

