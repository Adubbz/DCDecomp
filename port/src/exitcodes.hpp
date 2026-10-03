#pragma once

// The process's exit statuses. A PS2_UNIMPLEMENTED stub still aborts (SIGABRT, 134 from a shell)
// so that a debugger or a core dump stops at it.
enum ExitStatus : int {
    kExitOk = 0,
    // The window, the renderer or a file the port writes (the screenshot) failed.
    kExitFailure = 1,
    kExitUsage = 2,
    // The data directory is missing or holds no file.
    kExitNoData = 3,
    // The game's own __assert, such as LoadFile on a file the data directory does not have.
    kExitGameAssert = 4,
};
