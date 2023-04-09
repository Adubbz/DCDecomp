configure: WARNING: libdebuginfod is missing or unusable; some features may be unavailable.

configure: WARNING: no enhanced curses library found; disabling TUI


## Dumping symbols
``bin\objdump.exe --syms rom\SCUS_971.11 | grep "F main" > symbols.txt``

Then apply regex:

## References
---
- https://github.com/Xeeynamo/croc/
https://github.com/doldecomp/melee/