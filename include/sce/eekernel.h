#pragma once

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Flushes or invalidates the EE caches selected by an SDK operation code.
 */
void FlushCache(int operation);

/**
 * Flushes the instruction cache from interrupt context.
 */
void iFlushCache(int operation);

/**
 * Terminates the current EE process with the supplied status.
 */
void Exit(int status);

#ifdef __cplusplus
}
#endif
