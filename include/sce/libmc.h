#pragma once

/* Vendor SDK declarations. The reconstruction is given no system include path at all — only the
   game's own headers — which is why this is reached with quotes rather than as <libmc.h>. */

#include "common.h"

/** One colour of an icon.sys, held as four full words. */
struct sceMcColor {
    u_int r; /**< Red the colour draws with. */
    u_int g; /**< Green the colour draws with. */
    u_int b; /**< Blue the colour draws with. */
    u_int a; /**< Alpha the colour draws with. */
};

STATIC_ASSERT(sizeof(sceMcColor) == 0x10);

/** One colour of an icon.sys's lighting, held as floats. */
typedef float sceMcColorF[4];

/** One direction of an icon.sys's lighting. */
typedef float sceMcVu0FVECTOR[4];

/**
 * The icon.sys the browser reads to draw one save, written alongside it.
 */
struct sceMcIconSys {
    char head[4];                 /**< Always "PS2D"; the copy of it overruns into Unknown1. */
    u_short unknown1;             /**< Reserved. */
    u_short nl_offset;            /**< Byte the second line of the title starts at. */
    u_int unknown2;               /**< Reserved. */
    u_int trans_rate;             /**< How solid the icon draws. */
    sceMcColor bg_color[4];       /**< Colour each corner of the icon's background takes. */
    sceMcVu0FVECTOR light_dir[3]; /**< Direction each of the icon's three lights points. */
    sceMcColorF light_color[3];   /**< Colour each of those lights takes. */
    sceMcColorF ambient;          /**< Ambient light the icon draws under. */
    u_char title_name[68];        /**< Title the browser shows the save under. */
    char fname_view[64];          /**< Icon file the browser draws while viewing the save. */
    char fname_copy[64];          /**< Icon file the browser draws while copying the save. */
    char fname_del[64];           /**< Icon file the browser draws while deleting the save. */
    u_char reserve[512];          /**< Reserved. */
};

STATIC_ASSERT(sizeof(sceMcIconSys) == 0x3C4);

#ifdef __cplusplus
extern "C" {
#endif

/** Initializes the memory-card library and returns its status. */
int sceMcInit(void);

/**
 * Reports how the library's last call finished, and reads back what it
 * returned. Returns zero while that call is still running.
 */
int sceMcSync(int mode, int *cmd, int *result);

#ifdef __cplusplus
}
#endif
