function [P, T] = train_data(folder, ext)

group_file_table = readtable([folder '/file_name.txt']);

vectors = [1 0 0 0
           0 1 0 0
           0 0 1 0
           0 0 0 1];
       
for i = 1:height(group_file_table)
    t = im2double(imread(strcat(folder, '/', group_file_table{i,2}{1}, ext)));
    P(:, i) = t(:);
    T(:, i) = vectors(:, mod(group_file_table{i,1}-1, 4)+1);
end