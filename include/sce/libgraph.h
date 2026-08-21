#pragma once

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Names the texture a primitive draws with.
 *
 * The library builds the register and the drawing calls take it whole, so it
 * is modelled as the 64 bits it is rather than as the fields inside it.
 */
struct sceGsTex0 {
    unsigned long long value; /**< The register, as the library built it. */
};

/**
 * Waits for or polls a vertical synchronization event.
 */
int sceGsSyncV(int mode);

#ifdef __cplusplus
}
#endif
