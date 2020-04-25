%%M-DV%% Crea la malla con un archivo .msh que cumple con
%%M-DV%% el formato exigido por el programa GiD
function IMGIDM(ADAT,NUEL,NNUD,XYZ,NELE,ELE,DIRA,DIRO)
    %%M-DV%% ADAT: Archivo de entrada
    %%M-DV%% NUEL: Numero de nudos del elemento
    %%M-DV%% NNUD: Numero de nudos
    %%M-DV%% XYZ: Tabla de coordenadas de los nudos
    %%M-DV%% NELE: Numero de elementos
    %%M-DV%% ELE: Tabla de conectividades de los elementos
    %%M-DV%% DIRA: Directorio donde se encuentra el archivo ADAT
    %%M-DV%% DIRO: Directorio original de PEFICA.m
    
cd(DIRA); %%M-DV%% Cambia a la direccion donde se encuentra el archivo ADAT
if NUEL == 2; ELTI = 'line'; end

NAME = 'Malla de la viga';

GIDM = strcat(ADAT,'.msh'); % nombre archivo GiD post de la malla
FIDE = fopen(GIDM,'w'); % abrir archivo y establecer identificador
fprintf(FIDE,'### \n');
fprintf(FIDE,'# PEFICA-Octave postproceso para GiD \n');
fprintf(FIDE,'# \n');
fprintf(FIDE,'MESH "%s" dimension %3.0f   Elemtype %s   Nnode %2.0f \n \n', ...
    NAME,2,ELTI,NUEL);

% coordenadas de los nudos
fprintf(FIDE,'coordinates \n');
XYZ(:,2)=0;
TEM = [1:NNUD;XYZ'];
fprintf(FIDE,'%6i %+10.4e %+10.4e\n',TEM);
fprintf(FIDE,'end coordinates \n \n');

% conectividades y categoría de los elementos
fprintf(FIDE,'elements \n');
ELER=[ELE(:,2) ELE(:,3) ELE(:,1)];
TEN = [1:NELE;ELER'];
fprintf(FIDE,'%6i %6i %6i %6i\n',TEN);
fprintf(FIDE,'end elements \n \n');

status = fclose(FIDE);
cd(DIRO); %%M-DV%% Vuelve a la direccion donde se encuentra PEFICA.m
end