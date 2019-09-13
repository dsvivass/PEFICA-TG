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
      FEL = (MINWLELE*LELE/12)*[6 ; LELE ; 6 ; -LELE] + (WTELE*LELE/20)*[7 ; -LELE ; 3 ; 20*LELE/30];
  else
      MAXWLELE = WLELE(2,1);
      MINWLELE = WLELE(1,1);
      WTELE = MAXWLELE-MINWLELE; % Calculo carga triangular
      FEL = (MINWLELE*LELE/12)*[6 ; LELE ; 6 ; -LELE] + (WTELE*LELE/20)*[3 ; 20*LELE/30 ; 7 ; -LELE];
  end

end

function [FEL] = FBEAMT2(LELE,WLELE)
  % Entrada:  LELE:   longitud del elemento
  %           WELE:   carga distribuida uniforme
  % Salida:   FEL():  vector de fuerzas distribuida del elemento  
  FEL = [0 0 0 0];
end

function [FEL] = FBEAMT1(LELE,WLELE)
  % Entrada:  LELE:   longitud del elemento
  %           WELE:   carga distribuida uniforme
  % Salida:   FEL():  vector de fuerzas distribuida del elemento  
  FEL = [0 0 0 0];
end