b=3;a=2;k=2;q=4;e_0 = 8.84*10^-12;
theta = linspace(0,2*pi);
phi = linspace (-pi/2,pi/2);
[T,P]= meshgrid(theta,phi);
r=4;
[x,y,z]=sph2cart(T,P,r);
sigma = e_0 .* (-(b*k*a)./e_0.*r.^2)+((2*k.*(cos(T-1)).^3).*(2.*r.^5+3.*a.^5)./(5*b*e_0.*r.^4))-(a*q./(r.^2));
figure("name","Densidad","NumberTitle","off")
surf(x,y,z,sigma)
title("Mapa de color de la densidad en la esfera de radio a")
xlabel("Eje x")
ylabel("Eje y")
zlabel("Eje z")

