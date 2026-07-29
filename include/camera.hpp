#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CFrame;


class CCamera {
public:
    /* ?ret */ void Step(int); // @ 0x123F30 (0x2E0 bytes) -- mangled: Step__7CCameraFi
    /* ?ret */ void Stay(void); // @ 0x124210 (0x50 bytes) -- mangled: Stay__7CCameraFv
    /* ?ret */ void SetPos(CFrame *, float, float, float); // @ 0x124260 (0x30 bytes) -- mangled: SetPos__7CCameraFP6CFramefff
    /* ?ret */ void SetPos(float *); // @ 0x124290 (0x40 bytes) -- mangled: SetPos__7CCameraFPf
    /* ?ret */ void SetNextPos(CFrame *, float, float, float); // @ 0x1242D0 (0x20 bytes) -- mangled: SetNextPos__7CCameraFP6CFramefff
    /* ?ret */ void SetRef(CFrame *, float, float, float); // @ 0x1242F0 (0x20 bytes) -- mangled: SetRef__7CCameraFP6CFramefff
    /* ?ret */ void SetRef(float *); // @ 0x124310 (0x40 bytes) -- mangled: SetRef__7CCameraFPf
    /* ?ret */ void SetRef(float, float, float); // @ 0x124350 (0x30 bytes) -- mangled: SetRef__7CCameraFfff
    /* ?ret */ void SetNextRef(CFrame *, float, float, float); // @ 0x124380 (0x20 bytes) -- mangled: SetNextRef__7CCameraFP6CFramefff
    /* ?ret */ void GetDir(float *); // @ 0x1243A0 (0x40 bytes) -- mangled: GetDir__7CCameraFPf
    /* ?ret */ void GetCameraMatrix(float (*)[4]); // @ 0x1243E0 (0x270 bytes) -- mangled: GetCameraMatrix__7CCameraFPA4_f
    /* ?ret */ void SetSpeed(float); // @ 0x124650 (0x10 bytes) -- mangled: SetSpeed__7CCameraFf
    /* ?ret */ void SetRoll(float); // @ 0x124660 (0x10 bytes) -- mangled: SetRoll__7CCameraFf
    /* ?ret */ void GetPos(float *); // @ 0x124670 (0x30 bytes) -- mangled: GetPos__7CCameraFPf
    /* ?ret */ void GetRef(float *); // @ 0x1246A0 (0x30 bytes) -- mangled: GetRef__7CCameraFPf
    /* ?ret */ void GetAngleH(void); // @ 0x1246D0 (0x10 bytes) -- mangled: GetAngleH__7CCameraFv
    /* ?ret */ void GetRoll(void); // @ 0x1246E0 (0x10 bytes) -- mangled: GetRoll__7CCameraFv
    CCamera(float); // @ 0x1246F0 (0x80 bytes) -- mangled: __ct__7CCameraFf
    ~CCamera(void); // @ 0x124770 (0x60 bytes) -- mangled: __dt__7CCameraFv
};
