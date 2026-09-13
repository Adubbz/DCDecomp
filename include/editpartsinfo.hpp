#pragma once

#include "common.h"

/**
 * @file
 * Declares what the game remembers about every part an edited map can hold.
 */

class CSaveData;

/**
 * Describes the shape of one editable map part, as the part definition file
 * on the disc writes it.
 */
struct EPARTS_INFO_HEADER {
    s32 header_size; /**< Byte offset from the header to the packed cell map. */
    s32 data_size;   /**< Total number of bytes occupied by the packed record. */
    s32 width;  /**< Cells that the part covers from west to east. */
    s32 height; /**< Cells that the part covers from north to south. */
    s32 kind; /**< Parts classification copied from the source definition. */
    u8 unk_14[0x28];
    u8 *cell; /**< One byte per grid cell, row by row, that says what the cell is. */
    s32 element_id[6]; /**< Identifiers for the part's optional visual elements. */
    char *element_name[6]; /**< Packed names of the part's optional visual elements. */
    u8 unk_70[8];
};

/**
 * Describes one optional visual element attached to an editable part.
 */
struct EDITPARTS_ELEMENT {
    s32 id; /**< Element identifier, or a negative value when the slot is unused. */
    s32 unk_04;
    s32 enabled; /**< Whether the element's ordinary object names are visible. */
    u8 unk_0C[0x14];
};

STATIC_ASSERT(sizeof(EDITPARTS_ELEMENT) == 0x20);

/**
 * Holds the unpacked grid and visual-element names read from a parts definition.
 */
struct INIT_PARTSINFO {
    s32 width; /**< Cells that the source part covers from west to east. */
    s32 height; /**< Cells that the source part covers from north to south. */
    u8 cell[32][2]; /**< Source grid cells, whose low bytes form the packed grid. */
    s32 kind; /**< Parts classification copied into the packed header. */
    s32 element_id[6]; /**< Identifiers for the optional visual elements. */
    char element_name[6][0x20]; /**< Names belonging to the optional visual elements. */
};

/**
 * Records what one editable map part is and how far the player has taken it.
 */
struct EDITPARTS_INFO {
    s32 parts_no; /**< Number that names the part. */
    s32 unk_04;
    s32 unk_08;
    s32 unk_0C;
    u8 unk_10[4];
    s32 kind;   /**< What the plot holds: 2 where a story building stands on it. */
    s32 unk_18;
    s32 width;  /**< Cells that the part covers from west to east. */
    s32 height; /**< Cells that the part covers from north to south. */
    EDITPARTS_ELEMENT elements[6]; /**< Visibility definitions for optional model elements. */
    EPARTS_INFO_HEADER *header; /**< Shape of the part. */
};

STATIC_ASSERT(sizeof(EDITPARTS_INFO) == 0xE8);

class CEditPartsInfo {
public:
    u8 unk_00[0x64];
    EDITPARTS_INFO parts[24]; /**< Every part the map can hold. */
    u8 unk_1624[4];

    /**
     * Returns the record of one editable map part, or NULL.
     *
     * @mangled GetPartsInfo__14CEditPartsInfoFi
     * @address 0x199FD0
     * @size 0x50
     */
    EDITPARTS_INFO *GetPartsInfo(int);

    /**
     * @mangled CheckComplete__14CEditPartsInfoFi
     * @address 0x19A020
     * @size 0x80
     * @unknownret
     */
    int CheckComplete(int);

    /**
     * @mangled SetCompEvent__14CEditPartsInfoFii
     * @address 0x19A0A0
     * @size 0x60
     * @unknownret
     */
    void SetCompEvent(int, int);

    /**
     * @mangled GetCompEvent__14CEditPartsInfoFi
     * @address 0x19A100
     * @size 0x40
     * @unknownret
     */
    int GetCompEvent(int);

    /**
     * @mangled GetRequest__14CEditPartsInfoFi
     * @address 0x19A140
     * @size 0x40
     * @unknownret
     */
    int GetRequest(int);

    /**
     * @mangled GetNextPartsNum__14CEditPartsInfoFi
     * @address 0x19A180
     * @size 0x90
     * @unknownret
     */
    void GetNextPartsNum(int);

    /**
     * @mangled GetNextParts__14CEditPartsInfoFi
     * @address 0x19A210
     * @size 0x70
     * @unknownret
     */
    int GetNextParts(int);

    /**
     * @mangled Clear__14CEditPartsInfoFv
     * @address 0x19A280
     * @size 0x40
     * @unknownret
     */
    void Clear(void);

    /**
     * @mangled Save__14CEditPartsInfoFiP9CSaveData
     * @address 0x19A2C0
     * @size 0x130
     * @unknownret
     */
    void Save(int, CSaveData *);

    /**
     * @mangled Load__14CEditPartsInfoFiP9CSaveDatai
     * @address 0x19A3F0
     * @size 0x180
     * @unknownret
     */
    void Load(int, CSaveData *, int);

    /**
     * @mangled Initialize__14CEditPartsInfoFi
     * @address 0x19A570
     * @size 0x1D0
     * @unknownret
     */
    void Initialize(int);

    /**
     * @mangled Initialize__14CEditPartsInfoFiP18EPARTS_INFO_HEADER
     * @address 0x19A740
     * @size 0x70
     * @unknownret
     */
    void Initialize(int, EPARTS_INFO_HEADER *);

private:
};

/** Shared editable-map part catalogue. */
extern CEditPartsInfo EditPartsInfo;

STATIC_ASSERT(sizeof(CEditPartsInfo) == 0x1628);
