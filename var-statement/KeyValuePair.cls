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

        cName = pcName.

        var date dtWhen = today.


        iVal = piValue.
    end constructor.

end class.