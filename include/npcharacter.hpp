#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCPoly;


class CNPCharacter {
public:
    /**
     * @mangled Step__12CNPCharacterFv
     * @address 0x155FB0
     * @size 0x140
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled ShadowStep__12CNPCharacterFv
     * @address 0x1560F0
     * @size 0x50
     * @unknownret
     */
    void ShadowStep(void);

    /**
     * @mangled PlaySeq__12CNPCharacterFv
     * @address 0x156140
     * @size 0x210
     * @unknownret
     */
    void PlaySeq(void);

    /**
     * @mangled ClearSeq__12CNPCharacterFv
     * @address 0x156350
     * @size 0x50
     * @unknownret
     */
    void ClearSeq(void);

    /**
     * @mangled SetSeq__12CNPCharacterFPff
     * @address 0x1563A0
     * @size 0x70
     * @unknownret
     */
    void SetSeq(float *, float);

    /**
     * @mangled SetWait__12CNPCharacterFi
     * @address 0x156410
     * @size 0x40
     * @unknownret
     */
    void SetWait(int);

    /**
     * @mangled CheckSeq__12CNPCharacterFv
     * @address 0x156450
     * @size 0x20
     * @unknownret
     */
    void CheckSeq(void);

    /**
     * @mangled GetNextSeq__12CNPCharacterFv
     * @address 0x156470
     * @size 0x40
     * @unknownret
     */
    void GetNextSeq(void);

    /**
     * @mangled GetNowSeq__12CNPCharacterFv
     * @address 0x1564B0
     * @size 0x20
     * @unknownret
     */
    void GetNowSeq(void);

    /**
     * @mangled NextSeq__12CNPCharacterFv
     * @address 0x1564D0
     * @size 0x70
     * @unknownret
     */
    void NextSeq(void);

    /**
     * @mangled Draw__12CNPCharacterFv
     * @address 0x156540
     * @size 0xE0
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled DrawShadow__12CNPCharacterFv
     * @address 0x156620
     * @size 0x50
     * @unknownret
     */
    void DrawShadow(void);

    /**
     * @mangled CheckDraw__12CNPCharacterFv
     * @address 0x156670
     * @size 0x60
     * @unknownret
     */
    void CheckDraw(void);

    /**
     * @mangled PickUpPoly__12CNPCharacterFPfP6CCPoly
     * @address 0x1566D0
     * @size 0x40
     * @unknownret
     */
    void PickUpPoly(float *, CCPoly *);

    /**
     * @mangled Initialize__12CNPCharacterFv
     * @address 0x1569E0
     * @size 0x90
     * @unknownret
     */
    void Initialize(void);

    /**
     * @mangled __ct__12CNPCharacterFv
     * @address 0x156A70
     * @size 0xF0
     */
    CNPCharacter(void);
};
