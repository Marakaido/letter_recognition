
load('network');
[x, t] = train_data('train', '.bmp');
y = round(sim(net, x(:, 7)));
