tic()

help_message = { "Use the following parameters to configure the output:",
"\t-din",
"\t\tSet the input data file to load.",
"\t-dout",
"\t\tSet the output file to print to. (.esp format, default: wave.eps)",
"\t-kmax",
"\t\tPath for the different k_max wave file. (Format: path/kmax-num.dat)",
"\t-n4",
"\t\tPath for the 2-grade and 4-grade comparsion.",
"\t-fontsize",
"\t\tSet the font size to be used with the plot",
"\t-h",
"\t\tShow this help message." };

file_loaded = false;

filename = 'wave.eps';
kmaxpath = '';
n4path = '';

fontsize = 12;

arglist = argv();

for i = (1:nargin)
	switch (arglist(i){1})
	case "-din"
		load(arglist(++i){1});
		file_loaded = true;
	case "-fout"
		filename = arglist(++i){1};
	case "-kmax"
		kmaxpath = arglist(++i){1};
	case "-n4"
		n4path = arglist(++i){1};
	case "-fontsize"
		fontsize = str2num(arglist(++i){1});
	case "-h"
		for i = (1:length(help_message))
			printf('%s\n', help_message{i});
		endfor
		exit();
	endswitch
endfor

if (!file_loaded && isempty(kmaxpath) && isempty(n4path))
	printf('No valid data found. Use "-din filename" to load data to plot.');
	exit(-1)
endif

set(0, "DefaultAxesFontName", "Helvetica");
set(0, "DefaultAxesFontSize", fontsize);
set(0, "DefaultTextFontName", "Helvetica");
set(0, "DefaultTextFontSize", fontsize);
figure("visible", "off");
hold("on");
grid("on");

if (!isempty(kmaxpath))
	count = 4;
	for i = (240:-30:30)
		load(sprintf('%s/kmax-%d.dat', kmaxpath, i));
		plot(x, y, sprintf('%d;;', mod(count--, 6)));
	endfor
elseif (!isempty(n4path))
	load(sprintf('%s/n2.dat', n4path));
	plot(x, p, sprintf('%d;p(x), n = 2;', 5));
	plot(x, y, sprintf('%d;y(x), n = 2;', 3));
	load(sprintf('%s/n4.dat', n4path));
	plot(x, p, sprintf('%d;p(x), n = 4;', 4));
	plot(x, y, sprintf('%d;y(x), n = 4;', 1));
else
	if (!isempty(n2zeros))
		plot([n2zeros(1), n2zeros(1)], [0, n2zeros(3)], '1;;');
		plot([n2zeros(2), n2zeros(2)], [0, n2zeros(4)], '1;;');
	endif
	plot(x, p, '2;p(x);');
	plot(x, y, '3;y(x);');
endif

axis([x_min, x_max, y_min, y_max]);
xlabel("x");
ylabel("y(x)");
print("-depsc2", filename);

toc();
