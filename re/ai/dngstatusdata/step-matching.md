# `CUserStatus::Step` matching note

Dayuppy's exact source body produces the retail 226 instructions after mapping
its field names to the typed `CUserStatus` layout.

- The existing guarded body compiled to 904 bytes at 96.969025%.
- Dayuppy's original declaration and member-access order compiled to the retail 904 bytes at 99.358406%. The first 500 bytes match; the remaining differences are temporary-register choices in the two six-character interpolation loops.
- Reusing one function-scope loop index for both loops compiled to 904 bytes at 97.85398% and changed the loop-condition allocation as well.

The decisive source details are the function-scope `drain` and `dungeon`
locals, direct repeated reads of `NowWeaponHave->flags`, and a separately
declared `int i` in each of the water and life interpolation loops.

Dayuppy's private decompilation was used with permission and remains credited here; it is not included in this repository.
