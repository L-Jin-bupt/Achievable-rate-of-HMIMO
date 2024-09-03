function cap= capacity(En,N0)
SNR=En/N0;
cap=N0*log2(1+SNR)/2;