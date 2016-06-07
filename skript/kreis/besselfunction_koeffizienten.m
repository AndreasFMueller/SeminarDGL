
r=[0:0.01:10];

n=[0:1:3];

figure("visible", "off");
hold all;
leg='';

for i=1:length(n)
  plot(r,besselj(n(i),r));
  leg=strcat(leg,'$J_{',num2str(n(i)),'}(r)$;');
endfor
grid on;
axis([r(1) r(length(r)) -0.5 1]);
legend(strsplit(leg,';'));
xlabel('Abstand $r$');
ylabel('Normierte Amplitude');
plot(r,zeros(1,length(r)),'--k');
print('-dpdflatexstandalone' , 'besselfunction');
close
