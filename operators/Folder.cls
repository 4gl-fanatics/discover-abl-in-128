

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