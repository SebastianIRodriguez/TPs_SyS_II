gp = tf(400, [1 20 200]);

%% 2.2 
% Grafique la respuesta al escalon utilizando Matlab 
% y verifique que se cumpla lo calculado en el punto 2.1.
ltiview(gp)

%% 2.3
% Seleccione un valor de kp de modo obtener una ganancia estatica unitaria
% en el control a lazo abierto y grafique la respuesta al escalon.

%Eligiendo:
kp = 2;
ltiview((1/kp)*gp)

%% 2.4
% Se sabe que el parametro a0 puede variar teniendo un error de hasta 10 %.
% Calcule el maximo error que puede tener la verdadera ganancia estatica 
% del MCC suponiendo que solo existen errores en el parametro a0.
a0 = 200;
max_ganancia = 400/(1.1 * a0);
min_ganancia = 400/(0.9 * a0);
if abs(max_ganancia - 2) > abs(min_ganancia - 2)
    error_maximo = max_ganancia - 2
else
    error_maximo = min_ganancia - 2
end

%% 2.5
% Grafique la respuesta al escalon para los valores m?nimo y maximo de a0.
% Superponga las respuestas con la obtenida en 2.3 y compare.
%¿Como podria mejorarse la robustez del control frente a errores
% en los parametros?
a0_min = 0.9 * 200;
a0_max = 1.1 * 200;

kp = 2;

gp_min = tf(400, [1 20 a0_min]);
gp_max = tf(400, [1 20 a0_max]);

ltiview((1/kp)*gp_min, (1/kp)*gp, (1/kp)*gp_max)

% Se podria mejorar la robustez utilizando un control derivativo,
% de forma de fijar la ganancia en 1.


