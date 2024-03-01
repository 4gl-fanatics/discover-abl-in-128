/**
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.
**/
/*------------------------------------------------------------------------
    File        : KeyValuePair
    Purpose     :
    Author(s)   : Peter Judge
    Notes       :
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

class var-statement.KeyValuePair:

    var character cName.

    define property Name as character no-undo
    get():
        return cName.
    end get.

    var integer iVal.

    define property Value as integer no-undo
    get():
        return iVal.
    end get.

    constructor public KeyValuePair (pcName as character,
                                     piValue as integer):


        var date dtWhen = today.

        cName = pcName.
        iVal = piValue.
    end constructor.

end class.