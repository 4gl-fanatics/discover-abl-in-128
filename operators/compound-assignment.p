/**
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.
**/
/*------------------------------------------------------------------------
    File        : compound-assignment.p
    Purpose     :
    Author(s)   : Peter Judge, Consultingwerk Ltd
    Notes       :
  ----------------------------------------------------------------------*/

var integer i, j, k.
var decimal d = 100.
var character p, q, r.

j = 64.
k = 96.

do i = 1 to 26:

    j += 1.
    k += 1.

    p += chr(j).
    p += chr(k).
    p += "~n".

    q += chr(j) + chr(k) + "~n".

    r += substitute("uc: &1 lc: &2 &3", chr(j), chr(k), "~n").

end.

message p.
message "========".
message q.
message "========".
message r.

message d.

do i = 1 to 10:
    d /= 2.
    message i d.
end.

message "5 halved 20 times = " d.