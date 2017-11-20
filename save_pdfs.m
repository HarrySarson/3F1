files = arrayfun(@(fileinfo) string(fileinfo.name), dir(pwd));


for i = 1:length(files)
    [a, name, ext] = fileparts(files(i));
    
    if (strcmp(ext, '.fig'))    
        ouputname = strcat(pwd, '/figures/', name);
        openfig(files(i));
        print(gcf, ouputname, '-bestfit', '-dpdf');
        close gcf;
    end
end