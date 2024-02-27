/*------------------------------------------------------------------------
    File        : var.p
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
