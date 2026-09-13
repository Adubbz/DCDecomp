#pragma once

#include "common.h"

#include <libgraph.h>

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct MG_SPRITE;
struct RECT;

/**
 * Stores one queued event-sprite command consumed by a sprite table.
 */
struct SPRITE_TABLE {
    s16 x;        /**< Horizontal screen position. */
    s16 y;        /**< Vertical screen position. */
    s16 width;    /**< Display width. */
    s16 height;   /**< Display height. */
    s16 u;        /**< Horizontal texture origin. */
    s16 v;        /**< Vertical texture origin. */
    s16 u_width;  /**< Texture width. */
    s16 v_height; /**< Texture height. */
    s16 red;      /**< Red colour component. */
    s16 green;    /**< Green colour component. */
    s16 blue;     /**< Blue colour component. */
    s16 alpha;    /**< Alpha colour component. */
    u8 unk_18[0x10];
    u_long tex0;        /**< Texture register value. */
    SPRITE_TABLE *next; /**< Next queued command. */
    u8 unk_34[4];
};

STATIC_ASSERT(sizeof(SPRITE_TABLE) == 0x38);

/**
 * Collects layered sprite commands from a fixed entry pool.
 */
class CSpriteTable {
public:
    SPRITE_TABLE *pool;      /**< First entry in the command pool. */
    s32 list_count;          /**< Number of active sprite layers. */
    s32 pool_count;          /**< Number of entries in the command pool. */
    SPRITE_TABLE *heads[16]; /**< Sentinel at the head of each layer. */
    SPRITE_TABLE *tails[16]; /**< Next free entry for each layer. */
    SPRITE_TABLE *current;   /**< Next unused entry in the command pool. */
    SPRITE_TABLE *end;       /**< Address just past the command pool. */

    /**
     * @mangled DrawTable__12CSpriteTableFv
     * @address 0x12BA20
     * @size 0x470
     * @unknownret
     */
    void DrawTable(void);

    /**
     * @mangled AddTable__12CSpriteTableFiiP9MG_SPRITEii
     * @address 0x12BE90
     * @size 0x160
     * @unknownret
     */
    void AddTable(int, int, MG_SPRITE *, int, int);

    /**
     * @mangled AddTable__12CSpriteTableFiiP9sceGsTex0P4RECTii
     * @address 0x12BFF0
     * @size 0x70
     * @unknownret
     */
    void AddTable(int, int, sceGsTex0 *, RECT *, int, int);

    /**
     * @mangled Initialize__12CSpriteTableFP12SPRITE_TABLEii
     * @address 0x12C060
     * @size 0x60
     * @unknownret
     */
    void Initialize(SPRITE_TABLE *, int, int);

    /**
     * Returns the next unused sprite command, or null when the pool is full.
     *
     * @mangled GetNext__12CSpriteTableFv
     * @address 0x12C0C0
     * @size 0x2C
     */
    SPRITE_TABLE *GetNext(void);

    /**
     * @mangled ClearPointer__12CSpriteTableFv
     * @address 0x12C0F0
     * @size 0x80
     * @unknownret
     */
    void ClearPointer(void);
};

STATIC_ASSERT(sizeof(CSpriteTable) == 0x94);
