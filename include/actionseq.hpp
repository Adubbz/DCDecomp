#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct ACT_SEQ;
class CCharacter;


class CActionSeq {
public:
    /* ?ret */ void Initialize(ACT_SEQ *, int); // @ 0x154B30 (0x50 bytes) -- mangled: Initialize__10CActionSeqFP7ACT_SEQi
    CActionSeq(void); // @ 0x154B80 (0x40 bytes) -- mangled: __ct__10CActionSeqFv
    /* ?ret */ void ClearSeq(void); // @ 0x154BC0 (0x60 bytes) -- mangled: ClearSeq__10CActionSeqFv
    /* ?ret */ void GetNextSeq(void); // @ 0x154C20 (0x50 bytes) -- mangled: GetNextSeq__10CActionSeqFv
    /* ?ret */ void SyncChara(CCharacter *); // @ 0x154C70 (0x90 bytes) -- mangled: SyncChara__10CActionSeqFP10CCharacter
    /* ?ret */ void NextMoveSeq(void); // @ 0x154D00 (0x70 bytes) -- mangled: NextMoveSeq__10CActionSeqFv
    /* ?ret */ void NextMotionSeq(void); // @ 0x154D70 (0x70 bytes) -- mangled: NextMotionSeq__10CActionSeqFv
    /* ?ret */ void NextAnimeSeq(void); // @ 0x154DE0 (0x70 bytes) -- mangled: NextAnimeSeq__10CActionSeqFv
    /* ?ret */ void MoveSeq(float *, int); // @ 0x154E50 (0x90 bytes) -- mangled: MoveSeq__10CActionSeqFPfi
    /* ?ret */ void MoveSeq(float *, float); // @ 0x154EE0 (0xB0 bytes) -- mangled: MoveSeq__10CActionSeqFPff
    /* ?ret */ void MoveSeq(int); // @ 0x154F90 (0x30 bytes) -- mangled: MoveSeq__10CActionSeqFi
    /* ?ret */ void SetPos(float *); // @ 0x154FC0 (0x80 bytes) -- mangled: SetPos__10CActionSeqFPf
    /* ?ret */ void RotRefSeq(float *, float); // @ 0x155040 (0x70 bytes) -- mangled: RotRefSeq__10CActionSeqFPff
    /* ?ret */ void RotAngleSeq(float, float); // @ 0x1550B0 (0x60 bytes) -- mangled: RotAngleSeq__10CActionSeqFff
    /* ?ret */ void RotMoveSeq(float); // @ 0x155110 (0x50 bytes) -- mangled: RotMoveSeq__10CActionSeqFf
    /* ?ret */ void ClearRotSeq(void); // @ 0x155160 (0x40 bytes) -- mangled: ClearRotSeq__10CActionSeqFv
    /* ?ret */ void WaitRotSeq(void); // @ 0x1551A0 (0x40 bytes) -- mangled: WaitRotSeq__10CActionSeqFv
    /* ?ret */ void SetRot(float *); // @ 0x1551E0 (0x60 bytes) -- mangled: SetRot__10CActionSeqFPf
    /* ?ret */ void SetDelayRot(int); // @ 0x155240 (0x40 bytes) -- mangled: SetDelayRot__10CActionSeqFi
    /* ?ret */ void MotionTrg(int); // @ 0x155280 (0x40 bytes) -- mangled: MotionTrg__10CActionSeqFi
    /* ?ret */ void AnimeTrg(int); // @ 0x1552C0 (0x40 bytes) -- mangled: AnimeTrg__10CActionSeqFi
    /* ?ret */ void MotionSeq(int, int, float, int); // @ 0x155300 (0x80 bytes) -- mangled: MotionSeq__10CActionSeqFiifi
    /* ?ret */ void AnimeSeq(int, int, int, int); // @ 0x155380 (0x80 bytes) -- mangled: AnimeSeq__10CActionSeqFiiii
    /* ?ret */ void CheckEnd(void); // @ 0x155400 (0x70 bytes) -- mangled: CheckEnd__10CActionSeqFv
    /* ?ret */ void Play(void); // @ 0x1554A0 (0xB10 bytes) -- mangled: Play__10CActionSeqFv
};
