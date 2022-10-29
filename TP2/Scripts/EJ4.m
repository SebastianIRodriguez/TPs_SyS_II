% EJERCICIO 4, TP2 SyS 2
K = 1;
s = tf([1,0],1);

% Funciones transferencia
C = K;
Gs = 100/(s+100);
Gp = 400/(s^2+20*s+200);

% G de lazo abierto
Gla = C*Gp*Gs;

% G de lazo cerrado, son equivalentes!
Glc = feedback(C*Gp,Gs);
Glc2 = feedback(Gla,1);

% Gr�fica del lugar de las ra�ces
%rlocus(Gla);

% Sobre la gr�fica identificamos los puntos de cruce
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

%%

bode(Gp*Gs);
% Con este se nota que engloba al -1 en el valor antes obtenido de K
%nyquist(6.0971*Gp*Gs);
grid on;








