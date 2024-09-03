clc;
clear all;
close all;
d=70;
n0=1;
epsi=10^-3;
Pt=1;
f=3*10^9;%Hz
wavelength=3*10^8/f;
k=2*pi/wavelength;
con=1;
x=0.6:0.1:1;
for R=x
    S=R;
    N0=2*R/wavelength;
    N0=int64(N0);
    En=energy(R,S,Pt,k,d);
    ach_nor(con)=achnormalAWGN(R,En,N0,epsi);
    ach_nonnor(con)=achnonnormalAWGN(R,En,epsi,N0,n0);
    con_nor(con)=connormalAWGN(R,En,N0,epsi);
    con_nonnor(con)=connonnormalAWGN(R,En,epsi,N0,n0);
    con=con+1;
end
figure
plot(x,ach_nor,'-bp',x,ach_nonnor,'-ro',x,con_nor,'-b',x,con_nonnor,'-r','LineWidth',1.5);
xlabel('The length of antennas L / m');
ylabel('Information rate / bps/Hz')
patch([x,fliplr(x)],[ach_nor,fliplr(con_nor)],'blue');
% alpha(0.01);
patch([x,fliplr(x)],[ach_nonnor,fliplr(con_nonnor)],'red');
alpha(0.1);
% fill([x flip(x)], [f1 flip(f2)], [f2 - f1 flip(f2 - f1)])
legend('ach-NA','ach-NNA','con-NA','con-NNA');
legend('location','best');
grid on
hold on
