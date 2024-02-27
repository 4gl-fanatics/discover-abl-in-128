/*------------------------------------------------------------------------
    File        : query-fail.p
    Purpose     :
    Author(s)   : Peter Judge
    Notes       :
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

define variable iCustNum as integer no-undo.
define variable cLineNum  as character no-undo.

iCustNum = 42.
cLineNum = "d2".

/* The INTEGER() function will fail here */

for each Order no-lock where Order.CustNum = iCustNum,
    each OrderLine no-lock where OrderLine.Ordernum = Order.Ordernum
                     and OrderLine.Linenum = integer(cLineNum):
    display Order.OrderNum.
end.

message "Pass".

catch err as Progress.Lang.Error:
    message "Caught: " err:GetMessage(1).
end catch.
