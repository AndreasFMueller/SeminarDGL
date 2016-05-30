r=[0:0.1:25];
t=[0:pi/5:2*pi];

figure;

for i=1:length(t)
   for k=1:i
      line(t(i-k+1),(t(k)+1).*r,cos(t(i-k+1)).*(t(k)+1).*besselj(0,r)+t(k),'color',hsv2rgb([1,0,k/(i+k)]));
      hold off;
%      hold on;
%      grid on;
   endfor
%   hold off;
%   drawnow;
%   sleep(1);
endfor