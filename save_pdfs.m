files = arrayfun(@(fileinfo) string(fileinfo.name), dir(pwd));

mkdir('./tmp');

for i = 1:length(files)
    [a, name, ext] = fileparts(files(i));
    
    if (strcmp(ext, '.fig'))    
        ouputname = strcat(pwd, '/tmp/', name);
        openfig(files(i));
        print(gcf, ouputname, '-bestfit', '-dpdf');
        close gcf;
    end
end

system('pdfunite ./tmp/* ./figures.pdf');

rmdir('./tmp', 's');