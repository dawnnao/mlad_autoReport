import mlreportgen.dom.*;
headObj{4} = append(doc, Heading1('Statistics in total'));
headObj{4}.FontSize = '18';

%% insert blank
cBlank = cBlankNew; frag = 1;
cBlankNew = cBlank + frag;
for n = cBlank+1 : cBlankNew
    blankObj{n} = Paragraph('');
    append(doc, blankObj{n});
end

%% brief introduction
content = ['A channel-wise bar plot is presented in the following figure, ' ...
    'which can indicate the data quality of each channel. Data patterns are marked by colors.'];
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

imgsize = size(imread([dirName.plotSum dirName.statsSum]));
width = [num2str(4 * imgsize(2)/imgsize(1)) 'in'];
imageStats = Image([dirName.plotSum dirName.statsSum]);
imageStats.Height = '4in';
imageStats.Width = width;



countTable = countTable + 1;
tableObj{countTable} = Table();
row{1} = TableRow();
append(row{1}, TableEntry(imageStats));
append(tableObj{countTable}, row{1});

countFig = countFig + 1;
imageName = Paragraph(sprintf('Fig %d. Count in total', countFig));
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