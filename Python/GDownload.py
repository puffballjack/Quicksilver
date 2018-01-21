#!/usr/local/bin/env python3
from urllib.parse import urlparse
import sys
sys.path.append('/Users/mac/Library/Application Support/Quicksilver/Python/pyperclip-1.5.27')
import pyperclip
#url = "https://drive.google.com/file/d/0B0HSZQ6LzpOQRlgwckxvNlNubFU/view?usp=sharing"
url = sys.argv[1]
parsed = urlparse(url)


pathlist = parsed.path.split("/")
pathlist.remove('')

newpath = "/".join(pathlist)
#url = parsed.scheme + '://' + parsed.netloc + '/' + newpath
if pathlist[0] != 'file':
		url = 'https://drive.google.com/uc?export=download&id=' + pathlist[4]
else:
	url = 'https://drive.google.com/uc?export=download&id=' + pathlist[2]

pyperclip.copy(url)

quit()