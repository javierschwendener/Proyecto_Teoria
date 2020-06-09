clc
clear all
Rad=4;
n=3;
k=3;
b=5;
e_0 = 8.84*10^-12;
phi = linspace(0,2*pi);
r = linspace(0,10,10);
theta = linspace(0,2*pi,60);
[theta,phi,r] = meshgrid(theta,phi,r);
[x,y,z] = sph2cart(theta,phi,r);
r = (sqrt((x.^2).+(y.^2).+(z.^2)));
theta = atan(((x.^2+y.^2).^(1/2))./z);
Vin = (-1)*(((Rad.^3))./(e_0.*r.^.5)).+((24.*(Rad.^5))./(15.*(r.^5))).*(((5*(cos(theta)).^2)-3)./2).+(100*cos(theta)./r.^2);
Vout = (-1)*(((Rad.^3))./(e_0.*r)).+((4.*(Rad.^5))./(15.*(r.^5))).*(((5*(cos(theta)).^2)-3)./2);

Vbw = (cos(theta)).+ (-3)*(b.*k)./(2.*e_0).+((4.*(r.^2))/(30*e_0.*(b.^2))).*(((3*(cos(theta)).^2)-1)/2);
[U1,V1] = gradient(-Vin);
Densidad1 = e_0.*divergence(U1,V1,r);
[U2,V2] = gradient(-Vout);
Densidad2 = e_0.*divergence(U2,V2,r);
[U3,V3] = gradient(-Vbw);
Densidad3 = e_0.*divergence(U2,V2,r);

figure("name","Potencial y campo electrico","NumberTitle","off")
subplot(2,2,3)
quiver3(x,y,z,U1,V1,Vin)
title("E a b")
xlabel("Eje x")
ylabel("Eje y")
zlabel("Campo electrico")


clc
clear all
Rad=10;
r = linspace(0,10,10);
phi = linspace(0,2*pi,50);
theta = linspace(0,pi,50);
e_0 = 8.84*10^-12;
Vin = @(r,theta) (-1)*(((Rad.^3))./(e_0.*r.^.5)).+((24.*(Rad.^5))./(15.*(r.^5))).*(((5*(cos(theta)).^2)-3)./2).+(100*cos(theta)./r.^2);
[R,P] = meshgrid(r,phi);
[X,Y] = pol2cart(P,R);
Z=X;

subplot(2,2,1)
surf(X,Y,Vin(R,P))
title("V a b")
xlabel("Eje x")
ylabel("Eje y")
zlabel("Potencial electrico")


