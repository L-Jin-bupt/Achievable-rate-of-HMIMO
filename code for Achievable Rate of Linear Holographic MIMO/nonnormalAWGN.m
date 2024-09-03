function [ach,converse]= nonnormalAWGN(R,En,epsi,N0,n0)%n0 refers to the AWGN PSD
[n,lambda]=DoF(N0);
P=En/(sum(lambda));
sigma=ones(n,1);
for i=1:n
    sigma(i)=sqrt(n0/lambda(i));
end
sigmaY=sqrt(1+P);
t1=0;t2=0;
for i=1:n
   t1=t1+log2(sigmaY/sigma(i));
end
for i=1:n
    t2=t2+P/(sigma(i)^2-sigmaY^2);
end
t=t1-t2*log2(exp(1))/2;
w1=zeros(n,1);lambda1=zeros(n,1);w2=zeros(n,1);lambda2=zeros(n,1);I=ones(n,1);
for i=1:n
    w1(i)=(sigma(i)^2-sigmaY^2)/sigmaY^2;
    lambda1(i)=sigma(i)^2*P/(sigma(i)^2-sigmaY^2)^2;
    w2(i)=(sigma(i)^2-sigmaY^2)/sigma(i)^2;
    lambda2(i)=sigmaY^2*P/(sigma(i)^2-sigmaY^2)^2;
end 
%% 开始计算 method 0
temp=gx2inv(epsi,w1.',I.',lambda1.',0,0);
gamma=temp*log2(exp(1))/2+t;
beta1=gx2cdf(temp,w2.',I.',lambda2.',0,0,'upper');%gx2cdf(,..,'upper')=1-gx2cdf(,...,)
converse=-log2(beta1);

i=1;
taus = linspace(0,1,30).*epsi; 
taus = taus(3:end-2);
for tau=taus
    ka=kappa(tau,n,P);
   temp=gx2inv(epsi-tau,w1.',I.',lambda1.',0,0);
    gamma=temp*log2(exp(1))/2+t;
    beta=gx2cdf(temp,w2.',I.',lambda2.',0,0,'upper');
    con(i)=ka/beta;
    i=i+1;
end
con1=max(con);
ach=log2(con1);
end
