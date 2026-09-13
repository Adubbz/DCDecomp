# Dataset direct candidates

## `CCollision::PickUpNearPoly(CCPoly *, const CBoxVu0 &)`

The base collision interface supplies a no-result fallback for the bounded polygon query. Retail
clears the integer return register and returns without reading either argument, matching the other
base-class query stubs nearby.

## `InitializeDataBuffer()`

The routine clears the complete embedded arena with `memset`, then reserves water storage and two
equal active-data banks. The three `paddub`/`sw` pairs copy allocator returns into each allocator's
base field while preserving retail's argument-register allocation.

## `SetPacketReadBuffer(int, int)`

The routine reserves the read area first, followed by two equally sized VIF packet buffers and a
2,048-quadword scratch arena. It publishes the file-local scratch allocator through
`WorkBuffer__2`, the current split's disambiguated name for retail `WorkBuffer`, and prints the
embedded arena's resulting occupancy.

Its `"%d/%d\n"` literal replaces the residual `@199` `INCLUDE_RODATA`. Leaving both copies in the
object grows the pre-BSS image by 0x10 and shifts the dataset allocation run; removing the residual
include keeps every referenced global at its retail address.
