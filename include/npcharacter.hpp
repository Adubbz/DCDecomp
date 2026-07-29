#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCPoly;


class CNPCharacter {
public:
    /* ?ret */ void Step(void); // @ 0x155FB0 (0x140 bytes) -- mangled: Step__12CNPCharacterFv
    /* ?ret */ void ShadowStep(void); // @ 0x1560F0 (0x50 bytes) -- mangled: ShadowStep__12CNPCharacterFv
    /* ?ret */ void PlaySeq(void); // @ 0x156140 (0x210 bytes) -- mangled: PlaySeq__12CNPCharacterFv
    /* ?ret */ void ClearSeq(void); // @ 0x156350 (0x50 bytes) -- mangled: ClearSeq__12CNPCharacterFv
    /* ?ret */ void SetSeq(float *, float); // @ 0x1563A0 (0x70 bytes) -- mangled: SetSeq__12CNPCharacterFPff
    /* ?ret */ void SetWait(int); // @ 0x156410 (0x40 bytes) -- mangled: SetWait__12CNPCharacterFi
    /* ?ret */ void CheckSeq(void); // @ 0x156450 (0x20 bytes) -- mangled: CheckSeq__12CNPCharacterFv
    /* ?ret */ void GetNextSeq(void); // @ 0x156470 (0x40 bytes) -- mangled: GetNextSeq__12CNPCharacterFv
    /* ?ret */ void GetNowSeq(void); // @ 0x1564B0 (0x20 bytes) -- mangled: GetNowSeq__12CNPCharacterFv
    /* ?ret */ void NextSeq(void); // @ 0x1564D0 (0x70 bytes) -- mangled: NextSeq__12CNPCharacterFv
    /* ?ret */ void Draw(void); // @ 0x156540 (0xE0 bytes) -- mangled: Draw__12CNPCharacterFv
    /* ?ret */ void DrawShadow(void); // @ 0x156620 (0x50 bytes) -- mangled: DrawShadow__12CNPCharacterFv
    /* ?ret */ void CheckDraw(void); // @ 0x156670 (0x60 bytes) -- mangled: CheckDraw__12CNPCharacterFv
    /* ?ret */ void PickUpPoly(float *, CCPoly *); // @ 0x1566D0 (0x40 bytes) -- mangled: PickUpPoly__12CNPCharacterFPfP6CCPoly
    /* ?ret */ void Initialize(void); // @ 0x1569E0 (0x90 bytes) -- mangled: Initialize__12CNPCharacterFv
    CNPCharacter(void); // @ 0x156A70 (0xF0 bytes) -- mangled: __ct__12CNPCharacterFv
};
