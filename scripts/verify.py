#!/usr/bin/env python
# -*- coding: utf-8 -*-

# fmt.py
# Copyright (c) 2020 Hugh Coleman
#
# This file is part of hughcoleman/fortran, an attempt to investigate the
# FORTRAN programming language and learn about the early days of computing. It
# is released under the MIT License (see LICENSE.)

""" This script accepts a FORTRAN program and runs some basic validation 
checks.
"""

import sys

CHARSET = "123456789 =-ABCDEFGHI+.)JKLMNOPQR-$*/STUVWXYZ0,("

if __name__ == "__main__":
    if len(sys.argv) < 2:
        exit("usage: python {} <fortran program>".format(sys.argv[0]))

    # read list of statements...
    with open(sys.argv[1], "r") as fh:
        statements = fh.read().strip().split("\n")

    labels = {-1: -1} # {label: declaration line}
    sequencing = -1 # track sequence numbering
    for ln, statement in enumerate(statements):
        ln = ln + 1

        # first, check for illegal (ie. non-Hollerith) characters in source file, as
        # these are likely to cause errors
        if any(c not in CHARSET for c in statement):
            print("warn: illegal character on line {}".format(ln))

        # we should also check for lines that exceed the 80-column limit
        if len(statement) > 80:
            print("warn: line {} exceeds the 80-column limit".format(ln))

        # all other parsing rules do not apply to comments
        if (statement.startswith("C")):
            continue

        # extract the different fields from the statement
        label, continuation, expression, sequence = \
            statement[0:5], statement[5:6], statement[6:72], statement[72:80]

        # verify that label is valid
        if any(c not in "0123456789" for c in label.strip()):
            print("warn: illegal character in statement field on line {}".format(ln))

        if label.strip():
            # check for duplicate/badly ordered label declarations
            if int(label) in labels.keys():
                print("warn: duplicate label on line {}".format(ln))
            elif int(label) < max(labels.keys()):
                print("warn: labels badly ordered on line {}".format(ln))

            labels[int(label)] = ln

        # verify that continuation is valid
        if any(c not in "*!23456789" for c in continuation.strip()):
            print("warn: illegal character in continuation field on line {}".format(ln))
        
        # verify that sequence is valid
        if any(c not in "0123456789" for c in sequence.strip()):
            print("warn: illegal character in sequence field on line{}".format(ln))

        if sequence and sequence.startswith(" "):
            print("warn: consider left-justifying sequence number".format(ln))

        if sequence:
            if int(sequence) <= sequencing:
                print("warn: decreasing sequence number on line {}".format(ln))

            sequencing = int(sequence)
