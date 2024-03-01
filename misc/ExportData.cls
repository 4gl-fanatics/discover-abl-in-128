/**
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.
**/
/*------------------------------------------------------------------------
    File        : ExportData
    Purpose     :
    Author(s)   : Peter Judge, Consultingwerk Ltd
    Notes       :
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

class misc.ExportData:

    define public property TableName as character no-undo
    get.
    set.

    define public property DumpFile as character no-undo
    get.
    set.

    constructor public ExportData():
    end method.

    method public void DumpTable():
        var handle hBuffer, hQuery.

        create buffer hBuffer for table this-object:TableName buffer-name "b" + this-object:TableName.

        create query hQuery.
        hQuery:set-buffers(hBuffer).
        hQuery:query-prepare(substitute("for each &1 no-lock", hBuffer:name)).

        hQuery:query-open().

        output to value(this-object:DumpFile).
        do while hQuery:get-next():
            hBuffer:buffer-export().
        end.

        finally:
            output close.
            hQuery:query-close().

            delete object hQuery.
            delete object hBuffer.
        end finally.

    end method.

end class.