r=[0:0.1:25];

phi=linspace(0,pi/2,90);

scala=5;

m=abs(min(besselj(0,r)));
l=(1+m);

figure;
%plot(r,besselj(0,r));
%hold all;
for t=0:pi/50:2*pi
  for i=1:floor(length(r)/scala)
  x=r(i*scala).*cos(phi);
  y=r(i*scala).*sin(phi);
  p=1-(besselj(0,r(i*scala))+m)/l;
  plot(x,y,'color',[0.5.*(p+1) 0 (1-p)]);
  %p=(2-((0.5*cos(t)+0.5).*besselj(0,r(i*scala))+1))/2;
  %plot(x,y,'color',hsv2rgb([1,0,p]),'lineWidth',2*(2-p));
  hold on;
  grid on;
  axis([0 25 0 25],'square');
  endfor
  drawnow;
  text(20,20,strcat('t=',num2str(t)));
  sleep(0.01);
  hold off;
 endfor
grid on;
%axis('equal');
