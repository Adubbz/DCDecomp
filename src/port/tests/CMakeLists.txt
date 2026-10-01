# darkcloud_tests links the whole port and game so a test can exercise a
# replacement unit against the real game types. Each *_test.cpp registers its
# cases with DC_TEST; ctest runs one process per case.
file(GLOB_RECURSE TEST_SOURCES CONFIGURE_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/*_test.cpp)
add_executable(darkcloud_tests ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp ${TEST_SOURCES})
set_target_properties(darkcloud_tests PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
target_include_directories(darkcloud_tests PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
dc_link_game(darkcloud_tests)

foreach(source IN LISTS TEST_SOURCES)
    file(STRINGS ${source} cases REGEX "^DC_TEST\\(")
    foreach(line IN LISTS cases)
        string(REGEX REPLACE "^DC_TEST\\(([A-Za-z0-9_]+)\\).*" "\\1" name "${line}")
        add_test(NAME ${name} COMMAND darkcloud_tests ${name})
    endforeach()
endforeach()

# Measures sleep accuracy, which the parallel gfx tests on four cores skew.
set_tests_properties(platform_clock_wait_accuracy PROPERTIES RUN_SERIAL TRUE)
