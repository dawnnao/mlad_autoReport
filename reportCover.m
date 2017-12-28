import mlreportgen.dom.*;

dirName.docFile = sprintf('%s%s--%s_sensor%s%s', dirName.home, date.start, date.end, sensorStr, netLayout);
reportType = 'docx';
templateName = 'Auto_Report_Template';
doc = Document(dirName.docFile, reportType, templateName);
open(doc);

% change page size
layout = doc.CurrentPageLayout;
layout.PageSize.Orientation  ='portrait';
layout.PageSize.Height = '11.69in';
layout.PageSize.Width = '8.27in';

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
cBlank = cBlankNew; frag = 24;
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
% countSect = 1;
% sect{countSect} = DOCXPageLayout;
% sect{countSect}.PageSize.Orientation = 'portrait';
% sect{countSect}.SectionBreak = 'Next Page';
% sect{countSect}.PageSize.Height = '14in';
% sect{countSect}.PageSize.Width = '8.5in';
% append(doc, sect{countSect});


%% insert page number
% set format
layout = doc.CurrentPageLayout;
pageNum = PageNumber(1, 'n');
layout.Style = {pageNum};

% Create the footer and add a page number to it
para = Paragraph();
para.HAlign = 'center';
append(para, Page()); % get current page and append

% Add the page number to the footer
pageFooter = DOCXPageFooter();
append(pageFooter, para);
layout.PageFooters = pageFooter;

% %% change page size
% layout = doc.CurrentPageLayout;
% layout.PageSize.Orientation  ='portrait';
% layout.PageSize.Height = '14in';
% layout.PageSize.Width = '8.5in';




