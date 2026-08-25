#pragma once

#include "common.h"

/**
 * Stores one map-editor element attribute record.
 */
struct EDIT_ELEMENT_ATRA {
    u8 unk_00[0xC];
};

/**
 * Stores the acquisition limits for one editable part.
 */
struct EDIT_PARTS_ATRA {
    s32 max;      /**< Maximum quantity that can be acquired. */
    s32 acquired; /**< Whether this part supplies an acquisition. */
    u8 unk_08[0xB4];
};

/**
 * Stores all editable part attributes for one character group.
 */
struct EDIT_PARTS_DATA {
    EDIT_PARTS_ATRA parts[24]; /**< Attribute records addressed by part number. */
    u8 unk_11A0[0xBC];
};

STATIC_ASSERT(sizeof(EDIT_ELEMENT_ATRA) == 0xC);
STATIC_ASSERT(sizeof(EDIT_PARTS_ATRA) == 0xBC);
STATIC_ASSERT(sizeof(EDIT_PARTS_DATA) == 0x125C);

extern EDIT_ELEMENT_ATRA EditElementData[6][100];
extern EDIT_PARTS_DATA EditPartsData[6];

/**
 * Returns an editor element attribute after validating both indices.
 *
 * @mangled GetEditAtraData__Fii
 * @address 0x158D80
 * @size 0x78
 */
EDIT_ELEMENT_ATRA *GetEditAtraData(int ground, int number);

/**
 * Returns an editor part attribute after validating both indices.
 *
 * @mangled GetEditAtraPartsData__Fii
 * @address 0x158E00
 * @size 0x74
 */
EDIT_PARTS_ATRA *GetEditAtraPartsData(int ground, int number);

/**
 * Returns an editor chip attribute from the element table's chip range.
 *
 * @mangled GetEditAtraChipData__Fii
 * @address 0x158E80
 * @size 0x24
 */
EDIT_ELEMENT_ATRA *GetEditAtraChipData(int ground, int number);
