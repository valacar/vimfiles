#!/usr/bin/env python3

import sys
import argparse

try:
    from bs4 import BeautifulSoup
    from bs4.formatter import HTMLFormatter
except ImportError:
    sys.stdout.write(sys.stdin.read())
    sys.exit(1)

parser = argparse.ArgumentParser()
parser.add_argument(
    "-i",
    "--indent",
    help="Number of characters to indent each line.",
    type=int,
    default=1,
)
parser.add_argument(
    "-t", "--tabs", help="Use tabs instead of spaces.", action="store_true"
)
args = parser.parse_args()


# Customize the BeautifulSoup HTML formatter
# gets indent width from command line and doesn't sort attributes,
# also allows tabs instead of spaces
class MyFormatter(HTMLFormatter):
    def __init__(self, *args, use_tabs=False, indent=1, **kwargs):
        super(HTMLFormatter, self).__init__(self.HTML, *args, indent=indent, **kwargs)
        if use_tabs:
            self.indent = "\t" * indent

    def attributes(self, tag):
        for k, v in tag.attrs.items():
            yield k, v


soup = BeautifulSoup(sys.stdin, "html.parser", from_encoding="utf-8")
formatter = MyFormatter(indent=args.indent, use_tabs=args.tabs)
sys.stdout.write(soup.prettify(formatter=formatter))

# https://git.launchpad.net/beautifulsoup/tree/bs4/formatter.py
