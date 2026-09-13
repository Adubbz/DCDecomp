#pragma once

#include "common.h"

#include "mapobject.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CFrameVu1;

/**
 * Selects the distance range used to draw one map-object category.
 */
struct CMapCategoryAttr {
    float lod[4]; /**< Distances at which the category changes level of detail. */
    s32 lowest;   /**< Lowest level of detail that the category may draw. */
    s32 highest;  /**< Highest level of detail that the category may draw. */
};

STATIC_ASSERT(sizeof(CMapCategoryAttr) == 0x18);

/**
 * Owns the categories and scenery objects drawn by one map.
 */
class CMap {
public:
    CMapCategoryAttr category[16]; /**< Level-of-detail ranges for the map's
                                      object categories. */
    CMapObject object[10];         /**< Scenery objects placed in this map. */
    s32 draw_on;                   /**< Selects level-of-detail drawing when nonzero. */

    /**
     * @mangled SetObject__4CMapFiP9CFrameVu1ii
     * @address 0x143870
     * @size 0x80
     * Places a frame in a numbered object slot and returns that object, or
     * null when the slot number is invalid.
     */
    CMapObject *SetObject(int, CFrameVu1 *, int, int);

    /**
     * @mangled SetObject__4CMapFP9CFrameVu1ii
     * @address 0x1438F0
     * @size 0x90
     * Places a frame in the first free object slot and returns that object,
     * or null when every slot is occupied.
     */
    CMapObject *SetObject(CFrameVu1 *, int, int);

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
     * Draws every placed object, using its category's level-of-detail range
     * when range selection is enabled.
     */
    void Draw(void);

    /**
     * @mangled Initialize__4CMapFv
     * @address 0x143AA0
     * @size 0xB0
     * Resets the category ranges and every object slot to their defaults.
     */
    void Initialize(void);
};

STATIC_ASSERT(sizeof(CMap) == 0xAF0);
