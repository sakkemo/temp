# python-json cheat sheet
## tab-completion in python interpreter:
import rlcompleter, readline
readline.parse_and_bind('tab: complete')


import json

## Data type equivalents:
# JSON          Python
# object        dict
# array         list
# string        unicode
# number (int)  int, long
# number (real) float
# true          True
# false         False
# null          None

## Python data types:
# dict:
mydict = {'key1' : 0, 'key2': 1}
# list:
mylist = ['one', 'two', 'three', u'f\xc3\xbcnf']
# unicode:
myustring = u'öäöä'
# in python no value is None
empty = None

## Python to JSON

# json.dumps: Serialize ``obj`` to a JSON formatted ``str``
mylist = ['foo', {'bar': ('baz', None, 1.0, 2)}]
json.dumps(['foo', {'bar': ('baz', None, 1.0, 2)}])
json.dumps(['foo', {'bar': ('baz', None, 1.0, 2)}], indent=4, sort_keys=True, separators=(',', ': '))
print json.dumps("\"foo\bar")
print json.dumps(u'\u1234')
print json.dumps('\\')
print json.dumps({"c": 0, "b": 0, "a": 0}, sort_keys=True)
from StringIO import StringIO
io = StringIO()
json.dump(['streaming API'], io)
io.getvalue()

# json.dump: Serialize ``obj`` as a JSON formatted stream to ``fp`` (a``.write()``-supporting file-like object).
a = file('./python/jsonout.json', 'w')
json.dump(mylist, a, indent=4, sort_keys=True, separators=(',', ': '))
a.close()


## JSON to python
a = file('./python/jsonout.json', 'r')
anotherlist = json.load(a)
a.close()


