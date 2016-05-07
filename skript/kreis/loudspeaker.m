r=[0:0.1:25];

phi=linspace(0,pi/2,90);

scala=5;

m=abs(min(besselj(0,r)));
l=(1+m);

plot(r,besselj(0,r));
hold on;
for i=1:floor(length(r)/scala)
x=r(i*scala).*cos(phi);
y=r(i*scala).*sin(phi);
p=1-(besselj(0,r(i*scala))+m)/l;
plot(x,y,'color',hsv2rgb([1,0,p]));
hold on;
endfor
grid on;
%axis('equal');
