[x,t] = train_data('train', '.bmp');
net = newff(x, t, 25, {'tansig'});

net.trainFcn = 'trainoss';
net.performFcn = 'mse';
net.trainParam.epochs=2000; % Максимальна кількість епох
net.trainParam.goal=1E-4;

[net, tr] = train(net,x,t);
y = sim(net, x);
perf = perform(net,y,t);
counter = 1;
while perf > 0.1 && counter < 50
    net = init(net);
    net = train(net, x, t);
    y = net(x);
    perf = perform(net, y, t)
    counter = counter+1;
end

figure, plotconfusion(t,y)

save('network')