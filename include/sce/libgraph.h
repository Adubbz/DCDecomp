#pragma once

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Names the texture a primitive draws with.
 *
 * The drawing calls take the register whole, so the 64 bits it is are named
 * as well as the fields the hardware reads out of them.
 */
struct sceGsTex0 {
    union {
        unsigned long long value; /**< The register, as the library built it. */
        struct {
            unsigned long long tbp0 : 14; /**< Where the texture starts, in 64-word blocks. */
            unsigned long long tbw : 6;   /**< How wide one row of it is, in 64-pixel blocks. */
            unsigned long long psm : 6;   /**< How its pixels are stored. */
            unsigned long long tw : 4;    /**< Width of the texture, as a power of two. */
            unsigned long long th : 4;    /**< Height of the texture, as a power of two. */
            unsigned long long tcc : 1;   /**< Whether the texture carries alpha. */
            unsigned long long tfx : 2;   /**< How the texture and the primitive colour mix. */
            unsigned long long cbp : 14;  /**< Where its palette starts. */
            unsigned long long cpsm : 4;  /**< How the palette's entries are stored. */
            unsigned long long csm : 1;   /**< How the palette is laid out. */
            unsigned long long csa : 5;   /**< Which part of that block the palette takes. */
            unsigned long long cld : 3;   /**< When the palette is loaded again. */
        } bits;
    };
};

/**
 * The register that names where the depth buffer lives and how it is written.
 */
struct sceGsZbuf {
    union {
        unsigned long long value; /**< The register, as the library built it. */
        struct {
            unsigned long long zbp : 9;    /**< Where the depth buffer starts. */
            unsigned long long pad09 : 15;
            unsigned long long psm : 4;    /**< How its pixels are stored. */
            unsigned long long pad28 : 4;
            unsigned long long zmsk : 1;   /**< Whether drawing leaves the depth buffer alone. */
            unsigned long long pad33 : 31;
        } bits;
    };
};

/**
 * The register that names which pixels a primitive is allowed to write.
 */
struct sceGsTest {
    union {
        unsigned long long value; /**< The register, as the library built it. */
        struct {
            unsigned long long ate : 1;    /**< Whether the alpha test runs. */
            unsigned long long atst : 3;   /**< Which way the alpha test compares. */
            unsigned long long aref : 8;   /**< The alpha the test compares against. */
            unsigned long long afail : 2;  /**< What a failed alpha test still writes. */
            unsigned long long date : 1;   /**< Whether the destination alpha test runs. */
            unsigned long long datm : 1;   /**< Which destination alpha the test passes. */
            unsigned long long zte : 1;    /**< Whether the depth test runs. */
            unsigned long long ztst : 2;   /**< Which way the depth test compares. */
            unsigned long long pad19 : 45;
        } bits;
    };
};

/**
 * The register that names how a primitive blends with what is already drawn.
 */
struct sceGsAlpha {
    unsigned long long value; /**< The register, as the library built it. */
};

/**
 * Waits for or polls a vertical synchronization event.
 */
int sceGsSyncV(int mode);

#ifdef __cplusplus
}
#endif
