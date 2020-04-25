% -------------------------------------------------------------------------% /PEFUNI/PEFiCA: Programa de elementos finitos a código abierto. versión 2.0%% Esta versión está en la carpeta PEFUNI, e incluye:% Análisis elástico lineal para problemas unidimensionales de elementos% sometidos a fuerza axial y flexión. Considera deformaciones infinitesimales y% utiliza elementos finitos unidimensionales para dos tipos de problemas:% TIPR=10: fuerza axial con un grado de libertad por nudo corresp. al desplaz x.% TIPR=11: flexión con dos grados de libertad por nudo corresp. al desplaz y a%          la rotación alrededor de z.% -------------------------------------------------------------------------% Dorian L. Linero S., Martín Estrada M. & Diego A. Garzón A.% %%M-DV%% = Modificado o \a~nadido por Daniel S. Vivas S.% Universidad Nacional de Colombia% Facultad de Ingeniería% Todos los derechos reservados, 2020%function PEFICA (ADAT)% adicionar carpetasDIRO = pwd(); %%M-DV%% Directorio original de PEFICA.maddpath('./FUNCIONES');addpath(genpath('./DATOS')); %%M-DV%% a\~nade ademas todas las subcarpetas que se encuentran en /DATOSrun(ADAT); % leer datos de entrada de un archivo .mif NIT == 0 || NIT == 1 %%M-DV%% Permite ver los resultados en pantalla en caso de multiples analisis    clc; % limpiar pantallaend% tiempo inicial de la rutinaTINT = IMTIEM('/PEFUNI/PEFICA 2.0. Universidad Nacional de Colombia 2020 \n',0);% tiempo inicial de un grupo de instruccionesTINI = IMTIEM('Lectura de datos de entrada',0);% -------------------------------------------------------------------------TIPCA = CAT(1,3); %%M-DV%% Tipos de casos de analisisif TIPCA == 212 || TIPCA == 213 || TIPCA == 223 || TIPCA == 300    MANDIR(TIPCA,ADAT,DIRO,NIT,CAT,TINT); %%M-DV%% Maneja directorios y archivos originales    return %%M-DV%% Finaliza el programaelseif NIT == 0 %%M-DV%% Numero de iteracion = 0 implica que no hay mas de un caso de analisis    DIRA = strcat('DATOS/',ADAT,'.gid'); %%M-DV%% Directorio actual del archivo que se esta analizandoendELE = int32(ELE);        % cambio de tipo de datos para las matrices enterasNELE = size(ELE,1);      % número de elementos[NNUD,NDIM] = size(XYZ); % número de nudos y número de dimensionesTFIN = IMTIEM('',TINI);TINI = IMTIEM('Grados de libertad de nudos y elementos',0);% -------------------------------------------------------------------------% A partir de la tabla de desplazamientos conocidos de algunos nudos UCO()% se crea la tabla de GL por nudo MGL(), el subvector de desplazamientos% conocidos UBB() y se obtiene el número de GL por nudo NGLN y el número de% GL conocidos NGLC.[MGL,UBB,NGLN,NGLC] = NGLUCO(UCO,NNUD);NGLT = NNUD*NGLN;  % número de grados de libertad del sólidoNGLD = NGLT-NGLC;  % número de grados de libertad conocidos% Se crea la tabla de GLs por elemento o matriz de incidencias[INC] = NGLELE(ELE,MGL);TFIN = IMTIEM('',TINI);TINI = IMTIEM('Matriz de rigidez del solido',0);% -------------------------------------------------------------------------KGS = zeros(NGLT,NGLT); % definición de tamaño de la matriz de rigidez sólidofor IELE = 1:NELE    % matriz de rigidéz de elemento    CAE = CAT(ELE(IELE,1),:); % propiedades de la categ eleme IELE    NUEL = PELEME(CAT(ELE(IELE,1),3)); % número de nudos del elemento IELE    XYE(1:NUEL,1:NDIM) = XYZ(ELE(IELE,2:NUEL+1),1:NDIM);% coor nud de elem IELE    [KEL] = KELEME(XYE,CAE); %%M-DV%% matriz de rigidez del elem IELE        % ensamblaje de KEL() del elemento IELE en KGS() del sólido    NKEL = size(KEL,1); % tamaño de la matriz de rigidez del elemento    for IKEL=1:NKEL        for JKEL=1:NKEL            if ( INC(IELE, IKEL) ~= 0 & INC(IELE, JKEL) ~= 0)                KGS(INC(IELE, IKEL), INC(IELE, JKEL)) = ...                    KGS(INC(IELE, IKEL), INC(IELE, JKEL)) + KEL(IKEL, JKEL);            end % endif        end % endfor JKEL    end % endfor IKEL    end % endfor fin matriz de rigidez del sólido% submatrices de rigidez del sólidoKAA = KGS(1:NGLD,1:NGLD);            % submatriz K_{alpha,alpha}KAB = KGS(1:NGLD,NGLD+1:NGLT);       % submatriz K_{alpha,beta}KBA = KGS(NGLD+1:NGLT,1:NGLD);       % submatriz K_{beta,alpha}KBB = KGS(NGLD+1:NGLT,NGLD+1:NGLT);  % submatriz K_{beta,beta}TFIN = IMTIEM('',TINI);TINI = IMTIEM('Vector de fuerzas distribuidas',0);% -------------------------------------------------------------------------NFDI = size(FDI,1); % número de cargas distribuidas en elementosFGS = zeros(NGLT,1); % definición de tamaño del vec fuerz distribu de la mallafor IFDI = 1:NFDI % ciclo por carga distribuida    if FDI(IFDI,1)~=0 % control de problemas sin fuerzas distribuidas        IELE = FDI(IFDI,1); % identificador del elemento finito        WELE = FDI(IFDI,2); % carga distribuida        ICAT = ELE(IELE,1); % identific de la categ del elemento cargado        CAE = CAT(ICAT,:); % propiedades de la categ eleme IELE        NUEL = PELEME(CAT(ELE(IELE,1),3)); % número de nudos del elemento IELE        XYE(1:NUEL,1:NDIM) = XYZ(ELE(IELE,2:NUEL+1),1:NDIM); % coor nud de elem IELE        [FEL] = FELEMD(XYE,CAE,WELE); % vec fuerza de distrib del element                % ensamblaje de FEL() del elemento IELE en FGS() del sólido        NFEL = size(FEL,1); % tamaño de vector del elemento        for IFEL=1:NFEL            if INC(IELE, IFEL) ~= 0                FGS(INC(IELE, IFEL), 1) = FGS(INC(IELE, IFEL), 1) + FEL(IFEL,1);            end % endif        end % endfor IFEL        % fin ensamblaje    end % endifend % endfor%%M-DV%% Cargas lineales en los elementosif size(FDIL,1) ~= 0    [C,~,ic] = unique(FDIL(:,2:3),'rows');    CONT=accumarray(ic,1); % numero de elementos clasificados por magnitud de cargas lineales    [~,ULELE] = unique(FDIL(:,2:3),'rows','last');    [~,PRELE] = unique(FDIL(:,2:3),'rows','first');    %%M-DV%% Matriz de fuerzas distribuidas lineales simplificada    %%M-DV%% FDILS = [Vector_fuerzas Contador Primer_Elemento Ultimo_elemento Coor_Prim_nudo Coor_Ult_nudo]    FDILS = [C CONT FDIL(PRELE) FDIL(ULELE) XYZ(ELE(FDIL(PRELE),2)) XYZ(ELE(FDIL(ULELE),3)) ];    NFDILG = size(FDILS,1); %%M-DV%% Numero de fuerzas en el dominio de la viga en elementos generales    for IFDILG = 1:NFDILG %%M-DV%% Identificador fuerza distribuida lineal del elemento general        MFDILI = FDILS(IFDILG,1); %%M-DV%% Magnitud general inicial de la carga        MFDILF = FDILS(IFDILG,2); %%M-DV%% Magnitud general final de la carga        IELEI  = FDILS(IFDILG,4); %%M-DV%% Identificador elemento general inicial con la carga        IELEF  = FDILS(IFDILG,5); %%M-DV%% Identificador elemento general final con la carga        CNINI  = FDILS(IFDILG,6); %%M-DV%% Coordenada primer nudo del elemento general inicial        CNFIN  = FDILS(IFDILG,7); %%M-DV%% Coordenada ultimo nudo del elemento general final        PECIN  = (MFDILF - MFDILI) / (CNFIN - CNINI); %%M-DV%% Pendiente de ec. lineal de interpolacion        for IFDIL=IELEI : IELEF            if FDIL(IFDIL)~=0 %%M-DV%% identificador del elemento finito                              ICAT = ELE(IFDIL,1); %%M-DV%% identific de la categ del elemento cargado                CAE = CAT(ICAT,:); %%M-DV%% propiedades de la categ eleme IELE                NUEL = PELEME(CAT(ELE(IFDIL,1),3)); %%M-DV%% número de nudos del elemento IELE                XYE(1:NUEL,1:NDIM) = XYZ(ELE(IFDIL,2:NUEL+1),1:NDIM); %%M-DV%% coor nud de elem IELE                WLELE=[ PECIN*(XYE(1,1)-CNINI)+MFDILI ; (PECIN*(XYE(2,1)-CNINI)+MFDILI)]; %%M-DV%%                [FEL] = FELEMDL(XYE,CAE,WLELE); %%M-DV%% vec fuerza de distrib del element                                %%M-DV%% ensamblaje de FEL()                 NFEL = size(FEL,1); % tamaño de vector del elemento                for IFEL=1:NFEL                                     if INC(IFDIL, IFEL) ~= 0                        FGS(INC(IFDIL, IFEL), 1) = FGS(INC(IFDIL, IFEL), 1) + FEL(IFEL,1);                    end % endif                end % endfor IFEL                % fin ensamblaje            end % endif        end % endfor    endendTFIN = IMTIEM('',TINI);TINI = IMTIEM('Vector de fuerzas aplicadas direct en los nudos del solido',0);% -------------------------------------------------------------------------[TEM] = ORTAEX(FUN,NNUD); % tabla de fuerzas puntuales extendida a todos nuds[FGN] = ORTAVE(TEM,MGL); % vector de fuerzas en los nudos del sólido% solo es valido del GL=1 hasta GL=NGLD, los términos donde GL>NGLD son las% reacciones en los apoyos que aún son desconocidasTFIN = IMTIEM('',TINI);TINI = IMTIEM('Vector de fuerzas totales equival en los nudos del solido',0);% -------------------------------------------------------------------------% fuer.totales = fuer.eq.distribuidas + fuer.aplic.direc.nudosFGT = FGS + FGN;FAA = FGT(1:NGLD,1); % subvec.fuer.totales conocidas alpha, entre 1<=GL<=NGLDTFIN = IMTIEM('',TINI);TINI = IMTIEM('Desplazamientos en los nudos del solido',0);% -------------------------------------------------------------------------% solución de un sistema de ecuaciones simultaneas para obtener el% subvector de desplazamientos nodales desconocidos u_{alpha}UAA = (KAA) \ (FAA - KAB * UBB);UTO = [ UAA ; UBB ]; % vector de desplaz. nodales completo[UXY] = ORVETA(UTO,MGL); % tabla de desplaz. nodales en formato UX,UYTFIN = IMTIEM('',TINI);TINI = IMTIEM('Reacciones en los nudos del solido',0);% -------------------------------------------------------------------------FGB = FGS(NGLD+1:NGLT,1); % subvector beta de fuer.equival.distribuidasFBB = KBA * UAA + KBB * UBB - FGB; % subvector de fuerzas desconoc = reaccionesFNA = FGN(1:NGLD,1); % subvec.fuer.en nudos conocidas alphaFTO = [ FNA ; FBB ]; % vector completo de fuerzas en nudos (sin equival a distribuidas)[FXY] = ORVETA(FTO,MGL); % tabla de fuerzas nodales en formato FX,FYTFIN = IMTIEM('',TINI);% acciones internas en los elementos% --------------------------------------------------------------------------switch TIPR        % problema de fuerza axial: deformac, esfuerzo y fuerza axial en los elementos    % ------------------------------------------------------------------------    case 10        TINI = IMTIEM('Deformacion, esfuerzo y fuerza axial en cada elemento',0);        REL = zeros(NELE,6); % crear tabla de resultados en los elementos                for IELE = 1:NELE % ciclo por elemento                        TIPE = CAT(ELE(IELE,1),3); % código tipo del elemento            [NUEL] = PELEME(TIPE); % número de nudos del elemento IELE            NGLE = NUEL*NGLN; % número de GL por elemento            XYE(1:NUEL,1:NDIM) = XYZ(ELE(IELE,2:NUEL+1),1:NDIM); % coor nud de elem IELE            XYP = 0; % coord natural de evaluación de B. No afecta elementos lineales            UEL = EXTRAV(UTO,INC,IELE,NGLE); % vec despl nodales del elem                        EYOU = CAT(ELE(IELE,1),1); % módulo de Young del elemento            AREA = CAT(ELE(IELE,1),2); % área de secc trans del elemento                        % deformación, esfuerzo y fuerza axial            BEL = BELEME(XYE,XYP,TIPE,0); % matriz B evaluada en el punto XYP en coor nat            EPEL = BEL * UEL;    % deformación en el elem            STEL = EYOU * EPEL;   % esfuerzo en el elem            NFEL = STEL * AREA;   % fuerza axial en el elem                        % tabla de deformación, esfuerzo y fuerza axial por nudo y por elemento            REL(IELE,1) = EPEL; % deformación nudo inicial del elemento IELE            REL(IELE,2) = EPEL; % deformación nudo final del elemento IELE            REL(IELE,3) = STEL; % esfuerzo nudo inicial del elemento IELE            REL(IELE,4) = STEL; % esfuerzo nudo final del elemento IELE            REL(IELE,5) = NFEL; % fuerza axial nudo inicial del elemento IELE            REL(IELE,6) = NFEL; % fuerza axial nudo final del elemento IELE                    end % endfor                IMREAX(IMPR,XYZ,ELE,CAT,UCO,FUN,UXY,FXY,REL,ADAT);                TFIN = IMTIEM('',TINI);                % problema de flexión: desplaz, rotaciones, fuerzas internas en los elementos        % -----------------------------------------------------------    case 11        TINI = IMTIEM('Desplaz, rotac, fuerza interna en cada elemento',0);        NXIP = NIIE + 1; %%M-DV%% número de partes de cálculo en el elemento        REL = zeros(NELE,8); % crear tabla de resultados en los nudos de los eleme        RIL = zeros((NXIP+1)*NELE,4); % tabla de resultados en el interior de elem        URI = zeros(2*NELE,1); % tabla de índices que ubican a los nudos de cada elem                for IELE = 1:NELE % ciclo por elemento                        % desplazamientos en los nudos de un elemento IELE            TIPE = CAT(ELE(IELE,1),3); % código tipo del elemento            [NUEL] = PELEME(TIPE); % número de nudos del elemento IELE            NGLE = NUEL*NGLN; % número de GL por elemento            XYE(1:NUEL,1:NDIM) = XYZ(ELE(IELE,2:NUEL+1),1:NDIM); % coor nud de elem IELE            UEL = EXTRAV(UTO,INC,IELE,NGLE); % vec despl nodales del elem            LELE = abs(XYE(2,1)-XYE(1,1)); %%M-DV%% Longitud del elemento                        % matriz de rigidez del elemento IELE            CAE = CAT(ELE(IELE,1),:); % propiedades de la categ eleme IELE            [KEL] = KELEME(XYE,CAE); % matriz de rigidez del elem IELE                        % vector de fuerza equivalente a la carga distribuida en el elem IELE            WELE = 0;            NFDI = size(FDI,1); % número de elementos con cargas distribuidas            for IFDI = 1:NFDI                if FDI(IFDI,1) == IELE                    WELE = FDI(IFDI,2) + WELE; % carga distribuida                end % endif            end % endfor IFDI                        WLELE = [0 ; 0];   %%M-DV%%            NFDIL = size(FDIL,1);   %%M-DV%%            for IFDIL=1: NFDIL  %%M-DV%%                for IFDILG = 1:NFDILG  %%M-DV%%                    MFDILI = FDILS(IFDILG,1); %%M-DV%% Magnitud general inicial de la carga                    MFDILF = FDILS(IFDILG,2); %%M-DV%% Magnitud general final de la carga                    IELEI  = FDILS(IFDILG,4); %%M-DV%% Identificador elemento general inicial con la carga                    IELEF  = FDILS(IFDILG,5); %%M-DV%% Identificador elemento general final con la carga                    CNINI  = FDILS(IFDILG,6); %%M-DV%% Coordenada primer nudo del elemento general inicial                    CNFIN  = FDILS(IFDILG,7); %%M-DV%% Coordenada ultimo nudo del elemento general final                    PECIN  = (MFDILF - MFDILI) / (CNFIN - CNINI); %%M-DV%% Pendiente de ec. lineal de interpolacion                                        if FDIL(IFDIL,1) == IELE && IELEI <= IELE && IELE <= IELEF  %%M-DV%%                        WLELE=[ PECIN*(XYE(1,1)-CNINI)+MFDILI ; (PECIN*(XYE(2,1)-CNINI)+MFDILI)] + WLELE;  %%M-DV%%                    end  %%M-DV%%                end  %%M-DV%%            end  %%M-DV%%            [FEL] = FELEMD(XYE,CAE,WELE) + FELEMDL(XYE,CAE,WLELE);   %%M-DV%% vec fuerza de distrib del elem IELE                        % fuerza transversal y momento flector en los nudos del elemento IELE            FIE = KEL * UEL - FEL;            % tabla de resultados en los elementos            REL(IELE,1) = UEL(1,1);  % desplaza en y nudo inicial del elemento IELE            REL(IELE,2) = UEL(2,1);  % rotación en z nudo inicial del elemento IELE            REL(IELE,3) = UEL(3,1);  % desplaza en y nudo final del elemento IELE            REL(IELE,4) = UEL(4,1);  % rotación en z nudo final del elemento IELE            REL(IELE,5) = FIE(1,1);  % fuerza  en y nudo inicial del elemento IELE            REL(IELE,6) = FIE(2,1);  % momento en z nudo inicial del elemento IELE            REL(IELE,7) = FIE(3,1);  % fuerza  en y nudo final del elemento IELE            REL(IELE,8) = FIE(4,1);  % momento en z nudo final del elemento IELE                       % posición, desplazam, f cortante y momento en el inter del elemento IELE            LELE = XYE(2,1) - XYE(1,1);            for IXIP = 1:(NXIP+1)                XIPN = (IXIP-1) / NXIP; %%M-DV%%                 NEL = NELEME(XYE,XIPN,TIPE,0); %%M-DV%%                                if TIPE == 111                    BEL = BELEME(XYE,XIPN,TIPE,0); %%M-DV%% matriz B evaluada en el punto XYP en coor nat                else                    BELb = BELEME(XYE,XIPN,TIPE,1); %%M-DV%% matriz Bb evaluada en el punto XYP en coor nat                    BELs = BELEME(XYE,XIPN,TIPE,2); %%M-DV%% matriz Bs evaluada en el punto XYP en coor nat                end                DESE = NEL * UEL;                IPOS = (NXIP+1)*(IELE-1) + IXIP;                RIL(IPOS,1) = XYE(1,1) + XIPN*LELE;  % posición global                RIL(IPOS,2) = DESE; % desplazamiento en y                DES{IELE}(1,IXIP) = RIL(IPOS,2); %%M-DV%% Almaceno el desplazamiento por elemento                if TIPE == 111                    DNDX =  1/LELE*[(6*XIPN^2-6*XIPN) ...                        (3*LELE*XIPN^2 - 4*LELE*XIPN + LELE)...                        (-6*XIPN^2+6*XIPN)...                        (3*LELE*XIPN^2 - 2*LELE*XIPN)]; %%M-DV%% Derivada de N respecto a x                    GIRE = DNDX * UEL; % matriz B evaluada en el punto XYP en coor nat                else                    GIRE = NELEME(XYE,XIPN,TIPE,1); % matriz Bb evaluada en el punto XYP en coor nat                end                DNDX =  1/LELE*[(6*XIPN^2-6*XIPN) ...                        (3*LELE*XIPN^2 - 4*LELE*XIPN + LELE)...                        (-6*XIPN^2+6*XIPN)...                        (3*LELE*XIPN^2 - 2*LELE*XIPN)]; %%M-DV%% Derivada de N respecto a x                GIRE = DNDX * UEL;                GIR{IELE}(1,IXIP) = GIRE; %%M-DV%% Almaceno el giro por elemento                RIL(IPOS,3) = FIE(1,1) + WELE*XIPN*LELE + (WLELE(1,1)+WLELE(2,1))*XIPN*LELE/2; %%M-DV%%  fuerza cortante                RIL(IPOS,4) = -FIE(2,1) + FIE(1,1)*XIPN*LELE + 0.5*WELE*(XIPN*LELE)^2 + (WLELE(1,1)+WLELE(2,1))*(XIPN*LELE)^2/4; %%M-DV%% Momento                FM{IELE}(1,IXIP) = RIL(IPOS,3); %%M-DV%% Almaceno los datos de cortante en FM(1,:)                FM{IELE}(2,IXIP) = RIL(IPOS,4); %%M-DV%% Almaceno los datos de momentos en FM(2,:)            end % endfor IXIP            % índice que ubican los nudos de los elementos en RIL()            URI(2*IELE-1) = (NXIP+1)*(IELE-1) + 1;            URI(2*IELE) =  (NXIP+1)*IELE;                    end % endfor IELE                IMREFL(IMPR,XYZ,ELE,UXY,FXY,REL,RIL,URI,TIPE,... %%M-DV%% Para Octave               ADAT,NUEL,CAE,DIRA,DIRO,... %%M-DV%% Otros para MESH GID               FM,NXIP,NIT,DES,GIR); %%M-DV%% Otros para RESULTADOS GID        otherwise        % pendienteend % endswitch TIPR% mostrar tiempo finalTFIN = IMTIEM('Tiempo total de ejecucion',TINT);end