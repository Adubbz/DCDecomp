#include <cstdio>

int main(int argc, char **argv) {
    (void) argc;
    (void) argv;
    std::fprintf(stderr, "dcdata extract <iso-or-directory> <data-directory>\n");
    return 2;
}
