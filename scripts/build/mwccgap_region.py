#!/usr/bin/env python3
"""Run tools/mwccgap on a source as the release being built compiles it.

    mwccgap_region.py <mwccgap.py's arguments>

mwccgap reads INCLUDE_ASM markers straight out of the source text, before the
compiler has seen it, so a marker a `#ifdef PAL` guard leaves out would still
be spliced in -- and a unit that defines the function in the other branch
would then have no gap for it. This hands mwccgap the source with the lines
the release leaves out blanked (region.active_text), the release being the one
DCDECOMP_REGION names.
"""

import io
import os
import runpy
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import region  # noqa: E402

MWCCGAP = os.environ.get("MWCCGAP_DIR", "tools/mwccgap")
sys.path.insert(0, MWCCGAP)
from mwccgap.preprocessor import Preprocessor  # noqa: E402

original = Preprocessor.preprocess_c_file


def preprocess_c_file(self, textio):
    return original(self, io.StringIO(region.active_text(textio.read())))


Preprocessor.preprocess_c_file = preprocess_c_file
script = os.path.join(MWCCGAP, "mwccgap.py")
sys.argv = [script] + sys.argv[1:]
runpy.run_path(script, run_name="__main__")
