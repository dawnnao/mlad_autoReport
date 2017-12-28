import mlreportgen.dom.*;
headObj{3} = append(doc, Heading1('Statistics by label'));
headObj{3}.FontSize = '18';

%% insert blank
cBlank = cBlankNew; frag = 1;
cBlankNew = cBlank + frag;
for n = cBlank+1 : cBlankNew
    blankObj{n} = Paragraph('');
    append(doc, blankObj{n});
end

%% insert tabled images
imageCap = labelName;

countTable = countTable + 1;
tableObj{countTable} = Table();
rowImg{1} = TableRow();
rowCap{1} = TableRow();
c = 1;
for l = 1 : labelTotal
    imgsize = size(imread([dirName.plotSPT dirName.statsPerLabel{l}]));
    width = [num2str(2.5 * imgsize(2)/imgsize(1)) 'in'];
    imageSPT{l} = Image([dirName.plotSPT dirName.statsPerLabel{l}]);
    imageSPT{l}.Height = '2.5in';
    imageSPT{l}.Width = width;
    append(rowImg{1}, TableEntry(imageSPT{l}));
    
    if exist('countFig', 'var'), countFig = countFig + 1;
    else countFig = 1; 
    end
    imageStatsPerLabelCap{l} = Paragraph(sprintf('Fig %d. %s', countFig, imageCap{l}));
    imageStatsPerLabelCap{l}.Bold = false;
    % imageNetPerformCap.FontSize = '18';
    imageStatsPerLabelCap{l}.HAlign = 'center';
    append(rowCap{1}, TableEntry(imageStatsPerLabelCap{l}));
    
    if mod(c,2) == 0 % change here to customize column number
        append(tableObj{countTable},rowImg{1});
        append(tableObj{countTable},rowCap{1});
        rowImg{1} = TableRow();
        rowCap{1} = TableRow();
    elseif l == labelTotal
        append(tableObj{countTable},rowImg{1});
        append(tableObj{countTable},rowCap{1});
    end
    c = c + 1;
end
tableObj{countTable}.HAlign = 'center';
append(doc, tableObj{countTable});

%% insert blank
cBlank = cBlankNew; frag = 1;
cBlankNew = cBlank + frag;
for n = cBlank+1 : cBlankNew
    blankObj{n} = Paragraph('');
    append(doc, blankObj{n});
end

%% insert next section
% countSect = countSect + 1;
% sect{5} = DOCXPageLayout;
% sect{5}.PageSize.Orientation = 'portrait';
% sect{5}.SectionBreak = 'Next Page';
% sect{5}.PageSize.Height = '8.27in';
% sect{5}.PageSize.Width = '11.69in';
% append(doc, sect{5});

close(doc);
rptview(doc.OutputPath);