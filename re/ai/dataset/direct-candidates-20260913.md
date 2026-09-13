# Dataset direct candidates

## `CCollision::PickUpNearPoly(CCPoly *, const CBoxVu0 &)`

The base collision interface supplies a no-result fallback for the bounded polygon query. Retail
clears the integer return register and returns without reading either argument, matching the other
base-class query stubs nearby.

## `InitializeDataBuffer()`

The routine clears the complete embedded arena with `memset`, then reserves water storage and two
equal active-data banks. The three `paddub`/`sw` pairs copy allocator returns into each allocator's
base field while preserving retail's argument-register allocation.
