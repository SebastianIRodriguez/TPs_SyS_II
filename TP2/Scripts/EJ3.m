%% 3.3
% Grafique la respuesta al escalon de GLC (s) y verifique que se cumpla lo calculado. 
% Observe las caracteristicas de la respuesta y compare con la obtenida en lazo abierto.
kp = 2;
k1 = 9.5;
k2 = 100;
gp = tf(400, [1 20 200]);
glc1 = feedback(k1*gp, 1);
glc2 = feedback(k2*gp, 1);

ltiview(glc1, 'b', glc2, 'r', (1/kp)*gp, 'g')

% OBSERVACIONES:
% En la realimentacion, a mayores valores de k:
%   * Aumenta wn
%   * Aumenta el sobrevalor SV
%   * La ganancia estatica se aproxima asintoticamente a 1
%   * El sistema responde mas rapidamente

%% 3.4
% Grafique en una misma figura la respuesta al escalon del sistema a 
% lazo cerrado para los valores minimo y maximo de a0 y compare con 
% la respuesta obtenida en 3.3. ¿Que ventajas posee el actual esquema 
% de control respecto del anterior control a lazo abierto?

k = 9.5;

glc = feedback(k * tf(400, [1 20 200]), 1);

glc_min = feedback(k * tf(400, [1 20 200 * 0.9]), 1);
glc_max = feedback(k * tf(400, [1 20 200 * 1.1]), 1);

ltiview(glc, 'b', glc_min, 'r', glc_max, 'g')

% OBSERVACIONES
% Con este esquema de control, el sistema es mucho menos sensible a
% variaciones en el termino a0.

%% 3.5
% Grafique el lugar de las raices (LR). Evalue, en funcion de las
% caracteristicas observadas en la respuesta al escalon de GLC (s),
% donde se ubican los polos de GLC (s) para el valor de K calculado.

rlocus(gp)
hold on
[kbuscada, poles] = rlocfind(gp);

%% 3.6
% Grafique los diagramas de Bode y Nyquist de Gp(s).
% Evalue los margenes de fase y ganancia.

ltiview(gp);
grid;

%%
nyquist(gp);

% OBSERVACIONES
% M_fase = 68.53
% M_ganancia = inf

[Gm,Pm,Wgm,Wpm] = margin(gp);

%% 3.7
% Grafique los diagramas de Bode y Nyquist de GLA(s) = K * Gp(s) 
% para el valor de K calculado.
% Evalue los margenes de fase y ganancia del lazo de la Figura 2.
% Superponga los diagramas con los obtenidos en el item anterior y compare.

ltiview(gp, k*gp);
grid;
%Para este valor de k=9.5, M_fase = 180° - 160° = 20° // Real 18.91
[Gm2,Pm2,Wgm2,Wpm2] = margin(k*gp);

%%
nyquist(gp, k*gp);