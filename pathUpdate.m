dirName.mat = [dirName.home 'trainingSetMat/'];
dirName.matFile = [dirName.mat sprintf('trainingSet.mat')];
dirName.net = [dirName.home sprintf('/net_globalEpoch_%d_batchSize_%d_sizeFilter_%d_numFilter_%d/', ...
    maxEpoch(1), batchSize, sizeFilter, numFilter)];
dirName.plotPanoTrainSet = [dirName.mat 'panorama/'];



