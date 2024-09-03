function [N,lambda]=DoF(N0)
[phi,lambda]=dpss(2*N0,N0/2,2*N0);
N=sum(sum(lambda>10^-3));
lambda=lambda(1:N);
end