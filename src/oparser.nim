import parseopt, os, strutils
var params = commandLineParams()

type
  OParser = object
    banner: string
    options: seq[seq[string]]

template oparser*(parser, body: untyped) =
  var parser: OParser
  body

template add*(parser: OParser, lc: string, fc: string, dis: string, arg, body: untyped) =
  parser.options.add(@[lc, fc, dis])
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

template add*(parser: OParser, lc: string, fc: string, dis: string, body: untyped) =
  parser.options.add(@[lc, fc, dis])
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

proc help*(parser: OParser) =
  echo parser.banner
  for option in parser.options:
    var flag = "    " & option[0] & ", " & option[1]
    if flag.len >= 33:
      echo flag & " ".repeat(37) & option[2]
    else:
      echo flag & " ".repeat(33 - flag.len) & option[2]
