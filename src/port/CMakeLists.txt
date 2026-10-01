# The x64 port: the game's code built with clang as C++26 for the host.
#
# src/ps2 holds only the game's code as the PS2 build compiles it. Each of its
# units is copied into the build tree with its MWCC inline assembly replaced
# (cmake/StubAsm.cmake), the copies are compiled, and the objects are merged
# into one relocatable object whose definitions are all made weak. Units in
# src/port are compiled normally, so any function or variable defined there
# takes precedence at link time and the src/ps2 definition is discarded. That
# is how the PS2-only parts are replaced: the SDK, the Metrowerks runtime and
# the functions that touch the hardware directly.
#
# The port is always the PAL release.

if(NOT CMAKE_CXX_COMPILER)
    set(CMAKE_CXX_COMPILER clang++)
endif()
enable_language(CXX)

set(CMAKE_CXX_STANDARD 26)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# llvm-objcopy, not GNU objcopy: its --weaken leaves undefined references
# strong, so a missing replacement is still a link error.
find_program(OBJCOPY NAMES llvm-objcopy llvm-objcopy-19 REQUIRED)
find_program(LD_RELOCATABLE NAMES ld.lld REQUIRED)

set(PS2_DIR ${CMAKE_SOURCE_DIR}/src/ps2)
file(GLOB_RECURSE PS2_SOURCES CONFIGURE_DEPENDS RELATIVE ${PS2_DIR} ${PS2_DIR}/*.cpp)
file(GLOB_RECURSE PORT_SOURCES CONFIGURE_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)
# tools/mwccgap compiles a temporary beside the source it came from.
list(FILTER PS2_SOURCES EXCLUDE REGEX "(^|/)tmp[^/]*$")

# The copies of src/ps2 that clang compiles.
set(STUB_ASM ${CMAKE_CURRENT_SOURCE_DIR}/cmake/StubAsm.cmake)
set(PS2_COPIES "")
foreach(unit IN LISTS PS2_SOURCES)
    set(copy ${CMAKE_CURRENT_BINARY_DIR}/ps2/${unit})
    add_custom_command(OUTPUT ${copy}
        COMMAND ${CMAKE_COMMAND} -DSOURCE=${PS2_DIR}/${unit} -DOUTPUT=${copy}
                -DDISPLAY=src/ps2/${unit} -P ${STUB_ASM}
        DEPENDS ${PS2_DIR}/${unit} ${STUB_ASM}
        COMMENT "Stubbing the assembly in src/ps2/${unit}"
        VERBATIM)
    list(APPEND PS2_COPIES ${copy})
    # shims/<unit>.h is included ahead of a unit that needs MWCC-only
    # constructs supplied or renamed before clang can compile it.
    string(REGEX REPLACE "\\.cpp$" ".h" shim ${CMAKE_CURRENT_SOURCE_DIR}/shims/${unit})
    if(EXISTS ${shim})
        set_source_files_properties(${copy} PROPERTIES
            COMPILE_OPTIONS "-include;${shim}" OBJECT_DEPENDS ${shim})
    endif()
endforeach()

# What both halves are compiled with. The game was written for MWCC, which
# accepts constructs clang rejects by default: pointers truncated to 32-bit
# integers, narrowing in braced initialisers and the register keyword.
add_library(dc_options INTERFACE)
target_compile_definitions(dc_options INTERFACE DC_PC PAL)
target_include_directories(dc_options INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/include ${CMAKE_SOURCE_DIR}/include ${CMAKE_SOURCE_DIR}/include/sce)
target_compile_options(dc_options INTERFACE
    -include ${CMAKE_CURRENT_SOURCE_DIR}/include/pc_prelude.h
    -fms-extensions -ffunction-sections -fdata-sections
    -Wno-register -Wno-c++11-narrowing -Wno-return-mismatch)

# src/ps2: semantic interposition keeps clang from inlining or folding a call
# to a function src/port may replace, so every such call reaches the linker.
add_library(dc_ps2 OBJECT ${PS2_COPIES})
target_link_libraries(dc_ps2 PRIVATE dc_options)
target_compile_options(dc_ps2 PRIVATE -fPIC -fsemantic-interposition)
# Retail's code reads locals it never set and falls off the end of functions
# that return a value, and src/ps2 keeps both because the match depends on
# them. MWCC gave each a defined if arbitrary result; these flags give the port
# a defined one too, along with the type punning and wraparound the code assumes.
target_compile_options(dc_ps2 PRIVATE -ftrivial-auto-var-init=zero -fno-strict-return
    -fno-strict-aliasing -fwrapv)
# What is left on warns about behaviour the port may still need to answer for:
# uninitialised reads, missing returns, format strings, overlapping copies and
# the like. What is turned off describes how MWCC-era source is spelled -- string
# literals as char *, MWCC's pragmas, 32-bit pointer casts, the unused names
# and expressions matching leaves behind -- which src/ps2 cannot change without
# changing what MWCC compiles.
target_compile_options(dc_ps2 PRIVATE -Wall -Wno-writable-strings -Wno-unknown-pragmas
    -Wno-mismatched-tags -Wno-missing-braces -Wno-char-subscripts -Wno-overloaded-virtual
    -Wno-pointer-to-int-cast -Wno-int-to-pointer-cast -Wno-int-to-void-pointer-cast
    -Wno-void-pointer-to-int-cast -Wno-unused-variable -Wno-unused-but-set-variable
    -Wno-unused-local-typedef -Wno-unused-label -Wno-unused-function -Wno-unused-value
    -Wno-unused-const-variable -Wno-undefined-internal -Wno-self-assign -Wno-deprecated-volatile)

# A few names are defined by more than one unit -- copies the PS2 build tells
# apart by renaming them per object (config/*/object_fixups.json). The merge
# keeps the first definition of each; docs/PC.md lists them.
set(PS2_OBJECT ${CMAKE_BINARY_DIR}/dc_ps2.o)
add_custom_command(OUTPUT ${PS2_OBJECT}
    COMMAND ${LD_RELOCATABLE} -r --allow-multiple-definition -o ${PS2_OBJECT} $<TARGET_OBJECTS:dc_ps2>
    COMMAND ${OBJCOPY} --weaken ${PS2_OBJECT}
    DEPENDS $<TARGET_OBJECTS:dc_ps2>
    COMMAND_EXPAND_LISTS
    COMMENT "Merging src/ps2 into one weak object")

# The executable is linked without PIE so its code and data sit below 4 GiB,
# where the game's 32-bit pointer casts still round-trip.
add_executable(darkcloud ${PORT_SOURCES} ${PS2_OBJECT})
set_target_properties(darkcloud PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
target_link_libraries(darkcloud PRIVATE dc_options)
# The game's headers trip a few warnings that only describe how MWCC's source
# was written, not a problem in the port.
target_compile_options(darkcloud PRIVATE -Wall -Wno-mismatched-tags -Wno-unused-label
    -Wno-overloaded-virtual -Wno-unused-function)
# ItemPutListTbl12_bytes is a second name for the table, as the PS2 build
# gives it through object_fixups.json.
target_link_options(darkcloud PRIVATE -fuse-ld=lld -no-pie -Wl,--gc-sections -Wl,--error-limit=0
    -Wl,--defsym=ItemPutListTbl12_bytes=ItemPutListTbl12)
