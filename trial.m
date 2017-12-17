import mlreportgen.dom.*;
doctype = 'html';
d = Document('test',doctype);

t = Table(magic(5));
t.Style = {Border('inset','crimson','6pt'), ...
   ColSep('double','DarkGreen','3pt'), ...
   RowSep('double','Gold','3pt'), ...
   Width('50%')};

t.TableEntriesInnerMargin = '6pt';
t.TableEntriesHAlign = 'center';
t.TableEntriesVAlign = 'middle';
append(d,t);

close(d);
rptview(d.OutputPath);