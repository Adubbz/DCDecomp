# Texture animation record initialization

`CTexAnimeData::Initialize` marks the halfwords at offsets `0x00`, `0x06`,
`0x08`, and `0x20` with `-1`. It clears the halfwords at offsets `0x02` and
`0x04`, both 0x18-byte regions beginning at `0x08` and `0x20`, the six
halfwords from `0x38` through `0x42`, and the five words from `0x44` through
`0x54`.

The writes at `0x08` and `0x20` occur after their containing regions are
cleared. The retail assembly proves each field's offset and width; their
semantic roles remain unknown, so the header retains offset-based names.
