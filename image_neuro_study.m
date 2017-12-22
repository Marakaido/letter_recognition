function [net,tr] = image_neuro_study(saveFileName, goal, times)
[x,t] = train_data('train', '.bmp');
net = newff(x, t, [16 12], {'logsig', 'logsig'});

net.trainFcn = 'trainoss';
net.performFcn = 'mse';
net.trainParam.epochs=2000;
net.trainParam.goal=goal;

[best_net, best_tr] = train(net,x,t);
best_perf = perform(best_net,t,best_net(x));
for i = 1:times
    net = init(net);
    [net, tr] = train(net, x, t);
    perf = perform(net, t, net(x));
    if perf < best_perf
        best_perf = perf;
        best_net = net;
        best_tr = tr;
    end
end

figure, plotconfusion(t, best_net(x))
view(best_net)

net = best_net;
tr = best_tr;
time = sum(tr.time);

save(saveFileName)