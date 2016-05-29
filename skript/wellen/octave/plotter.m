tic()

help_message = { "Use the following parameters to configure the output:",
"\t-din",
"\t\tSet the input data file to load.",
"\t-dout",
"\t\tSet the output file to print to. (.esp format)",
"\t-kmax",
"\t\tPath for the different k_max wave file. (Format: path/kmax-num.dat)",
"\t-h",
"\t\tShow this help message." };

file_loaded = false;

filename = 'wave';
kmaxpath = '';

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
	case "-h"
		for i = (1:length(help_message))
			printf('%s\n', help_message{i});
		endfor
		exit();
	endswitch
endfor

if (!file_loaded && isempty(kmaxpath))
	printf('No valid data found. Use "-din filename" to load data to plot.');
	exit(-1)
endif

set(0, "defaultaxesfontname", "Helvetica");
figure("visible", "off");
hold("on");
grid("on");

if (!isempty(kmaxpath))
	count = 3;
	for i = (30:30:240)
		load(sprintf('%s/kmax-%d.dat', kmaxpath, i));
		plot(x, y, sprintf('%d;;', mod(count++, 6)));
	endfor
else
	plot(x, y, '3;y(x);');
	plot(x, p, '2;p(x);');
endif

axis([x_min, x_max, y_min, y_max]);
print("-depsc2", filename);

toc();
