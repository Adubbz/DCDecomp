# `CDungeonEventMan::SearchDataSwitch` matching notes

The function visits all 96 runtime event records. When an enabled record's
source definition has the requested script number, it starts or stops that
record according to the second argument.

Keeping a runtime-record pointer reaches 91.51923% object similarity. Indexing
the runtime-record array directly reaches 98.75%; removing the source pointer
local produces the same result. In the 98.75% version, MWCC shifts the four
long-lived values from retail's `$19` through `$16` into `$20` through `$17`,
and uses `$17` rather than `$20` for the scaled index. The instruction count,
control flow, calls, data, relocations, and immediates otherwise agree.
