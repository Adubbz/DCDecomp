#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CBoxVu0;
class CCamera;
class CEffectGroup;


class CMapParts {
public:
    /**
     * @mangled GetPosition__9CMapPartsFPf
     * @address 0x19A7B0
     * @size 0x30
     * @unknownret
     */
    void GetPosition(float *);

    /**
     * @mangled SetPosition__9CMapPartsFPf
     * @address 0x19A7E0
     * @size 0x30
     * @unknownret
     */
    void SetPosition(float *);

    /**
     * @mangled SetPosition__9CMapPartsFfff
     * @address 0x19A810
     * @size 0x20
     * @unknownret
     */
    void SetPosition(float, float, float);

    /**
     * @mangled SetRotation__9CMapPartsFfff
     * @address 0x19A830
     * @size 0x20
     * @unknownret
     */
    void SetRotation(float, float, float);

    /**
     * @mangled SetRotY__9CMapPartsFi
     * @address 0x19A850
     * @size 0x60
     * @unknownret
     */
    void SetRotY(int);

    /**
     * @mangled GetRotY__9CMapPartsFv
     * @address 0x19A8B0
     * @size 0x10
     * @unknownret
     */
    void GetRotY(void);

    /**
     * @mangled Initialize__9CMapPartsFv
     * @address 0x19A8C0
     * @size 0xA0
     * @unknownret
     */
    void Initialize(void);

    /**
     * @mangled __ct__9CMapPartsFv
     * @address 0x19A960
     * @size 0x50
     */
    CMapParts(void);

    /**
     * @mangled FrameObjectOnOff__9CMapPartsFPci
     * @address 0x19A9B0
     * @size 0x70
     * @unknownret
     */
    void FrameObjectOnOff(char *, int);

    /**
     * @mangled GetWidth__9CMapPartsFv
     * @address 0x19AA20
     * @size 0x60
     * @unknownret
     */
    void GetWidth(void);

    /**
     * @mangled GetHeight__9CMapPartsFv
     * @address 0x19AA80
     * @size 0x60
     * @unknownret
     */
    void GetHeight(void);

    /**
     * @mangled GetInfoData__9CMapPartsFii
     * @address 0x19AAE0
     * @size 0x160
     * @unknownret
     */
    void GetInfoData(int, int);

    /**
     * @mangled ChangeAltData__9CMapPartsFv
     * @address 0x19AC40
     * @size 0xA0
     * @unknownret
     */
    void ChangeAltData(void);

    /**
     * @mangled ChangeDigData__9CMapPartsFv
     * @address 0x19ACE0
     * @size 0xA0
     * @unknownret
     */
    void ChangeDigData(void);

    /**
     * @mangled CheckBox__9CMapPartsFP7CBoxVu0
     * @address 0x19AD80
     * @size 0x140
     * @unknownret
     */
    void CheckBox(CBoxVu0 *);

    /**
     * @mangled CheckBox2__9CMapPartsFP7CBoxVu0
     * @address 0x19AEC0
     * @size 0x1E0
     * @unknownret
     */
    void CheckBox2(CBoxVu0 *);

    /**
     * @mangled DrawLOD__9CMapPartsFPfiiPi
     * @address 0x19B0A0
     * @size 0x1C0
     * @unknownret
     */
    void DrawLOD(float *, int, int, int *);

    /**
     * @mangled DrawParts__9CMapPartsFfPfiiPi
     * @address 0x19B260
     * @size 0x2F0
     * @unknownret
     */
    void DrawParts(float, float *, int, int, int *);

    /**
     * @mangled DrawEffect__9CMapPartsFP7CCamerafP12CEffectGroup
     * @address 0x19B550
     * @size 0x130
     * @unknownret
     */
    void DrawEffect(CCamera *, float, CEffectGroup *);
};
