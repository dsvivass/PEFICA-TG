function [P]=GAUSS(eps1,eps2,eps3,w1,w2,w3)

P1=[2-3*eps1+eps1^3
   1-eps1-eps1^2+eps1^3
   2+3*eps1-eps1^3
   -1-eps1+eps1^2+eps1^3];
P2=[2-3*eps2+eps2^3
   1-eps2-eps2^2+eps2^3
   2+3*eps2-eps2^3
   -1-eps2+eps2^2+eps2^3];
P3=[2-3*eps3+eps3^3
   1-eps3-eps3^2+eps3^3
   2+3*eps3-eps3^3
   -1-eps3+eps3^2+eps3^3];
P=[w1*P1 w2*P2 w3*P3];
end