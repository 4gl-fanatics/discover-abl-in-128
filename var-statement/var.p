/*------------------------------------------------------------------------
    File        : var.p
    Purpose     :
    Author(s)   : Peter Judge
    Notes       :
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

var integer iLoop, iCnt.

/* ARRAYS */
var character[] cNames.

/* Fixed extent, initial values */
var character[12] cMonths = ["Jan", "Feb","Amr", "Apr","May", "Jun","Jul", "Aug","Sep", "Oct","Nov", "Dec"].

/* variable extent, initial values */
var character[] cWeekdays = ["Sun", "Mon","Tue","Wed","Thu","Fri", "Sat"].

/* */



message "before: " extent(cWeekdays).

extent(cWeekdays) = 8.

message "after: " extent(cWeekdays).
message "[4]" cWeekdays[4].
