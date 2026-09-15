#pragma once

#include "common.h"

#include <libvu0.h>

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CBoxVu0;
class CCPoly;
class CCamera;
class CCameraFollow;
class CEffectGroup;
class CFrame;
class CMapParts;
class CRect_i_;
class CSaveData;

/**
 * Holds the render controls for one editable-ground water surface.
 */
struct EDIT_WATER_SURFACE_RENDER {
    s32 draw; /**< Whether this water surface is drawn. */
    u8 unk_004[0x3AC];
};

class CEditGround {
public:
    u8 unk_00000[0x15060];
    EDIT_WATER_SURFACE_RENDER water_surfaces[4]; /**< Render controls for the four ground water surfaces. */
    sceVu0FVECTOR clip_plane; /**< Plane used to clip the editable ground's rendered geometry. */
    u8 unk_15f30[0x360];
    CFrame *frame; /**< Root frame containing the editable ground model. */
    u8 unk_16294[0xA6C8];
    s32 suppress_water; /**< Whether rendering of the editable ground's water is disabled. */
    /**
     * @mangled SetMapParts__11CEditGroundFifffi
     * @address 0x1A0470
     * @size 0x79C
     * @unknownret
     */
    void SetMapParts(int, float, float, float, int);

    /**
     * @mangled SetRiverParts__11CEditGroundFfffii
     * @address 0x1A0C10
     * @size 0x3C8
     * @unknownret
     */
    void SetRiverParts(float, float, float, int, int);

    /**
     * @mangled SetRoadParts__11CEditGroundFfffii
     * @address 0x1A0FE0
     * @size 0x2A4
     * @unknownret
     */
    void SetRoadParts(float, float, float, int, int);

    /**
     * @mangled DeleteMapParts__11CEditGroundFPiPifff
     * @address 0x1A1290
     * @size 0x418
     * @unknownret
     */
    void DeleteMapParts(int *, int *, float, float, float);

    /**
     * @mangled GetAreaCode__11CEditGroundFfff
     * @address 0x1A16B0
     * @size 0xAC
     * @unknownret
     */
    int GetAreaCode(float, float, float);

    /**
     * @mangled GetAlt__11CEditGroundFfff
     * @address 0x1A1760
     * @size 0x84
     * @unknownret
     */
    float GetAlt(float, float, float);

    /**
     * @mangled GetAlt_i__11CEditGroundFfff
     * @address 0x1A17F0
     * @size 0x84
     * @unknownret
     */
    void GetAlt_i(float, float, float);

    /**
     * @mangled GetPartsObject__11CEditGroundFi
     * @address 0x1A1880
     * @size 0x50
     * @unknownret
     */
    CMapParts *GetPartsObject(int);

    /**
     * @mangled GetPartsID__11CEditGroundFfff
     * @address 0x1A18D0
     * @size 0x84
     * @unknownret
     */
    void GetPartsID(float, float, float);

    /**
     * @mangled GetParts__11CEditGroundFfff
     * @address 0x1A1960
     * @size 0x5C
     * @unknownret
     */
    CMapParts *GetParts(float, float, float);

    /**
     * @mangled CheckEffect__11CEditGroundFv
     * @address 0x1A19C0
     * @size 0x18
     * @unknownret
     */
    void CheckEffect(void);

    /**
     * @mangled SetBuildEffect__11CEditGroundFi
     * @address 0x1A19E0
     * @size 0x134
     * @unknownret
     */
    void SetBuildEffect(int);

    /**
     * @mangled EffectTask__11CEditGroundFv
     * @address 0x1A1B20
     * @size 0x1E0
     * @unknownret
     */
    void EffectTask(void);

    /**
     * @mangled SetFocusParts__11CEditGroundFfff
     * @address 0x1A1D00
     * @size 0x130
     * @unknownret
     */
    void SetFocusParts(float, float, float);

    /**
     * @mangled EditAreaClip__11CEditGroundFP7CCameraf
     * @address 0x1A1E30
     * @size 0x89C
     * @unknownret
     */
    void EditAreaClip(CCamera *, float);

    /**
     * @mangled GetRandomPlanePos__11CEditGroundFPfPA4_fiPf
     * @address 0x1A26D0
     * @size 0x3BC
     * @unknownret
     */
    int GetRandomPlanePos(float *, float (*)[4], int, float *);

    /**
     * @mangled GetNearParts__11CEditGroundFPP9CMapPartsiP7CBoxVu0P7CBoxVu0
     * @address 0x1A2A90
     * @size 0x17C
     * @unknownret
     */
    void GetNearParts(CMapParts **, int, CBoxVu0 *, CBoxVu0 *);

    /**
     * @mangled MakePartsBox__11CEditGroundFv
     * @address 0x1A2C10
     * @size 0x64
     * @unknownret
     */
    void MakePartsBox(void);

    /**
     * @mangled GetPartsBox__11CEditGroundFP7CBoxVu0fff
     * @address 0x1A2C80
     * @size 0x8C
     * @unknownret
     */
    void GetPartsBox(CBoxVu0 *, float, float, float);

    /**
     * @mangled GetPeoplePos__11CEditGroundFiPf
     * @address 0x1A2D10
     * @size 0x190
     * @unknownret
     */
    int GetPeoplePos(int, float *);

    /**
     * @mangled DrawBaseGround__11CEditGroundFv
     * @address 0x1A2EA0
     * @size 0x64
     * @unknownret
     */
    void DrawBaseGround(void);

    /**
     * @mangled Draw__11CEditGroundFfiiiii
     * @address 0x1A2F10
     * @size 0x23C
     * @unknownret
     */
    void Draw(float, int, int, int, int, int);

    /**
     * @mangled StepWater__11CEditGroundFv
     * @address 0x1A3150
     * @size 0x20C
     * @unknownret
     */
    void StepWater(void);

    /**
     * @mangled DrawWaterSurface__11CEditGroundFP7CCamera
     * @address 0x1A3360
     * @size 0x2B8
     * @unknownret
     */
    void DrawWaterSurface(CCamera *);

    /**
     * @mangled DrawWater__11CEditGroundFi
     * @address 0x1A3620
     * @size 0x314
     * @unknownret
     */
    void DrawWater(int);

    /**
     * @mangled DrawRipple__11CEditGroundFi
     * @address 0x1A3940
     * @size 0x2A0
     * @unknownret
     */
    void DrawRipple(int);

    /**
     * @mangled DrawShadow__11CEditGroundFiff
     * @address 0x1A3BE0
     * @size 0x34C
     * @unknownret
     */
    void DrawShadow(int, float, float);

    /**
     * @mangled DrawPartsCursor__11CEditGroundFiPfPfiPfi
     * @address 0x1A3F30
     * @size 0x6D8
     * @unknownret
     */
    void DrawPartsCursor(int, float *, float *, int, float *, int);

    /**
     * @mangled DrawEffect__11CEditGroundFP13CCameraFollowfP12CEffectGroup
     * @address 0x1A4610
     * @size 0x170
     * @unknownret
     */
    void DrawEffect(CCameraFollow *, float, CEffectGroup *);

    /**
     * @mangled Save__11CEditGroundFPc
     * @address 0x1A4780
     * @size 0x188
     * @unknownret
     */
    void Save(char *);

    /**
     * @mangled Load__11CEditGroundFPc
     * @address 0x1A4910
     * @size 0x374
     * @unknownret
     */
    void Load(char *);

    /**
     * @mangled Save__11CEditGroundFiP9CSaveData
     * @address 0x1A4C90
     * @size 0x17C
     * @unknownret
     */
    void Save(int, CSaveData *);

    /**
     * @mangled Load__11CEditGroundFiP9CSaveData
     * @address 0x1A4E10
     * @size 0xD0
     * @unknownret
     */
    void Load(int, CSaveData *);

    /**
     * @mangled PickUpPoly__11CEditGroundFP6CCPolyfff
     * @address 0x1A4EE0
     * @size 0x70
     * @unknownret
     */
    int PickUpPoly(CCPoly *, float, float, float);

    /**
     * @mangled PickUpPoly__11CEditGroundFP6CCPoly7CBoxVu0i
     * @address 0x1A4F50
     * @size 0x214
     * @unknownret
     */
    int PickUpPoly(CCPoly *, CBoxVu0, int);

    /**
     * @mangled PickUpEditAreaPoly__11CEditGroundFP6CCPolyfff
     * @address 0x1A5170
     * @size 0x94
     * @unknownret
     */
    int PickUpEditAreaPoly(CCPoly *, float, float, float);

    /**
     * @mangled PickUpCameraPoly__11CEditGroundFP6CCPolyR7CBoxVu0i
     * @address 0x1A5210
     * @size 0x2F4
     * @unknownret
     */
    void PickUpCameraPoly(CCPoly *, CBoxVu0 &, int);

    /**
     * @mangled Clear__11CEditGroundFv
     * @address 0x1A5510
     * @size 0x2E8
     * @unknownret
     */
    void Clear(void);

    /**
     * @mangled Initialize__11CEditGroundFv
     * @address 0x1A5800
     * @size 0x1A8
     * @unknownret
     */
    void Initialize(void);

    /**
     * @mangled RemakeGrid__11CEditGroundFv
     * @address 0x1A59B0
     * @size 0x40
     * @unknownret
     */
    void RemakeGrid(void);

    /**
     * @mangled __ct__11CEditGroundFv
     * @address 0x1A59F0
     * @size 0xE4
     */
    CEditGround(void);

    /**
     * @mangled RequestCheck__11CEditGroundFv
     * @address 0x1A5FE0
     * @size 0x1F4
     * @unknownret
     */
    void RequestCheck(void);

    /**
     * @mangled CheckPartsRect__11CEditGroundFiiR8CRect_i_
     * @address 0x1A61E0
     * @size 0xE0
     * @unknownret
     */
    void CheckPartsRect(int, int, CRect_i_ &);

    /**
     * @mangled GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsi
     * @address 0x1A62C0
     * @size 0x14C
     * @unknownret
     */
    void GetRectParts(CRect_i_ *, CMapParts *, int);

    /**
     * @mangled GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsii
     * @address 0x1A6410
     * @size 0x338
     * @unknownret
     */
    void GetRectParts(CRect_i_ *, CMapParts *, int, int);

    /**
     * @mangled GetRectDirParts__11CEditGroundFP8CRect_i_P9CMapPartsii
     * @address 0x1A6750
     * @size 0x264
     * @unknownret
     */
    void GetRectDirParts(CRect_i_ *, CMapParts *, int, int);

    /**
     * @mangled NornRequest__11CEditGroundFPA64_P9CMapParts
     * @address 0x1A69C0
     * @size 0x3C4
     * @unknownret
     */
    void NornRequest(CMapParts *(*) [64]);

    /**
     * @mangled MatatagiRequest__11CEditGroundFPA64_P9CMapParts
     * @address 0x1A6D90
     * @size 0x65C
     * @unknownret
     */
    void MatatagiRequest(CMapParts *(*) [64]);

    /**
     * @mangled QueensRequest__11CEditGroundFPA64_P9CMapParts
     * @address 0x1A73F0
     * @size 0x49C
     * @unknownret
     */
    void QueensRequest(CMapParts *(*) [64]);

    /**
     * @mangled MuskaRequest__11CEditGroundFPA64_P9CMapParts
     * @address 0x1A7920
     * @size 0x614
     * @unknownret
     */
    void MuskaRequest(CMapParts *(*) [64]);

    /**
     * @mangled YellowRequest__11CEditGroundFPA64_P9CMapParts
     * @address 0x1A7F40
     * @size 0x8A0
     * @unknownret
     */
    void YellowRequest(CMapParts *(*) [64]);
};

class CPartsCursor {
public:
    /**
     * @mangled Draw__12CPartsCursorFPfii
     * @address 0x1A5CB0
     * @size 0x328
     * @unknownret
     */
    void Draw(float *, int, int);
};
