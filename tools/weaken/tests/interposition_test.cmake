# ctest driver for interposition_check.py: a "port" object replaces Add, and "game" objects call it the
# way the port's build compiles ps2/src (through the linker) and the ways that bypass a replacement (an
# ELF .L$local alias, a relocation against Add's own section, a Mach-O branch to a local label).
#
# -DPYTHON= -DCHECK= -DWEAKEN= -DCXX= -DNM= -DOBJDUMP= -DOBJCOPY= -DWORK=

function(check expected_status port game)
    execute_process(COMMAND ${PYTHON} ${CHECK} --nm ${NM} --objdump ${OBJDUMP} ${WORK}/${game} ${WORK}/${port}
        RESULT_VARIABLE status OUTPUT_VARIABLE out ERROR_VARIABLE err)
    if(NOT status STREQUAL expected_status)
        message(FATAL_ERROR "${game}: exited ${status}, expected ${expected_status}\n${out}${err}")
    endif()
    if(ARGC GREATER 3 AND NOT err MATCHES "${ARGV3}")
        message(FATAL_ERROR "${game}: no match for '${ARGV3}' in:\n${err}")
    endif()
endfunction()

function(compile target source object)
    execute_process(COMMAND ${CXX} --target=${target} -c ${ARGN} ${WORK}/${source} -o ${WORK}/${object}
        RESULT_VARIABLE status ERROR_VARIABLE err)
    if(NOT status EQUAL 0)
        message(FATAL_ERROR "compiling ${source} for ${target} failed:\n${err}")
    endif()
endfunction()

function(weaken object)
    if(object MATCHES "^macho")
        execute_process(COMMAND ${WEAKEN} ${WORK}/${object} RESULT_VARIABLE status)
    else()
        execute_process(COMMAND ${OBJCOPY} --weaken ${WORK}/${object} RESULT_VARIABLE status)
    endif()
    if(NOT status EQUAL 0)
        message(FATAL_ERROR "weakening ${object} failed")
    endif()
endfunction()

file(REMOVE_RECURSE ${WORK})
file(MAKE_DIRECTORY ${WORK})
file(WRITE ${WORK}/port.cpp "extern \"C\" int Add(int a, int b) { return a - b; }\n")
file(WRITE ${WORK}/game.cpp [=[
extern "C" int Add(int a, int b) { return a + b; }
extern "C" int Twice(int a) { return Add(a, a) * 3; }
]=])
file(WRITE ${WORK}/game.s [=[
    .text
    .globl _Add
    .p2align 2
_Add:
Ladd_local:
    add w0, w0, w1
    ret
    .globl _Twice
    .p2align 2
_Twice:
    bl Ladd_local
    ret
    .subsections_via_symbols
]=])

compile(x86_64-linux-gnu port.cpp elf_port.o)
compile(arm64-apple-macos14 port.cpp macho_port.o)

compile(x86_64-linux-gnu game.cpp elf_interposable.o -O1 -fPIC -fsemantic-interposition -ffunction-sections)
weaken(elf_interposable.o)
check(0 elf_port.o elf_interposable.o)

compile(x86_64-linux-gnu game.cpp elf_local_alias.o -O1 -fPIC -fno-semantic-interposition -fno-inline-functions)
weaken(elf_local_alias.o)
check(1 elf_port.o elf_local_alias.o "Twice calls Add without a relocation")

compile(x86_64-linux-gnu game.cpp elf_section.o -O0 -fPIC -fno-semantic-interposition -ffunction-sections)
weaken(elf_section.o)
check(1 elf_port.o elf_section.o "Twice calls Add through \\.text\\.Add")

compile(x86_64-linux-gnu game.cpp elf_strong.o -O1 -fPIC -fsemantic-interposition -ffunction-sections)
check(1 elf_port.o elf_strong.o "Add is a strong definition")

compile(arm64-apple-macos14 game.cpp macho_interposable.o -O1 -fno-inline-functions -Xclang -fsemantic-interposition)
weaken(macho_interposable.o)
check(0 macho_port.o macho_interposable.o)

compile(arm64-apple-macos14 game.s macho_local_label.o)
weaken(macho_local_label.o)
check(1 macho_port.o macho_local_label.o "_Twice calls _Add without a relocation")
