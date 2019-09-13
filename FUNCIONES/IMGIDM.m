function IMGIDM(ADAD,NUEL,CAE,NNUD,XYZ,NELE,ELE)

if NUEL == 2; ELTI = 'line'; end

NAME = 'Malla de la viga';

GIDM = strcat(ADAD,'.msh'); % nombre archivo GiD post de la malla
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
end