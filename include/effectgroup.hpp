#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CEffect;
class CEffectParam;


class CEffectGroup {
public:
    /**
     * @mangled EnterEffect__12CEffectGroupFP12CEffectParam
     * @address 0x164980
     * @size 0x70
     * @unknownret
     */
    void EnterEffect(CEffectParam *);

    /**
     * @mangled Step__12CEffectGroupFi
     * @address 0x1649F0
     * @size 0x70
     * @unknownret
     */
    void Step(int);

    /**
     * @mangled Draw__12CEffectGroupFv
     * @address 0x164A60
     * @size 0x60
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled Clear__12CEffectGroupFv
     * @address 0x164AC0
     * @size 0x60
     * @unknownret
     */
    void Clear(void);

    /**
     * @mangled Initialize__12CEffectGroupFP7CEffecti
     * @address 0x164B20
     * @size 0x10
     * @unknownret
     */
    void Initialize(CEffect *, int);
};
