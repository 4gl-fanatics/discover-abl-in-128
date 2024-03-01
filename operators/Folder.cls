/**
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.
**/
/*------------------------------------------------------------------------
    File        : Folder
    Purpose     :
    Author(s)   : Peter Judge, Consultingwerk Ltd
    Notes       :
  ----------------------------------------------------------------------*/
block-level on error undo, throw.

using operators.* from propath.

class operators.Folder:

        define public property FolderName as character no-undo
        get.
        private set.

        define public property ParentFolder as Folder no-undo
        get.
        private set.

        constructor public Folder (poParent as Folder, pcName as character ):
            this-object:FolderName = pcName.
            this-object:ParentFolder = poParent.
        end constructor.

        method public Folder GetChildFolder(pcName as character):
            if asc(substring(pcName, 1, 1, "character")) mod 2 = 0 then
                return new Folder(this-object, pcName).
            else
                return ?.
        end method.

end class.