
r=[0:0.01:10];

n=[0:1:3];

h = figure("visible", "off");
%h = figure("visible","on");
hold all;
leg='';

for i=1:length(n)
  plot(r,besselj(n(i),r));
  leg=strcat(leg,'$J_{',num2str(n(i)),'}(r)$;');
endfor
grid on;
axis([r(1) r(length(r)) -0.45 1]);
leg(length(leg)) = ''; %Letztes Semikolon entfernen
h_leg = legend(strsplit(leg,';'),"location",'northeastoutside');
xlabel('Abstand $r$');
ylabel('Normierte Amplitude');
plot(r,zeros(1,length(r)),'--k');
print('-dpdflatexstandalone' , 'besselfunction' , '-F:20');
%close
