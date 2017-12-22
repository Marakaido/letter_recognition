function [R, Y] = recognize_all(net)

files = dir(fullfile('recogn', '*.bmp'));
R = table;
Y = [];
for i=1:length(files)
    file = files(i);
    [Letter, V] = recognition(strcat(file.folder, '/', file.name), net);
    Y = [Y; V'];
    T = {file.name, Letter, mat2str(V)};
    R = [R; T];
end
R.Properties.VariableNames = {'Image' 'Recognized' 'Vector'};