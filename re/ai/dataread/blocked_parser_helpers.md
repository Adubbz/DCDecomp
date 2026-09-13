# Parked cloth parser helpers

The exact Dayuppy bodies remain at
`dc1-decomp-review-1707723/pending/main/clothcfg.cpp`, lines 211 through 326.
The four relevant functions are `GetArg`, `SearchCommand`, `SkipSpace`, and
`CheckChar`; their retail dataread symbols carry the duplicate suffix `__2`.

In the bulk candidate, the bodies compiled and each scored 100.0 only after
being defined with explicit `extern "C"` identifiers containing the full
mangled `__2` names. That spelling bypasses the source-level retail names and
changes the LOCAL helpers into GLOBAL definitions, so integration review
rejected it. The discarded evidence commits were `3f35c243`, `3289e03b`,
`3fc1e34a`, and `d913ea73`; each was judged by `check.sh --json` against the
same successfully linked bulk object.

The bodies are therefore parked unchanged for the boundary work that can map
compiled LOCAL helper symbols onto the retail duplicate names. Their
`INCLUDE_ASM` markers and reference assembly remain in `asm/nonmatchings/dataread/`.
