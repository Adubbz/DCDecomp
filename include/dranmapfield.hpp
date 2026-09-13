#pragma once

#include "common.h"

#include "dataalloc_fwd.hpp"

#include "character.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CBoxVu0;
class CCPoly;

class CDranMapField : public CCharacter {
public:
    /**
     * Loads one drainage-field model into the next free slot.
     *
     * @mangled LoadModel__13CDranMapFieldFPUiP14CDataAlloc2_1_
     * @address 0x1CD3C0
     * @size 0x150
     */
    void LoadModel(unsigned int *, CDataAlloc2<1> *);

    /**
     * Appends polygons near the active drainage-field collision frames.
     *
     * @mangled AddCollision__13CDranMapFieldFP6CCPolyi7CBoxVu0
     * @address 0x1CD510
     * @size 0x100
     */
    int AddCollision(CCPoly *, int, CBoxVu0);

    /**
     * Loads one drainage-field collision frame into the next free slot.
     *
     * @mangled LoadCollision__13CDranMapFieldFPUiP14CDataAlloc2_1_
     * @address 0x1CD610
     * @size 0x110
     */
    void LoadCollision(unsigned int *, CDataAlloc2<1> *);

    /**
     * Draws every active drainage-field model that has finished loading.
     *
     * @mangled Draw__13CDranMapFieldFv
     * @address 0x1CD720
     * @size 0xB0
     */
    void Draw(void);

    /**
     * Advances the timed state of every loaded drainage-field model.
     *
     * @mangled Step__13CDranMapFieldFv
     * @address 0x1CD7D0
     * @size 0x140
     */
    void Step(void);
};

STATIC_ASSERT(sizeof(CDranMapField) == 0x11B0);

/**
 * Holds the drainage-field models, their collision frames and their runtime
 * states.
 */
struct DRAN_MAP_FIELD_SET {
    CDranMapField field[12]; /**< Models drawn for the drainage fields. */
    CFrame *unk_D440[12];
    s32 unk_D470[12];
    s32 unk_D4A0;
    s32 unk_D4A4;
    u8 unk_D4A8[8];
};

STATIC_ASSERT(sizeof(DRAN_MAP_FIELD_SET) == 0xD4B0);

/**
 * Drainage-field models and runtime state for the current dungeon.
 */
extern "C" DRAN_MAP_FIELD_SET DranMapField;
