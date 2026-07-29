#!/usr/bin/env python3
"""Create a decomp.me scratch for one function.

    decompme.py <symbol> [main|title|dun]

Posts what https://decomp.me/new would: the function's reference disassembly as
the target, build/ctx.cpp as the context, and this project's compiler and flags
plus -lang=c++. decomp.me assembles with the same binutils and a prelude that
already defines glabel/alabel/jlabel, so the dumps go over nearly as they are.
"""

import json
import os
import sys
import urllib.error
import urllib.request

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import ref_index  # noqa: E402  (needs the script's own directory on the path)

API = "https://decomp.me/api/scratch"
SCRATCH_URL = "https://decomp.me/scratch/%s"

# mwcc 2.3.3 is what this project builds with; see the top of the README.
COMPILER = "mwcps2-2.3.3-000906"
PLATFORM = "ps2"

# The C++ amalgamation, not the C rendering: decomp.me compiles the context
# with mwcc rather than parsing it, so it wants the project's own language.
# ctx.c is the one m2c reads; see scripts/diff/m2ctx.py.
CTX = "build/ctx.cpp"
FLAGS = "build/compiler_flags.txt"

# mwcc infers the language from the file extension, and decomp.me names the
# scratch's source after the platform rather than after this project, so the
# language has to be stated. Without it the C++ context is parsed as C.
EXTRA_FLAGS = ["-lang=c++"]

# decomp.me's own cc line already passes these, and the include paths point at
# a tree it does not have -- the context is what stands in for the headers.
DROP_FLAGS = {"-c", "-nostdinc", "-stderr"}
DROP_FLAGS_WITH_ARG = {"-i", "-I"}


def compiler_flags():
    """This build's mwcc flags, less the ones decomp.me supplies or cannot use."""
    with open(FLAGS, encoding="utf-8") as f:
        raw = f.read().split()

    out = []
    skip = False
    for flag in raw:
        if skip:
            skip = False
            continue
        if flag in DROP_FLAGS_WITH_ARG:
            skip = True
            continue
        if flag in DROP_FLAGS:
            continue
        out.append(flag)
    return " ".join(out + EXTRA_FLAGS)


def prepare_asm(path):
    """The dump as decomp.me wants it.

    Only the `.include "macro.inc"` has to go: that resolves against this
    tree, and decomp.me prepends its own prelude defining the same macros.
    """
    with open(path, encoding="utf-8") as f:
        lines = f.read().splitlines()
    return "\n".join(l for l in lines if not l.strip().startswith(".include")) + "\n"


def create(symbol, section=None):
    for path, what in ((CTX, "C++ context"), (FLAGS, "compiler flags")):
        if not os.path.exists(path):
            raise SystemExit(
                "decompme: %s is missing (the %s).\n"
                "          Build first: cmake --build build" % (path, what))

    located = ref_index.lookup(symbol, section)
    if located is None:
        raise SystemExit("decompme: %s is in no reference index" % symbol)

    with open(CTX, encoding="utf-8") as f:
        context = f.read()

    payload = {
        "name": symbol,
        "compiler": COMPILER,
        "platform": PLATFORM,
        "compiler_flags": compiler_flags(),
        "context": context,
        "source_code": "// %s\n// Paste an attempt here, or start from decompile.sh.\n" % symbol,
        "diff_label": symbol,
        "target_asm": prepare_asm(located.source),
    }

    req = urllib.request.Request(
        API,
        data=json.dumps(payload).encode("utf-8"),
        headers={
            "Content-Type": "application/json",
            # decomp.me sits behind Cloudflare, which rejects the default
            # urllib agent outright.
            "User-Agent": "dcdecomp-diff.sh (+https://github.com/Adubbz/DCDecomp)",
        },
        method="POST",
    )

    try:
        with urllib.request.urlopen(req, timeout=60) as resp:
            body = json.load(resp)
    except urllib.error.HTTPError as e:
        detail = e.read().decode("utf-8", "replace")[:500]
        raise SystemExit("decompme: POST failed (HTTP %d)\n%s" % (e.code, detail))
    except urllib.error.URLError as e:
        raise SystemExit("decompme: could not reach decomp.me: %s" % e.reason)

    slug = body.get("slug")
    if not slug:
        raise SystemExit("decompme: no slug in the response: %s" % json.dumps(body)[:300])

    print(SCRATCH_URL % slug)
    token = body.get("claim_token")
    if token:
        print("Claim it (once, while logged in): %s/claim?token=%s"
              % (SCRATCH_URL % slug, token), file=sys.stderr)


def main():
    if not 1 <= len(sys.argv) - 1 <= 2:
        raise SystemExit("usage: decompme.py <symbol> [main|title|dun]")
    create(sys.argv[1], sys.argv[2] if len(sys.argv) > 2 else None)


if __name__ == "__main__":
    main()
