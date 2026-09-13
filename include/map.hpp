#pragma once

#include "common.h"

#include "mapobject.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CFrameVu1;

/**
 * Owns the categories and scenery objects drawn by one map.
 */
class CMap {
public:
    u8 unk_000[0x180];
    CMapObject object[10]; /**< Scenery objects placed in this map. */
    s32 draw_on; /**< Selects level-of-detail drawing when nonzero. */

    /**
     * @mangled SetObject__4CMapFiP9CFrameVu1ii
     * @address 0x143870
     * @size 0x80
     * @unknownret
     */
    void SetObject(int, CFrameVu1 *, int, int);

    /**
     * @mangled SetObject__4CMapFP9CFrameVu1ii
     * @address 0x1438F0
     * @size 0x90
     * @unknownret
     */
    void SetObject(CFrameVu1 *, int, int);

    /**
     * Returns the map object in a numbered slot, or null for an invalid slot.
     *
     * @mangled GetObject__4CMapFi
     * @address 0x143980
     * @size 0x40
     */
    CMapObject *GetObject(int);

    /**
     * @mangled Draw__4CMapFv
     * @address 0x1439C0
     * @size 0xE0
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled Initialize__4CMapFv
     * @address 0x143AA0
     * @size 0xB0
     * @unknownret
     */
    void Initialize(void);
};

STATIC_ASSERT(sizeof(CMap) == 0xAF0);
