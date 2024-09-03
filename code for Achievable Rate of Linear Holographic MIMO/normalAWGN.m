function [ach,converse]= normalAWGN(R,En,N0,epsi)
[n,lambda]=DoF(N0);
P=En/n;%Watt
sigmaY=sqrt(1+P);
v=n/P;
gammatemp=ncx2inv(1-epsi,n,v);
t=n*(1+P)-P*gammatemp;
gamma =  t * log2(exp(1)) / (2  + 2*P) + n/2 *log2 (1 + P);
qq0=(n*(1+P)-t)/(P*(1+P));
beta1=ncx2cdf(qq0,n,n*(1+1/P));
converse=-log2(beta1);
i=1;
taus = linspace(0,1,30).*epsi; 
taus = taus(3:end-2);
for tau=taus
    ka=kappa(tau,n,P);
    gammatemp=ncx2inv(1-epsi+tau,n,v);
    t=n*(1+P)-P*gammatemp;
    gamma =  t * log2(exp(1)) / (2  + 2*P) + n/2 *log2 (1 + P);
    qq0=(n*(1+P)-t)/(P*(1+P));
    beta=ncx2cdf(qq0,n,n*(1+1/P));
    con(i)=ka/beta;
    i=i+1;
end
con1=max(con);
ach=log2(con1);
end
