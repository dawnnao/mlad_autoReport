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

%% insert tabled images

itemName = [sensor.label.name, 'Total anomalies', 'Total'];

% table initialization
countTable = countTable + 1;
tableObj{countTable} = Table();
rowText = TableRow();

% make table head
append(rowText, TableEntry('Anomaly patterns'));
append(rowText, TableEntry('Quantity'));
append(rowText, TableEntry('Ratio of anomalies (%)'));
append(rowText, TableEntry('Ratio of total (%)'));
append(tableObj{countTable}, rowText);
rowText = TableRow();

% insert
c = 1;
for s = 1 : length(itemName)
    % append text to cell of table
    imgsize = size(imread([dirName.plotSPS dirName.statsPerSensor{s}]));
    width = [num2str(2.5 * imgsize(2)/imgsize(1)) 'in'];
    imageSPS{s} = Image([dirName.plotSPS dirName.statsPerSensor{s}]);
    imageSPS{s}.Height = '2.2in';
    imageSPS{s}.Width = width;
    
    
    
    
    
    
    append(rowText, TableEntry(imageSPS{s}));
    
    % append cell to table
    if mod(c,4) == 0
        append(tableObj{countTable}, rowText);
        rowText = TableRow();
    end
    c = c + 1;
end





tableObj{countTable}.HAlign = 'center';
append(doc, tableObj{countTable});

% br{cPageBreak} = PageBreak();
% append(doc ,br{cPageBreak}); cPageBreak = cPageBreak + 1;

%% insert next section
countSect = countSect + 1;
sect{countSect} = DOCXPageLayout;
sect{countSect}.PageSize.Orientation = 'portrait';
sect{countSect}.SectionBreak = 'Next Page';
sect{countSect}.PageSize.Height = '8.27in';
sect{countSect}.PageSize.Width = '11.69in';
append(doc, sect{countSect});

