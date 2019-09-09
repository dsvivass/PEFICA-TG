Gid Post Results File 1.0 
### 
# PEFICA-Octave postproceso para GiD 
# 
GaussPoints "GP" Elemtype line 
Number of Gauss Points: 4 
Nodes included 
Natural Coordinates: Internal 
end gausspoints 
# 
Result "Displacement" "Load Analysis"  1  Scalar OnNodes 
ComponentNames "UY"  
Values 
     1   +0.000000e+00 
     2   -2.124944e-03 
     3   -4.119695e-03 
     4   -5.863775e-03 
     5   -7.248816e-03 
     6   -8.180081e-03 
     7   -8.577970e-03 
     8   -8.468822e-03 
     9   -7.970524e-03 
    10   -7.153424e-03 
    11   -6.092053e-03 
    12   -4.848892e-03 
    13   -3.513537e-03 
    14   -2.215304e-03 
    15   -1.094409e-03 
    16   -3.019679e-04 
    17   +0.000000e+00 
End Values 
# 
Result "Giro" "Load Analysis"  1  Scalar OnNodes 
ComponentNames "Tetha"  
Values 
     1   +4.294321e-03 
     2   +4.161731e-03 
     3   +3.777080e-03 
     4   +3.163081e-03 
     5   +2.345472e-03 
     6   +1.353020e-03 
     7   +2.175198e-04 
     8   -6.307783e-04 
     9   -1.339080e-03 
    10   -1.904594e-03 
    11   -2.313370e-03 
    12   -2.619804e-03 
    13   -2.678509e-03 
    14   -2.467684e-03 
    15   -1.965526e-03 
    16   -1.150232e-03 
    17   +0.000000e+00 
End Values 
# 
Result "Cortante" "Load Analysis"  1  Vector OnGaussPoints "GP" 
ComponentNames "V"  
Values 
     1 0.00   +4.908743e+04 
   0.00   +4.808743e+04 
   0.00   +4.708743e+04 
   0.00   +4.608743e+04 
     2 0.00   +4.608743e+04 
   0.00   +4.508743e+04 
   0.00   +4.408743e+04 
   0.00   +4.308743e+04 
     3 0.00   +4.308743e+04 
   0.00   +4.208743e+04 
   0.00   +4.108743e+04 
   0.00   +4.008743e+04 
     4 0.00   +4.008743e+04 
   0.00   +3.908743e+04 
   0.00   +3.808743e+04 
   0.00   +3.708743e+04 
     5 0.00   +3.708743e+04 
   0.00   +3.608743e+04 
   0.00   +3.508743e+04 
   0.00   +3.408743e+04 
     6 0.00   +3.408743e+04 
   0.00   +3.308743e+04 
   0.00   +3.208743e+04 
   0.00   +3.108743e+04 
     7 0.00   +3.108743e+04 
   0.00   +3.008743e+04 
   0.00   +2.908743e+04 
   0.00   +2.808743e+04 
     8 0.00   +2.808743e+04 
   0.00   +2.708743e+04 
   0.00   +2.608743e+04 
   0.00   +2.508743e+04 
     9 0.00   +2.508743e+04 
   0.00   +2.508743e+04 
   0.00   +2.508743e+04 
   0.00   +2.508743e+04 
    10 0.00   +2.508743e+04 
   0.00   +2.508743e+04 
   0.00   +2.508743e+04 
   0.00   +2.508743e+04 
    11 0.00   -1.491257e+04 
   0.00   -1.650979e+04 
   0.00   -1.810701e+04 
   0.00   -1.970423e+04 
    12 0.00   -1.970423e+04 
   0.00   -2.116257e+04 
   0.00   -2.262090e+04 
   0.00   -2.407923e+04 
    13 0.00   -2.407923e+04 
   0.00   -2.539868e+04 
   0.00   -2.671812e+04 
   0.00   -2.803757e+04 
    14 0.00   -2.803757e+04 
   0.00   -2.921812e+04 
   0.00   -3.039868e+04 
   0.00   -3.157923e+04 
    15 0.00   -3.157923e+04 
   0.00   -3.262090e+04 
   0.00   -3.366257e+04 
   0.00   -3.470423e+04 
    16 0.00   -3.470423e+04 
   0.00   -3.560701e+04 
   0.00   -3.650979e+04 
   0.00   -3.741257e+04 
End Values 
# 
Result "Momento" "Load Analysis"  1  Vector OnGaussPoints "GP" 
ComponentNames "M"  
Values 
     1 0.00   -9.115779e+04 0.00
   0.00   -8.305989e+04 0.00 
   0.00   -7.512865e+04 0.00 
   0.00   -6.736408e+04 0.00 
     2 0.00   -6.736408e+04 0.00
   0.00   -5.976617e+04 0.00 
   0.00   -5.233493e+04 0.00 
   0.00   -4.507036e+04 0.00 
     3 0.00   -4.507036e+04 0.00
   0.00   -3.797246e+04 0.00 
   0.00   -3.104122e+04 0.00 
   0.00   -2.427665e+04 0.00 
     4 0.00   -2.427665e+04 0.00
   0.00   -1.767874e+04 0.00 
   0.00   -1.124750e+04 0.00 
   0.00   -4.982929e+03 0.00 
     5 0.00   -4.982929e+03 0.00
   0.00   +1.114976e+03 0.00 
   0.00   +7.046215e+03 0.00 
   0.00   +1.281079e+04 0.00 
     6 0.00   +1.281079e+04 0.00
   0.00   +1.840869e+04 0.00 
   0.00   +2.383993e+04 0.00 
   0.00   +2.910450e+04 0.00 
     7 0.00   +2.910450e+04 0.00
   0.00   +3.420241e+04 0.00 
   0.00   +3.913365e+04 0.00 
   0.00   +4.389822e+04 0.00 
     8 0.00   +4.389822e+04 0.00
   0.00   +4.849613e+04 0.00 
   0.00   +5.292736e+04 0.00 
   0.00   +5.719194e+04 0.00 
     9 0.00   +5.719194e+04 0.00
   0.00   +6.137317e+04 0.00 
   0.00   +6.555441e+04 0.00 
   0.00   +6.973565e+04 0.00 
    10 0.00   +6.973565e+04 0.00
   0.00   +7.391689e+04 0.00 
   0.00   +7.809813e+04 0.00 
   0.00   +8.227937e+04 0.00 
    11 0.00   +8.227937e+04 0.00
   0.00   +7.966084e+04 0.00 
   0.00   +7.677611e+04 0.00 
   0.00   +7.362517e+04 0.00 
    12 0.00   +7.360086e+04 0.00
   0.00   +7.019530e+04 0.00 
   0.00   +6.654667e+04 0.00 
   0.00   +6.265500e+04 0.00 
    13 0.00   +6.263069e+04 0.00
   0.00   +5.850753e+04 0.00 
   0.00   +5.416446e+04 0.00 
   0.00   +4.960149e+04 0.00 
    14 0.00   +4.957718e+04 0.00
   0.00   +4.480588e+04 0.00 
   0.00   +3.983781e+04 0.00 
   0.00   +3.467298e+04 0.00 
    15 0.00   +3.464868e+04 0.00
   0.00   +2.929867e+04 0.00 
   0.00   +2.377504e+04 0.00 
   0.00   +1.807781e+04 0.00 
    16 0.00   +1.805351e+04 0.00
   0.00   +1.219424e+04 0.00 
   0.00   +6.184502e+03 0.00 
   0.00   +2.430556e+01 0.00 
End Values 
# 
