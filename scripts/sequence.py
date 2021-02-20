#!/usr/bin/env python
# -*- coding: utf-8 -*-

# sequence.py
# Copyright (c) 2020 Hugh Coleman
#
# This file is part of hughcoleman/fortran, an attempt to investigate the
# FORTRAN programming language and learn about the early days of computing. It
# is released under the MIT License (see LICENSE.)

""" This script accepts a FORTRAN program and automatically sequences the
statements.
"""

import sys

if __name__ == "__main__":
    if len(sys.argv) < 2:
        exit(f"usage: python {sys.argv[0]} <fortran program>")

    # read list of statements...
    with open(sys.argv[1], "r") as fh:
        statements = fh.read().strip().split("\n")

    # ...and sequence them
    for i, statement in enumerate(statements):
        print(statement[:72].ljust(72) + str(i + 1).ljust(8))
