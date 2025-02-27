import mlreportgen.dom.*;
headObj{1} = append(doc, Heading1('Detection result panorama'));
headObj{1}.FontSize = '18';

%% insert blank
cBlank = cBlankNew; frag = 1;
cBlankNew = cBlank + frag;
for n = cBlank+1 : cBlankNew
    blankObj{n} = Paragraph('');
    append(doc, blankObj{n});
end

%% brief introduction
content = ['The anomaly detection results are given in the following figure, ' ...
    'which is a panorama in time-space. Colors denote different types of anomaly. ' ...
    'In this figure, data quality and features of distribution can be inspected. ' ...
    'Legend of color is given in section ''Statistics in total''.'];
introObj = Paragraph(content);
% introObj.Bold = false;
% introObj.Style = {FontFamily('Times New Roman')};
% introObj.FontSize = '12';
introObj.HAlign = 'left';
append(doc, introObj);

%% insert blank
cBlank = cBlankNew; frag = 1;
cBlankNew = cBlank + frag;
for n = cBlank+1 : cBlankNew
    blankObj{n} = Paragraph('');
    append(doc, blankObj{n});
end

%% insert tabled images
panoRotate = imread([dirName.plotPano dirName.panopano]);
% panoRotate = imrotate(panoRotate, -90);
dirName.panoRotate = [sprintf('%s--%s_sensor_all%s', date.start, date.end, sensorStr) ...
                    '_anomalyDetectionPanoramaRotate.png'];
imwrite(panoRotate, [dirName.plotPano dirName.panoRotate]);
imgsize = size(imread([dirName.plotPano dirName.panoRotate]));
width = [num2str(2.9 * imgsize(2)/imgsize(1)) 'in'];
imagePano = Image([dirName.plotPano dirName.panoRotate]);
imagePano.Height = '2.9in';
imagePano.Width = width;

% image
if exist('countTable', 'var'), countTable = countTable + 1;
else countTable = 1; 
end
tableObj{countTable} = Table();
row{1} = TableRow();
append(row{1}, TableEntry(imagePano));
append(tableObj{countTable}, row{1});

% caption of image
if exist('countFig', 'var'), countFig = countFig + 1;
else countFig = 1; 
end

imageName = Paragraph(sprintf('Fig %d. Panorama of detection results', countFig));
imageName.Bold = false;
% imageName.FontSize = '18';
imageName.HAlign = 'center';
row{1} = TableRow();
append(row{1}, TableEntry(imageName));
append(tableObj{countTable}, row{1});
row{1} = TableRow();
tableObj{countTable}.HAlign = 'center';
append(doc, tableObj{countTable});

%% insert blank
cBlank = cBlankNew; frag = 2;
cBlankNew = cBlank + frag;
for n = cBlank+1 : cBlankNew
    blankObj{n} = Paragraph('');
    append(doc, blankObj{n});
end

%% insert next section
if exist('countSect', 'var'), countSect = countSect + 1;
else countSect = 1; 
end
sect{countSect} = DOCXPageLayout;
sect{countSect}.PageSize.Orientation = 'landscape';
sect{countSect}.SectionBreak = 'Next Page';
sect{countSect}.PageSize.Height = '8.27in';
sect{countSect}.PageSize.Width = '11.69in';
append(doc, sect{countSect});