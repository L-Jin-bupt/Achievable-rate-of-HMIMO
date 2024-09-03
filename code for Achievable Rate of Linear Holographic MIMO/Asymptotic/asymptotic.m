clc;
clear all;
close all;
d=100;
n0=1;
epsi=10^-3;
Pt=1;
f=3.5*10^9;%Hz
wavelength=3*10^8/f;
k=2*pi/wavelength;
con=1;
x=5:20:505;
for R=x
    S=R;
    N0(con)=2*R/wavelength;
    En(con)=energy(R,S,Pt,k,d);
    [re1,re2]=achlargen(En(con),N0(con),epsi);
    r1(con)=re1;
    r2(con)=re2;
    ach_nor(con)=re1/R;
    converse(con)=re2/R;
    cap(con)= capacity(En(con),N0(con))/R;
    Rapp(con)=norapp(epsi,En(con),N0(con))/R;
    con=con+1;
end
figure
plot(x,converse,'-kd',x,ach_nor,'-bp',x,Rapp,'-ro',x,cap,'-g*','LineWidth',1.5);
xlim([x(1) x(end)]);
set(gca,'XTick',x);
xlabel('The aperture-length of antennas {\it L} / m');
ylabel('Space efficiency / bps/Hz/m')
legend('Converse','Achiveblility','Normal approximation','Asymptotic');
legend('location','southeast');
grid on
hold on
