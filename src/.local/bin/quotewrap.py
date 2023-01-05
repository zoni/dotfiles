#!/usr/bin/env python

"""quotewrap

Word-wrap or apply quotation marks to input
Accepts either data on stdin or a list of filenames to read

Released into public domain, originally written by Nick Groenen <nick@groenen.me>
"""

import sys
from os.path import basename
from textwrap import TextWrapper

def mangle(input, quote=False, wrap=False):
	"""Quote and/or wrap input

	input: An iterable yielding strings
	quote: Boolean, quote input?
	wrap: Boolean, word-wrap input?
	yields: Strings
	"""
	initial_indent = "> " if quote else ""
	subsequent_indent = "> " if quote else ""
	if wrap:
		wrapper = TextWrapper(initial_indent=initial_indent, subsequent_indent=subsequent_indent, width=74, expand_tabs=False, replace_whitespace=False, drop_whitespace=False)
		for line in input:
			yield "\n".join(wrapper.wrap(line))
	else:
		for line in input:
			yield "{0}{1}".format(initial_indent, line)

wrap = basename(sys.argv[0]) == "wrap" or "--wrap" in sys.argv
quote = basename(sys.argv[0]) == "quote" or "--quote" in sys.argv

if len(sys.argv) < 2 or (len(sys.argv) == 2 and (sys.argv[1] == "--wrap" or sys.argv[1] == "--quote")):
	for line in mangle(sys.stdin, quote, wrap):
		sys.stdout.write(line)
else:
	for arg in sys.argv[1:]:
		if arg == "--wrap" or arg == "--quote": continue
		for line in mangle(open(arg), quote, wrap):
			sys.stdout.write(line)
