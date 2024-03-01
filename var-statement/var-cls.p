/**
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.
**/
/*------------------------------------------------------------------------
    File        : var-cls.p
    Purpose     :
    Author(s)   : Peter Judge
    Notes       :
  ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Progress.Json.ObjectModel.*.

var JsonObject jo.
var JsonArray ja = new JsonArray(3).

var datetime-tz dtNow = now, dtThen = add-interval(now, 150, "seconds").

message  interval(dtThen, dtNow, "seconds").
