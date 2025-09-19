#!/usr/bin/env python3
import sys
from collections import defaultdict

mode = sys.argv[1]

if mode=="mapper":
    [print(f"{w}\t1") for line in sys.stdin for w in line.strip().split()]
elif mode=="reducer":
    d=defaultdict(int)
    [d.__setitem__(w,d[w]+int(c)) for line in sys.stdin for w,c in [line.strip().split("\t")]]
    [print(f"{w}\t{v}") for w,v in d.items()]
