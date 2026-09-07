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
     * @mangled LoadModel__13CDranMapFieldFPUiP14CDataAlloc2_1_
     * @address 0x1CD3C0
     * @size 0x150
     * @unknownret
     */
    void LoadModel(unsigned int *, CDataAlloc2<1> *);

    /**
     * @mangled AddCollision__13CDranMapFieldFP6CCPolyi7CBoxVu0
     * @address 0x1CD510
     * @size 0x100
     * @unknownret
     */
    int AddCollision(CCPoly *, int, CBoxVu0);

    /**
     * @mangled LoadCollision__13CDranMapFieldFPUiP14CDataAlloc2_1_
     * @address 0x1CD610
     * @size 0x110
     * @unknownret
     */
    void LoadCollision(unsigned int *, CDataAlloc2<1> *);

    /**
     * @mangled Draw__13CDranMapFieldFv
     * @address 0x1CD720
     * @size 0xB0
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled Step__13CDranMapFieldFv
     * @address 0x1CD7D0
     * @size 0x140
     * @unknownret
     */
    void Step(void);
};

STATIC_ASSERT(sizeof(CDranMapField) == 0x11B0);
