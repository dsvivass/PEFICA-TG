%%M-DV%% Crea archivo .res con los resultados obtenidos, que cumple con
%%M-DV%% el formato exigido por el programa GiD
function IMGIDR(ADAT,NUEL,CAE,NELE,FM,NXIP,NIT,DIRA,DIRO,DES,GIR)
    %%M-DV%% ADAT: Archivo de entrada
    %%M-DV%% NUEL: Numero de nudos del elemento
    %%M-DV%% CAE: Categoria del elemento
    %%M-DV%% NELE: Numero de elementos
    %%M-DV%% FM: Arreglo de celdas con informacion de cortante y momento
    %%almacenado por elemento
    %%M-DV%% NXIP: Numero de partes de calculo dentro del elemento
    %%(incluyendo las interpolaciones)
    %%M-DV%% NIT: Numero de iteracion en caso de multiples analisis
    %%M-DV%% DIRA: Directorio donde se encuentra el archivo ADAT
    %%M-DV%% DIRO: Directorio original de PEFICA.m
    %%M-DV%% DES: Arreglo de celdas con informacion de desplazamientos
    %%almacenados por elemento
    %%M-DV%% GIR: Arreglo de celdas con informacion de giros almacenados por
    %%elemento
    
cd(DIRA); %%M-DV%% Cambia el directorio a aquel donde se encuentra el archivo ADAT
if NUEL == 2; ELTI = 'line'; end
NPGAUSS = NXIP + 1;
if NIT == 0 || NIT == 1
    GIDM = strcat(ADAT,'.res'); % nombre archivo GiD post de los resultados
    FIDE = fopen(GIDM,'w'); % abrir archivo y establecer identificador
    fprintf(FIDE,'Gid Post Results File 1.0 \n');
    fprintf(FIDE,'### \n');
    fprintf(FIDE,'# PEFICA-Octave postproceso para GiD \n');
    fprintf(FIDE,'# \n');
    fprintf(FIDE,'GaussPoints "GP" Elemtype %s \n',ELTI);
    fprintf(FIDE,'Number of Gauss Points: %i \n',NPGAUSS);
    fprintf(FIDE,'Nodes included \n');
    fprintf(FIDE,'Natural Coordinates: Internal \n');
    fprintf(FIDE,'end gausspoints \n');
    fprintf(FIDE,'# \n');
else
    GIDM = strcat(ADAT,'.res'); % nombre archivo GiD post de los resultados
    FIDE = fopen(GIDM,'a+'); % abrir archivo y establecer identificador
end

%Tipo de analisis
switch CAE(1,3)
    case 111
        TANA = 'Euler-Bernoulli';
    case 112
        TANA = 'Timoshenko_1PG';
    case 113
        TANA = 'Timoshenko_2PG';
end

% Impresion de desplazamientos
fprintf(FIDE,'Result "Desplazamiento" "%s"  1  Vector OnGaussPoints "GP" \n',TANA);
fprintf(FIDE,'ComponentNames "U_y"  \n');
fprintf(FIDE,'Values \n');
for IELE = 1 : NELE
    fprintf(FIDE,'%6i 0.00 %+15.6e \n',IELE,DES{IELE}(1,1));
    for IINTE = 2 : NPGAUSS
        fprintf(FIDE,'   0.00 %+15.6e \n',DES{IELE}(1,IINTE));
    end
end
fprintf(FIDE,'End Values \n');
fprintf(FIDE,'# \n');

% Impresion de giros
fprintf(FIDE,'Result "Giro" "%s"  1  Vector OnGaussPoints "GP" \n',TANA);
fprintf(FIDE,'ComponentNames "Tetha_z"  \n');
fprintf(FIDE,'Values \n');
for IELE = 1 : NELE
    fprintf(FIDE,'%6i 0.00 %+15.6e \n',IELE,GIR{IELE}(1,1));
    for IINTE = 2 : NPGAUSS
        fprintf(FIDE,'   0.00 %+15.6e \n',GIR{IELE}(1,IINTE));
    end
end
fprintf(FIDE,'End Values \n');
fprintf(FIDE,'# \n');

% Impresion de cortante
fprintf(FIDE,'Result "Cortante" "%s"  1  Vector OnGaussPoints "GP" \n',TANA);
fprintf(FIDE,'ComponentNames "V_y"  \n');
fprintf(FIDE,'Values \n');
for IELE = 1 : NELE
    fprintf(FIDE,'%6i 0.00 %+15.6e\n',IELE,FM{IELE}(1,1));
    for IINTE = 2 : NPGAUSS
        fprintf(FIDE,'   0.00 %+15.6e\n',FM{IELE}(1,IINTE));
    end
end
fprintf(FIDE,'End Values \n');
fprintf(FIDE,'# \n');

% Impresion de momentos
fprintf(FIDE,'Result "Momento" "%s"  1  Vector OnGaussPoints "GP" \n',TANA);
fprintf(FIDE,'ComponentNames "M_z"  \n');
fprintf(FIDE,'Values \n');
for IELE = 1 : NELE
    fprintf(FIDE,'%6i 0.00 %+15.6e \n',IELE,FM{IELE}(2,1));
    for IINTE = 2 : NPGAUSS
        fprintf(FIDE,'   0.00 %+15.6e \n',FM{IELE}(2,IINTE));
    end
end
fprintf(FIDE,'End Values \n');

status = fclose(FIDE);
cd(DIRO); %%M-DV%% Vuelve a la direccion donde se encuentra PEFICA.m
end