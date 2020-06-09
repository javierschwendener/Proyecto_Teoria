a=3;b=3;
function [X,Y,U,V,Potencial,Campo,Densidad] = serie(a,b,n)
  x = 0:0.05:a;
  y = 0:0.05:b;
  e_0 = 8.84*10^-12;
  [X,Y] = meshgrid(x,y);
  suma = 0;
  for i = 1:n
    k = (i.*pi)./b;
    f = @(y) (2./b).*(2.*y.^3.+5).*(sin(k.*y));
    Fn = integral(f,0,b);
    termn = Fn .* cosh(k.*X).*sin(k.*Y);
    suma = suma .+ termn;
  end
  Potencial = suma;
  Campo = gradient((-1).*Potencial);
  [U,V] = gradient((-1).*Potencial);
  Densidad = e_0 .* divergence(U,V);
endfunction
figure("name","Potencial electrico","NumberTitle","off")
[X,Y,U,V,Potencial,Campo,Densidad] = serie(a,b,2);
subplot(2,2,1)
surf(X,Y,Potencial)
title("Con n=2")
xlabel("Eje x")
ylabel("Eje y")
zlabel("Potencial electrico")

[X,Y,U,V,Potencial,Campo,Densidad] = serie(a,b,5);
subplot(2,2,2)
surf(X,Y,Potencial)
title("Con n=5")
xlabel("Eje x")
ylabel("Eje y")
zlabel("Potencial electrico")

[X,Y,U,V,Potencial,Campo,Densidad] = serie(a,b,10);
subplot(2,2,3)
surf(X,Y,Potencial)
title("Con n=10")
xlabel("Eje x")
ylabel("Eje y")
zlabel("Potencial electrico")

[X,Y,U,V,Potencial,Campo,Densidad] = serie(a,b,20);
subplot(2,2,4)
surf(X,Y,Potencial)
title("Con n=20")
xlabel("Eje x")
ylabel("Eje y")
zlabel("Potencial electrico")

figure("name","Campo electrico","NumberTitle","off")
[X,Y,U,V,Potencial,Campo,Densidad] = serie(a,b,2);
subplot(2,2,1)
Z=X;
quiver3(X,Y,Z,U,V,Z)
title("Con n=2")
xlabel("Eje x")
ylabel("Eje y")
zlabel("Campo electrico")

[X,Y,U,V,Potencial,Campo,Densidad] = serie(a,b,5);
subplot(2,2,2)
Z=X;
quiver3(X,Y,Z,U,V,Z)
title("Con n=5")
xlabel("Eje x")
ylabel("Eje y")
zlabel("Campo electrico")

[X,Y,U,V,Potencial,Campo,Densidad] = serie(a,b,10);
subplot(2,2,3)
Z=X;
quiver3(X,Y,Z,U,V,Z)
title("Con n=10")
xlabel("Eje x")
ylabel("Eje y")
zlabel("Campo electrico")

[X,Y,U,V,Potencial,Campo,Densidad] = serie(a,b,20);
subplot(2,2,4)
Z=X;
quiver3(X,Y,Z,U,V,Z)
title("Con n=20")
xlabel("Eje x")
ylabel("Eje y")
zlabel("Campo electrico")

figure("name","Densidad","NumberTitle","off")
[X,Y,U,V,Potencial,Campo,Densidad] = serie(a,b,2);
subplot(2,2,1)
surf(X,Y,Densidad)
title("Con n=2")
xlabel("Eje x")
ylabel("Eje y")
zlabel("Densidad")

[X,Y,U,V,Potencial,Campo,Densidad] = serie(a,b,5);
subplot(2,2,2)
surf(X,Y,Densidad)
title("Con n=5")
xlabel("Eje x")
ylabel("Eje y")
zlabel("Densidad")

[X,Y,U,V,Potencial,Campo,Densidad] = serie(a,b,10);
subplot(2,2,3)
surf(X,Y,Densidad)
title("Con n=10")
xlabel("Eje x")
ylabel("Eje y")
zlabel("Densidad")

[X,Y,U,V,Potencial,Campo,Densidad] = serie(a,b,20);
subplot(2,2,4)
surf(X,Y,Densidad)
title("Con n=20")
xlabel("Eje x")
ylabel("Eje y")
zlabel("Densidad")