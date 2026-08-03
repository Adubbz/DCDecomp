#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CTexture;


class CCandleEffect {
public:
    /**
     * @mangled Initialize__13CCandleEffectFv
     * @address 0x163A30
     * @size 0x30
     * @unknownret
     */
    void Initialize(void);

    /**
     * @mangled __ct__13CCandleEffectFv
     * @address 0x163A60
     * @size 0x30
     */
    CCandleEffect(void);

    /**
     * @mangled SetTexture__13CCandleEffectFP8CTexture
     * @address 0x163A90
     * @size 0x10
     * @unknownret
     */
    void SetTexture(CTexture *);

    /**
     * @mangled SetScale__13CCandleEffectFff
     * @address 0x163AA0
     * @size 0x10
     * @unknownret
     */
    void SetScale(float, float);

    /**
     * @mangled SetPosition__13CCandleEffectFPf
     * @address 0x163AB0
     * @size 0x30
     * @unknownret
     */
    void SetPosition(float *);

    /**
     * @mangled Step__13CCandleEffectFv
     * @address 0x163AE0
     * @size 0x40
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled Draw__13CCandleEffectFv
     * @address 0x163B20
     * @size 0x200
     * @unknownret
     */
    void Draw(void);
};
