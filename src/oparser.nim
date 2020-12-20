import parseopt, os
var params = commandLineParams()

template oparser*(body: untyped) =
  body
  

template add*(lc: string, fc: string, dis: string, body: untyped) =
  echo params
  for kind, key, val in getopt(params):
    echo "kind ", kind
    echo "key ", key
    echo "lc ", lc
    echo (key == lc)
    echo (key == fc)
    if (kind == cmdShortOption):
      if (("-" & key) == lc):
        body
    elif (kind == cmdLongOption):
      if (("--" & key) == fc):
        body
    elif (kind == cmdArgument):
      if (key == fc):
        body