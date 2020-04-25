%%M-DV%%
% Vector de fuerzas lineales distribuidas del elemento finito unidimensional
function [FEL] = FELEMDL(XYE,CAE,WLELE)
  % Entrada:  XYE():  coordenadas de los nudos del elemento
  %           CAE():  propiedades del catergoría del elemento
  %           WLELE:   carga distribuida lineal
  %
  % Salida:   FEL():  vector de fuerzas nodales equivalentes del elemento  

  TIPE = CAE(3);  % código del tipo de elemento
  LELE = abs(XYE(2,1)-XYE(1,1)); % longitud del elemento medida entre nudos I y J

  switch TIPE
    case 111 % elemento de flexión unidimensional cúbico de cont c1
      [FEL] = FBEAME(LELE,WLELE);
    case 112 %%M-DV%% elemento de flexión unidimensional lineal de continuidad c0 (Timoshenko con Ks 1 puntos de Gauss)
      [FEL] = FBEAMT1(LELE,WLELE);
    case 113 %%M-DV%% elemento de flexión unidimensional lineal de continuidad c0 (Timoshenko con Ks 2 puntos de Gauss)
      [FEL] = FBEAMT2(LELE,WLELE);
    otherwise
      % pendiente
  end
 
end

% ------------------------------------------------------------------------
% Vector de fuerzas equivalentes a una carga distribuida lineal del elemento 
% para flexión unidimensional cúbico de continuidad c1
function [FEL] = FBEAME(LELE,WLELE)
  % Entrada:  LELE:   longitud del elemento
  %           WLELE:   carga distribuida lineal
  %           WLELE(1,1):  Magnitud inicial carga distribuida lineal
  %           WLELE(2,1):  Magnitud final carga distribuida lineal
  % Salida:   FEL():  vector de fuerzas distribuida lineal del elemento  
  FEL = [7*LELE*WLELE(1,1)/20  +  3*LELE*WLELE(2,1)/20 ; 
         LELE^2*WLELE(1,1)/20  +  LELE^2*WLELE(2,1)/30 ;
         3*LELE*WLELE(1,1)/20  +  7*LELE*WLELE(2,1)/20 ; 
       - LELE^2*WLELE(1,1)/30  -  LELE^2*WLELE(2,1)/20];

end

% ------------------------------------------------------------------------
% Vector de fuerzas equivalentes a una carga distribuida lineal del elemento 
% para flexión unidimensional lineal de continuidad c0
function [FEL] = FBEAMT2(LELE,WLELE)
  % Entrada:  LELE:   longitud del elemento
  %           WLELE:   carga distribuida lineal
  %           WLELE(1,1):  Magnitud inicial carga distribuida lineal
  %           WLELE(2,1):  Magnitud final carga distribuida lineal
  % Salida:   FEL():  vector de fuerzas distribuida lineal del elemento  
  FEL = [LELE/3*(WLELE(1,1)+WLELE(2,1)/2) ; 0 ; LELE/3*(WLELE(1,1)/2+WLELE(2,1)) ; 0];
end

% ------------------------------------------------------------------------
% Vector de fuerzas equivalentes a una carga distribuida lineal del elemento 
% para flexión unidimensional lineal de continuidad c0
function [FEL] = FBEAMT1(LELE,WLELE)
  % Entrada:  LELE:   longitud del elemento
  %           WLELE:   carga distribuida lineal
  %           WLELE(1,1):  Magnitud inicial carga distribuida lineal
  %           WLELE(2,1):  Magnitud final carga distribuida lineal
  % Salida:   FEL():  vector de fuerzas distribuida lineal del elemento  
  FEL = [LELE/3*(WLELE(1,1)+WLELE(2,1)/2) ; 0 ; LELE/3*(WLELE(1,1)/2+WLELE(2,1)) ; 0];
end