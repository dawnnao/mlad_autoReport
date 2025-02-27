import mlreportgen.dom.*;
headObj{2} = append(doc, Heading1('Statistics by sensor'));
headObj{2}.FontSize = '18';

section = doc.CurrentDOCXSection;
section.PageMargins.Top = '0.5in';
section.PageMargins.Bottom = '0.5in';
section.PageMargins.Footer = '0.3in';

%% insert blank
cBlank = cBlankNew; frag = 1;
cBlankNew = cBlank + frag;
for n = cBlank+1 : cBlankNew
    blankObj{n} = Paragraph('');
    append(doc, blankObj{n});
end

%% brief introduction
content = ['In this section, the anomaly detection results are presented channel by channel. ' ...
    'In each subfigure, anomalies are counted monthly by type. ' ...
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
for s = sensor.numVec
    imageCap{s} = sprintf('Sensor %d', s); 
end

countTable = countTable + 1;
tableObj{countTable} = Table();
rowImg{1} = TableRow();
rowCap{1} = TableRow();
c = 1;
for s = sensor.numVec
    imgsize = size(imread([dirName.plotSPS dirName.statsPerSensor{s}]));
    width = [num2str(2 * imgsize(2)/imgsize(1)) 'in'];
    imageSPS{s} = Image([dirName.plotSPS dirName.statsPerSensor{s}]);
    imageSPS{s}.Height = '2in';
    imageSPS{s}.Width = width;
    append(rowImg{1}, TableEntry(imageSPS{s}));
    
    if exist('countFig', 'var'), countFig = countFig + 1;
    else countFig = 1; 
    end
    imageStatsPerSensorCap{s} = Paragraph(sprintf('Fig %d. %s', countFig, imageCap{s}));
    imageStatsPerSensorCap{s}.Bold = false;
    % imageNetPerformCap.FontSize = '18';
    imageStatsPerSensorCap{s}.HAlign = 'center';
    append(rowCap{1}, TableEntry(imageStatsPerSensorCap{s}));
    
    if mod(c,4) == 0 % change here to customize column number
        append(tableObj{countTable},rowImg{1});
        append(tableObj{countTable},rowCap{1});
        rowImg{1} = TableRow();
        rowCap{1} = TableRow();
    elseif s == sensor.numVec(end)
        append(tableObj{countTable},rowImg{1});
        append(tableObj{countTable},rowCap{1});
    end
    c = c + 1;
end
tableObj{countTable}.HAlign = 'center';
append(doc, tableObj{countTable});

% br{cPageBreak} = PageBreak();
% append(doc ,br{cPageBreak}); cPageBreak = cPageBreak + 1;

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
sect{countSect}.PageSize.Orientation = 'portrait';
sect{countSect}.SectionBreak = 'Next Page';
sect{countSect}.PageSize.Height = '8.27in';
sect{countSect}.PageSize.Width = '11.69in';
append(doc, sect{countSect});

