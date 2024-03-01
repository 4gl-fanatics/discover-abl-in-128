/**
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.
**/
/*------------------------------------------------------------------------
    File        : safe-navigation.p
    Purpose     :
    Author(s)   : Peter Judge
    Notes       :
  ----------------------------------------------------------------------*/
block-level on error undo, throw.

using operators.* from propath.

var Folder oFolder1, oFolder2, oFolder3.

session:appl-alert-boxes = true.
session:system-alert-boxes = true.


oFolder1 = new Folder(?, "path").
oFolder2 = new Folder(oFolder1, "child-path").
oFolder3 = new Folder(oFolder2, "grandchild-path").

message "self:" oFolder3:FolderName.
if valid-object(oFolder3:ParentFolder) then do:
    message "up one" oFolder3:ParentFolder:FolderName.

    if valid-object(oFolder3:ParentFolder:ParentFolder) then do:
        message "up two" oFolder3:ParentFolder:ParentFolder:FolderName.

        if valid-object(oFolder3:ParentFolder:ParentFolder:ParentFolder) then
            message "up three" oFolder3:ParentFolder:ParentFolder:ParentFolder:FolderName.
        else
            message "up three" ?.
    end.
    else do:
        message "up two" ?.
        message "up three" ?.
    end.
end.
else do:
    message "up one" ?.
    message "up two" ?.
    message "up three" ?.
end.

message "".

/* also works for methods */
message "is there: "   oFolder1:GetChildFolder("there"):FolderName.
message "is missing: " oFolder1:GetChildFolder("missing"):FolderName.


catch err as Progress.Lang.Error:
    message "Caught: " err:GetMessage(1).
end catch.
