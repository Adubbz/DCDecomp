# `ebattle_loop` analysis

## Provenance

The bodies of the fourteen functions matched here come from Dayuppy's Dark
Cloud decompilation at commit `1707723`. Each was restyled to this repository's
headers and names and judged against the MAIN-image reference assembly on its
own. The similarly named `CameraAutoMove` candidate belongs to the DUN image
and is not part of this cohort.

## Enemy-battle and editor state

The small-data globals used by these functions form two adjacent groups. The
enemy-battle group stores the diagnostic mode and confirmation-effect timer,
kind, and button. The editor group stores the camera-view mode, the character
and fishing state, and the horizontal and vertical camera angles. Their types
come directly from the word and floating-point loads and stores in the matched
functions.

`keylock` has global linkage in retail and returns the low two bits of the
character-control state. The stick helpers in this unit call it before reading
editor input.

## Ladder event setup

`EdInitHashigo` fills the established `ED_EVENT_INFO` fields. Event kind 4
reverses the first two vector arguments and clears the first integer argument;
other kinds keep the vectors in parameter order and set that integer to one.
The third vector is the event rotation. The function also copies the event
point's side and linked value, and converts the fourth component of its unknown
vector at offset `0x60` to the first flag argument.
