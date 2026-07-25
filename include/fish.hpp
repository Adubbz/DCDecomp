#pragma once

#include "common.h"

class CFish {
public:
    /* ?ret */ void FindFood(void); // @ 0x240180 (0xD0 bytes) -- mangled: FindFood__5CFishFv
    /* ?ret */ void EatFood(void); // @ 0x240250 (0xC0 bytes) -- mangled: EatFood__5CFishFv
    /* ?ret */ void BiteHook(void); // @ 0x240310 (0xC0 bytes) -- mangled: BiteHook__5CFishFv
    /* ?ret */ void LeaveFood(void); // @ 0x2403D0 (0x50 bytes) -- mangled: LeaveFood__5CFishFv
    /* ?ret */ void LeaveHook(void); // @ 0x240420 (0x50 bytes) -- mangled: LeaveHook__5CFishFv
    /* ?ret */ void SetCPoly(CCPoly *, int); // @ 0x240470 (0x10 bytes) -- mangled: SetCPoly__5CFishFP6CCPolyi
    /* ?ret */ void Step(void); // @ 0x240480 (0x7F0 bytes) -- mangled: Step__5CFishFv
    /* ?ret */ void Draw(void); // @ 0x240C70 (0x60 bytes) -- mangled: Draw__5CFishFv
    /* ?ret */ void SetFoodPos(int, float *, float); // @ 0x240CD0 (0x50 bytes) -- mangled: SetFoodPos__5CFishFiPff
    /* ?ret */ void SetAngleMode(void); // @ 0x240D20 (0x20 bytes) -- mangled: SetAngleMode__5CFishFv
    /* ?ret */ void SetBattleMode(void); // @ 0x240D40 (0x20 bytes) -- mangled: SetBattleMode__5CFishFv
    /* ?ret */ void SetScale(void); // @ 0x240D60 (0x120 bytes) -- mangled: SetScale__5CFishFv
    /* ?ret */ void GetFP(void); // @ 0x240E80 (0xC0 bytes) -- mangled: GetFP__5CFishFv
    /* ?ret */ void SetMotion(int, int); // @ 0x240F40 (0x30 bytes) -- mangled: SetMotion__5CFishFii
    /* ?ret */ void SetPosition(float *); // @ 0x240F70 (0x60 bytes) -- mangled: SetPosition__5CFishFPf
    /* ?ret */ void GetPosition(float *); // @ 0x240FD0 (0x30 bytes) -- mangled: GetPosition__5CFishFPf
    /* ?ret */ void SetRotation(float *); // @ 0x241000 (0x60 bytes) -- mangled: SetRotation__5CFishFPf
    /* ?ret */ void GetRotation(float *); // @ 0x241060 (0x30 bytes) -- mangled: GetRotation__5CFishFPf
    /* ?ret */ void SetReference(CFrame *); // @ 0x241090 (0x60 bytes) -- mangled: SetReference__5CFishFP6CFrame
    /* ?ret */ void DeleteReference(void); // @ 0x2410F0 (0x50 bytes) -- mangled: DeleteReference__5CFishFv
    /* ?ret */ void Initialize(void); // @ 0x241140 (0xA0 bytes) -- mangled: Initialize__5CFishFv
};
