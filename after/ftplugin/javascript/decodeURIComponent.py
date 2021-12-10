#!/usr/bin/env python3

import sys
import urllib.parse

# Translates %xx escapes to single letter equivalent,
# e.g. "search+query%20%28correct%29" to "search+query (correct)"
# Note: Intended to be used as a filter in Vim, so it reads stdin and writes to stdout

sys.stdout.write(urllib.parse.unquote(sys.stdin.read()))
