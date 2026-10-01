#include <cstdio>
#include <cstdlib>

#include "dataread.hpp"
#include "exitcodes.hpp"
#include "mathutil.hpp"

[[noreturn]] void Ps2Unimplemented(const char *function, const char *file, int line) {
    std::fprintf(stderr, "%s:%d: %s: PlayStation 2 code is not implemented on PC\n", file, line, function);
    std::abort();
}

// Retail halted on a failed assertion. The game prints its own context on stdout first (LoadFile
// names the file), so stdout is flushed ahead of the message. _Exit, not exit: static destructors
// would tear down the renderer under a frame the game may have open.
[[noreturn]] void __assert(const char *file, int line, const char *expression) {
    std::fflush(stdout);
    std::fprintf(stderr, "%s:%d: assertion failed: %s\n", file, line, expression);
    std::fflush(nullptr);
    std::_Exit(kExitGameAssert);
}

// The host runs the static constructors mwInit would have run.
extern "C" void mwInit(int argc, const char **argv, const char **envp) {}

extern "C" [[noreturn]] void exit__2(int status) {
    std::exit(status);
}

// TITLE.BIN and DUN.BIN are linked into the executable, so there is never an
// overlay to load.
void LoadOverlay(int mode) {}

extern "C" int mwLoadOverlay(char *path, void *address) {
    return 1;
}
