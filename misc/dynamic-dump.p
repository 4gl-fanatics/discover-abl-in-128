
using misc.*.

var ExportData oExport = new ExportData().

oExport:TableName = "Salesrep".
oExport:DumpFile = "dump/srep.d".

oExport:DumpTable().
