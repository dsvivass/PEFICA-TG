% ==================================================================
%                        General Data File
% ==================================================================
% Units:
% length m mass kg
% Number of elements and nodes:
% .................................................................

% 20 21
% Material      Surface density kg/m^2

IMPR=8;
TIPR=11;
 %   EYOU    INER   TIPE   A   Kz   MPOISS   
CAT = [ ...
  2.15000e+10  1.60000e-03 111
];

% .................................................................

%    Element    Node(1)   Node(2)    Material     inercia
ELE = [ ...
         1          1        21         20 
         2          1        20         19 
         3          1        19         18 
         4          1        18         17 
         5          1        17         16 
         6          1        16         15 
         7          1        15         14 
         8          1        14         13 
         9          1        13         12 
        10          1        12         11 
        11          1        11         10 
        12          1        10          9 
        13          1         9          8 
        14          1         8          7 
        15          1         7          6 
        16          1         6          5 
        17          1         5          4 
        18          1         4          3 
        19          1         3          2 
        20          1         2          1 
];
ELE(:,1)=[];


% .................................................................

% Coordinates:
% X m
XYZ = [ ...
    5.00000e+00 
    4.75000e+00 
    4.50000e+00 
    4.25000e+00 
    4.00000e+00 
    3.75000e+00 
    3.50000e+00 
    3.25000e+00 
    3.00000e+00 
    2.75000e+00 
    2.50000e+00 
    2.25000e+00 
    2.00000e+00 
    1.75000e+00 
    1.50000e+00 
    1.25000e+00 
    1.00000e+00 
    7.50000e-01 
    5.00000e-01 
    2.50000e-01 
    0.00000e+00 
];

% .................................................................

% Categorias:

% .................................................................


% .................................................................

% Nudo    indy   indz    VAUY     VAUZ
UCO = [ ...
21    1   1  0.00000e+00  0.00000e+00
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
         1  -1.00000e+04 -5.00000e+03
         2  -1.00000e+04 -5.00000e+03
         3  -1.00000e+04 -5.00000e+03
         4  -1.00000e+04 -5.00000e+03
         5  -1.00000e+04 -5.00000e+03
         6  -1.00000e+04 -5.00000e+03
         7  -1.00000e+04 -5.00000e+03
         8  -1.00000e+04 -5.00000e+03
         9  -1.00000e+04 -5.00000e+03
        10  -1.00000e+04 -5.00000e+03
        11  -1.00000e+04 -5.00000e+03
        12  -1.00000e+04 -5.00000e+03
        13  -1.00000e+04 -5.00000e+03
        14  -1.00000e+04 -5.00000e+03
        15  -1.00000e+04 -5.00000e+03
        16  -1.00000e+04 -5.00000e+03
        17  -1.00000e+04 -5.00000e+03
        18  -1.00000e+04 -5.00000e+03
        19  -1.00000e+04 -5.00000e+03
        20  -1.00000e+04 -5.00000e+03
];



