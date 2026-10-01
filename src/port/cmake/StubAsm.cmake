# Copies one unit of src/ps2 for the port with its MWCC inline assembly
# replaced, since clang cannot compile it.
#
#   cmake -DSOURCE=<unit> -DOUTPUT=<copy> -DDISPLAY=<name> -P StubAsm.cmake
#
# - An `asm { ... }` block that is only a branch on $0 != $0 can never be taken
#   and is dropped.
# - Any other `asm { ... }` block becomes PS2_ASM(), which reports the function
#   and aborts.
# - A function written entirely in assembly (`asm <declarator> { ... }`) keeps
#   its declarator and gets PS2_ASM() as its body.
#
# Every replacement keeps the newlines it removed, and the copy starts with a
# #line naming DISPLAY, so diagnostics and stub reports point into src/ps2.

cmake_minimum_required(VERSION 3.20)

file(READ "${SOURCE}" text)

set(result "#line 1 \"${DISPLAY}\"\n")
set(block "(^|[^A-Za-z0-9_])asm([ \t]+[^\n;{}]*[^ \t\n;{}])?[ \t]*{([^}]*)}")
set(never_taken "^[ \t\r\n]*bne[ \t]+\\$0,[ \t]*\\$0,[ \t]*[A-Za-z_][A-Za-z0-9_]*[ \t\r\n]*$")

while(TRUE)
    string(REGEX MATCH "${block}" match "${text}")
    if(match STREQUAL "")
        break()
    endif()
    set(lead "${CMAKE_MATCH_1}")
    set(declarator "${CMAKE_MATCH_2}")
    set(body "${CMAKE_MATCH_3}")

    string(FIND "${text}" "${match}" at)
    string(SUBSTRING "${text}" 0 ${at} before)
    string(LENGTH "${match}" length)
    math(EXPR after "${at} + ${length}")
    string(SUBSTRING "${text}" ${after} -1 text)

    string(LENGTH "${lead}" lead_length)
    string(SUBSTRING "${match}" ${lead_length} -1 replaced)
    string(REGEX REPLACE "[^\n]" "" newlines "${replaced}")
    if(NOT declarator STREQUAL "" AND NOT lead MATCHES "^\n?$")
        # An assembly function starts its line; anything else is prose.
        set(replacement "asm ${declarator} {${body}}")
        set(newlines "")
    elseif(NOT declarator STREQUAL "")
        string(STRIP "${declarator}" declarator)
        set(replacement "${declarator} { PS2_ASM(); }")
    elseif(body MATCHES "${never_taken}")
        set(replacement "")
    else()
        set(replacement "PS2_ASM();")
    endif()
    string(APPEND result "${before}${lead}${replacement}${newlines}")
endwhile()
string(APPEND result "${text}")

# Rewriting an unchanged copy would rebuild its object for nothing.
if(EXISTS "${OUTPUT}")
    file(READ "${OUTPUT}" previous)
    if(previous STREQUAL result)
        return()
    endif()
endif()
file(WRITE "${OUTPUT}" "${result}")
