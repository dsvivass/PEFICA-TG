% ==================================================================
%                        General Data File
% ==================================================================
% Units:
% length m mass kg
% Number of elements and nodes:
% .................................................................

% 13 14
% Material      Surface density kg/m^2

IMPR=8;
TIPR=11;
 %   EYOU    INER   TIPE   A   Kz   MPOISS   
CAT = [ ...
  2.15000e+10  1.60000e-03 111  1.20000e-01  8.30000e-01  2.00000e-01
];

% .................................................................

%    Element    Node(1)   Node(2)    Material     inercia
ELE = [ ...
         1          1        14         13 
         2          1        13         12 
         3          1        12         11 
         4          1        11         10 
         5          1        10          9 
         6          1         9          8 
         7          1         8          7 
         8          1         7          6 
         9          1         6          5 
        10          1         5          4 
        11          1         4          3 
        12          1         3          2 
        13          1         2          1 
];
ELE(:,1)=[]


% .................................................................

% Coordinates:
% X m
XYZ = [ ...
    6.50000e+00 
    6.00000e+00 
    5.50000e+00 
    5.00000e+00 
    4.50000e+00 
    4.00000e+00 
    3.50000e+00 
    3.00000e+00 
    2.50000e+00 
    2.00000e+00 
    1.50000e+00 
    1.00000e+00 
    5.00000e-01 
    0.00000e+00 
];

% .................................................................

% Categorias:

% .................................................................


% .................................................................

% Nudo    indy   indz    VAUY     VAUZ
UCO = [ ...
];

% .................................................................

% Nudo    FUNY     FUMZ
FUN = [ ...
];

% .................................................................

% Nudo    WELE
FDI = [ ...
];

% .................................................................

FDIL = [ ...
         1  -1.00000e+01 -5.00000e+00
         2  -1.00000e+01 -5.00000e+00
         3  -1.00000e+01 -5.00000e+00
         4  -1.00000e+01 -5.00000e+00
         5  -1.00000e+01 -5.00000e+00
         6   0.00000e+00 -3.00000e+00
         7  -2.00000e+01 -5.50000e+01
         8  -2.00000e+01 -5.50000e+01
         9  -2.00000e+01 -5.50000e+01
        10  -2.00000e+01 -5.50000e+01
        11  -2.00000e+01 -5.50000e+01
        12  -2.00000e+01 -5.50000e+01
        13  -2.00000e+01 -5.50000e+01
];

NDIM=1;
    i=1;
   [C,~,ic] = unique(FDIL(:,2:3),'rows','legacy');
  CONT=accumarray(ic,1); % numero de elementos clasificados por magnitud de cargas lineales
  [~,ULELE] = unique(FDIL(:,2:3),'rows','last','legacy');
  [~,PRELE] = unique(FDIL(:,2:3),'rows','first','legacy');
  %%M-DV%% Matriz de fuerzas distribuidas lineales simplificada 
  %%M-DV%% FDILS = [Vector_fuerzas Contador Primer_Elemento Ultimo_elemento Coor_Prim_nudo Coor_Ult_nudo]
  FDILS = [C CONT FDIL(PRELE) FDIL(ULELE) XYZ(ELE(FDIL(PRELE),2)) XYZ(ELE(FDIL(ULELE),3)) ]; 
  NFDILG = size(FDILS,1); %%M-DV%% Numero de fuerzas en el dominio de la viga en elementos generales
  for IFDILG = 1:NFDILG %%M-DV%% Identificador fuerza distribuida lineal del elemento general
      MFDILI = FDILS(IFDILG,1); %%M-DV%% Magnitud general inicial de la carga
      MFDILF = FDILS(IFDILG,2); %%M-DV%% Magnitud general final de la carga
      IELEI  = FDILS(IFDILG,4); %%M-DV%% Identificador elemento general inicial con la carga
      IELEF  = FDILS(IFDILG,5); %%M-DV%% Identificador elemento general final con la carga
      CNINI  = FDILS(IFDILG,6); %%M-DV%% Coordenada primer nudo del elemento general inicial
      CNFIN  = FDILS(IFDILG,7); %%M-DV%% Coordenada ultimo nudo del elemento general final
      PECIN  = (MFDILF - MFDILI) / (CNFIN - CNINI); %%M-DV%% Pendiente de ec. lineal de interpolacion
      for IFDIL=IELEI : IELEF
          if FDIL(IFDIL)~=0
              IELEL = FDIL(IFDIL,1) % identificador del elemento finito
              ICAT = ELE(IELEL,1); % identific de la categ del elemento cargado
              CAE = CAT(ICAT,:); % propiedades de la categ eleme IELE
              NUEL = PELEME(CAT(ELE(IELEL,1),3)); % número de nudos del elemento IELE
              XYE(1:NUEL,1:NDIM) = XYZ(ELE(IELEL,2:NUEL+1),1:NDIM); % coor nud de elem IELE
              WLELE=[ PECIN*(XYE(1,1)-CNINI)+MFDILI ; (PECIN*(XYE(2,1)-CNINI)+MFDILI)]; %%M-DV%%
              [FEL] = FELEMDL(XYE,CAE,WLELE); % vec fuerza de distrib del element
          end
      end
  end
  
  %%M-DV%%
% Vector de fuerzas lineales distribuidas del elemento finito unidimensional
function [FEL] = FELEMDL(XYE,CAE,WLELE)
  % Entrada:  XYE():  coordenadas de los nudos del elemento
  %           CAE():  propiedades del catergoría del elemento
  %           WELE:   carga distribuida
  %
  % Salida:   FEL():  vector de fuerzas distribuida del elemento  

  TIPE = CAE(3);  % código del tipo de elemento
  LELE = abs(XYE(2,1)-XYE(1,1)); % longitud del elemento medida entre nudos I y J
  
  switch TIPE
    case 101 % elemento de fuerza axial unimensional lineal de cont c0
      [FEL] = FAXIAL(LELE,WLELE);
    case 102 % elemento de fuerza axial unidimensional cuadrático de cont c0
      [FEL] = FAXIAC(LELE,WLELE);
    case 111 % elemento de flexión unidimensional cúbico de cont c1
      [FEL] = FBEAME(LELE,WLELE);
    case 112 % elemento de flexión unidimensional cúbico de cont c1
      [FEL] = FBEAMT1(LELE,WLELE);
    case 113 % elemento de flexión unidimensional cúbico de cont c1
      [FEL] = FBEAMT2(LELE,WLELE);
    otherwise
      % pendiente
  end
 
end


% ------------------------------------------------------------------------
% Vector de fuerzas equivalentes a una carga distribuida uniforme en un 
% elemento de fuerza axial unidimensional lineal de continuidad c0
function [FEL] = FAXIAL(LELE,WLELE)
  % Entrada:  LELE:   longitud del elemento
  %           WELE:   carga distribuida
  % Salida:   FEL():  vector de fuerzas distribuida del elemento  
  FEL = (WLELE*LELE/2)*[1 ; 1];
end

% ------------------------------------------------------------------------
% Vector de fuerzas equivalentes a una carga distribuida uniforme en un 
% elemento de fuerza axial unidimensional cuadrático de continuidad c0
function [FEL] = FAXIAC(LELE,WLELE)
  % Entrada:  LELE:   longitud del elemento
  %           WELE:   carga distribuida
  % Salida:   FEL():  vector de fuerzas distribuida del elemento  
  FEL = (WLELE*LELE/6)*[1 ; 1 ; 4];
end

% ------------------------------------------------------------------------
% Vector de fuerzas equivalentes a una carga distribuida uniforme del elemento 
% para flexión unidimensional cúbico de continuidad c1
function [FEL] = FBEAME(LELE,WLELE)
  % Entrada:  LELE:   longitud del elemento
  %           WELE:   carga distribuida uniforme
  % Salida:   FEL():  vector de fuerzas distribuida del elemento  
  if abs(WLELE(1,1)) > abs(WLELE(2,1)) % Calculo de magnitud maxima
      MAXWLELE = WLELE(1,1);
      MINWLELE = WLELE(2,1);
      WTELE = MAXWLELE-MINWLELE; % Calculo carga triangular
      FEL = (MINWLELE*LELE/12)*[6 ; LELE ; 6 ; -LELE] + (WTELE*LELE/20)*[7 ; -LELE ; 3 ; 20*LELE/30]
  else
      MAXWLELE = WLELE(2,1);
      MINWLELE = WLELE(1,1);
      WTELE = MAXWLELE-MINWLELE; % Calculo carga triangular
      FEL = (MINWLELE*LELE/12)*[6 ; LELE ; 6 ; -LELE] + (WTELE*LELE/20)*[3 ; 20*LELE/30 ; 7 ; -LELE]
  end

end

function [FEL] = FBEAMT2(LELE,WLELE)
  % Entrada:  LELE:   longitud del elemento
  %           WELE:   carga distribuida uniforme
  % Salida:   FEL():  vector de fuerzas distribuida del elemento  
  FEL = (1/2*WLELE*LELE)*[1 ; 0 ; 1 ; 0];
end

function [FEL] = FBEAMT1(LELE,WLELE)
  % Entrada:  LELE:   longitud del elemento
  %           WELE:   carga distribuida uniforme
  % Salida:   FEL():  vector de fuerzas distribuida del elemento  
  FEL = (1/2*WLELE*LELE)*[1 ; 0 ; 1 ; 0];
end
  




