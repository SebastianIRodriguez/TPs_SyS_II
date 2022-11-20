% Cargando musica_tp3
%m = 
%
%              fs: 44100
%           nbits: 16
%          musica: [1323000x1 double]
%    TiempoMusica: [1323000x2 double]

in =m.TiempoMusica;
% simular
soundsc(m.musica,m.fs,m.nbits)            %original, todo bello 
clear sound

soundsc(filtrada.signals.values,11025,16);%muestreada, un asco
% Queda un sonido de fondo agudo bastante molesto, recordar q la seï¿½al
% posee frecuencias superiores a la mitad de la de muestreo, ya que 
% m.fs=44100, el Aliasing destruye la informaciï¿½n

%% 3.2.1
%a. Diseï¿½ar filtros de Butterworth para minimizar el aliasing para una frecuencia de muestreo de fs =
%11025 Hz. Asumir una atenuaciï¿½n mï¿½nima ?mï¿½?n = 20 dB para una frecuencia de corte de fa := fs/2.
%Seleccionar una atenuaciï¿½n mï¿½xima para la banda de paso ?mï¿½ax y varias selectividades k =
%fp/fa
%[n,Ï‰n]=buttord(Ï‰p, Ï‰a, Î±mÂ´ax, Î±mÂ´Ä±n,'s')
%[num,den]=butter(n,Ï‰n,'low','s')
% Atenuaciones
alphamin = 20;
alphamax = 0.5;

% Frecuencias de muestreo, corte y paso
fs=11025;
fc=fs/2; wc=fc*2*pi;  %5512.5
fp1=3000; wp1=fp1*2*pi; 
fp2=4000; wp2=fp2*2*pi; 
fp3=5000; wp3=fp3*2*pi; 

%Selectividades
k1=fp1/fc;
k2=fp2/fc;
k3=fp3/fc;

% n representa el Ã³rden del filtro, w1 la "nueva" frecuencia de paso a la que hay que diseÃ±arlo
[n1,w1]=buttord(wp1, wc, alphamax, alphamin,'s');
[n2,w2]=buttord(wp2, wc, alphamax, alphamin,'s');
[n3,w3]=buttord(wp3, wc, alphamax, alphamin,'s');

[num1,den1]=butter(n1,w1,'low','s');
[num2,den2]=butter(n2,w2,'low','s');
[num3,den3]=butter(n3,w3,'low','s');

%% b. Graficar amplitud y fase de la respuesta en frecuencia del filtro para las selectividades seleccionadas en una misma grÃ¡fica. Para ello puede utilizar los comandos [H,w]=freqs(num,den),
%plot(w,abs(H)), plot(w,phase(H)). Identificar ventajas y desventajas de un filtro antialiasing
%con mayor o menor selectividad. Â¿QuÃ© selectividad resulta la mÃ¡s adecuada?

%% Intento de varios plots
[H1,wg1]=freqs(num1,den1);

grid on;
hold on;
% Top plot
subplot(2,1,1);
%plot(wg1, abs(H1));                  % En unidades y rad/s
plot(wg1/(2*pi),-20*log(abs(H1)),'r'); % En dB y Hz
title('Amplitud vs w');
grid on;
hold on;

% Bottom plot
subplot(2,1,2);
%plot(wg1, phase(H1))
plot(wg1/(2*pi),phase(H1)*180/pi,'r')  % En grados y Hz
title('Fase vs w');
grid on;
hold on;

[H2,wg2]=freqs(num2,den2);
% Top plot
subplot(2,1,1);
%plot(wg1, abs(H1));                  % En unidades y rad/s
plot(wg2/(2*pi),-20*log(abs(H2)),'b'); % En dB y Hz
grid on;
hold on;

% Bottom plot
subplot(2,1,2);
%plot(wg1, phase(H1))
plot(wg2/(2*pi),phase(H2)*180/pi,'b')  % En grados y Hz
grid on;
hold on;

[H3,wg3]=freqs(num3,den3);
% Top plot
subplot(2,1,1);
%plot(wg1, abs(H1));                  % En unidades y rad/s
plot(wg2/(2*pi),-20*log(abs(H2)),'g'); % En dB y Hz
grid on;
hold on;

% Bottom plot
subplot(2,1,2);
%plot(wg1, phase(H1))
plot(wg2/(2*pi),phase(H2)*180/pi,'g')  % En grados y Hz
grid on;
hold on;

%% Luego de simular los 3 filtros, lógicamente el de mayor selectividad 
% resultó ser más funcional, pero tal vez podría usarse algun otro que
% atenúe aún más, por ejemplo con alphamin=60
% para amax=0.5, amin=60 n=25
% para amax= 1, amin=60 n=24
% para amax= 2, amin=60 n=23
% para amax= 2, amin=60 n=23
% para amax= 2, amin=60 n=22
% para amax= 3, amin=40 n=15
% para amax= 1, amin=40 n=17 %% Acá está lindo
% para amax= 0.5, amin=40 n=18 

alphamin2 = 60;
alphamax = 1;

[n22,w22]=buttord(wp2, wc, alphamax, alphamin2,'s');
[num22,den22]=butter(n22,w22,'low','s');
[H22,wg2]=freqs(num22,den22);


%% Todos los sonidos
soundsc(m.musica,m.fs,m.nbits) % Original
%%
soundsc(filtrada.signals.values,11025,16) % Muestreo bruto
%%
soundsc(filtrada1.signals.values,11025,16)
%%
soundsc(filtrada2.signals.values,11025,16)
%%
soundsc(filtrada3.signals.values,11025,16)
%%
soundsc(filtrada22.signals.values,11025,16)



