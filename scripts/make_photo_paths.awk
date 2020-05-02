BEGIN {print "["}
{ print "\"" "/" $0 "\"" ","}
END {print "]"}