clc
clear all
Rad=4;
e_0 = 8.84*10^-12;
phi = linspace(0,2*pi);
r = linspace(0,10,10);
theta = linspace(0,2*pi,60);
[theta,phi,r] = meshgrid(theta,phi,r);
[x,y,z] = sph2cart(theta,phi,r);
r = (sqrt((x.^2).+(y.^2).+(z.^2)));
theta = atan(((x.^2+y.^2).^(1/2))./z);
Vin = (-1)*(r.*cos(theta)).+((34.*(r.^3))/(25*e_0.*(Rad.^2))).*(((5*(cos(theta)).^3)-3*cos(theta))/2);
Vout = (-1)*(((Rad.^3).*cos(theta))./(e_0.*r.^2)).+((34.*(Rad.^5))./(25.*(r.^4))).*(((5*(cos(theta)).^3)-3*cos(theta))./2);
[U1,V1] = gradient(-Vin);
[U2,V2] = gradient(-Vout);

figure("name","Potencial y campo electrico","NumberTitle","off")
subplot(2,2,3)
quiver3(x,y,z,U1,V1,Vin)
title("Ein")
xlabel("Eje x")
ylabel("Eje y")
zlabel("Campo electrico")

subplot(2,2,4)
quiver3(x,y,z,U2,V2,Vout)
title("Eout")
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
Vin = @(r,theta) (-1)*(r.*cos(theta)).+((34.*(r.^3))/(25*e_0.*(Rad.^2))).*(((5*(cos(theta)).^3)-3*cos(theta))/2);
[R,P] = meshgrid(r,phi);
[X,Y] = pol2cart(P,R);
Z=X;

subplot(2,2,1)
surf(X,Y,Vin(R,P))
title("Vin")
xlabel("Eje x")
ylabel("Eje y")
zlabel("Potencial electrico")

Vout = @(r,theta) (-1)*(((Rad.^3).*cos(theta))./(e_0.*r.^2)).+((34.*(Rad.^5))./(25.*(r.^4))).*(((5*(cos(theta)).^3)-3*cos(theta))./2);
subplot(2,2,2)
surf(X,Y,Vout(R,P))
title("Vout")
xlabel("Eje x")
ylabel("Eje y")
zlabel("Potencial electrico")