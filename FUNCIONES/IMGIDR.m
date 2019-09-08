function IMGIDR(ADAD,NUEL,CAE,NNUD,UXY,NELE,ELE,FM)

if NUEL == 2; ELTI = 'line'; end
  
  GIDM = strcat(ADAD,'.res'); % nombre archivo GiD post de los resultados
  FIDE = fopen(GIDM,'w'); % abrir archivo y establecer identificador
  
  fprintf(FIDE,'Gid Post Results File 1.0 \n');
  fprintf(FIDE,'### \n');
  fprintf(FIDE,'# PEFICA-Octave postproceso para GiD \n');
  fprintf(FIDE,'# \n');
  fprintf(FIDE,'GaussPoints "GP" Elemtype %s \n',ELTI);
  fprintf(FIDE,'Number of Gauss Points: %i \n',2);
  fprintf(FIDE,'Natural Coordinates: Internal \n');
  fprintf(FIDE,'end gausspoints \n');
  fprintf(FIDE,'# \n');
  
  % desplazamientos de los nudos
  fprintf(FIDE,'Result "Displacement" "Load Analysis"  1  Scalar OnNodes \n');
  fprintf(FIDE,'ComponentNames "UY"  \n');
  fprintf(FIDE,'Values \n');
  TEM = [1:NNUD;UXY(:,1)'];
  fprintf(FIDE,'%6i %+15.6e \n',TEM);
  fprintf(FIDE,'End Values \n');
  fprintf(FIDE,'# \n');
  
  fprintf(FIDE,'Result "Giro" "Load Analysis"  1  Scalar OnNodes \n');
  fprintf(FIDE,'ComponentNames "Tetha"  \n');
  fprintf(FIDE,'Values \n');
  TEM = [1:NNUD;UXY(:,2)'];
  fprintf(FIDE,'%6i %+15.6e \n',TEM);
  fprintf(FIDE,'End Values \n');
  fprintf(FIDE,'# \n');
  
    % Fuerzas en los nudos
  fprintf(FIDE,'Result "Cortante" "Load Analysis"  1  Scalar OnNodes \n');
  fprintf(FIDE,'ComponentNames "V"  \n');
  fprintf(FIDE,'Values \n');
  TEM = [1:NNUD;FM(:,1)'];
  fprintf(FIDE,'%6i %+15.6e \n',TEM);
  fprintf(FIDE,'End Values \n');
  fprintf(FIDE,'# \n');
  
    fprintf(FIDE,'Result "Momento" "Load Analysis"  1  Scalar OnNodes \n');
  fprintf(FIDE,'ComponentNames "V"  \n');
  fprintf(FIDE,'Values \n');
  TEM = [1:NNUD;FM(:,2)'];
  fprintf(FIDE,'%6i %+15.6e \n ',TEM);
  fprintf(FIDE,'End Values \n');
  fprintf(FIDE,'# \n');
  
%   
%   % esfuerzos en los elementos
%   fprintf(FIDE,'Result "Stress" "Load Analysis" 1 Vector OnGaussPoints "GP" \n');
%   fprintf(FIDE,'ComponentNames "STXX", "STYY", "STXY" \n');
%   fprintf(FIDE,'Values \n');
%   NRES = rows(SRE);
%   JELE = 0;
%   for IRES=1:NRES
%     if SRE(IRES,1)~=JELE
%       fprintf(FIDE,'%6i %+15.6e %+15.6e %+15.6e \n', SRE(IRES,1),SRE(IRES,3:5)');
%     else
%       fprintf(FIDE,'       %+15.6e %+15.6e %+15.6e \n', SRE(IRES,3:5)');
%     end % endif
%     JELE = SRE(IRES,1);
%   end %endfor IRES
%   fprintf(FIDE,'End Values \n');
%   fprintf(FIDE,'# \n');
%   
%   % esfuerzos principales en los elementos
%   fprintf(FIDE,'Result "Principal Stress" "Load Analysis" 1 Vector OnGaussPoints "GP" \n');
%   fprintf(FIDE,'ComponentNames "STP1", "STP2", "STP3" \n');
%   fprintf(FIDE,'Values \n');
%   NRES = rows(SRE);
%   JELE = 0;
%   for IRES=1:NRES
%     if SRE(IRES,1)~=JELE
%       fprintf(FIDE,'%6i %+15.6e %+15.6e %+15.6e \n', SRE(IRES,1),SRE(IRES,6:8)');
%     else
%       fprintf(FIDE,'       %+15.6e %+15.6e %+15.6e \n', SRE(IRES,6:8)');
%     end % endif
%     JELE = SRE(IRES,1);
%   end %endfor IRES
%   fprintf(FIDE,'End Values \n');
%   fprintf(FIDE,'# \n');
% 
%   % deformaciones en los elementos
%   fprintf(FIDE,'Result "Strain" "Load Analysis" 1 Vector OnGaussPoints "GP" \n');
%   fprintf(FIDE,'ComponentNames "EPXX", "EPYY", "EPXY" \n');
%   fprintf(FIDE,'Values \n');
%   NRES = rows(ERE);
%   JELE = 0;
%   for IRES=1:NRES
%     if ERE(IRES,1)~=JELE
%       fprintf(FIDE,'%6i %+15.6e %+15.6e %+15.6e \n', ERE(IRES,1),ERE(IRES,3:5)');
%     else
%       fprintf(FIDE,'       %+15.6e %+15.6e %+15.6e \n', ERE(IRES,3:5)');
%     end % endif
%     JELE = ERE(IRES,1);
%   end %endfor IRES
%   fprintf(FIDE,'End Values \n');
%   fprintf(FIDE,'# \n');
%   
%   % deformaciones principales en los elementos
%   fprintf(FIDE,'Result "Principal Strain" "Load Analysis" 1 Vector OnGaussPoints "GP" \n');
%   fprintf(FIDE,'ComponentNames "EPP1", "EPP2", "EPP3" \n');
%   fprintf(FIDE,'Values \n');
%   NRES = rows(ERE);
%   JELE = 0;
%   for IRES=1:NRES
%     if ERE(IRES,1)~=JELE
%       fprintf(FIDE,'%6i %+15.6e %+15.6e %+15.6e \n', ERE(IRES,1),ERE(IRES,6:8)');
%     else
%       fprintf(FIDE,'       %+15.6e %+15.6e %+15.6e \n', ERE(IRES,6:8)');
%     end % endif
%     JELE = ERE(IRES,1);
%   end %endfor IRES
%   fprintf(FIDE,'End Values \n');
%   fprintf(FIDE,'# \n');
% 
%   % otros resultados en los elementos
%   fprintf(FIDE,'Result "Other results" "Load Analysis" 1 Scalar OnGaussPoints "GP" \n');
%   % STVM: esfuerzo de Von Mises
%   fprintf(FIDE,'ComponentNames "STVM" \n');
%   fprintf(FIDE,'Values \n');
%   NRES = rows(SRE);
%   JELE = 0;
%   for IRES=1:NRES
%     if SRE(IRES,1)~=JELE
%       fprintf(FIDE,'%6i %+15.6e \n', SRE(IRES,1),SRE(IRES,9)');
%     else
%       fprintf(FIDE,'       %+15.6e \n', SRE(IRES,9)');
%     end % endif
%     JELE = SRE(IRES,1);
%   end %endfor IRES
%   fprintf(FIDE,'End Values \n');
%   fprintf(FIDE,'# \n');

  
  status = fclose(FIDE);

end