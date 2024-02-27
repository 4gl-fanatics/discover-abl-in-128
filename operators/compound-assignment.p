/*
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
*/

var integer i, k.
var character r.

i = i + 1.
k = k * i.
r = substitute("&1 x: &2 y: &3", r, i, k).