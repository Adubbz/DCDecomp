# Edit-parts direct candidates

## Completion-event state

`SetCompEvent` and `GetCompEvent` address the selected part through `GetPartsInfo`. Both access the
32-bit word at `EDITPARTS_INFO+0x04`; the setter changes only bit 0 and the getter normalizes that
bit to an integer boolean. This establishes the completion-state field while preserving its other
bits.

The getter returns zero for an invalid part index because `GetPartsInfo` supplies null outside the
24-entry catalogue. Retail's `sltu` converts the masked bit into the returned integer boolean.

## `GetNextParts(int)`

Starting after the supplied index, the method walks the part catalogue until `CheckPartsInfo`
accepts a record. It returns that index, or -1 when `GetPartsInfo` reaches the end of the 24-entry
catalogue.

Retail binds `CheckPartsInfo` locally at 0x199F90, directly before this unit's first method. The
current upstream split already defines it in `editloop3.cpp` and links it as a global symbol, so
this source uses that existing contract without moving the translation-unit boundary.

## Remaining unit sweep

The complete attempt-zero sweep covered all eight queue entries left after these ports. `Clear`
and the header-taking `Initialize` produced compilable drafts at 80.0% and 67.6%. `GetRequest`
still needs the request word at `CEditPartsInfo+0x04` represented as a field. `CheckComplete` and
`GetNextPartsNum` need their member calls recovered, while `Save` and `Load` need the established
`CSaveData` accessors. The other `Initialize` needs `EDIT_PARTS_ATRA` from `editatra.hpp` plus its
remaining structure work. Those eight functions are outside this three-port refill cap.
