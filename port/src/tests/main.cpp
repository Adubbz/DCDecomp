#include <gtest/gtest.h>

// A main of the tests' own rather than gtest_main's: the game's main is a weak definition in the
// link, and an archive member is not pulled in to replace a symbol that is already defined.
int main(int argc, char **argv) {
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
