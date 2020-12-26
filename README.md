# oparser
```nim
import oparser

oparser(parser):
  parser.banner = "Usage: app [arguments]"
  parser.add("-w", "--welcome", "Say Welcome!"):
    echo "Welcome!"
  parser.add("-s", "--say", "Say my phrase", myphrase):
    echo "Say: ", myphrase
  parser.add("-v", "--version", "Application version"):
    echo "Version 0.0.1"
  parser.add("-h", "--help", "Show this help"):
    parser.help
    quit()
```

```
>test.exe -w
Welcome!

>test.exe --say:"Say my name"
Say: Say my name

>test.exe -v
Version 0.0.1

>test.exe -h
Usage: app [arguments]
    -w, --welcome                Say Welcome!
    -s, --say                    Say my phrase
    -v, --version                Application version
    -h, --help                   Show this help
```
