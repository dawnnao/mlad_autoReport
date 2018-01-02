import mlreportgen.dom.*;

dirName.docFile = sprintf('%s%s--%s_sensor%s%s', dirName.home, date.start, date.end, sensorStr, netLayout);
reportType = 'docx';
templateName = 'Auto_Report_Template';
doc = Document(dirName.docFile, reportType, templateName);
open(doc);

% change page size
layout = doc.CurrentPageLayout;
layout.PageSize.Orientation  ='portrait';
layout.PageSize.Height = '29.7cm'; % '11.69in' '11in';
layout.PageSize.Width = '20.99cm'; % '8.27in'  '8.5in';

% insert blank
cBlank = 0; frag = 6;
cBlankNew = cBlank + frag;
for n = cBlank+1 : cBlankNew
    blankObj{n} = Paragraph('');
    append(doc, blankObj{n});
end

rptgen.cfr_line_break;
rptgen.cfr_line_break;
rptgen.cfr_line_break;

titleObj{1} = Paragraph('Machine Learning-based SHM Data Anomaly Detection Auto-Report');
titleObj{1}.Bold = false;
titleObj{1}.Style = {FontFamily('Times New Roman')};
titleObj{1}.FontSize = '28';
titleObj{1}.HAlign = 'center';
append(doc, titleObj{1});

% insert blank
cBlank = 0; frag = 1;
cBlankNew = cBlank + frag;
for n = cBlank+1 : cBlankNew
    blankObj{n} = Paragraph('');
    append(doc, blankObj{n});
end

titleObj{2} = Paragraph('Version: 0.1');
titleObj{2}.Bold = false;
titleObj{2}.Style = {FontFamily('Times New Roman')};
titleObj{2}.FontSize = '20';
titleObj{2}.HAlign = 'center';
append(doc, titleObj{2});

% insert blank
cBlank = cBlankNew; frag = 26;
cBlankNew = cBlank + frag;
for n = cBlank+1 : cBlankNew
    blankObj{n} = Paragraph('');
    append(doc, blankObj{n});
end

arthurObj = Paragraph('Center of Data Science and Engineering for Civil Infrastructure | HIT');
arthurObj.Bold = false;
arthurObj.Style = {FontFamily('Times New Roman')};
arthurObj.FontSize = '20';
arthurObj.HAlign = 'center';
append(doc, arthurObj);

% insert blank
cBlank = cBlankNew; frag = 2;
cBlankNew = cBlank + frag;
for n = cBlank+1 : cBlankNew
    blankObj{n} = Paragraph('');
    append(doc, blankObj{n});
end

% dateObj = Paragraph(datetime('now','Format','yyyy-MM-dd'));
% datestr(datetime('now'),'yyyy-MM-dd');
dateObj = Paragraph(datestr(datetime('now'),'yyyy-mm-dd'));
dateObj.Bold = false;
dateObj.Style = {FontFamily('Times New Roman')};
dateObj.FontSize = '20';
dateObj.HAlign = 'center';
% append(dateObj, ['' datetime('now','Format','yyyy-MM-dd') '']);
append(doc, dateObj);

countFig = 0; % initialization for image count
countTable = 0;

% sizeCurrent = doc.CurrentPageLayout;
% sizeCurrent.PageSize.Orientation  ='portrait';
% sizeCurrent.PageSize.Height = '8.27in';
% sizeCurrent.PageSize.Width = '11.69in';
% % append(doc,'This document has portrait pages');
% append(doc, sizeCurrent);

%% insert next section
if exist('countSect', 'var'), countSect = countSect + 1;
else countSect = 1; 
end
sect{countSect} = DOCXPageLayout;
sect{countSect}.PageSize.Orientation = 'portrait';
sect{countSect}.SectionBreak = 'Next Page';
sect{countSect}.PageSize.Height = '29.7cm'; % a4: '11.69in'
sect{countSect}.PageSize.Width = '20.99cm'; % a4: '8.27in'
append(doc, sect{countSect});

% % just add a pagebreak
% br = PageBreak();
% append(doc,br);




