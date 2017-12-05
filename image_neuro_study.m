%[P, T] = train_data('train', '.bmp');
img = imread('train/k.bmp');
P(:, 1) = img(:);
img = imread('train/K.bmp');
P(:, 2) = img(:);
T = [3 1];
net = newff(P, T, 16);

net.trainFcn = 'trainoss';
net.performFcn = 'mse';
net.trainParam.epochs=1500; % Максимальна кількість епох
net.trainParam.goal=0.01; % Мінімальна помилка навчання
[net,tr] = train(net,P,T,[],[],[],[]); % виконати навчання нейромережі
ep1=tr.epoch; % Epoch number; номери епох
mse1=tr.perf; % Помилки навчання для кожної епохи
outputs = sim(net,P);
plot(outputs)
%save('net_1');