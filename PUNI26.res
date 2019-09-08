Gid Post Results File 1.0 
### 
# PEFICA-Octave postproceso para GiD 
# 
GaussPoints "GP" Elemtype line 
Number of Gauss Points: 2 
Natural Coordinates: Internal 
end gausspoints 
# 
Result "Displacement" "Load Analysis"  1  Scalar OnNodes 
ComponentNames "UY"  
Values 
     1   +4.163639e-03 
     2   +1.135538e-03 
     3   +0.000000e+00 
End Values 
# 
Result "Giro" "Load Analysis"  1  Scalar OnNodes 
ComponentNames "Tetha"  
Values 
     1   +1.362645e-03 
     2   +9.084302e-04 
     3   +0.000000e+00 
End Values 
# 
Result "Cortante" "Load Analysis"  1  Scalar OnNodes 
ComponentNames "V"  
Values 
     1   -5.000000e+03 
     2   -5.000000e+03 
     3   -9.532597e-12 
End Values 
# 
Result "Momento" "Load Analysis"  1  Scalar OnNodes 
ComponentNames "V"  
Values 
     1   +2.910383e-11 
      2   +1.250000e+04 
      3   +1.250000e+04 
 End Values 
# 
