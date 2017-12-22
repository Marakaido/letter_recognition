[x,t] = train_data('train', '.bmp');
all_times = zeros(3, 7);
modifier = 0;
ts = zeros(1, 3);
sigmas = zeros(1, 3);
deltas = zeros(1, 3); 
ms = zeros(1, 3);
for i=1:3
    times = zeros(1, 7);
    for j=1:7
        net = newff(x, t, [16 6+modifier], {'logsig', 'logsig'});

        net.trainFcn = 'trainoss';
        net.performFcn = 'mse';
        net.trainParam.epochs=2000;
        net.trainParam.goal=1E-3;

        [net, tr] = train(net,x,t);
        times(j) = sum(tr.time);
    end
    all_times(i, :) = times(:);
    ts(i) = sum(times) / 7;
    sigmas(i) = sqrt(sum((times - ts(i)).^2 / 7));
    s = sqrt(7/6) * sigmas(i);
    deltas(i) = 2.45 * s / sqrt(7);
    ms(i) = 2.45^2 * s^2 / 0.1^2;
    modifier = modifier+6;
end