[x,t] = train_data('train', '.bmp');
net = newff(x, t, 10);

net.trainFcn = 'trainoss';
net.performFcn = 'mse';
net.trainParam.epochs=2000; % Максимальна кількість епох
net.trainParam.goal=1E-4;

net = train(net,x,t);
y = round(net(x));
perf = perform(net,y,t);

plot(1:20, t, 'ro', 1:20, y, 'bo', 1:20, abs(t-y), 'r--')

save('network')