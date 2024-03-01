/**
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.
**/
/*------------------------------------------------------------------------
    File        : dynamic-dump.p
    Purpose     :
    Author(s)   : Peter Judge, Consultingwerk Ltd
    Notes       : Requests a variant of the sports db to be connected
  ----------------------------------------------------------------------*/

using misc.*.

var ExportData oExport = new ExportData().

oExport:TableName = "Salesrep".
oExport:DumpFile = "dump/srep.d".

oExport:DumpTable().
