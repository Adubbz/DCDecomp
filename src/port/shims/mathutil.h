#pragma once

/**
 * Included ahead of src/ps2/mathutil.cpp, whose Metrowerks C++ runtime is
 * written against MWCC rather than the host's library.
 */

/** The runtime's own std::exception and std::bad_exception, renamed apart from the host library's. */
#define exception mw_exception
#define bad_exception mw_bad_exception

/** What MWCC names the exception being handled inside a handler; the port never throws one. */
static char __exception_magic;
