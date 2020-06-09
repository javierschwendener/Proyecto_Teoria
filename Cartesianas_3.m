a=1;b=2;
function [X,Y,U,V,Potencial,Campo,Densidad] = serie(a,b,n)
  x = 0:0.05:a;
  y = 0:0.05:b;
  e_0 = 8.84*10^-12;
  [X,Y] = meshgrid(x,y);
  suma = 0;
  m=n;
  for i = 1:n
    for j = 1:m
      k = (i.*pi)./b;
      l = (j.*pi)./a;
      f1 = @(x) (x).*(sin(l.*x));
      f2 = @(y) (y.^2).*(sin(k.*y));
      Gnm = (4/(a.*b)).*(integral(f1,0,a)).*(integral(f2,0,b));
      termnm = Gnm.*(sin(k.*Y)).*(sin(l.*X));
      suma = suma + termnm;
    end
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