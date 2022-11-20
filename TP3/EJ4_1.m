%% Enunciado
% Una vez obtenida la señal adecuadamente muestreada a la frecuencia fs se desea dividirla en 3 bandas:
% de 0 a 600 Hz, de 600 a 1500 Hz y de 1500 Hz en adelante.

%% EJ 4.1
% a. Dise�ar filtros FIR de fase lineal para obtener la separaci�n en bandas deseada empleando
% ventanas de Hamming. Funciones �tiles: fir1, window.

% Frecuencias de muestreo, corte y paso
fs=11025;
fc=fs/2; Wc=fc*2*pi;  %5512.5
nd = 80; % �rden del filtro discreto
wind1=hamming(nd+1);

Wn1 = 600*2*pi/Wc;
FIR1 = fir1(nd,Wn1,'low',wind1);

Wn2_1= 600*2*pi/Wc;
Wn2_2= 1500*2*pi/Wc;
Wn2=[Wn2_1,Wn2_2];
FIR2 = fir1(nd,Wn2,'stop',wind1);

Wn3 = 1500*2*pi/Wc;
FIR3 = fir1(nd,Wn3,'high',wind1);

%% b- Graficar las respuestas en frecuencia de los filtros dise�ados. Funciones �tiles: fvtool, freqz.
%fvtool(FIR1);
%fvtool(FIR2);
%fvtool(FIR3);
%freqz(FIR1);
%freqz(FIR2);
%freqz(FIR3);

%% c- Filtrar la se�al de audio mediante cada uno de los filtros dise�ados. Escuchar las se�ales
% resultantes. Funciones �tiles: filter.
den=[1;zeros(nd,1)];
den=den';
soundsc(filtrada.signals.values,11025,16);

filtradaFIR1=filter(FIR1,den,filtrada.signals.values);
soundsc(filtradaFIR1,11025,16);

filtradaFIR2=filter(FIR2,den,filtrada.signals.values);
soundsc(filtradaFIR2,11025,16);

filtradaFIR3=filter(FIR3,den,filtrada.signals.values);
soundsc(filtradaFIR3,11025,16);


