# PTS archive lookup

`SearchPTS` treats a PTS archive as a 16-byte header followed by fixed
0x30-byte file records. The header word at offset 0x04 is the record count.
Each record starts with a 16-byte name and stores its file offset at 0x10.

The name overload strips directory components from the requested path before
comparing it with each record. The index overload checks only the upper bound,
matching retail behavior for negative indices. Its byte-offset expression is
kept explicit because that form produces retail's multiply/add/load sequence;
introducing a typed record pointer changes register allocation.
