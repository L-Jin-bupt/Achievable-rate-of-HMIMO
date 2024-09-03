clc;
clear all;
close all;
d=100;
n0=1;
epsi=10^-3;
f=3*10^9;%Hz
wavelength=3*10^8/f;
k=2*pi/wavelength;
con=1;
R=1;
S=R;
x=0.5:0.1:1.5;
for Pt=x
    N0=2*R/wavelength;
    N0=int64(N0);
    En=energy(R,S,Pt,k,d);
    ach_nor(con)=normalAWGN(R,En,N0,epsi);
    ach_nonnor(con)=nonnormalAWGN(R,En,epsi,N0,n0);
    con=con+1;
end
%% epsi=10^-5
epsi=10^-5;
con=1;
for Pt=x
    N0=2*R/wavelength;
    N0=int64(N0);
    En=energy(R,S,Pt,k,d);
    ach_nor2(con)=normalAWGN(R,En,N0,epsi);
    ach_nonnor2(con)=nonnormalAWGN(R,En,epsi,N0,n0);
    con=con+1;
end
figure
set(0,'DefaultAxesFontName','Times New Roman')
set(0,'DefaultTextFontName','Times New Roman')
plot(x,ach_nor,'-bp',x,ach_nonnor,'-b+',x,ach_nor2,'-ro',x,ach_nonnor2,'-r*','LineWidth',1.5);
xlabel('Square of current {\it P_{T}} / A^{2}');
ylabel('Achievable rate / bps/Hz')
legend('ach-NA \epsilon=10^{-3}','ach-NNA \epsilon=10^{-3}','ach-NA \epsilon=10^{-5}','ach-NNA \epsilon=10^{-5}');
legend('location','northwest');
grid on
hold on
