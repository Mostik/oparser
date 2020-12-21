import parseopt, os
var params = commandLineParams()

template oparser*(body: untyped) =
  body

template add*(lc: string, fc: string, dis: string, arg, body: untyped) =
  var arg: string
  for kind, key, val in getopt(params):
    arg = val
    if (kind == cmdShortOption):
      if (("-" & key) == lc):
        body
    elif (kind == cmdLongOption):
      if (("--" & key) == fc):
        body
    elif (kind == cmdArgument):
      if (key == fc):
        body