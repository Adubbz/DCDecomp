#!/usr/bin/env python3
"""Run tools/mwccgap for one release.

    mwccgap_region.py <mwccgap.py's arguments>

mwccgap reads its INCLUDE_ASM and INCLUDE_RODATA markers straight out of the
source text, before the compiler has seen it, so a marker a `#ifdef PAL` guard
leaves out would still be spliced in. This hands it the source as the release
being built compiles it -- the release is the one the compiler flags name --
and points a marker at that release's own reference assembly.
"""

import io
import os
import re
import runpy
import sys

if "-DPAL" in sys.argv[1:]:
    os.environ["DCDECOMP_REGION"] = "PAL"
else:
    os.environ["DCDECOMP_REGION"] = "NTSC"

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import region  # noqa: E402

MWCCGAP = os.environ.get("MWCCGAP_DIR", "tools/mwccgap")
sys.path.insert(0, MWCCGAP)
from mwccgap.preprocessor import Preprocessor  # noqa: E402

MARKER = re.compile(r'^((?:INCLUDE_ASM|INCLUDE_RODATA)\(")([^"]*)(".*)$')
original = Preprocessor.preprocess_c_file


def preprocess_c_file(self, textio):
    lines = region.active_text(textio.read()).split("\n")
    lines = [MARKER.sub(lambda m: m.group(1) + region.marker_folder(m.group(2)) + m.group(3), line)
             for line in lines]
    return original(self, io.StringIO("\n".join(lines)))


Preprocessor.preprocess_c_file = preprocess_c_file

sys.argv[0] = os.path.join(MWCCGAP, "mwccgap.py")
runpy.run_path(sys.argv[0], run_name="__main__")
