/**
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.
**/
/*------------------------------------------------------------------------
    File        : query-fail.p
    Purpose     :
    Author(s)   : Peter Judge, Consultingwerk Ltd
    Notes       : Requires a connection to Sports2000
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
