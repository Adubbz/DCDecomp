# Dataset direct candidates

## `CCollision::PickUpNearPoly(CCPoly *, const CBoxVu0 &)`

The base collision interface supplies a no-result fallback for the bounded polygon query. Retail
clears the integer return register and returns without reading either argument, matching the other
base-class query stubs nearby.
