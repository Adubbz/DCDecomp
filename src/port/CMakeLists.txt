# The x64 port: the game's code built with clang as C++26 for the host.
#
# src/ps2 holds only the game's code as the PS2 build compiles it. Its units are
# compiled as they are and merged into one relocatable object whose definitions
# are all made weak. Units in src/port are compiled normally, so any function or
# variable defined there takes precedence at link time and the src/ps2
# definition is discarded. That is how the PS2-only parts are replaced: the SDK,
# the Metrowerks runtime, the functions that touch the hardware directly and
# those written in assembly.
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
# darkcloud is position-independent (DC_LINK_OPTIONS below).
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# The LLVM tools are looked up beside the compiler first: Homebrew's llvm is
# keg-only and apt.llvm.org's unversioned names live in /usr/lib/llvm-N/bin.
get_filename_component(compiler_dir ${CMAKE_CXX_COMPILER} DIRECTORY)
file(REAL_PATH ${CMAKE_CXX_COMPILER} compiler_path)
get_filename_component(compiler_real_dir ${compiler_path} DIRECTORY)
set(LLVM_TOOL_HINTS ${compiler_dir} ${compiler_real_dir})
# llvm-objcopy, not GNU objcopy: its --weaken leaves undefined references
# strong, so a missing replacement is still a link error. It handles Mach-O
# too (LLVM 20 sets N_WEAK_DEF, byte for byte what tools/weaken writes).
find_program(OBJCOPY NAMES llvm-objcopy llvm-objcopy-19 HINTS ${LLVM_TOOL_HINTS} REQUIRED)
find_program(LLVM_NM NAMES llvm-nm HINTS ${LLVM_TOOL_HINTS} REQUIRED)
find_program(LLVM_OBJDUMP NAMES llvm-objdump HINTS ${LLVM_TOOL_HINTS} REQUIRED)
find_program(LLVM_READOBJ NAMES llvm-readobj HINTS ${LLVM_TOOL_HINTS} REQUIRED)
find_program(LLVM_LIPO NAMES llvm-lipo lipo HINTS ${LLVM_TOOL_HINTS} REQUIRED)
if(APPLE)
    # ld64.lld has no -r ("not yet implemented" through LLVM 20); Apple's ld does,
    # and it is the linker clang drives for the final link too.
    find_program(LD_RELOCATABLE NAMES ld PATHS /usr/bin NO_DEFAULT_PATH REQUIRED)
    set(DC_MACHO_WEAKEN objcopy CACHE STRING "What weakens the merged Mach-O object: objcopy or tool")
    set_property(CACHE DC_MACHO_WEAKEN PROPERTY STRINGS objcopy tool)
else()
    find_program(LD_RELOCATABLE NAMES ld.lld HINTS ${LLVM_TOOL_HINTS} REQUIRED)
endif()
option(DC_INTERPOSITION_CHECK "Check that src/ps2's calls to replaced functions go through the linker" ON)
if(DC_INTERPOSITION_CHECK)
    find_package(Python3 REQUIRED COMPONENTS Interpreter)
endif()
# SDL3 owns the window and input; Vulkan 1.4 renders.
find_package(SDL3 REQUIRED CONFIG)
find_package(Vulkan 1.4 REQUIRED)

set(PS2_DIR ${CMAKE_SOURCE_DIR}/src/ps2)
set(PORT_DIR ${CMAKE_CURRENT_SOURCE_DIR})
file(GLOB_RECURSE PS2_SOURCES CONFIGURE_DEPENDS RELATIVE ${PS2_DIR} ${PS2_DIR}/*.cpp)
file(GLOB_RECURSE PORT_SOURCES CONFIGURE_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)
list(FILTER PORT_SOURCES EXCLUDE REGEX "/tests/")
# tools/mwccgap compiles a temporary beside the source it came from.
list(FILTER PS2_SOURCES EXCLUDE REGEX "(^|/)tmp[^/]*$")

set(PS2_UNITS "")
# include/port/stubs/<unit>.hpp, if it exists, is included ahead of that unit
# of src/ps2: it declares what the port defines in place of code PORT leaves
# out, and supplies or renames what the unit takes from MWCC alone.
foreach(unit IN LISTS PS2_SOURCES)
    list(APPEND PS2_UNITS ${PS2_DIR}/${unit})
    string(REGEX REPLACE "\\.cpp$" ".hpp" header ${CMAKE_SOURCE_DIR}/include/port/stubs/${unit})
    if(EXISTS ${header})
        set_property(SOURCE ${PS2_DIR}/${unit} APPEND PROPERTY COMPILE_OPTIONS -include ${header})
        set_property(SOURCE ${PS2_DIR}/${unit} APPEND PROPERTY OBJECT_DEPENDS ${header})
    endif()
endforeach()

# What both halves are compiled with. The game was written for MWCC, which
# accepts constructs clang rejects by default: pointers truncated to 32-bit
# integers, narrowing in braced initialisers and the register keyword.
add_library(dc_options INTERFACE)
# PORT leaves out the functions src/ps2 writes in MIPS assembly.
target_compile_definitions(dc_options INTERFACE PORT PAL)
target_include_directories(dc_options INTERFACE
    ${CMAKE_SOURCE_DIR}/include/port ${CMAKE_SOURCE_DIR}/include/ps2 ${CMAKE_SOURCE_DIR}/include/ps2/sce)
target_compile_options(dc_options INTERFACE
    "SHELL:-include ${CMAKE_SOURCE_DIR}/include/port/port.h"
    -fms-extensions -ffunction-sections -fdata-sections
    -Wno-register -Wno-c++11-narrowing -Wno-return-mismatch)
# arm64 clang fuses a*b+c into one rounding by default; x86-64 has no FMA in its
# baseline. Off everywhere so the game's arithmetic rounds the same on both.
target_compile_options(dc_options INTERFACE -ffp-contract=off)

# src/ps2: semantic interposition keeps clang from inlining or folding a call
# to a function src/port may replace, so every such call reaches the linker.
# The driver only passes -fsemantic-interposition for ELF. Mach-O definitions
# are not dso_local, so the flag given to cc1 makes LLVM treat them as
# interposable just the same; without it -fno-inline-functions alone still
# lets IPSCCP and attribute inference delete calls to functions that return a
# constant or do nothing. ps2_interposition_check verifies the result.
add_library(dc_ps2 OBJECT ${PS2_UNITS})
target_link_libraries(dc_ps2 PRIVATE dc_options)
if(APPLE)
    target_compile_options(dc_ps2 PRIVATE "SHELL:-Xclang -fsemantic-interposition" -fno-inline-functions)
else()
    target_compile_options(dc_ps2 PRIVATE -fPIC -fsemantic-interposition)
endif()
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

# Names the PS2 build tells apart per object (config/*/object_fixups.json) are
# renamed by include/port/stubs, so no two units define the same strong name and
# the merge allows none: Apple's ld -r has no --allow-multiple-definition, and a
# duplicate fails on both platforms alike.
add_subdirectory(${CMAKE_SOURCE_DIR}/tools/weaken ${CMAKE_BINARY_DIR}/tools/weaken)
set(PS2_OBJECT ${CMAKE_BINARY_DIR}/dc_ps2.o)
if(APPLE)
    if(DC_MACHO_WEAKEN STREQUAL "tool")
        set(weaken_command $<TARGET_FILE:weaken> ${PS2_OBJECT})
        set(weaken_depends weaken)
    else()
        set(weaken_command ${OBJCOPY} --weaken ${PS2_OBJECT})
        set(weaken_depends "")
    endif()
    add_custom_command(OUTPUT ${PS2_OBJECT}
        COMMAND ${LD_RELOCATABLE} -r -keep_private_externs -o ${PS2_OBJECT} $<TARGET_OBJECTS:dc_ps2>
        COMMAND ${weaken_command}
        DEPENDS $<TARGET_OBJECTS:dc_ps2> ${weaken_depends}
        COMMAND_EXPAND_LISTS
        COMMENT "Merging src/ps2 into one weak object")
else()
    add_custom_command(OUTPUT ${PS2_OBJECT}
        COMMAND ${LD_RELOCATABLE} -r -o ${PS2_OBJECT} $<TARGET_OBJECTS:dc_ps2>
        COMMAND ${OBJCOPY} --weaken ${PS2_OBJECT}
        DEPENDS $<TARGET_OBJECTS:dc_ps2>
        COMMAND_EXPAND_LISTS
        COMMENT "Merging src/ps2 into one weak object")
endif()

# Everything in src/port except main.cpp is an object library rather than an
# archive: an archive member only enters the link when something references
# it, so a strong definition sitting in one would never displace the weak
# src/ps2 copy. Objects named on the link line always do.
set(PORT_LIB_SOURCES ${PORT_SOURCES})
list(FILTER PORT_LIB_SOURCES EXCLUDE REGEX "/tests/|/main\\.cpp$")
# The host side (platform, gfx, audio) never sees a game header, so it is built
# without dc_options: no port.h ahead of each unit and no game include paths.
set(HOST_SOURCES ${PORT_LIB_SOURCES})
list(FILTER HOST_SOURCES INCLUDE REGEX "/src/port/(platform|gfx|audio)/")
list(FILTER PORT_LIB_SOURCES EXCLUDE REGEX "/src/port/(platform|gfx|audio)/")

# Every shaders/*.vert|frag under src/port/gfx becomes a header holding its
# SPIR-V words as a const uint32_t array named after the file (draw.frag ->
# draw_frag), in ${SHADER_HEADER_DIR}/shaders/<file>.spv.hpp.
find_program(GLSLANG_VALIDATOR NAMES glslangValidator REQUIRED)
set(SHADER_DIR ${CMAKE_CURRENT_SOURCE_DIR}/gfx/shaders)
set(SHADER_HEADER_DIR ${CMAKE_BINARY_DIR}/generated)
file(GLOB SHADER_SOURCES CONFIGURE_DEPENDS ${SHADER_DIR}/*.vert ${SHADER_DIR}/*.frag)
set(SHADER_HEADERS "")
foreach(shader IN LISTS SHADER_SOURCES)
    get_filename_component(shader_name ${shader} NAME)
    string(REPLACE "." "_" shader_symbol ${shader_name})
    set(header ${SHADER_HEADER_DIR}/shaders/${shader_name}.spv.hpp)
    add_custom_command(OUTPUT ${header}
        COMMAND ${GLSLANG_VALIDATOR} -V --target-env vulkan1.4 --quiet --vn ${shader_symbol}
            --depfile ${header}.d -o ${header} ${shader}
        DEPENDS ${shader}
        DEPFILE ${header}.d
        COMMENT "Compiling ${shader_name} to SPIR-V")
    list(APPEND SHADER_HEADERS ${header})
endforeach()

add_library(dc_host OBJECT ${HOST_SOURCES} ${SHADER_HEADERS})
target_include_directories(dc_host PRIVATE ${CMAKE_CURRENT_SOURCE_DIR} ${SHADER_HEADER_DIR})
target_link_libraries(dc_host PRIVATE SDL3::SDL3 Vulkan::Vulkan)
target_compile_options(dc_host PRIVATE -Wall -ffunction-sections -fdata-sections)

add_library(dc_port OBJECT ${PORT_LIB_SOURCES})
target_link_libraries(dc_port PRIVATE dc_options SDL3::SDL3 Vulkan::Vulkan)
# Replacement units reach the host side as "gfx/gfx.hpp", "platform/window.hpp".
target_include_directories(dc_port PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
# The game's headers trip a few warnings that only describe how MWCC's source
# was written, not a problem in the port.
target_compile_options(dc_port PRIVATE -Wall -Wno-mismatched-tags -Wno-unused-label
    -Wno-overloaded-virtual -Wno-unused-function)

# src/ps2 calls a function src/port replaces only through a relocation against
# its name; this fails the build when the compiler bound such a call inside
# dc_ps2.o, or when dc_ps2.o still holds a strong definition.
if(DC_INTERPOSITION_CHECK)
    set(interposition_stamp ${CMAKE_BINARY_DIR}/ps2_interposition_check.stamp)
    set(interposition_script ${CMAKE_SOURCE_DIR}/tools/weaken/interposition_check.py)
    add_custom_command(OUTPUT ${interposition_stamp}
        COMMAND ${Python3_EXECUTABLE} ${interposition_script} --nm ${LLVM_NM} --objdump ${LLVM_OBJDUMP}
            --stamp ${interposition_stamp} ${PS2_OBJECT} $<TARGET_OBJECTS:dc_port>
        DEPENDS ${PS2_OBJECT} $<TARGET_OBJECTS:dc_port> ${interposition_script}
        COMMAND_EXPAND_LISTS
        COMMENT "Checking that src/ps2 reaches src/port's replacements through the linker")
    add_custom_target(ps2_interposition_check ALL DEPENDS ${interposition_stamp})
endif()

# Shared by the game and its tests: the port's objects, the weakened game and
# the link flags they need. The executable is position-independent on every
# platform: the game's casts of pointers to 32-bit integers are all widened in
# src/port (docs/port/truncations.md), so nothing has to sit below 4 GiB.
# ItemPutListTbl12_bytes is a second name for the table, as the PS2 build gives
# it through object_fixups.json; draw_rect and WorkBuffer__2 are second names
# the same way. src/port/linknames.cpp defines the names that are not aliases,
# EditGaijiTbl among them.
if(APPLE)
    set(DC_LINK_OPTIONS -Wl,-dead_strip -Wl,-alias,_ItemPutListTbl12,_ItemPutListTbl12_bytes
        -Wl,-alias,_draw_rect_store,_draw_rect -Wl,-alias,_WorkBuffer,_WorkBuffer__2)
else()
    set(DC_LINK_OPTIONS -fuse-ld=lld -pie -Wl,-z,separate-code -Wl,--gc-sections -Wl,--error-limit=0
        -Wl,--defsym=ItemPutListTbl12_bytes=ItemPutListTbl12 -Wl,--defsym=draw_rect=draw_rect_store
        -Wl,--defsym=WorkBuffer__2=WorkBuffer)
endif()

function(dc_link_game target)
    target_sources(${target} PRIVATE $<TARGET_OBJECTS:dc_port> $<TARGET_OBJECTS:dc_host> ${PS2_OBJECT})
    target_link_libraries(${target} PRIVATE dc_options SDL3::SDL3 Vulkan::Vulkan)
    target_include_directories(${target} PRIVATE ${PORT_DIR})
    target_compile_options(${target} PRIVATE -Wall -Wno-mismatched-tags -Wno-unused-label
        -Wno-overloaded-virtual -Wno-unused-function)
    target_link_options(${target} PRIVATE ${DC_LINK_OPTIONS})
endfunction()

add_executable(darkcloud ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp)
set_target_properties(darkcloud PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
dc_link_game(darkcloud)

include(GNUInstallDirs)
install(TARGETS darkcloud RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})

enable_testing()
add_subdirectory(tests)
add_subdirectory(${CMAKE_SOURCE_DIR}/tools/dcdata ${CMAKE_BINARY_DIR}/tools/dcdata)
