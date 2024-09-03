function app= norapp(epsi,En,N0)
SNR=En/N0;
A=N0*log2(1+SNR)/2;
V=SNR/2*(2+SNR)/(1+SNR)^2*(log2(exp(1)))^2;
B=sqrt(N0*V)*qfuncinv(epsi);
% norminv(epsi, 0, 1);
app=A-B;