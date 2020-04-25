Gid Post Results File 1.0 
### 
# PEFICA-Octave postproceso para GiD 
# 
GaussPoints "GP" Elemtype line 
Number of Gauss Points: 7 
Nodes included 
Natural Coordinates: Internal 
end gausspoints 
# 
Result "Desplazamiento" "Euler-Bernoulli"  1  Vector OnGaussPoints "GP" 
ComponentNames "U_y"  
Values 
     1 0.00   +0.000000e+00 
   0.00   -2.474776e-04 
   0.00   -8.636628e-04 
   0.00   -1.659184e-03 
   0.00   -2.444671e-03 
   0.00   -3.030750e-03 
   0.00   -3.228052e-03 
     2 0.00   -3.228052e-03 
   0.00   -3.085298e-03 
   0.00   -2.753025e-03 
   0.00   -2.254797e-03 
   0.00   -1.614174e-03 
   0.00   -8.547211e-04 
   0.00   +0.000000e+00 
End Values 
# 
Result "Giro" "Euler-Bernoulli"  1  Vector OnGaussPoints "GP" 
ComponentNames "Tetha_z"  
Values 
     1 0.00   +0.000000e+00 
   0.00   -9.267866e-04 
   0.00   -1.474830e-03 
   0.00   -1.644132e-03 
   0.00   -1.434690e-03 
   0.00   -8.465056e-04 
   0.00   +1.204215e-04 
     2 0.00   +1.204215e-04 
   0.00   +7.243217e-04 
   0.00   +1.257534e-03 
   0.00   +1.720058e-03 
   0.00   +2.111894e-03 
   0.00   +2.433043e-03 
   0.00   +2.683503e-03 
End Values 
# 
Result "Cortante" "Euler-Bernoulli"  1  Vector OnGaussPoints "GP" 
ComponentNames "V_y"  
Values 
     1 0.00   +8.691500e+04
   0.00   +7.591500e+04
   0.00   +6.491500e+04
   0.00   +5.391500e+04
   0.00   +4.291500e+04
   0.00   +3.191500e+04
   0.00   +2.091500e+04
     2 0.00   -1.408500e+04
   0.00   -1.641833e+04
   0.00   -1.875167e+04
   0.00   -2.108500e+04
   0.00   -2.341833e+04
   0.00   -2.575167e+04
   0.00   -2.808500e+04
End Values 
# 
Result "Momento" "Euler-Bernoulli"  1  Vector OnGaussPoints "GP" 
ComponentNames "M_z"  
Values 
     1 0.00   -9.374167e+04 
   0.00   -5.303417e+04 
   0.00   -1.782667e+04 
   0.00   +1.188083e+04 
   0.00   +3.608833e+04 
   0.00   +5.479583e+04 
   0.00   +6.800333e+04 
     2 0.00   +6.350333e+04 
   0.00   +5.841944e+04 
   0.00   +5.255778e+04 
   0.00   +4.591833e+04 
   0.00   +3.850111e+04 
   0.00   +3.030611e+04 
   0.00   +2.133333e+04 
End Values 
Result "Desplazamiento" "Timoshenko_1PG"  1  Vector OnGaussPoints "GP" 
ComponentNames "U_y"  
Values 
     1 0.00   +0.000000e+00 
   0.00   -2.018188e-04 
   0.00   -4.036376e-04 
   0.00   -6.054563e-04 
   0.00   -8.072751e-04 
   0.00   -1.009094e-03 
   0.00   -1.210913e-03 
     2 0.00   -1.210913e-03 
   0.00   -1.009094e-03 
   0.00   -8.072751e-04 
   0.00   -6.054563e-04 
   0.00   -4.036376e-04 
   0.00   -2.018188e-04 
   0.00   +0.000000e+00 
End Values 
# 
Result "Giro" "Timoshenko_1PG"  1  Vector OnGaussPoints "GP" 
ComponentNames "Tetha_z"  
Values 
     1 0.00   +0.000000e+00 
   0.00   -1.627723e-04 
   0.00   -3.067270e-04 
   0.00   -4.318640e-04 
   0.00   -5.381834e-04 
   0.00   -6.256851e-04 
   0.00   -6.943692e-04 
     2 0.00   -6.943692e-04 
   0.00   -2.477589e-04 
   0.00   +1.899613e-04 
   0.00   +6.187915e-04 
   0.00   +1.038732e-03 
   0.00   +1.449781e-03 
   0.00   +1.851941e-03 
End Values 
# 
Result "Cortante" "Timoshenko_1PG"  1  Vector OnGaussPoints "GP" 
ComponentNames "V_y"  
Values 
     1 0.00   +8.487012e+04
   0.00   +7.387012e+04
   0.00   +6.287012e+04
   0.00   +5.187012e+04
   0.00   +4.087012e+04
   0.00   +2.987012e+04
   0.00   +1.887012e+04
     2 0.00   -1.612988e+04
   0.00   -1.846321e+04
   0.00   -2.079654e+04
   0.00   -2.312988e+04
   0.00   -2.546321e+04
   0.00   -2.779654e+04
   0.00   -3.012988e+04
End Values 
# 
Result "Momento" "Timoshenko_1PG"  1  Vector OnGaussPoints "GP" 
ComponentNames "M_z"  
Values 
     1 0.00   -8.351729e+04 
   0.00   -4.383222e+04 
   0.00   -9.647163e+03 
   0.00   +1.903790e+04 
   0.00   +4.222296e+04 
   0.00   +5.990802e+04 
   0.00   +7.209309e+04 
     2 0.00   +6.759309e+04 
   0.00   +6.182757e+04 
   0.00   +5.528428e+04 
   0.00   +4.796321e+04 
   0.00   +3.986436e+04 
   0.00   +3.098774e+04 
   0.00   +2.133333e+04 
End Values 
Result "Desplazamiento" "Timoshenko_2PG"  1  Vector OnGaussPoints "GP" 
ComponentNames "U_y"  
Values 
     1 0.00   +0.000000e+00 
   0.00   -3.867180e-05 
   0.00   -7.734360e-05 
   0.00   -1.160154e-04 
   0.00   -1.546872e-04 
   0.00   -1.933590e-04 
   0.00   -2.320308e-04 
     2 0.00   -2.320308e-04 
   0.00   -1.933590e-04 
   0.00   -1.546872e-04 
   0.00   -1.160154e-04 
   0.00   -7.734360e-05 
   0.00   -3.867180e-05 
   0.00   +0.000000e+00 
End Values 
# 
Result "Giro" "Timoshenko_2PG"  1  Vector OnGaussPoints "GP" 
ComponentNames "Tetha_z"  
Values 
     1 0.00   +0.000000e+00 
   0.00   -5.426335e-05 
   0.00   -8.953860e-05 
   0.00   -1.058257e-04 
   0.00   -1.031248e-04 
   0.00   -8.143574e-05 
   0.00   -4.075858e-05 
     2 0.00   -4.075858e-05 
   0.00   +2.457885e-05 
   0.00   +8.119666e-05 
   0.00   +1.290948e-04 
   0.00   +1.682734e-04 
   0.00   +1.987323e-04 
   0.00   +2.204716e-04 
End Values 
# 
Result "Cortante" "Timoshenko_2PG"  1  Vector OnGaussPoints "GP" 
ComponentNames "V_y"  
Values 
     1 0.00   +8.532640e+04
   0.00   +7.432640e+04
   0.00   +6.332640e+04
   0.00   +5.232640e+04
   0.00   +4.132640e+04
   0.00   +3.032640e+04
   0.00   +1.932640e+04
     2 0.00   -1.567360e+04
   0.00   -1.800693e+04
   0.00   -2.034026e+04
   0.00   -2.267360e+04
   0.00   -2.500693e+04
   0.00   -2.734026e+04
   0.00   -2.967360e+04
End Values 
# 
Result "Momento" "Timoshenko_2PG"  1  Vector OnGaussPoints "GP" 
ComponentNames "M_z"  
Values 
     1 0.00   -8.579868e+04 
   0.00   -4.588548e+04 
   0.00   -1.147228e+04 
   0.00   +1.744092e+04 
   0.00   +4.085413e+04 
   0.00   +5.876733e+04 
   0.00   +7.118053e+04 
     2 0.00   +6.668053e+04 
   0.00   +6.106711e+04 
   0.00   +5.467591e+04 
   0.00   +4.750693e+04 
   0.00   +3.956018e+04 
   0.00   +3.083564e+04 
   0.00   +2.133333e+04 
End Values 
