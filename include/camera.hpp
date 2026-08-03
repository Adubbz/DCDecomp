#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CFrame;


class CCamera {
public:
    /**
     * @mangled Step__7CCameraFi
     * @address 0x123F30
     * @size 0x2E0
     * @unknownret
     */
    void Step(int);

    /**
     * @mangled Stay__7CCameraFv
     * @address 0x124210
     * @size 0x50
     * @unknownret
     */
    void Stay(void);

    /**
     * @mangled SetPos__7CCameraFP6CFramefff
     * @address 0x124260
     * @size 0x30
     * @unknownret
     */
    void SetPos(CFrame *, float, float, float);

    /**
     * @mangled SetPos__7CCameraFPf
     * @address 0x124290
     * @size 0x40
     * @unknownret
     */
    void SetPos(float *);

    /**
     * @mangled SetNextPos__7CCameraFP6CFramefff
     * @address 0x1242D0
     * @size 0x20
     * @unknownret
     */
    void SetNextPos(CFrame *, float, float, float);

    /**
     * @mangled SetRef__7CCameraFP6CFramefff
     * @address 0x1242F0
     * @size 0x20
     * @unknownret
     */
    void SetRef(CFrame *, float, float, float);

    /**
     * @mangled SetRef__7CCameraFPf
     * @address 0x124310
     * @size 0x40
     * @unknownret
     */
    void SetRef(float *);

    /**
     * @mangled SetRef__7CCameraFfff
     * @address 0x124350
     * @size 0x30
     * @unknownret
     */
    void SetRef(float, float, float);

    /**
     * @mangled SetNextRef__7CCameraFP6CFramefff
     * @address 0x124380
     * @size 0x20
     * @unknownret
     */
    void SetNextRef(CFrame *, float, float, float);

    /**
     * @mangled GetDir__7CCameraFPf
     * @address 0x1243A0
     * @size 0x40
     * @unknownret
     */
    void GetDir(float *);

    /**
     * @mangled GetCameraMatrix__7CCameraFPA4_f
     * @address 0x1243E0
     * @size 0x270
     * @unknownret
     */
    void GetCameraMatrix(float (*)[4]);

    /**
     * @mangled SetSpeed__7CCameraFf
     * @address 0x124650
     * @size 0x10
     * @unknownret
     */
    void SetSpeed(float);

    /**
     * @mangled SetRoll__7CCameraFf
     * @address 0x124660
     * @size 0x10
     * @unknownret
     */
    void SetRoll(float);

    /**
     * @mangled GetPos__7CCameraFPf
     * @address 0x124670
     * @size 0x30
     * @unknownret
     */
    void GetPos(float *);

    /**
     * @mangled GetRef__7CCameraFPf
     * @address 0x1246A0
     * @size 0x30
     * @unknownret
     */
    void GetRef(float *);

    /**
     * @mangled GetAngleH__7CCameraFv
     * @address 0x1246D0
     * @size 0x10
     * @unknownret
     */
    void GetAngleH(void);

    /**
     * @mangled GetRoll__7CCameraFv
     * @address 0x1246E0
     * @size 0x10
     * @unknownret
     */
    void GetRoll(void);

    /**
     * @mangled __ct__7CCameraFf
     * @address 0x1246F0
     * @size 0x80
     */
    CCamera(float);

    /**
     * @mangled __dt__7CCameraFv
     * @address 0x124770
     * @size 0x60
     */
    ~CCamera(void);
};
