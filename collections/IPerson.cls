/**
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.
**/
/*------------------------------------------------------------------------
    File        : IPerson
    Purpose     :
    Author(s)   : Peter Judge, Consultingwerk Ltd
    Notes       :
  ----------------------------------------------------------------------*/

interface collections.IPerson:

    define public property FirstName as character no-undo
    get.

    define public property LastName as character no-undo
    get.

    define public property MiddleNames as character no-undo extent
    get.

end interface.