import parseopt, os
var params = commandLineParams()

template oparser*(parser, body: untyped) =
  var parser: seq[seq[string]]
  body

template add*(parser: seq[seq[string]], lc: string, fc: string, dis: string, arg, body: untyped) =
  parser.add(@[lc, fc, dis])
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

template add*(parser: seq[seq[string]], lc: string, fc: string, dis: string, body: untyped) =
  parser.add(@[lc, fc, dis])
  for kind, key, val in getopt(params):
    if (kind == cmdShortOption):
      if (("-" & key) == lc):
        body
    elif (kind == cmdLongOption):
      if (("--" & key) == fc):
        body
    elif (kind == cmdArgument):
      if (key == fc):
        body

