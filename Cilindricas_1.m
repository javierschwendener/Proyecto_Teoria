R=3;E0=(-1).*(8.854187817*10.^(-12));

t=linspace(0,2.*pi);
r=linspace(1,5);
[T,P]=meshgrid(t,r);
Potencial=E0.*P.*cos(T).*(((R./P).^2)-1);
[x,y,Z]=pol2cart(T,P,Potencial);

figure("name","Potencial electrico","NumberTitle","off")
surf(x,y,Z)
xlabel("Eje x")
ylabel("Eje y")
zlabel("Potencial electrico")
