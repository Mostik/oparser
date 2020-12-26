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

