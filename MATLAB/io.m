a = [1 0];
b = [1 5];
lengthd = length(d);
d(lengthd) = d(lengthd) - 10098;
c = [1 10];
d = conv(a,b);
e = conv(d,c);
g = roots(d)

%-----%

fprintf(' math formula V = (pi/3)*(R^2 -  h^2)(r+h) \n V = (pi/3)(-h^3 - RH^2 + R^2h + R^3)');
R = 9;
V = 500;
H = (9: -.2 : -9);
fprintf(' part a');
polynomialVolume = [ (-1) (-R) (R^2) (R^3)];
VolumeHeight = polyval(polynomialVolume,H) * ( pi / 3);
fprintf(VolumeHeight);
fprintf('part b');
plot(H,VolumeHeight)
ylabel(' height in inches')
ylabel('Volume in cubic inches')
fprintf('part c')
500VolumeHeight = [ -1 -R R^2 R^3 -3*V/pi];
500Height = roots(500VolumeHeight)
fprintf( ' part d');
Vpd = polyder(polynomialVolume);
rVmax = roots(Vpd)
Vmax = polyval(polynomialVolume,rVmax(2))*pi/3

%-- 21 --%
t=[1:6];
NB = [2 4.5 7.5 15 31 64]*1000;
p=polyfit(t,log(NB),1);
m=p(1)
b=exp(p(2))
tp=linspace(1,6,100);
F=@ (x) b*exp(m*x);
NBp=F(tp);
plot(t,NB,'o',tp,NBp)
xlabel('t (hr)')
ylabel('NB')
legend('Data','Model',0)
NB45=F(4.5)

%-- 24 d --%
x=[1 2.2 3.7 6.4 9 11.5 14.2
17.8 20.5 23.2];
y=[12 9 6.6 5.5 7.2 9.2 9.6 8.5
6.5 2.2];
p1=polyfit(x,y,5);
xplot=linspace(0,24,100);
yplot=polyval(p1,xplot);
plot(x,y,'ok',xplot,yplot,'k',
'linewidth',2,'markersize',8)
xlabel('x','fontsize',18)
ylabel('y','fontsize',18)
-- % 28 c --
v=[5:10:75];
FE = [11 22 28 29.5 30 30 27 23];
xp=linspace(5,75,100);
ypL=interp1(v,FE,xp,'linear');
ypS=interp1(v,FE,xp,'spline');
plot(v,FE,'o',xp,ypL,':',xp,ypS)
xlabel('Year')
xlabel('v (mi/h)')
ylabel('FE (mpg)')
legend('Data','Linear','Spline',0)
FE60L=interp1(v,FE,60,'linear')
FE60S=interp1(v,FE,60,'spline')
%--2--%
F=@ (x) 2*cos(x)-0.5*sqrt(x)-1;
fplot(F,[0 5])
xlabel('x')
ylabel('y')
r=fzero(F,3)
%--10--%
V=250;
R1=2:0.1:5;
R2=2*R1;
h=3*V./(pi*(R1.^2+R2.^2+R1.*R2));
S=pi*(R1+R2).*sqrt((R2-R1).^2+h.^2)+pi*R1.^2;
plot(R1,S)
xlabel('R1 (cm)')
ylabel('Surface Area (cm^3)')
SUR=@ (x) pi*(x+2*x)*sqrt((2*x-x)^2+(3*V/
(pi*(x^2+(2*x).^2+x.*2*x))).^2)+pi*x.^2;
R1min=fminbnd(SUR,1,5)
R2min=2*R1min
H=3*V./(pi*(R1min.^2+R2min.^2+R1min.*R2min))
%--13--%
F=@ (x) x.*sqrt(5^2*(1-x.^2/19^2));
Fneg=@ (x) -x.*sqrt(5^2*(1-x.^2/19^2));
x=0.1:0.2:18.9;
Ap=2*F(x);
plot(x,Ap)
xlabel('x (in.)')
ylabel('Area (in.^2)')
[xAmax]=fminbnd(Fneg,12,16);
aAmax=2*xAmax
bAmax=2*sqrt(5^2*(1-xAmax.^2/19^2))
%-22-%
clear, clc
t=linspace(0,2*pi,100);
b=5;
x=2*b*cos(t)-b*cos(2*t);
y=2*b*sin(t)-b*sin(2*t);
plot (x,y)
axis square
xd=-2*b*sin(t)+2*b*sin(2*t);
yd=2*b*cos(t)-2*b*sin(2*t);
F= @ (x) sqrt((-2*b*sin(x)+2*b*sin(2*x)).^2+(2*b*cos(x)-
2*b*sin(2*x)).^2);
L=quadl(F,0,2*pi)
%--30--%






