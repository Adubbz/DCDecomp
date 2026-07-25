#pragma once

#include "common.h"

class CCharacter {
public:
    /* ?ret */ void ClearPointLight(void); // @ 0x137EA0 (0x40 bytes) -- mangled: ClearPointLight__10CCharacterFv
    /* ?ret */ void SetPointLight(float *, float, float, float, float, float, float); // @ 0x137EE0 (0x110 bytes) -- mangled: SetPointLight__10CCharacterFPfffffff
    /* ?ret */ void InitializeTexAnime(CTexAnimeData *, int); // @ 0x137FF0 (0x30 bytes) -- mangled: InitializeTexAnime__10CCharacterFP13CTexAnimeDatai
    /* ?ret */ void ClearTexAnime(void); // @ 0x138020 (0x30 bytes) -- mangled: ClearTexAnime__10CCharacterFv
    /* ?ret */ void TextureAnime(int); // @ 0x138050 (0x30 bytes) -- mangled: TextureAnime__10CCharacterFi
    /* ?ret */ void TexAnimeOn(int); // @ 0x138080 (0x30 bytes) -- mangled: TexAnimeOn__10CCharacterFi
    /* ?ret */ void TexAnimeOff(int); // @ 0x1380B0 (0x30 bytes) -- mangled: TexAnimeOff__10CCharacterFi
    /* ?ret */ void SetFootSound(float, float, int); // @ 0x1380E0 (0x130 bytes) -- mangled: SetFootSound__10CCharacterFffi
    /* ?ret */ void SetFootSoundID(int); // @ 0x138210 (0x10 bytes) -- mangled: SetFootSoundID__10CCharacterFi
    /* ?ret */ void FootSoundEnable(int); // @ 0x138220 (0x10 bytes) -- mangled: FootSoundEnable__10CCharacterFi
    /* ?ret */ void EventEnable(int); // @ 0x138230 (0x10 bytes) -- mangled: EventEnable__10CCharacterFi
    /* ?ret */ void SetEvent(float, int, int, int); // @ 0x138240 (0xC0 bytes) -- mangled: SetEvent__10CCharacterFfiii
    /* ?ret */ void ClearEvent(int); // @ 0x138300 (0x70 bytes) -- mangled: ClearEvent__10CCharacterFi
    /* ?ret */ void SetMotionCamera(CCamera *); // @ 0x138370 (0x40 bytes) -- mangled: SetMotionCamera__10CCharacterFP7CCamera
    /* ?ret */ void GetMotionParam(int, int *, int *, int *, int *); // @ 0x1383B0 (0xC0 bytes) -- mangled: GetMotionParam__10CCharacterFiPiPiPiPi
    /* ?ret */ void GetMotionInfo(int); // @ 0x138470 (0x70 bytes) -- mangled: GetMotionInfo__10CCharacterFi
    /* ?ret */ void GetNowTime(void); // @ 0x1384E0 (0x50 bytes) -- mangled: GetNowTime__10CCharacterFv
    /* ?ret */ void Step(void); // @ 0x138530 (0x760 bytes) -- mangled: Step__10CCharacterFv
    /* ?ret */ void ShadowStep(void); // @ 0x138C90 (0x1C0 bytes) -- mangled: ShadowStep__10CCharacterFv
    /* ?ret */ void ClothStep(int); // @ 0x138E50 (0x120 bytes) -- mangled: ClothStep__10CCharacterFi
    /* ?ret */ void ClothFloor(int); // @ 0x138F70 (0x40 bytes) -- mangled: ClothFloor__10CCharacterFi
    /* ?ret */ void SetPosition(float, float, float); // @ 0x138FB0 (0x90 bytes) -- mangled: SetPosition__10CCharacterFfff
    /* ?ret */ void GetWorldPosition(float *); // @ 0x139040 (0x70 bytes) -- mangled: GetWorldPosition__10CCharacterFPf
    /* ?ret */ void SetPosition(float *); // @ 0x1390E0 (0x30 bytes) -- mangled: SetPosition__10CCharacterFPf
    /* ?ret */ void SetPosition(CVector3_f_); // @ 0x139110 (0x40 bytes) -- mangled: SetPosition__10CCharacterF11CVector3_f_
    /* ?ret */ void SetRotation(float, float, float); // @ 0x139150 (0x90 bytes) -- mangled: SetRotation__10CCharacterFfff
    /* ?ret */ void SetRotation(float *); // @ 0x1391E0 (0x30 bytes) -- mangled: SetRotation__10CCharacterFPf
    /* ?ret */ void SetRotation(CVector3_f_); // @ 0x139210 (0x40 bytes) -- mangled: SetRotation__10CCharacterF11CVector3_f_
    /* ?ret */ void SetScale(float, float, float); // @ 0x139250 (0x90 bytes) -- mangled: SetScale__10CCharacterFfff
    /* ?ret */ void SetScale(float *); // @ 0x1392E0 (0x30 bytes) -- mangled: SetScale__10CCharacterFPf
    /* ?ret */ void Draw(void); // @ 0x139310 (0x3F0 bytes) -- mangled: Draw__10CCharacterFv
    /* ?ret */ void DrawShadow(void); // @ 0x139700 (0xF0 bytes) -- mangled: DrawShadow__10CCharacterFv
    /* ?ret */ void LoadPackData(unsigned int *, char *, CDataAlloc2_1_ *, CDataAlloc2_1_ *); // @ 0x1397F0 (0x30 bytes) -- mangled: LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
    /* ?ret */ void LoadPackData(unsigned int *, char *, CDataAlloc2_1_ *, CDataAlloc2_1_ *, CDataAlloc2_1_ *); // @ 0x139820 (0x30 bytes) -- mangled: LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_
    /* ?ret */ void LoadPackData2(unsigned int *, char *, CDataAlloc2_1_ *, int, CDataAlloc2_1_ *, int); // @ 0x139850 (0x40 bytes) -- mangled: LoadPackData2__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_i
    /* ?ret */ void LoadPackData3(unsigned int *, char *, CDataAlloc2_1_ *, int, CDataAlloc2_1_ *, int, int); // @ 0x139890 (0x40 bytes) -- mangled: LoadPackData3__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_ii
    /* ?ret */ void DeleteExtendTexture(int); // @ 0x1398D0 (0xC0 bytes) -- mangled: DeleteExtendTexture__10CCharacterFi
    /* ?ret */ void DeleteExtendMotion(void); // @ 0x139990 (0x40 bytes) -- mangled: DeleteExtendMotion__10CCharacterFv
    /* ?ret */ void Initialize(void); // @ 0x1399D0 (0x2D0 bytes) -- mangled: Initialize__10CCharacterFv
    /* ?ret */ void PickUpPoly(float *, CCPoly *); // @ 0x156710 (0x2D0 bytes) -- mangled: PickUpPoly__10CCharacterFPfP6CCPoly
};

class CMainChara {
public:
    /* ?ret */ void Draw(void); // @ 0x139CA0 (0x20 bytes) -- mangled: Draw__10CMainCharaFv
    /* ?ret */ void Initialize(void); // @ 0x139CC0 (0x50 bytes) -- mangled: Initialize__10CMainCharaFv
};
