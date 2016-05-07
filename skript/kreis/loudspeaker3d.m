x=[-25:0.1:25];
y=[-25:0.1:25]';
%z=sqrt(x.^2+y.^2);
r=[0:0.1:25];
%scala=5;
%m=abs(min(besselj(0,r)));

%[xt,yt,zt] = sphere();
%xa = abs(xt);
%ya = abs(yt);
%za = abs(zt);

%mesh(x,y,besselj(0,z));
%hold all;

%for i=1:floor(length(r)/scala)
%  p=1-(besselj(0,r(i*scala))+m);
%  plot3(r(i*scala).*xa,r(i*scala).*ya,r(i*scala).*za,'--k','lineWidth',5*p);
%endfor

for t=0:1:10
  hold off;
  z=sqrt(x.^2+y.^2+t.^2);
  surface(x,y,besselj(0,z));
  text(0,0,-1,num2str(t));
  grid on;
  view([0,0,0]);
  drawnow;
  sleep(t(1));
endfor