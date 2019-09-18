% ==================================================================
%                        General Data File
% ==================================================================
% Units:
% length m mass kg
% Number of elements and nodes:
% .................................................................

% 10 11
% Material      Surface density kg/m^2

IMPR=8;
TIPR=11;
NIIE=20;
 %   EYOU    INER   TIPE   A   Kz   MPOISS   
CAT = [ ...
  2.15000e+10  1.60000e-03 112  1.20000e-01  8.30000e-01  2.00000e-01
];

% .................................................................

%    Element    Node(1)   Node(2)    Material     inercia
ELE = [ ...
         1          1        11         10 
         2          1        10          9 
         3          1         9          8 
         4          1         8          7 
         5          1         7          6 
         6          1         6          5 
         7          1         5          4 
         8          1         4          3 
         9          1         3          2 
        10          1         2          1 
];
ELE(:,1)=[];


% .................................................................

% Coordinates:
% X m
XYZ = [ ...
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
11    1   1  0.00000e+00  0.00000e+00
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
         1   0.00000e+00  5.00000e+04
         2   0.00000e+00  5.00000e+04
         3   0.00000e+00  5.00000e+04
         4   0.00000e+00  5.00000e+04
         5   0.00000e+00  5.00000e+04
         6   0.00000e+00  5.00000e+04
         7   0.00000e+00  5.00000e+04
         8   0.00000e+00  5.00000e+04
         9   0.00000e+00  5.00000e+04
        10   0.00000e+00  5.00000e+04
];
NIT = 0;






