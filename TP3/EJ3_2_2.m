%% 3.2.2. Muestreo inteligente 2. Filtro de Chebyshev Tipo 1.
clc
%% a.
% Para los mismos parámetros de atenuaciones y selectividades anteriores,
% diseñar filtros de Chebyshev.
% Funciones útiles: [n,?n]=cheb1ord(?p, ?a, ?max, ?min,'s')
% [num,den]=cheby1(n,?max,?p,'low','s')
fs = 11025;
wa = fs / 2;
at_max = .1;
at_min = 20;

% Para k = 0.1
wp1 = 0.1 * wa;
[n1,wn1] = cheb1ord(wp1, wa, at_max, at_min,'s');
[num1,den1] = cheby1(n1, at_max, wn1, 'low', 's');
[H1,w1]=freqs(num1,den1);

% Para k = 0.6
wp2 = 0.6 * wa;
[n2,wn2] = cheb1ord(wp2, wa, at_max, at_min,'s');
[num2,den2] = cheby1(n2, at_max, wn2, 'low', 's');
[H2,w2]=freqs(num2,den2);

% Para k = 0.9
wp3 = 0.9 * wa;
[n3,wn3] = cheb1ord(wp3, wa, at_max, at_min,'s');
[num3,den3] = cheby1(n3, at_max, wn3, 'low', 's');
[H3,w3]=freqs(num3,den3);

%% b.
% Graficar amplitud y fase de la respuesta en frecuencia del filtro para 
% las selectividades seleccionadas en una misma figura.
% Comparar el orden y las características de los filtros obtenidos con lo
% obtenido para los filtros de Butterworth para cada una de las selectividades.
% ¿Qué ventajas y desventajas encuentra al comparar ambos filtros?

plot(w1, abs(H1), w2, abs(H2), w3, abs(H3))
grid on
legend('k=0.1', 'k=0.6', 'k=0.9')

%% c.
% Simular el sistema de filtrado y muestreo correspondiente.
% Escuchar el resultado y comparar con el filtro Butterworth seleccionado
% anteriormente.

%% Señal 1
soundsc(sound1.Data)
%% Señal 2
soundsc(sound2.Data)
%% Señal 3
soundsc(sound3.Data)

%% d.
% ¿Resulta adecuada la plantilla del filtro antialising diseñada en el punto
% 3.2.a. para el diseño de filtros de Butterworth y Chebyshev? Justifique.


