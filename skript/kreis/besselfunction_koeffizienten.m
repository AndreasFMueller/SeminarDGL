
r=[0:0.01:4];

n=[0:0.1:1];

figure;
hold all;
leg='';

for i=1:length(n)
  plot(r,besselj(n(i),r));
  leg=strcat(leg,'J',num2str(n(i)),'(r);');
endfor
grid on;
axis([0 4 -0.5 1.25]);
legend(strsplit(leg,';'));
plot(r,zeros(1,length(r)),'--k');
print('-dpng' , 'besselfunction');
close