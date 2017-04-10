function [net, info] = train_network(opts,fold,imdb,varargin)

net = cnn_mnist_init('useBnorm', opts.useBnorm);
[net, info] = cnn_train(net, imdb, @getBatch, ...
    opts.train, ...
    'val', 'NaN') ;

function [im, labels] = getBatch(imdb, batch)

im = imdb.images.data(:,:,:,batch);
labels = imdb.images.labels(1,batch);


