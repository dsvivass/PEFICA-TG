%%M-DV%% Manejo de directorios para obtener resultados organizados en
%%carpetas de origen
function MANDIR(TIPCA,ADAT,DIRO,NIT,CAT,TINT)
    %%M-DV%% TIPCA: Tipo de caso de analisis
    %%M-DV%% ADAT: Archivo de entrada
    %%M-DV%% DIRO: Directorio original de PEFICA.m
    %%M-DV%% NIT: Numero de iteracion en caso de multiples analisis
    %%M-DV%% CAT: Tabla de categorias del problema
    %%M-DV%% TINT: Tiempo acumulado de ejecucion
    
switch TIPCA
    case 212 %%M-DV%% Caso Euler Bernoulli y Timoshenko1PG
        FILEO = strcat(ADAT,'.m'); %%M-DV%% Archivo original con extension .m
        FILEN = strcat(ADAT,'_MULTIPLE.m'); %%M-DV%% Archivo nuevo para casos de analisis .m
        DIRA = strcat('DATOS/',ADAT,'.gid'); %%M-DV%% Directorio actual del archivo que se esta analizando
        cd(DIRA); %%M-DV%% Cambio de directorio a carpeta que contiene el archivo que se esta analizando
        copyfile(FILEO,FILEN); %%M-DV%% Copia del archivo original al nuevo
        NIT = 1; %%M-DV%% Numero de iteracion en caso de varios casos de analisis
        for TIPA=111 : 112
            if NIT > 1
                cd(DIRA); %%M-DV%% desde NIT = 2 debe cambiar al directorio actual
            end
            CAT(:,3) = TIPA; %%M-DV%% Tipo de analisis que se a\~nadira
            ABRIR=fopen(FILEN,'a+'); %%M-DV%% Append al archivo nuevo
            fprintf(ABRIR,'DIRA = "%s";\n',DIRA); %%M-DV%% Escribe la direccion del directorio DIRA
            fprintf(ABRIR,'NIT = %d;\n',NIT); %%M-DV%% Escribe el numero de iteracion
            fprintf(ABRIR,'CAT = [...\n'); %%M-DV%% Escribe la nueva categoria que se esta analizando
            for FCAT=1 : size(CAT,1) %%M-DV%% Ciclo para escribir tantas categorias como se tengan
                fprintf(ABRIR,'%f ',CAT(FCAT,:));
                fprintf(ABRIR,';\n');
            end
            fprintf(ABRIR,'];\n'); %%M-DV%% Cierra matriz CAT
            NIT = NIT + 1; %%M-DV%% Actualizacion de numero de iteracion
            status = fclose(ABRIR); %%M-DV%% Cerrar el archivo *_actualizado.m
            cd(DIRO); %%M-DV%% Cambia direccion a directorio original de PEFICA.m
            PEFICA(FILEN); %%M-DV%% Invoca a PEFICA para que lea el nuevo archivo *_MULTIPLE.m
        end
        TFIN = IMTIEM('Tiempo total acumulado de ejecucion',TINT); %%M-DV%% Tiempo total de ejecucion del programa
        return %%M-DV%% Devuelve el control a la funcion que la invoco "PEFICA.m"
    case 213 %%M-DV%% Caso Euler Bernoulli y Timoshenko2PG
        FILEO = strcat(ADAT,'.m'); %%M-DV%% Archivo original con extension .m
        FILEN = strcat(ADAT,'_MULTIPLE.m'); %%M-DV%% Archivo nuevo para casos de analisis .m
        DIRA = strcat('DATOS/',ADAT,'.gid'); %%M-DV%% Directorio actual del archivo que se esta analizando
        cd(DIRA); %%M-DV%% Cambio de directorio a carpeta que contiene el archivo que se esta analizando
        copyfile(FILEO,FILEN); %%M-DV%% Copia del archivo original al nuevo
        NIT = 1; %%M-DV%% Numero de iteracion en caso de varios casos de analisis
        for TIPA=111 : 2 : 113
            if NIT > 1
                cd(DIRA); %%M-DV%% desde NIT = 2 debe cambiar al directorio actual
            end
            CAT(:,3) = TIPA; %%M-DV%% Tipo de analisis que se a\~nadira
            ABRIR=fopen(FILEN,'a+'); %%M-DV%% Append al archivo original
            fprintf(ABRIR,'DIRA = "%s";\n',DIRA); %%M-DV%% Escribe la direccion del directorio DIRA
            fprintf(ABRIR,'NIT = %d;\n',NIT); %%M-DV%% Escribe el numero de iteracion
            fprintf(ABRIR,'CAT = [...\n'); %%M-DV%% Escribe la nueva categoria que se esta analizando
            for FCAT=1 : size(CAT,1) %%M-DV%% Ciclo para escribir tantas categorias como se tengan
                fprintf(ABRIR,'%f ',CAT(FCAT,:));
                fprintf(ABRIR,';\n');
            end
            fprintf(ABRIR,'];\n'); %%M-DV%% Cierra matriz CAT
            NIT = NIT + 1; %%M-DV%% Actualizacion de numero de iteracion
            status = fclose(ABRIR); %%M-DV%% Cerrar el archivo *_actualizado.m
            cd(DIRO); %%M-DV%% Cambia direccion a directorio original de PEFICA.m
            PEFICA(FILEN); %%M-DV%% Invoca a PEFICA para que lea el nuevo archivo *_MULTIPLE.m
        end
        TFIN = IMTIEM('Tiempo total acumulado de ejecucion',TINT); %%M-DV%% Tiempo total de ejecucion del programa
        return
    case 223 %%M-DV%% Caso Timoshenko1PG y Timoshenko2PG
        FILEO = strcat(ADAT,'.m'); %%M-DV%% Archivo original con extension .m
        FILEN = strcat(ADAT,'_MULTIPLE.m'); %%M-DV%% Archivo nuevo para casos de analisis .m
        DIRA = strcat('DATOS/',ADAT,'.gid'); %%M-DV%% Directorio actual del archivo que se esta analizando
        cd(DIRA); %%M-DV%% Cambio de directorio a carpeta que contiene el archivo que se esta analizando
        copyfile(FILEO,FILEN); %%M-DV%% Copia del archivo original al nuevo
        NIT = 1; %%M-DV%% Numero de iteracion en caso de varios casos de analisis
        for TIPA=112 : 113
            if NIT > 1
                cd(DIRA); %%M-DV%% desde NIT = 2 debe cambiar al directorio actual
            end
            CAT(:,3) = TIPA; %%M-DV%% Tipo de analisis que se a\~nadira
            ABRIR=fopen(FILEN,'a+'); %%M-DV%% Append al archivo original
            fprintf(ABRIR,'DIRA = "%s";\n',DIRA); %%M-DV%% Escribe la direccion del directorio DIRA
            fprintf(ABRIR,'NIT = %d;\n',NIT); %%M-DV%% Escribe el numero de iteracion
            fprintf(ABRIR,'CAT = [...\n'); %%M-DV%% Escribe la nueva categoria que se esta analizando
            for FCAT=1 : size(CAT,1) %%M-DV%% Ciclo para escribir tantas categorias como se tengan
                fprintf(ABRIR,'%f ',CAT(FCAT,:));
                fprintf(ABRIR,';\n');
            end
            fprintf(ABRIR,'];\n'); %%M-DV%% Cierra matriz CAT
            NIT = NIT + 1; %%M-DV%% Actualizacion de numero de iteracion
            status = fclose(ABRIR); %%M-DV%% Cerrar el archivo *_actualizado.m
            cd(DIRO); %%M-DV%% Cambia direccion a directorio original de PEFICA.m
            PEFICA(FILEN); %%M-DV%% Invoca a PEFICA para que lea el nuevo archivo *_MULTIPLE.m
        end
        TFIN = IMTIEM('Tiempo total acumulado de ejecucion',TINT); %%M-DV%% Tiempo total de ejecucion del programa
        return
    case 300 %%M-DV%% Caso Euler-Bernoulli, Timoshenko1PG y Timoshenko2PG
        FILEO = strcat(ADAT,'.m'); %%M-DV%% Archivo original con extension .m
        FILEN = strcat(ADAT,'_MULTIPLE.m'); %%M-DV%% Archivo nuevo para casos de analisis .m
        DIRA = strcat('DATOS/',ADAT,'.gid'); %%M-DV%% Directorio actual del archivo que se esta analizando
        cd(DIRA); %%M-DV%% Cambio de directorio a carpeta que contiene el archivo que se esta analizando
        copyfile(FILEO,FILEN); %%M-DV%% Copia del archivo original al nuevo
        NIT = 1; %%M-DV%% Numero de iteracion en caso de varios casos de analisis
        for TIPA=111 : 113
            if NIT > 1
                cd(DIRA); %%M-DV%% desde NIT = 2 debe cambiar al directorio actual
            end
            CAT(:,3) = TIPA; %%M-DV%% Tipo de analisis que se a\~nadira
            ABRIR=fopen(FILEN,'a+'); %%M-DV%% Append al archivo original
            fprintf(ABRIR,'DIRA = "%s";\n',DIRA); %%M-DV%% Escribe la direccion del directorio DIRA
            fprintf(ABRIR,'NIT = %d;\n',NIT); %%M-DV%% Escribe el numero de iteracion
            fprintf(ABRIR,'CAT = [...\n'); %%M-DV%% Escribe la nueva categoria que se esta analizando
            for FCAT=1 : size(CAT,1) %%M-DV%% Ciclo para escribir tantas categorias como se tengan
                fprintf(ABRIR,'%f ',CAT(FCAT,:));
                fprintf(ABRIR,';\n');
            end
            fprintf(ABRIR,'];\n'); %%M-DV%% Cierra matriz CAT
            NIT = NIT + 1; %%M-DV%% Actualizacion de numero de iteracion
            status = fclose(ABRIR); %%M-DV%% Cerrar el archivo *_actualizado.m
            cd(DIRO); %%M-DV%% Cambia direccion a directorio original de PEFICA.m
            PEFICA(FILEN); %%M-DV%% Invoca a PEFICA para que lea el nuevo archivo *_MULTIPLE.m
        end
        TFIN = IMTIEM('Tiempo total acumulado de ejecucion',TINT); %%M-DV%% Tiempo total de ejecucion del programa
        return
end
end