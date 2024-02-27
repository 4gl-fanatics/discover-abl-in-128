
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