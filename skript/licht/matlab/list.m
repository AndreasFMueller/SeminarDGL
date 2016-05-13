scopy = '';
base = 495;
basep = 500;
for r = [4.95:-0.05:1]
    fprintf('%d/%3.0f, ', base, (exp(-(r-1)/2)*1000));
    scopy = strcat(scopy, sprintf('%d/%3.0f, ', base, (exp(-(r-1)/2)*1000)));
    base = base - 5;
    basep = base - 5;
end
clipboard('copy', scopy);
fprintf('\n0');