#pragma once

#include "common.h"

class CLogo {
public:
    /**
     * @mangled __ct__5CLogoFv
     * @address 0x1DD3E00
     * @size 0x40
     */
    CLogo(void);

    /**
     * @mangled Init__5CLogoFv
     * @address 0x1DD3E40
     * @size 0xC0
     * @unknownret
     */
    void Init(void);

    /**
     * @mangled Fade__5CLogoFv
     * @address 0x1DD3F00
     * @size 0x80
     * @unknownret
     */
    void Fade(void);

    /**
     * @mangled FadeOut__5CLogoFv
     * @address 0x1DD3F80
     * @size 0x40
     * @unknownret
     */
    void FadeOut(void);

    /**
     * @mangled Sparkdraw__5CLogoFf
     * @address 0x1DD3FC0
     * @size 0x2D0
     * @unknownret
     */
    void Sparkdraw(float);

    /**
     * @mangled Draw__5CLogoFv
     * @address 0x1DD4290
     * @size 0x140
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled Move__5CLogoFv
     * @address 0x1DD43D0
     * @size 0x50
     * @unknownret
     */
    void Move(void);
};
