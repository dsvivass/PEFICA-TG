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
# 
Result "Displacement" "Euler-Bernoulli"  1  Scalar OnNodes 
ComponentNames "UY"  
Values 
     1   -1.741158e-02 
     2   -1.620074e-02 
     3   -1.499251e-02 
     4   -1.378999e-02 
     5   -1.259690e-02 
     6   -1.141748e-02 
     7   -1.025656e-02 
     8   -9.119528e-03 
     9   -8.012355e-03 
    10   -6.941566e-03 
    11   -5.914259e-03 
    12   -4.938099e-03 
    13   -4.021318e-03 
    14   -3.172716e-03 
    15   -2.401662e-03 
    16   -1.718092e-03 
    17   -1.132510e-03 
    18   -6.559860e-04 
    19   -3.001605e-04 
    20   -7.724023e-05 
    21   +0.000000e+00 
End Values 
# 
Result "Giro" "Euler-Bernoulli"  1  Scalar OnNodes 
ComponentNames "Tetha"  
Values 
     1   -4.844961e-03 
     2   -4.840041e-03 
     3   -4.823765e-03 
     4   -4.793862e-03 
     5   -4.748062e-03 
     6   -4.684093e-03 
     7   -4.599685e-03 
     8   -4.492566e-03 
     9   -4.360465e-03 
    10   -4.201111e-03 
    11   -4.012234e-03 
    12   -3.791561e-03 
    13   -3.536822e-03 
    14   -3.245746e-03 
    15   -2.916061e-03 
    16   -2.545497e-03 
    17   -2.131783e-03 
    18   -1.672647e-03 
    19   -1.165819e-03 
    20   -6.090268e-04 
    21   +0.000000e+00 
End Values 
# 
Result "Cortante" "Euler-Bernoulli"  1  Vector OnGaussPoints "GP" 
ComponentNames "V"  
Values 
     1 0.00   +3.000000e+04 
   0.00   +2.979167e+04 
   0.00   +2.958333e+04 
   0.00   +2.937500e+04 
   0.00   +2.916667e+04 
   0.00   +2.895833e+04 
   0.00   +2.875000e+04 
     2 0.00   +2.875000e+04 
   0.00   +2.854167e+04 
   0.00   +2.833333e+04 
   0.00   +2.812500e+04 
   0.00   +2.791667e+04 
   0.00   +2.770833e+04 
   0.00   +2.750000e+04 
     3 0.00   +2.750000e+04 
   0.00   +2.729167e+04 
   0.00   +2.708333e+04 
   0.00   +2.687500e+04 
   0.00   +2.666667e+04 
   0.00   +2.645833e+04 
   0.00   +2.625000e+04 
     4 0.00   +2.625000e+04 
   0.00   +2.604167e+04 
   0.00   +2.583333e+04 
   0.00   +2.562500e+04 
   0.00   +2.541667e+04 
   0.00   +2.520833e+04 
   0.00   +2.500000e+04 
     5 0.00   +2.500000e+04 
   0.00   +2.479167e+04 
   0.00   +2.458333e+04 
   0.00   +2.437500e+04 
   0.00   +2.416667e+04 
   0.00   +2.395833e+04 
   0.00   +2.375000e+04 
     6 0.00   +2.375000e+04 
   0.00   +2.354167e+04 
   0.00   +2.333333e+04 
   0.00   +2.312500e+04 
   0.00   +2.291667e+04 
   0.00   +2.270833e+04 
   0.00   +2.250000e+04 
     7 0.00   +2.250000e+04 
   0.00   +2.229167e+04 
   0.00   +2.208333e+04 
   0.00   +2.187500e+04 
   0.00   +2.166667e+04 
   0.00   +2.145833e+04 
   0.00   +2.125000e+04 
     8 0.00   +2.125000e+04 
   0.00   +2.104167e+04 
   0.00   +2.083333e+04 
   0.00   +2.062500e+04 
   0.00   +2.041667e+04 
   0.00   +2.020833e+04 
   0.00   +2.000000e+04 
     9 0.00   +2.000000e+04 
   0.00   +1.979167e+04 
   0.00   +1.958333e+04 
   0.00   +1.937500e+04 
   0.00   +1.916667e+04 
   0.00   +1.895833e+04 
   0.00   +1.875000e+04 
    10 0.00   +1.875000e+04 
   0.00   +1.854167e+04 
   0.00   +1.833333e+04 
   0.00   +1.812500e+04 
   0.00   +1.791667e+04 
   0.00   +1.770833e+04 
   0.00   +1.750000e+04 
    11 0.00   +1.750000e+04 
   0.00   +1.729167e+04 
   0.00   +1.708333e+04 
   0.00   +1.687500e+04 
   0.00   +1.666667e+04 
   0.00   +1.645833e+04 
   0.00   +1.625000e+04 
    12 0.00   +1.625000e+04 
   0.00   +1.604167e+04 
   0.00   +1.583333e+04 
   0.00   +1.562500e+04 
   0.00   +1.541667e+04 
   0.00   +1.520833e+04 
   0.00   +1.500000e+04 
    13 0.00   +1.500000e+04 
   0.00   +1.479167e+04 
   0.00   +1.458333e+04 
   0.00   +1.437500e+04 
   0.00   +1.416667e+04 
   0.00   +1.395833e+04 
   0.00   +1.375000e+04 
    14 0.00   +1.375000e+04 
   0.00   +1.354167e+04 
   0.00   +1.333333e+04 
   0.00   +1.312500e+04 
   0.00   +1.291667e+04 
   0.00   +1.270833e+04 
   0.00   +1.250000e+04 
    15 0.00   +1.250000e+04 
   0.00   +1.229167e+04 
   0.00   +1.208333e+04 
   0.00   +1.187500e+04 
   0.00   +1.166667e+04 
   0.00   +1.145833e+04 
   0.00   +1.125000e+04 
    16 0.00   +1.125000e+04 
   0.00   +1.104167e+04 
   0.00   +1.083333e+04 
   0.00   +1.062500e+04 
   0.00   +1.041667e+04 
   0.00   +1.020833e+04 
   0.00   +1.000000e+04 
    17 0.00   +1.000000e+04 
   0.00   +9.791667e+03 
   0.00   +9.583333e+03 
   0.00   +9.375000e+03 
   0.00   +9.166667e+03 
   0.00   +8.958333e+03 
   0.00   +8.750000e+03 
    18 0.00   +8.750000e+03 
   0.00   +8.541667e+03 
   0.00   +8.333333e+03 
   0.00   +8.125000e+03 
   0.00   +7.916667e+03 
   0.00   +7.708333e+03 
   0.00   +7.500000e+03 
    19 0.00   +7.500000e+03 
   0.00   +7.291667e+03 
   0.00   +7.083333e+03 
   0.00   +6.875000e+03 
   0.00   +6.666667e+03 
   0.00   +6.458333e+03 
   0.00   +6.250000e+03 
    20 0.00   +6.250000e+03 
   0.00   +6.041667e+03 
   0.00   +5.833333e+03 
   0.00   +5.625000e+03 
   0.00   +5.416667e+03 
   0.00   +5.208333e+03 
   0.00   +5.000000e+03 
End Values 
# 
Result "Momento" "Euler-Bernoulli"  1  Vector OnGaussPoints "GP" 
ComponentNames "M"  
Values 
     1 0.00   -8.750000e+04 0.00
   0.00   -8.625434e+04 0.00 
   0.00   -8.501736e+04 0.00 
   0.00   -8.378906e+04 0.00 
   0.00   -8.256944e+04 0.00 
   0.00   -8.135851e+04 0.00 
   0.00   -8.015625e+04 0.00 
     2 0.00   -8.015625e+04 0.00
   0.00   -7.896267e+04 0.00 
   0.00   -7.777778e+04 0.00 
   0.00   -7.660156e+04 0.00 
   0.00   -7.543403e+04 0.00 
   0.00   -7.427517e+04 0.00 
   0.00   -7.312500e+04 0.00 
     3 0.00   -7.312500e+04 0.00
   0.00   -7.198351e+04 0.00 
   0.00   -7.085069e+04 0.00 
   0.00   -6.972656e+04 0.00 
   0.00   -6.861111e+04 0.00 
   0.00   -6.750434e+04 0.00 
   0.00   -6.640625e+04 0.00 
     4 0.00   -6.640625e+04 0.00
   0.00   -6.531684e+04 0.00 
   0.00   -6.423611e+04 0.00 
   0.00   -6.316406e+04 0.00 
   0.00   -6.210069e+04 0.00 
   0.00   -6.104601e+04 0.00 
   0.00   -6.000000e+04 0.00 
     5 0.00   -6.000000e+04 0.00
   0.00   -5.896267e+04 0.00 
   0.00   -5.793403e+04 0.00 
   0.00   -5.691406e+04 0.00 
   0.00   -5.590278e+04 0.00 
   0.00   -5.490017e+04 0.00 
   0.00   -5.390625e+04 0.00 
     6 0.00   -5.390625e+04 0.00
   0.00   -5.292101e+04 0.00 
   0.00   -5.194444e+04 0.00 
   0.00   -5.097656e+04 0.00 
   0.00   -5.001736e+04 0.00 
   0.00   -4.906684e+04 0.00 
   0.00   -4.812500e+04 0.00 
     7 0.00   -4.812500e+04 0.00
   0.00   -4.719184e+04 0.00 
   0.00   -4.626736e+04 0.00 
   0.00   -4.535156e+04 0.00 
   0.00   -4.444444e+04 0.00 
   0.00   -4.354601e+04 0.00 
   0.00   -4.265625e+04 0.00 
     8 0.00   -4.265625e+04 0.00
   0.00   -4.177517e+04 0.00 
   0.00   -4.090278e+04 0.00 
   0.00   -4.003906e+04 0.00 
   0.00   -3.918403e+04 0.00 
   0.00   -3.833767e+04 0.00 
   0.00   -3.750000e+04 0.00 
     9 0.00   -3.750000e+04 0.00
   0.00   -3.667101e+04 0.00 
   0.00   -3.585069e+04 0.00 
   0.00   -3.503906e+04 0.00 
   0.00   -3.423611e+04 0.00 
   0.00   -3.344184e+04 0.00 
   0.00   -3.265625e+04 0.00 
    10 0.00   -3.265625e+04 0.00
   0.00   -3.187934e+04 0.00 
   0.00   -3.111111e+04 0.00 
   0.00   -3.035156e+04 0.00 
   0.00   -2.960069e+04 0.00 
   0.00   -2.885851e+04 0.00 
   0.00   -2.812500e+04 0.00 
    11 0.00   -2.812500e+04 0.00
   0.00   -2.740017e+04 0.00 
   0.00   -2.668403e+04 0.00 
   0.00   -2.597656e+04 0.00 
   0.00   -2.527778e+04 0.00 
   0.00   -2.458767e+04 0.00 
   0.00   -2.390625e+04 0.00 
    12 0.00   -2.390625e+04 0.00
   0.00   -2.323351e+04 0.00 
   0.00   -2.256944e+04 0.00 
   0.00   -2.191406e+04 0.00 
   0.00   -2.126736e+04 0.00 
   0.00   -2.062934e+04 0.00 
   0.00   -2.000000e+04 0.00 
    13 0.00   -2.000000e+04 0.00
   0.00   -1.937934e+04 0.00 
   0.00   -1.876736e+04 0.00 
   0.00   -1.816406e+04 0.00 
   0.00   -1.756944e+04 0.00 
   0.00   -1.698351e+04 0.00 
   0.00   -1.640625e+04 0.00 
    14 0.00   -1.640625e+04 0.00
   0.00   -1.583767e+04 0.00 
   0.00   -1.527778e+04 0.00 
   0.00   -1.472656e+04 0.00 
   0.00   -1.418403e+04 0.00 
   0.00   -1.365017e+04 0.00 
   0.00   -1.312500e+04 0.00 
    15 0.00   -1.312500e+04 0.00
   0.00   -1.260851e+04 0.00 
   0.00   -1.210069e+04 0.00 
   0.00   -1.160156e+04 0.00 
   0.00   -1.111111e+04 0.00 
   0.00   -1.062934e+04 0.00 
   0.00   -1.015625e+04 0.00 
    16 0.00   -1.015625e+04 0.00
   0.00   -9.691840e+03 0.00 
   0.00   -9.236111e+03 0.00 
   0.00   -8.789062e+03 0.00 
   0.00   -8.350694e+03 0.00 
   0.00   -7.921007e+03 0.00 
   0.00   -7.500000e+03 0.00 
    17 0.00   -7.500000e+03 0.00
   0.00   -7.087674e+03 0.00 
   0.00   -6.684028e+03 0.00 
   0.00   -6.289062e+03 0.00 
   0.00   -5.902778e+03 0.00 
   0.00   -5.525174e+03 0.00 
   0.00   -5.156250e+03 0.00 
    18 0.00   -5.156250e+03 0.00
   0.00   -4.796007e+03 0.00 
   0.00   -4.444444e+03 0.00 
   0.00   -4.101563e+03 0.00 
   0.00   -3.767361e+03 0.00 
   0.00   -3.441840e+03 0.00 
   0.00   -3.125000e+03 0.00 
    19 0.00   -3.125000e+03 0.00
   0.00   -2.816840e+03 0.00 
   0.00   -2.517361e+03 0.00 
   0.00   -2.226562e+03 0.00 
   0.00   -1.944444e+03 0.00 
   0.00   -1.671007e+03 0.00 
   0.00   -1.406250e+03 0.00 
    20 0.00   -1.406250e+03 0.00
   0.00   -1.150174e+03 0.00 
   0.00   -9.027778e+02 0.00 
   0.00   -6.640625e+02 0.00 
   0.00   -4.340278e+02 0.00 
   0.00   -2.126736e+02 0.00 
   0.00   -7.607923e-10 0.00 
End Values 
# 
