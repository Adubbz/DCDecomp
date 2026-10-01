#include <cstdio>
#include <cstdlib>

#include "dataread.hpp"
#include "mathutil.hpp"

[[noreturn]] void Ps2Unimplemented(const char *function, const char *file, int line) {
    std::fprintf(stderr, "%s:%d: %s: PlayStation 2 code is not implemented on PC\n", file, line, function);
    std::abort();
}

[[noreturn]] void __assert(const char *file, int line, const char *expression) {
    std::fprintf(stderr, "%s:%d: assertion failed: %s\n", file, line, expression);
    std::abort();
}

extern "C" [[noreturn]] void exit__2(int status) {
    std::exit(status);
}

// TITLE.BIN and DUN.BIN are linked into the executable, so there is never an
// overlay to load.
void LoadOverlay(int mode) {}

extern "C" int mwLoadOverlay(char *path, void *address) {
    return 1;
}
