# coding: utf-8
"JSONDict implementation"
try:
    import simplejson as json
except ImportError:
    import json

import os, sys
from tornado.util import ObjectDict
from pathlib import Path

class JSONDict(ObjectDict):
    def printasjson(self):
        return json.dumps(self)

    @classmethod
    def retjson(cls, jsonfile: str):
        "return a JSONDict from a json file"
        with open(jsonfile) as f:
            return cls(json.load(f))


if __name__ == "__main__":
    JSONDict.retjson('j.json')
    jobj = JSONDict.retjson('j.json')
    type(jobj)
