function [P, T] = train_data(folder, ext)

group_file_table = readtable([folder '/file_name.txt']);

for i = 1:height(group_file_table)
    t = im2double(imread(strcat(folder, '/', group_file_table{i,2}{1}, ext)));
    P(:, i) = t(:);
end

T = [1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0
     0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0
     0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0
     0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1];