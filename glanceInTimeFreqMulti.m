function [sensorData, dateVec, dateSerial] = glanceInTimeFreqMulti(pathRead, sensorNum, dayStart, dayEnd, pathSave, prefix, fs)
% DESCRIPTION:
%   This is a subfunction of mlad.m, to read user specified data, and
%   display progress in command window.

% AUTHOR:
%   Zhiyi Tang
%   tangzhi1@hit.edu.cn
%   Center of Structural Monitoring and Control
% 
% DATE CREATED:
%   12/19/2016  

path.root = pathRead;
hourTotal = (dayEnd-dayStart+1)*24;
count = 1;
figure
set(gcf,'Units','pixels','Position',[100, 100, 100, 100]);
for day = dayStart : dayEnd
    string = datestr(day);
    for hour = 0:23
        ticRemain = tic;
        dateVec(count,:) = datevec(string,'dd-mmm-yyyy');
        dateVec(count,4) = hour;
        dateSerial(count,1) = datenum(dateVec(count,:));
        path.folder = sprintf('%04d-%02d-%02d',dateVec(count,1),dateVec(count,2), dateVec(count,3));
        path.file = [path.folder sprintf(' %02d-VIB.mat',hour)];
        path.full = [path.root '/' path.folder '/' path.file];
        if ~exist(path.full, 'file')
            fprintf('\nCAUTION:\n%s\nNo such file! Filled with a zero.\n', path.full)
            sensorData(1, 1) = zeros;  % always save in column 1
        else
            read = ['load(''' path.full ''');']; eval(read);
            sensorData(:, sensorNum) = data(:, sensorNum);  % always save in column 1
        end
        data = [];
        for s = sensorNum
            % time series signals plot
            plot(sensorData(:, s),'color','k');
            position = get(gcf,'Position');
            set(gcf,'Units','pixels','Position',[position(1), position(2), 100, 100]);  % control figure's position
            set(gca,'Units','normalized', 'Position',[0 0 1 1]);  % control axis's position in figure
            set(gca,'visible','off');
            xlim([0 size(sensorData,1)]);
            set(gcf,'color','white');
            img = getframe(gcf);
            img = imresize(img.cdata, [100 100]);  % expected dimension
            img = rgb2gray(img);
            img = im2double(img);
            imshow(img)
            pathSaveAll = [pathSave{s} '/' sprintf('%sabsIdx_%d_%d', prefix, s, count) '_time.png'];
            imwrite(img, pathSaveAll);
    %         close gcf

            % frequency domain plot
            N = size(sensorData, 1);
            f = (0 : N/2-1)*(fs/N);
            sensorData(isnan(sensorData(:, s)), s) = 0;
            freqData = fft(sensorData(:, s) - median(sensorData(:, s)));

            plot(f, abs(real(freqData(1:N/2))),'color','k');
            set(gca, 'visible', 'off');
            set(gcf,'color','white');
            set(gcf,'Units','pixels','Position',[position(1), position(2), 100, 100]);  % control figure's position
            set(gca,'Units','normalized', 'Position',[0 0 1 1]);  % control axis's position in figure
            img = getframe(gcf);
            img = imresize(img.cdata, [100 100]);  % expected dimension
            img = rgb2gray(img);
            img = im2double(img);
            imshow(img)
            pathSaveAll = [pathSave{s} '/' sprintf('%sabsIdx_%d_%d', prefix, s, count) '_freq.png'];
            imwrite(img, pathSaveAll);
    %         close gcf

            tocRemain = toc(ticRemain);
            tRemain = tocRemain * (hourTotal - count);
            [hours, mins, secs] = sec2hms(tRemain);
            fprintf('\nGenerating sensor-%02d images...  %d-%02d-%02d  %02d:00-%02d:00  Done!', ...
                s, dateVec(count,1), dateVec(count,2), dateVec(count,3), hour, hour+1)
            fprintf('\nTotal: %d  Now: %d  ', hourTotal, count)
            fprintf('About %02dh%02dm%05.2fs left.\n', hours, mins, secs)
        end
        count = count+1;
        sensorData = [];
    end
end
count = count-1;
clear data
close
end
