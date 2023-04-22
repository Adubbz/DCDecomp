## Useful tools
- mips2c
- splat
- decomp-permuter
- asm-differ

The game is optimized at -O2. This has been confirmed by matching buildRoom

Commands:

- mips64r5900el-ps2-elf-as -march=r5900 -32 -Iinclude buildRoom.s
- python3 tools/diff.py -j=main -e buildRoom__Fiiiii 0x1C53C0 0x1C5544
- tools\mwccmips.exe -O2 -c src\dungeon.c
- python3 permuter.py -j 64 work/

TODO: Setup splat

# Makefile

``.PHONY`` ensures make does not treat a target as a file

``+=`` is used to append
``$@`` is an automatic variable that contains the target name
``$<`` name of the first prerequisite

Good Makefile reference: https://gitlab.com/banjo.decomp/banjo-kazooie/-/blob/master/Makefile

# References

binutils is provided by [ps2toolchain-ee](https://github.com/ps2dev/ps2toolchain-ee)

ee-as.exe is sourced from ProDG 2.0 found [here](https://archive.org/details/SNSystemsProDGPs2)


https://stackoverflow.com/questions/19912881/how-to-tell-force-gnu-ld-to-put-a-section-symbol-in-a-specific-part-of-the-out