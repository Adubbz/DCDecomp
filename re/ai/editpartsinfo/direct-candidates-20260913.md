# Edit-parts direct candidates

## Completion-event state

`SetCompEvent` and `GetCompEvent` address the selected part through `GetPartsInfo`. Both access the
32-bit word at `EDITPARTS_INFO+0x04`; the setter changes only bit 0 and the getter normalizes that
bit to an integer boolean. This establishes the completion-state field while preserving its other
bits.
