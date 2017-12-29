import mlreportgen.dom.*;
headObj{2} = append(doc, Heading1('Counting Table'));
headObj{2}.FontSize = '18';

%% insert blank
cBlank = cBlankNew; frag = 1;
cBlankNew = cBlank + frag;
for n = cBlank+1 : cBlankNew
    blankObj{n} = Paragraph('');
    append(doc, blankObj{n});
end

%% brief introduction
content = ['In the following table, the amount of each type of anamolies, as well as the normal data, ' ...
    'is respectively counted. In addition, the in-anomaly ratio and in-total ratio are calculated.'];
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

%% insert counting table

% make table contents
itemName = [sensor.label.name'; 'Total anomalies'; 'Total'];
sensor.ratioOfCategoryText = {};
for r = 1 : size(sensor.ratioOfCategory, 1)
    for c = 1 : size(sensor.ratioOfCategory, 2)
        switch c
            case 1
                sensor.ratioOfCategoryText(r,c) = {sprintf('%d', sensor.ratioOfCategory(r,c))};
            case {2, 3}
                if isnan(sensor.ratioOfCategory(r,c))
                    sensor.ratioOfCategoryText(r,c) = {'--'};
                else
                    sensor.ratioOfCategoryText(r,c) = {sprintf('%0.2f', sensor.ratioOfCategory(r,c))};
                end
        end
    end
end
% add table left column
sensor.ratioOfCategoryText = [itemName sensor.ratioOfCategoryText];
% add table header
tableHeader = {'Anomaly patterns', 'Quantity', 'Ratio of anomalies (%)', 'Ratio of total (%)'};
sensor.ratioOfCategoryText = [tableHeader; sensor.ratioOfCategoryText];

% table initialization
countTable = countTable + 1;
tableObj{countTable} = Table(sensor.ratioOfCategoryText);
% rowText = TableRow();

% tableObj{countTable}.Style = {Border('solid','2pt'), ...
%    ColSep('double','2pt'), ...
%    RowSep('solid','2pt'), ...
%    Width('50%')};

tableObj{countTable}.Style = {RowHeight('0.4in')}; % LineSpacing(1)


tableObj{countTable}.Border = 'solid';
tableObj{countTable}.BorderWidth = '2pt';

tableObj{countTable}.ColSep = 'solid';
tableObj{countTable}.ColSepWidth = '1pt';
tableObj{countTable}.RowSep = 'solid';
tableObj{countTable}.RowSepWidth = '1pt';

tableObj{countTable}.TableEntriesStyle = {FontFamily('Times New Roman'), Width('2in'), Color('black')};
tableObj{countTable}.TableEntriesHAlign = 'center';
tableObj{countTable}.TableEntriesVAlign = 'middle';

tableObj{countTable}.HAlign = 'center';

%%
% % make table head
% append(rowText, TableEntry('Anomaly patterns'));
% append(rowText, TableEntry('Quantity'));
% append(rowText, TableEntry('Ratio of anomalies (%)'));
% append(rowText, TableEntry('Ratio of total (%)'));
% append(tableObj{countTable}, rowText);
% rowText = TableRow();
% 
% % insert
% c = 1;
% for s = 1 : length(itemName)
%     % append text to cell of table
%     imgsize = size(imread([dirName.plotSPS dirName.statsPerSensor{s}]));
%     width = [num2str(2.5 * imgsize(2)/imgsize(1)) 'in'];
%     imageSPS{s} = Image([dirName.plotSPS dirName.statsPerSensor{s}]);
%     imageSPS{s}.Height = '2.2in';
%     imageSPS{s}.Width = width;
%     
%     append(rowText, TableEntry(imageSPS{s}));
%     
%     % append cell to table
%     if mod(c,4) == 0
%         append(tableObj{countTable}, rowText);
%         rowText = TableRow();
%     end
%     c = c + 1;
% end

%%
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

