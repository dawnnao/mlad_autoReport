clear;clc;close all;

readRoot = 'C:/dataArchiveTemp/Sutong/';
saveRoot = 'D:/results/mlad/';

sensorNum = 1:20;
dateStart = '2012-02-01';
dateEnd = '2012-02-03';
k = 10;
sensorClustRatio = 50/100;
fs = 20;
step = [2];
seed = 1;
maxEpoch = 150;
batchSize = 100;
sizeFilter = 40;
numFilter = 20;
gpuOrCpu = 'gpu';

sensor = mlad_main(readRoot, saveRoot, sensorNum, ...
    dateStart, dateEnd, k, sensorClustRatio, [], fs, step, [], seed, ...
    maxEpoch, batchSize, sizeFilter, numFilter, gpuOrCpu);