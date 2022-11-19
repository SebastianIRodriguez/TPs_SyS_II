% EJERCICIO 4, TP2 SyS 2
K = 9.5;
s = tf([1,0],1);

% Funciones transferencia
C = K;
Gs = 100/(s+100);
Gp = 400/(s^2+20*s+200);

% G de lazo abierto
Gla = C*Gp*Gs;

% G de lazo cerrado
Glc = feedback(C*Gp,Gs);

%% Polos y respuesta escalón

polosLC = pole(Glc);
grid on;
step(Glc);

%% Gráfica del lugar de las raíces
rlocus(Gla/K);

% Sobre la gráfica identificamos los puntos de cruce
%   Kcruce = 6.0971
%   Pcruce =
%   1.0e+02 *
%  -1.1999 + 0.0000i
%  -0.0000 + 0.4690i
%  -0.0000 - 0.4690i

%[Kcruce,Pcruce] = rlocfind(Gla);

%% Confirmamos:
%Glai = feedback(6.0971*Gp,Gs);
%Poolin = pole(Glai);
%Poolin =
%
%   1.0e+02 *
%
%  -1.1999 + 0.0000i
%  -0.0000 + 0.4690i
%  -0.0000 - 0.4690i

%% BODE

ltiview(Gp*Gs,Gp);
grid on;
%% NYQUIST
% Con este se nota que engloba al -1 en el valor antes obtenido de K
nyquist(Gp*Gs);
grid on;

%% Margenes de fase y ganancia
[Gm,Pm,Wgm,Wpm] = margin(Gp*Gs);
% Kcruce = 6.0971
% Gm = 6.1
% Pm = 58.92








