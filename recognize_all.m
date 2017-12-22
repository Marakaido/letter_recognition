function R = recognize_all(net)

files = dir(fullfile('recogn', '*.bmp'));
R = table;
for i=1:length(files)
    file = files(i);
    T = {file.name, recognition(strcat(file.folder, '/', file.name), net)};
    R = [R; T];
end
R.Properties.VariableNames = {'Image' 'Recognized'};