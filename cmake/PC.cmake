# The x64 port: the game's code built with clang as C++26 for the host.
#
# Every unit in src/common is compiled as it is, then the objects are merged
# into one relocatable object whose definitions are all made weak. Units in
# src/pc are compiled normally, so any function or variable defined there takes
# precedence at link time and the common definition is discarded. That is how
# the PS2-only parts are replaced: the SDK, the Metrowerks runtime, functions
# that touch the hardware directly, and the functions whose bodies are MWCC
# inline assembly (compiled out of src/common under DC_PC). Each replacement is
# a stub that asserts when it is called.
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

file(GLOB_RECURSE COMMON_SOURCES CONFIGURE_DEPENDS ${CMAKE_SOURCE_DIR}/src/common/*.cpp)
file(GLOB_RECURSE PC_SOURCES CONFIGURE_DEPENDS ${CMAKE_SOURCE_DIR}/src/pc/*.cpp)
# tools/mwccgap compiles a temporary beside the source it came from.
list(FILTER COMMON_SOURCES EXCLUDE REGEX "/tmp[^/]*$")

# What both halves are compiled with. The game was written for MWCC, which
# accepts constructs clang rejects by default: pointers truncated to 32-bit
# integers, narrowing in braced initialisers and the register keyword.
add_library(dc_options INTERFACE)
target_compile_definitions(dc_options INTERFACE DC_PC PAL)
target_include_directories(dc_options INTERFACE
    ${CMAKE_SOURCE_DIR}/src/pc/include ${CMAKE_SOURCE_DIR}/include ${CMAKE_SOURCE_DIR}/include/sce)
target_compile_options(dc_options INTERFACE
    -include ${CMAKE_SOURCE_DIR}/src/pc/include/pc_prelude.h
    -fms-extensions -ffunction-sections -fdata-sections
    -Wno-register -Wno-c++11-narrowing -Wno-return-mismatch)

# src/common: semantic interposition keeps clang from inlining or folding a
# call to a function src/pc may replace, so every such call reaches the linker.
add_library(dc_common OBJECT ${COMMON_SOURCES})
target_link_libraries(dc_common PRIVATE dc_options)
target_compile_options(dc_common PRIVATE -w -fPIC -fsemantic-interposition)

# A few names are defined by more than one unit -- copies the PS2 build tells
# apart by renaming them per object (config/*/object_fixups.json). The merge
# keeps the first definition of each; docs/PC.md lists them.
set(COMMON_OBJECT ${CMAKE_BINARY_DIR}/dc_common.o)
add_custom_command(OUTPUT ${COMMON_OBJECT}
    COMMAND ${LD_RELOCATABLE} -r --allow-multiple-definition -o ${COMMON_OBJECT} $<TARGET_OBJECTS:dc_common>
    COMMAND ${OBJCOPY} --weaken ${COMMON_OBJECT}
    DEPENDS $<TARGET_OBJECTS:dc_common>
    COMMAND_EXPAND_LISTS
    COMMENT "Merging src/common into one weak object")

# The executable is linked without PIE so its code and data sit below 4 GiB,
# where the game's 32-bit pointer casts still round-trip.
add_executable(darkcloud ${PC_SOURCES} ${COMMON_OBJECT})
target_link_libraries(darkcloud PRIVATE dc_options)
# The game's headers trip a few warnings that only describe how MWCC's source
# was written, not a problem in the port.
target_compile_options(darkcloud PRIVATE -Wall -Wno-mismatched-tags -Wno-unused-label
    -Wno-overloaded-virtual -Wno-unused-function)
# ItemPutListTbl12_bytes is a second name for the table, as the PS2 build
# gives it through object_fixups.json.
target_link_options(darkcloud PRIVATE -fuse-ld=lld -no-pie -Wl,--gc-sections -Wl,--error-limit=0
    -Wl,--defsym=ItemPutListTbl12_bytes=ItemPutListTbl12)
