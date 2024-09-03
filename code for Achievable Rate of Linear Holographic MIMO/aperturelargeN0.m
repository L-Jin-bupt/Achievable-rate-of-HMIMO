clc;
clear all;
close all;
d=100;
n0=1;
epsi=10^-3;
Pt=0.045;
f=10*10^9;%Hz
wavelength=3*10^8/f;
k=2*pi/wavelength;
con=1;
x=0.5:0.1:1.1;
for R=x
    S=R;
    N0=2*R/wavelength;
    N0=int64(N0);
    En=energy(R,S,Pt,k,d);
    [ach,converse]=normalAWGN(R,En,N0,epsi);
    ach_nor(con)=ach;
    con_nor(con)=converse;
    se_ach_nor(con)=ach/R;
    se_con_nor(con)=converse/R;
    [ach1,conv1]=nonnormalAWGN(R,En,epsi,N0,n0);
    ach_nonnor(con)=ach1;
    con_nonnor(con)=conv1;
    se_ach_nonnor(con)=ach1/R;
    se_con_nonnor(con)=conv1/R;
    con=con+1;
end
figure;
set(0,'DefaultAxesFontName','Times New Roman')
set(0,'DefaultTextFontName','Times New Roman')
plot(x,ach_nor,'-bp',x,ach_nonnor,'-ro',x,con_nor,'-b*',x,con_nonnor,'-r+','LineWidth',1.5);
xlabel('The aperture-length of antennas {\it L} / m');
ylabel('Information rate / bps/Hz')
patch([x,fliplr(x)],[ach_nor,fliplr(con_nor)],'blue');
patch([x,fliplr(x)],[ach_nonnor,fliplr(con_nonnor)],'red');
alpha(0.1);
xlim([0.5 1.1]);
legend('ach-NA','ach-NNA','con-NA','con-NNA');
legend('location','best');
grid on;

figure;
set(0,'DefaultAxesFontName','Times New Roman')
set(0,'DefaultTextFontName','Times New Roman')
plot(x,se_ach_nor,'-bp',x,se_ach_nonnor,'-ro',x,se_con_nor,'-b*',x,se_con_nonnor,'-r+','LineWidth',1.5);
xlabel('The aperture-length of antennas {\it L} / m');
ylabel('Space efficiency / bps/Hz/m')
patch([x,fliplr(x)],[se_ach_nor,fliplr(se_con_nor)],'blue');
patch([x,fliplr(x)],[se_ach_nonnor,fliplr(se_con_nonnor)],'red');
alpha(0.1);
xlim([0.5 1.1]);
legend('ach-NA','ach-NNA','con-NA','con-NNA');
legend('location','best');
grid on;