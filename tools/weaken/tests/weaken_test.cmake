# ctest driver for weaken: builds a small arm64 Mach-O object from source, weakens it and checks the
# symbol table with the LLVM tools, then checks the refusals. Runs on any host: the sources need no SDK.
#
# -DWEAKEN= -DCXX= -DNM= -DREADOBJ= -DOBJDUMP= -DLIPO= -DOBJCOPY= -DWORK=

function(run expected_status)
    execute_process(COMMAND ${ARGN} RESULT_VARIABLE status OUTPUT_VARIABLE out ERROR_VARIABLE err)
    if(NOT status STREQUAL expected_status)
        message(FATAL_ERROR "${ARGN}\nexited ${status}, expected ${expected_status}\n${out}${err}")
    endif()
    set(out "${out}" PARENT_SCOPE)
    set(err "${err}" PARENT_SCOPE)
endfunction()

function(expect haystack pattern what)
    if(NOT haystack MATCHES "${pattern}")
        message(FATAL_ERROR "${what}: no match for '${pattern}' in:\n${haystack}")
    endif()
endfunction()

function(reject haystack pattern what)
    if(haystack MATCHES "${pattern}")
        message(FATAL_ERROR "${what}: unexpected match for '${pattern}' in:\n${haystack}")
    endif()
endfunction()

file(REMOVE_RECURSE ${WORK})
file(MAKE_DIRECTORY ${WORK})
file(WRITE ${WORK}/fixture.cpp [=[
extern int Missing(int);
static int Hidden(int value) { return value * 7; }
int counter = 3;
int Add(int a, int b) { return a + b + counter + Hidden(a); }
int Twice(int a) { return Missing(Add(a, a)); }
]=])

run(0 ${CXX} --target=arm64-apple-macos14 -O1 -c ${WORK}/fixture.cpp -o ${WORK}/strong.o)
file(COPY_FILE ${WORK}/strong.o ${WORK}/weak.o)
run(0 ${WEAKEN} ${WORK}/weak.o)

run(0 ${OBJDUMP} --macho --private-headers ${WORK}/weak.o)
expect("${out}" "MH_MAGIC_64 +ARM64 +ALL +0x00 +OBJECT" "header")

run(0 ${NM} -m ${WORK}/weak.o)
set(nm "${out}")
foreach(symbol __Z3Addii __Z5Twicei _counter)
    expect("${nm}" "\\) weak external ${symbol}\n" "${symbol} weakened")
endforeach()
expect("${nm}" "\\(undefined\\) external __Z7Missingi\n" "the reference stays strong")
reject("${nm}" "weak external __ZL6Hiddeni" "a file-local symbol is left alone")

run(0 ${READOBJ} --symbols ${WORK}/weak.o)
string(REGEX MATCHALL "WeakDef \\(0x80\\)" weak_defs "${out}")
list(LENGTH weak_defs count)
if(NOT count EQUAL 3)
    message(FATAL_ERROR "expected 3 WeakDef symbols, found ${count}:\n${out}")
endif()

# Only n_desc may change: the code, the relocations and the size stay as they were.
run(0 ${OBJDUMP} -d -r ${WORK}/strong.o)
string(REPLACE "strong.o" "" before "${out}")
run(0 ${OBJDUMP} -d -r ${WORK}/weak.o)
string(REPLACE "weak.o" "" after "${out}")
if(NOT before STREQUAL after)
    message(FATAL_ERROR "the disassembly changed")
endif()
file(SIZE ${WORK}/strong.o strong_size)
file(SIZE ${WORK}/weak.o weak_size)
if(NOT strong_size EQUAL weak_size)
    message(FATAL_ERROR "size changed from ${strong_size} to ${weak_size}")
endif()

# The same bytes llvm-objcopy --weaken writes, and running twice changes nothing.
file(COPY_FILE ${WORK}/strong.o ${WORK}/objcopy.o)
run(0 ${OBJCOPY} --weaken ${WORK}/objcopy.o)
file(SHA256 ${WORK}/weak.o weak_hash)
file(SHA256 ${WORK}/objcopy.o objcopy_hash)
if(NOT weak_hash STREQUAL objcopy_hash)
    message(FATAL_ERROR "weaken and llvm-objcopy --weaken disagree")
endif()
run(0 ${WEAKEN} ${WORK}/weak.o)
file(SHA256 ${WORK}/weak.o again_hash)
if(NOT again_hash STREQUAL weak_hash)
    message(FATAL_ERROR "a second run changed the file")
endif()

run(0 ${CXX} --target=x86_64-apple-macos14 -O1 -c ${WORK}/fixture.cpp -o ${WORK}/x86_64.o)
run(0 ${LIPO} -create ${WORK}/strong.o ${WORK}/x86_64.o -output ${WORK}/fat.o)
file(SHA256 ${WORK}/fat.o fat_hash)
run(3 ${WEAKEN} ${WORK}/fat.o)
expect("${err}" "universal \\(fat\\) file" "fat input refused")
file(SHA256 ${WORK}/fat.o fat_after)
if(NOT fat_after STREQUAL fat_hash)
    message(FATAL_ERROR "a refused file was modified")
endif()

run(0 ${CXX} --target=x86_64-linux-gnu -c ${WORK}/fixture.cpp -o ${WORK}/elf.o)
run(3 ${WEAKEN} ${WORK}/elf.o)
expect("${err}" "not a Mach-O file" "ELF input refused")

run(2 ${WEAKEN} ${WORK}/missing.o)
expect("${err}" "cannot open" "missing file")
run(1 ${WEAKEN})
