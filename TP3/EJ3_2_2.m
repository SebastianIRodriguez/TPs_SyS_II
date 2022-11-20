%% 3.2.2. Muestreo inteligente 2. Filtro de Chebyshev Tipo 1.
clc
%% a.
% Para los mismos parametros de atenuaciones y selectividades anteriores,
% disenar filtros de Chebyshev.
% Funciones utiles: [n,wn]=cheb1ord(wp, wa, at_max, at_min,'s')
% [num,den]=cheby1(n, at_max, wp,'low','s')
fs = 11025;
wa = fs*2*pi / 2;
at_max = .5;
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
% Comparar el orden y las caracteristicas de los filtros obtenidos con lo
% obtenido para los filtros de Butterworth para cada una de las selectividades.
% ¿Que ventajas y desventajas encuentra al comparar ambos filtros?
subplot(2,1,1);
plot(w1, -20*log10(abs(H1)), w2, -20*log10(abs(H2)), w3, -20*log10(abs(H3)))
title('Atenuacion(dB) vs w');
grid on
legend('k=0.1', 'k=0.6', 'k=0.9')

subplot(2,1,2);
plot(w1, phase(H1)*180/pi, w2, phase(H2)*180/pi, w3, phase(H3)*180/pi)
title('Fase vs w');
grid on
legend('k=0.1', 'k=0.6', 'k=0.9')

%% c.
% Simular el sistema de filtrado y muestreo correspondiente.
% Escuchar el resultado y comparar con el filtro Butterworth seleccionado
% anteriormente.

%% Senal 1
soundsc(sound1.Data,11025,16)
%% Senal 2
soundsc(sound2.Data,11025,16)
%% Senal 3
soundsc(sound3.Data,11025,16)

%% d.
% ¿Resulta adecuada la plantilla del filtro antialising disenada en el punto
% 3.2.a. para el diseno de filtros de Butterworth y Chebyshev? Justifique.

% La plantilla logra reducir notablemente el aliasing en comparacion con
% la version en crudo. Podrian mejorarse los resultados aumentando la 
% atenuacion maxima.
%


