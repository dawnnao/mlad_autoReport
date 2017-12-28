clear;clc;close all;

% win
readRoot = 'C:/dataArchiveTemp/Sutong/';
saveRoot = 'D:/results/mlad_autoReport/';
% saveRoot = 'D:/results/results_mlad_withKnownLabel/round2/mlad111/';

% mac
% readRoot = '/Volumes/BOOTCAMP/data/Sutong/';
% readRoot = '/Users/zhiyitang/Programming/data/Sutong/';
% saveRoot = '/Users/zhiyitang/Programming/results/mlad111_forReport/';

sensorNum = [1:38];
dateStart = '2012-02-01';
dateEnd = '2012-02-03';
k = 10; % number of clusters
sensorClustRatio = 50/100;
% sensorPSize = 10;
fs = 20;
step = [5];
% labelName = {'1-normal','2-missing','3-minor','4-outlier','5-square','6-trend','7-drift'};
seed = 1; % for random number generation
maxEpoch = [150];
batchSize = 100;
sizeFilter = [40];
numFilter = [20];
gpuOrCpu = 'gpu';

%%
sensor = mlad_autoReport_unity_jumpTest(readRoot, saveRoot, sensorNum, ...
    dateStart, dateEnd, k, sensorClustRatio, [], fs, step, [], seed, ...
    maxEpoch, batchSize, sizeFilter, numFilter, gpuOrCpu);









