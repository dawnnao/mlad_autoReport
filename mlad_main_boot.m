clear;clc;close all;

% win
readRoot = 'C:/Users/zhiyi/Downloads/yingwuzhou/';
saveRoot = 'C:/Users/zhiyi/Downloads/yingwuzhou/';

% mac
% readRoot = '/Volumes/BOOTCAMP/data/Sutong/';
% readRoot = '/Users/zhiyitang/Programming/data/Sutong/';
% saveRoot = '/Users/zhiyitang/Programming/results/';

sensorNum = [1:16];
dateStart = '2020-04-21';
dateEnd = '2020-04-26';
k = 10; % number of clusters
sensorClustRatio = 50/100;
% sensorPSize = 10;
fs = 20;
step = [6];
% labelName = {'1-normal','2-missing','3-minor','4-outlier','5-square','6-trend','7-drift'};
seed = 1; % for random number generation
maxEpoch = [150];
batchSize = 100;
sizeFilter = [40];
numFilter = [20];
gpuOrCpu = 'gpu';

%%
sensor = mlad_main(readRoot, saveRoot, sensorNum, ...
    dateStart, dateEnd, k, sensorClustRatio, [], fs, step, [], seed, ...
    maxEpoch, batchSize, sizeFilter, numFilter, gpuOrCpu);