cmake_minimum_required(VERSION 3.20)
project(dcdecomp NONE)

# PLATFORM picks what is built: PS2 builds and verifies the retail images
# (src/ps2/CMakeLists.txt), PC builds the x64 port (src/port/CMakeLists.txt).
set(PLATFORM PS2 CACHE STRING "Platform to build: PS2 or PC")
set_property(CACHE PLATFORM PROPERTY STRINGS PS2 PC)
if(PLATFORM STREQUAL "PS2")
    add_subdirectory(src/ps2)
elseif(PLATFORM STREQUAL "PC")
    add_subdirectory(src/port)
else()
    message(FATAL_ERROR "PLATFORM must be PS2 or PC, not ${PLATFORM}")
endif()
