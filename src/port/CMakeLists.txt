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

# llvm-objcopy, not GNU objcopy: its --weaken leaves undefined references
# strong, so a missing replacement is still a link error.
find_program(OBJCOPY NAMES llvm-objcopy llvm-objcopy-19 REQUIRED)
find_program(LD_RELOCATABLE NAMES ld.lld REQUIRED)
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

# src/ps2: semantic interposition keeps clang from inlining or folding a call
# to a function src/port may replace, so every such call reaches the linker.
add_library(dc_ps2 OBJECT ${PS2_UNITS})
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

# Shared by the game and its tests: the port's objects, the weakened game and
# the link flags they need. The executable is linked without PIE so its code
# and data sit below 4 GiB, where the game's 32-bit pointer casts still
# round-trip. ItemPutListTbl12_bytes is a second name for the table, as the
# PS2 build gives it through object_fixups.json; draw_rect and WorkBuffer__2
# are second names the same way, and EditGaijiTbl is the linker script's name
# for an address inside EditPartsData. src/port/linknames.cpp defines the
# names that are not aliases.
function(dc_link_game target)
    target_sources(${target} PRIVATE $<TARGET_OBJECTS:dc_port> $<TARGET_OBJECTS:dc_host> ${PS2_OBJECT})
    target_link_libraries(${target} PRIVATE dc_options SDL3::SDL3 Vulkan::Vulkan)
    target_include_directories(${target} PRIVATE ${PORT_DIR})
    target_compile_options(${target} PRIVATE -Wall -Wno-mismatched-tags -Wno-unused-label
        -Wno-overloaded-virtual -Wno-unused-function)
    target_link_options(${target} PRIVATE -fuse-ld=lld -no-pie -Wl,--gc-sections -Wl,--error-limit=0
        -Wl,--defsym=ItemPutListTbl12_bytes=ItemPutListTbl12 -Wl,--defsym=draw_rect=draw_rect_store
        -Wl,--defsym=WorkBuffer__2=WorkBuffer -Wl,--defsym=EditGaijiTbl=EditPartsData+0x466C)
endfunction()

add_executable(darkcloud ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp)
set_target_properties(darkcloud PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
dc_link_game(darkcloud)

enable_testing()
add_subdirectory(tests)
add_subdirectory(${CMAKE_SOURCE_DIR}/tools/dcdata ${CMAKE_BINARY_DIR}/tools/dcdata)
