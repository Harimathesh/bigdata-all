#!/usr/bin/env python3
import sys
from collections import defaultdict

mode = sys.argv[1]
if mode=="mapper":
    for line in sys.stdin:
        student, subject, mark = line.strip().split(",")
        print(f"{student}\t{mark}")
elif mode=="reducer":
    d=defaultdict(list)
    for line in sys.stdin:
        student, mark = line.strip().split("\t")
        d[student].append(int(mark))
    for student, marks in d.items():
        avg=sum(marks)/len(marks)
        if avg>80:
            print(f"{student}\tavg={avg:.2f},min={min(marks)},max={max(marks)}")
