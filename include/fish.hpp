#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCPoly;
class CFrame;


class CFish {
public:
    /**
     * @mangled FindFood__5CFishFv
     * @address 0x240180
     * @size 0xD0
     * @unknownret
     */
    void FindFood(void);

    /**
     * @mangled EatFood__5CFishFv
     * @address 0x240250
     * @size 0xC0
     * @unknownret
     */
    void EatFood(void);

    /**
     * @mangled BiteHook__5CFishFv
     * @address 0x240310
     * @size 0xC0
     * @unknownret
     */
    void BiteHook(void);

    /**
     * @mangled LeaveFood__5CFishFv
     * @address 0x2403D0
     * @size 0x50
     * @unknownret
     */
    void LeaveFood(void);

    /**
     * @mangled LeaveHook__5CFishFv
     * @address 0x240420
     * @size 0x50
     * @unknownret
     */
    void LeaveHook(void);

    /**
     * @mangled SetCPoly__5CFishFP6CCPolyi
     * @address 0x240470
     * @size 0x10
     * @unknownret
     */
    void SetCPoly(CCPoly *, int);

    /**
     * @mangled Step__5CFishFv
     * @address 0x240480
     * @size 0x7F0
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled Draw__5CFishFv
     * @address 0x240C70
     * @size 0x60
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled SetFoodPos__5CFishFiPff
     * @address 0x240CD0
     * @size 0x50
     * @unknownret
     */
    void SetFoodPos(int, float *, float);

    /**
     * @mangled SetAngleMode__5CFishFv
     * @address 0x240D20
     * @size 0x20
     * @unknownret
     */
    void SetAngleMode(void);

    /**
     * @mangled SetBattleMode__5CFishFv
     * @address 0x240D40
     * @size 0x20
     * @unknownret
     */
    void SetBattleMode(void);

    /**
     * @mangled SetScale__5CFishFv
     * @address 0x240D60
     * @size 0x120
     * @unknownret
     */
    void SetScale(void);

    /**
     * @mangled GetFP__5CFishFv
     * @address 0x240E80
     * @size 0xC0
     * @unknownret
     */
    void GetFP(void);

    /**
     * @mangled SetMotion__5CFishFii
     * @address 0x240F40
     * @size 0x30
     * @unknownret
     */
    void SetMotion(int, int);

    /**
     * @mangled SetPosition__5CFishFPf
     * @address 0x240F70
     * @size 0x60
     * @unknownret
     */
    void SetPosition(float *);

    /**
     * @mangled GetPosition__5CFishFPf
     * @address 0x240FD0
     * @size 0x30
     * @unknownret
     */
    void GetPosition(float *);

    /**
     * @mangled SetRotation__5CFishFPf
     * @address 0x241000
     * @size 0x60
     * @unknownret
     */
    void SetRotation(float *);

    /**
     * @mangled GetRotation__5CFishFPf
     * @address 0x241060
     * @size 0x30
     * @unknownret
     */
    void GetRotation(float *);

    /**
     * @mangled SetReference__5CFishFP6CFrame
     * @address 0x241090
     * @size 0x60
     * @unknownret
     */
    void SetReference(CFrame *);

    /**
     * @mangled DeleteReference__5CFishFv
     * @address 0x2410F0
     * @size 0x50
     * @unknownret
     */
    void DeleteReference(void);

    /**
     * @mangled Initialize__5CFishFv
     * @address 0x241140
     * @size 0xA0
     * @unknownret
     */
    void Initialize(void);
};
