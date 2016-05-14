
r=[0:0.01:7];

n=[0:0.2:1];

figure;
hold all;
leg='';

for i=1:length(n)
  plot(r,besselj(n(i),r));
  leg=strcat(leg,'J',num2str(n(i)),'(r);');
endfor
grid on;
axis([r(1) r(length(r)) -0.5 1.25]);
legend(strsplit(leg,';'));
xlabel('Abstand r');
ylabel('Normierte Amplitude');
plot(r,zeros(1,length(r)),'--k');
print('-dpng' , 'besselfunction');
close