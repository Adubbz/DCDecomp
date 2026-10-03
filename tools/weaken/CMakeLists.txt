# weaken marks a Mach-O object's definitions weak, the macOS fallback for llvm-objcopy --weaken
# (src/port/CMakeLists.txt). Built and tested on every host so the Linux build keeps it honest; the
# fixtures are compiled for arm64-apple-macos14 by the host's clang, which needs no SDK for them.
# The LLVM tool paths come from src/port/CMakeLists.txt.
add_executable(weaken ${CMAKE_CURRENT_SOURCE_DIR}/weaken.cpp)
set_target_properties(weaken PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
target_compile_options(weaken PRIVATE -Wall -Wextra)

add_test(NAME tools_weaken_macho
    COMMAND ${CMAKE_COMMAND} -DWEAKEN=$<TARGET_FILE:weaken> -DCXX=${CMAKE_CXX_COMPILER} -DNM=${LLVM_NM}
        -DREADOBJ=${LLVM_READOBJ} -DOBJDUMP=${LLVM_OBJDUMP} -DLIPO=${LLVM_LIPO} -DOBJCOPY=${OBJCOPY}
        -DWORK=${CMAKE_CURRENT_BINARY_DIR}/weaken_test -P ${CMAKE_CURRENT_SOURCE_DIR}/tests/weaken_test.cmake)

if(DC_INTERPOSITION_CHECK)
    add_test(NAME tools_interposition_check
        COMMAND ${CMAKE_COMMAND} -DPYTHON=${Python3_EXECUTABLE}
            -DCHECK=${CMAKE_CURRENT_SOURCE_DIR}/interposition_check.py -DWEAKEN=$<TARGET_FILE:weaken>
            -DCXX=${CMAKE_CXX_COMPILER} -DNM=${LLVM_NM} -DOBJDUMP=${LLVM_OBJDUMP} -DOBJCOPY=${OBJCOPY}
            -DWORK=${CMAKE_CURRENT_BINARY_DIR}/interposition_test
            -P ${CMAKE_CURRENT_SOURCE_DIR}/tests/interposition_test.cmake)
endif()
