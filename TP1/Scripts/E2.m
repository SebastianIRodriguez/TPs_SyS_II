%% 3.2.1
num = [12,-5.88];
den = [1 -2*0.92*cos(0.31) 0.92^2];
G = tf(num, den, 0.01);

polos = roots([1 -1.752 0.8464])
%% 3.2.2
%A partir de la FTD, obtenga un juego de EED. 
%Calcule los autovalores de la matriz de evolucion y comparelos con los polos de la FTD. 
%Puede usar para esto las funciones tf2ss, pole y eig.

[A, B ,C, D] = tf2ss(num, den);

autovalores = eig(A);
%Se ve que autovalores ~ polos

%% 3.2.3
%Grafica salida muestreada del MCC
stem(w_k.time, w_k.data)