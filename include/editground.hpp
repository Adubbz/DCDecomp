#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CBoxVu0;
class CCPoly;
class CCamera;
class CCameraFollow;
class CEffectGroup;
class CMapParts;
class CRect_i_;
class CSaveData;


class CEditGround {
public:
    /* ?ret */ void SetMapParts(int, float, float, float, int); // @ 0x1A0470 (0x7A0 bytes) -- mangled: SetMapParts__11CEditGroundFifffi
    /* ?ret */ void SetRiverParts(float, float, float, int, int); // @ 0x1A0C10 (0x3D0 bytes) -- mangled: SetRiverParts__11CEditGroundFfffii
    /* ?ret */ void SetRoadParts(float, float, float, int, int); // @ 0x1A0FE0 (0x2B0 bytes) -- mangled: SetRoadParts__11CEditGroundFfffii
    /* ?ret */ void DeleteMapParts(int *, int *, float, float, float); // @ 0x1A1290 (0x420 bytes) -- mangled: DeleteMapParts__11CEditGroundFPiPifff
    /* ?ret */ void GetAreaCode(float, float, float); // @ 0x1A16B0 (0xB0 bytes) -- mangled: GetAreaCode__11CEditGroundFfff
    /* ?ret */ void GetAlt(float, float, float); // @ 0x1A1760 (0x90 bytes) -- mangled: GetAlt__11CEditGroundFfff
    /* ?ret */ void GetAlt_i(float, float, float); // @ 0x1A17F0 (0x90 bytes) -- mangled: GetAlt_i__11CEditGroundFfff
    /* ?ret */ void GetPartsObject(int); // @ 0x1A1880 (0x50 bytes) -- mangled: GetPartsObject__11CEditGroundFi
    /* ?ret */ void GetPartsID(float, float, float); // @ 0x1A18D0 (0x90 bytes) -- mangled: GetPartsID__11CEditGroundFfff
    /* ?ret */ void GetParts(float, float, float); // @ 0x1A1960 (0x60 bytes) -- mangled: GetParts__11CEditGroundFfff
    /* ?ret */ void CheckEffect(void); // @ 0x1A19C0 (0x20 bytes) -- mangled: CheckEffect__11CEditGroundFv
    /* ?ret */ void SetBuildEffect(int); // @ 0x1A19E0 (0x140 bytes) -- mangled: SetBuildEffect__11CEditGroundFi
    /* ?ret */ void EffectTask(void); // @ 0x1A1B20 (0x1E0 bytes) -- mangled: EffectTask__11CEditGroundFv
    /* ?ret */ void SetFocusParts(float, float, float); // @ 0x1A1D00 (0x130 bytes) -- mangled: SetFocusParts__11CEditGroundFfff
    /* ?ret */ void EditAreaClip(CCamera *, float); // @ 0x1A1E30 (0x8A0 bytes) -- mangled: EditAreaClip__11CEditGroundFP7CCameraf
    /* ?ret */ void GetRandomPlanePos(float *, float (*)[4], int, float *); // @ 0x1A26D0 (0x3C0 bytes) -- mangled: GetRandomPlanePos__11CEditGroundFPfPA4_fiPf
    /* ?ret */ void GetNearParts(CMapParts **, int, CBoxVu0 *, CBoxVu0 *); // @ 0x1A2A90 (0x180 bytes) -- mangled: GetNearParts__11CEditGroundFPP9CMapPartsiP7CBoxVu0P7CBoxVu0
    /* ?ret */ void MakePartsBox(void); // @ 0x1A2C10 (0x70 bytes) -- mangled: MakePartsBox__11CEditGroundFv
    /* ?ret */ void GetPartsBox(CBoxVu0 *, float, float, float); // @ 0x1A2C80 (0x90 bytes) -- mangled: GetPartsBox__11CEditGroundFP7CBoxVu0fff
    /* ?ret */ void GetPeoplePos(int, float *); // @ 0x1A2D10 (0x190 bytes) -- mangled: GetPeoplePos__11CEditGroundFiPf
    /* ?ret */ void DrawBaseGround(void); // @ 0x1A2EA0 (0x70 bytes) -- mangled: DrawBaseGround__11CEditGroundFv
    /* ?ret */ void Draw(float, int, int, int, int, int); // @ 0x1A2F10 (0x240 bytes) -- mangled: Draw__11CEditGroundFfiiiii
    /* ?ret */ void StepWater(void); // @ 0x1A3150 (0x210 bytes) -- mangled: StepWater__11CEditGroundFv
    /* ?ret */ void DrawWaterSurface(CCamera *); // @ 0x1A3360 (0x2C0 bytes) -- mangled: DrawWaterSurface__11CEditGroundFP7CCamera
    /* ?ret */ void DrawWater(int); // @ 0x1A3620 (0x320 bytes) -- mangled: DrawWater__11CEditGroundFi
    /* ?ret */ void DrawRipple(int); // @ 0x1A3940 (0x2A0 bytes) -- mangled: DrawRipple__11CEditGroundFi
    /* ?ret */ void DrawShadow(int, float, float); // @ 0x1A3BE0 (0x350 bytes) -- mangled: DrawShadow__11CEditGroundFiff
    /* ?ret */ void DrawPartsCursor(int, float *, float *, int, float *, int); // @ 0x1A3F30 (0x6E0 bytes) -- mangled: DrawPartsCursor__11CEditGroundFiPfPfiPfi
    /* ?ret */ void DrawEffect(CCameraFollow *, float, CEffectGroup *); // @ 0x1A4610 (0x170 bytes) -- mangled: DrawEffect__11CEditGroundFP13CCameraFollowfP12CEffectGroup
    /* ?ret */ void Save(char *); // @ 0x1A4780 (0x190 bytes) -- mangled: Save__11CEditGroundFPc
    /* ?ret */ void Load(char *); // @ 0x1A4910 (0x380 bytes) -- mangled: Load__11CEditGroundFPc
    /* ?ret */ void Save(int, CSaveData *); // @ 0x1A4C90 (0x180 bytes) -- mangled: Save__11CEditGroundFiP9CSaveData
    /* ?ret */ void Load(int, CSaveData *); // @ 0x1A4E10 (0xD0 bytes) -- mangled: Load__11CEditGroundFiP9CSaveData
    /* ?ret */ void PickUpPoly(CCPoly *, float, float, float); // @ 0x1A4EE0 (0x70 bytes) -- mangled: PickUpPoly__11CEditGroundFP6CCPolyfff
    /* ?ret */ void PickUpPoly(CCPoly *, CBoxVu0, int); // @ 0x1A4F50 (0x220 bytes) -- mangled: PickUpPoly__11CEditGroundFP6CCPoly7CBoxVu0i
    /* ?ret */ void PickUpEditAreaPoly(CCPoly *, float, float, float); // @ 0x1A5170 (0xA0 bytes) -- mangled: PickUpEditAreaPoly__11CEditGroundFP6CCPolyfff
    /* ?ret */ void PickUpCameraPoly(CCPoly *, CBoxVu0 &, int); // @ 0x1A5210 (0x300 bytes) -- mangled: PickUpCameraPoly__11CEditGroundFP6CCPolyR7CBoxVu0i
    /* ?ret */ void Clear(void); // @ 0x1A5510 (0x2F0 bytes) -- mangled: Clear__11CEditGroundFv
    /* ?ret */ void Initialize(void); // @ 0x1A5800 (0x1B0 bytes) -- mangled: Initialize__11CEditGroundFv
    /* ?ret */ void RemakeGrid(void); // @ 0x1A59B0 (0x40 bytes) -- mangled: RemakeGrid__11CEditGroundFv
    CEditGround(void); // @ 0x1A59F0 (0xF0 bytes) -- mangled: __ct__11CEditGroundFv
    /* ?ret */ void RequestCheck(void); // @ 0x1A5FE0 (0x200 bytes) -- mangled: RequestCheck__11CEditGroundFv
    /* ?ret */ void CheckPartsRect(int, int, CRect_i_ &); // @ 0x1A61E0 (0xE0 bytes) -- mangled: CheckPartsRect__11CEditGroundFiiR8CRect_i_
    /* ?ret */ void GetRectParts(CRect_i_ *, CMapParts *, int); // @ 0x1A62C0 (0x150 bytes) -- mangled: GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsi
    /* ?ret */ void GetRectParts(CRect_i_ *, CMapParts *, int, int); // @ 0x1A6410 (0x340 bytes) -- mangled: GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsii
    /* ?ret */ void GetRectDirParts(CRect_i_ *, CMapParts *, int, int); // @ 0x1A6750 (0x270 bytes) -- mangled: GetRectDirParts__11CEditGroundFP8CRect_i_P9CMapPartsii
    /* ?ret */ void NornRequest(CMapParts * (*)[64]); // @ 0x1A69C0 (0x3D0 bytes) -- mangled: NornRequest__11CEditGroundFPA64_P9CMapParts
    /* ?ret */ void MatatagiRequest(CMapParts * (*)[64]); // @ 0x1A6D90 (0x660 bytes) -- mangled: MatatagiRequest__11CEditGroundFPA64_P9CMapParts
    /* ?ret */ void QueensRequest(CMapParts * (*)[64]); // @ 0x1A73F0 (0x4A0 bytes) -- mangled: QueensRequest__11CEditGroundFPA64_P9CMapParts
    /* ?ret */ void MuskaRequest(CMapParts * (*)[64]); // @ 0x1A7920 (0x620 bytes) -- mangled: MuskaRequest__11CEditGroundFPA64_P9CMapParts
    /* ?ret */ void YellowRequest(CMapParts * (*)[64]); // @ 0x1A7F40 (0x8A0 bytes) -- mangled: YellowRequest__11CEditGroundFPA64_P9CMapParts
};

class CPartsCursor {
public:
    /* ?ret */ void Draw(float *, int, int); // @ 0x1A5CB0 (0x330 bytes) -- mangled: Draw__12CPartsCursorFPfii
};
