#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct ACT_SEQ;
class CCharacter;


class CActionSeq {
public:
    /**
     * @mangled Initialize__10CActionSeqFP7ACT_SEQi
     * @address 0x154B30
     * @size 0x50
     * @unknownret
     */
    void Initialize(ACT_SEQ *, int);

    /**
     * @mangled __ct__10CActionSeqFv
     * @address 0x154B80
     * @size 0x40
     */
    CActionSeq(void);

    /**
     * @mangled ClearSeq__10CActionSeqFv
     * @address 0x154BC0
     * @size 0x60
     * @unknownret
     */
    void ClearSeq(void);

    /**
     * @mangled GetNextSeq__10CActionSeqFv
     * @address 0x154C20
     * @size 0x50
     * @unknownret
     */
    void GetNextSeq(void);

    /**
     * @mangled SyncChara__10CActionSeqFP10CCharacter
     * @address 0x154C70
     * @size 0x90
     * @unknownret
     */
    void SyncChara(CCharacter *);

    /**
     * @mangled NextMoveSeq__10CActionSeqFv
     * @address 0x154D00
     * @size 0x70
     * @unknownret
     */
    void NextMoveSeq(void);

    /**
     * @mangled NextMotionSeq__10CActionSeqFv
     * @address 0x154D70
     * @size 0x70
     * @unknownret
     */
    void NextMotionSeq(void);

    /**
     * @mangled NextAnimeSeq__10CActionSeqFv
     * @address 0x154DE0
     * @size 0x70
     * @unknownret
     */
    void NextAnimeSeq(void);

    /**
     * @mangled MoveSeq__10CActionSeqFPfi
     * @address 0x154E50
     * @size 0x90
     * @unknownret
     */
    void MoveSeq(float *, int);

    /**
     * @mangled MoveSeq__10CActionSeqFPff
     * @address 0x154EE0
     * @size 0xB0
     * @unknownret
     */
    void MoveSeq(float *, float);

    /**
     * @mangled MoveSeq__10CActionSeqFi
     * @address 0x154F90
     * @size 0x30
     * @unknownret
     */
    void MoveSeq(int);

    /**
     * @mangled SetPos__10CActionSeqFPf
     * @address 0x154FC0
     * @size 0x80
     * @unknownret
     */
    void SetPos(float *);

    /**
     * @mangled RotRefSeq__10CActionSeqFPff
     * @address 0x155040
     * @size 0x70
     * @unknownret
     */
    void RotRefSeq(float *, float);

    /**
     * @mangled RotAngleSeq__10CActionSeqFff
     * @address 0x1550B0
     * @size 0x60
     * @unknownret
     */
    void RotAngleSeq(float, float);

    /**
     * @mangled RotMoveSeq__10CActionSeqFf
     * @address 0x155110
     * @size 0x50
     * @unknownret
     */
    void RotMoveSeq(float);

    /**
     * @mangled ClearRotSeq__10CActionSeqFv
     * @address 0x155160
     * @size 0x40
     * @unknownret
     */
    void ClearRotSeq(void);

    /**
     * @mangled WaitRotSeq__10CActionSeqFv
     * @address 0x1551A0
     * @size 0x40
     * @unknownret
     */
    void WaitRotSeq(void);

    /**
     * @mangled SetRot__10CActionSeqFPf
     * @address 0x1551E0
     * @size 0x60
     * @unknownret
     */
    void SetRot(float *);

    /**
     * @mangled SetDelayRot__10CActionSeqFi
     * @address 0x155240
     * @size 0x40
     * @unknownret
     */
    void SetDelayRot(int);

    /**
     * @mangled MotionTrg__10CActionSeqFi
     * @address 0x155280
     * @size 0x40
     * @unknownret
     */
    void MotionTrg(int);

    /**
     * @mangled AnimeTrg__10CActionSeqFi
     * @address 0x1552C0
     * @size 0x40
     * @unknownret
     */
    void AnimeTrg(int);

    /**
     * @mangled MotionSeq__10CActionSeqFiifi
     * @address 0x155300
     * @size 0x80
     * @unknownret
     */
    void MotionSeq(int, int, float, int);

    /**
     * @mangled AnimeSeq__10CActionSeqFiiii
     * @address 0x155380
     * @size 0x80
     * @unknownret
     */
    void AnimeSeq(int, int, int, int);

    /**
     * @mangled CheckEnd__10CActionSeqFv
     * @address 0x155400
     * @size 0x70
     * @unknownret
     */
    void CheckEnd(void);

    /**
     * @mangled Play__10CActionSeqFv
     * @address 0x1554A0
     * @size 0xB10
     * @unknownret
     */
    void Play(void);
};
