% PEFICA - PEFUNI archivo de datos de entrada
% -----------------------------------
% ejemplo 3.15 del libro
% viga a flexión
%
% datos generales
TIPR = 11;   % código del tipo de problema:
             % 10: elementos a fuerza axial, 11: elementos a flexión
IMPR = 8;    % tipo de impresión de los resultados
             % 0: ninguno, 1: en ventana de comandos, 2: en gráficas de octave
             % 3: en TikZ LaTeX,
             % 8: en ventana de comando y en gráfica
             % 9: en todos los anteriores

% Tabla de categorias: CAT().
% El número de la fila corresponde al número de la categoría
% incluye propiedades del material: EYOU: módulo de Young 
% propiedades del elemento: AREA: área de la sec.trans. en el problema TIPR=10
%                         o INER: inercia de sec.trans. en el problema TIPR=11
% tipo elemento: TIPE: 101 elem. fuerza axial unidimensional lineal c0,
%                      102 elem. fuerza axial unidimensional cuadrático c0,
%                    o 111 elem. flexión unidimensional cúbico c1.
% formato para TIPR=10:  CAT = [ EYOU AREA TIPE ] % ICAT 
% formato para TIPR=11:  CAT = [ EYOU INER TIPE ] % ICAT 
CAT = [ ...
2.15000e+10  1.60000e-03 112  1.20000e-01  8.30000e-01  2.00000e-01;      % 1
28.0E9       16e-04      112      0.12       0.83           0.2];     % 2

% Tabla de conectividades de los elementos: ELE()
% El número de la fila corresponde al número del elemento finito y cada columna 
% contiene: ICAT: categoría , NUDI: id del primer nudo,
%           NUDJ: id del segundo nudo, NUDK: id del tercer nudo si existe (opcional)
% formato:  ELE = [ ICAT NUDI NUDJ ... ] % IELE
ELE = [1,1,2;1,2,3;1,3,4;1,4,5;1,5,6;1,6,7;1,7,8;1,8,9;1,9,10;1,10,11;1,11,12;1,12,13;1,13,14;1,14,15;1,15,16;1,16,17;1,17,18;1,18,19;1,19,20;1,20,21;1,21,22;1,22,23;1,23,24;1,24,25;1,25,26;1,26,27;1,27,28;1,28,29;1,29,30;1,30,31;1,31,32;1,32,33;1,33,34;1,34,35;1,35,36;1,36,37;1,37,38;1,38,39;1,39,40;1,40,41;1,41,42;1,42,43;1,43,44;1,44,45;1,45,46;1,46,47;1,47,48;1,48,49;1,49,50;1,50,51;1,51,52;1,52,53;1,53,54;1,54,55;1,55,56;1,56,57;1,57,58;1,58,59;1,59,60;1,60,61;1,61,62;1,62,63;1,63,64;1,64,65];

% Tabla de coordenadas de los nudos: XYZ()
% El número de la fila corresponde al número del nudo y cada columna 
% incluye:  XNUD: coordenada x del nudo 
% formato:  XYZ = [ XNUD ] % INUD
XYZ = [0;0.0625000000000000;0.125000000000000;0.187500000000000;0.250000000000000;0.312500000000000;0.375000000000000;0.437500000000000;0.500000000000000;0.562500000000000;0.625000000000000;0.687500000000000;0.750000000000000;0.812500000000000;0.875000000000000;0.937500000000000;1;1.06250000000000;1.12500000000000;1.18750000000000;1.25000000000000;1.31250000000000;1.37500000000000;1.43750000000000;1.50000000000000;1.56250000000000;1.62500000000000;1.68750000000000;1.75000000000000;1.81250000000000;1.87500000000000;1.93750000000000;2;2.06250000000000;2.12500000000000;2.18750000000000;2.25000000000000;2.31250000000000;2.37500000000000;2.43750000000000;2.50000000000000;2.56250000000000;2.62500000000000;2.68750000000000;2.75000000000000;2.81250000000000;2.87500000000000;2.93750000000000;3;3.06250000000000;3.12500000000000;3.18750000000000;3.25000000000000;3.31250000000000;3.37500000000000;3.43750000000000;3.50000000000000;3.56250000000000;3.62500000000000;3.68750000000000;3.75000000000000;3.81250000000000;3.87500000000000;3.93750000000000;4];
% Tabla de desplazamientos conocidos: UCO()
% Para problemas de fuerza axial TIPR=10 contiene:
%   INUD: número del nudo,
%   DCUX: indicador si el desplazam en x es conocido o no (1:conoc o 0:descon),
%   VAUX: valor del desplazamiento conocido.  No importa su valor cuando DCUX=0
% Para problemas de flexión TIPR=11 contiene:
%   INUD: número del nudo,
%   DCUY: indicador si el desplazam en y es conocido o no (1:conoc o 0:descon),
%   DCRZ: indicador si la rotación en z es conocida o no (1:conoc o 0:descon),
%   VAUY: valor del desplazamiento en y conocido.  No importa su valor si DCUY=0
%   VARZ: valor de la rotación en z conocido. No importa su valor cuando DCRZ=0
% formato para TIPR=10:  UCO = [ INUD DCUX VAUX ]
% formato para TIPR=11:  UCO = [ INUD DCUY DCRZ VAUY VARZ ]
UCO = [ ...
001 1 1 0.0000 0.0000 ];

% Tabla de fuerzas aplicadas en los nudos de la malla.
% Para problemas de fuerza axial TIPR=10 contiene:
%   INUD: número del nudo
%   FUNX: valor de la fuerza puntual en dirección x.
% Para problemas de flexión TIPR=11 contiene:
%   INUD: número del nudo
%   FUNY: valor de la fuerza puntual en dirección y
%   FUMZ: valor del momento alrededor del eje z.
% Formato para TIPR=10: FUN = [ INUD FUNX ]
% Formato para TIPR=11: FUN = [ INUD FUNY FUMZ ]
FUN = [ 0 00000 0.00 ];

% Tabla de fuerzas distribuidas uniformes aplicadas sobre los elementos.
% Para problemas de fuerza axial TIPR=10 contiene:
%   IELE: número del elemento IELE
%   WELE: valor de la carga distribuida uniforme en dirección x.
% Para problemas de fuerza axial TIPR=11 contiene:
%   IELE: número del elemento IELE
%   WELE: valor de la carga distribuida uniforme en direc y, (positiva arriba)
% Formato:  FDI = [ IELE WELE ]
FDI = [1,-5000;2,-5000;3,-5000;4,-5000;5,-5000;6,-5000;7,-5000;8,-5000;9,-5000;10,-5000;11,-5000;12,-5000;13,-5000;14,-5000;15,-5000;16,-5000;17,-5000;18,-5000;19,-5000;20,-5000;21,-5000;22,-5000;23,-5000;24,-5000;25,-5000;26,-5000;27,-5000;28,-5000;29,-5000;30,-5000;31,-5000;32,-5000;33,-5000;34,-5000;35,-5000;36,-5000;37,-5000;38,-5000;39,-5000;40,-5000;41,-5000;42,-5000;43,-5000;44,-5000;45,-5000;46,-5000;47,-5000;48,-5000;49,-5000;50,-5000;51,-5000;52,-5000;53,-5000;54,-5000;55,-5000;56,-5000;57,-5000;58,-5000;59,-5000;60,-5000;61,-5000;62,-5000;63,-5000;64,-5000];