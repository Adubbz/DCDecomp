#pragma once

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Waits for or polls a vertical synchronization event.
 */
int sceGsSyncV(int mode);

#ifdef __cplusplus
}
#endif
