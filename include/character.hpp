#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCPoly;
class CCamera;
class CDataAlloc2_1_;
class CTexAnimeData;
class CVector3_f_;


class CCharacter {
public:
    /**
     * @mangled ClearPointLight__10CCharacterFv
     * @address 0x137EA0
     * @size 0x40
     * @unknownret
     */
    void ClearPointLight(void);

    /**
     * @mangled SetPointLight__10CCharacterFPfffffff
     * @address 0x137EE0
     * @size 0x110
     * @unknownret
     */
    void SetPointLight(float *, float, float, float, float, float, float);

    /**
     * @mangled InitializeTexAnime__10CCharacterFP13CTexAnimeDatai
     * @address 0x137FF0
     * @size 0x30
     * @unknownret
     */
    void InitializeTexAnime(CTexAnimeData *, int);

    /**
     * @mangled ClearTexAnime__10CCharacterFv
     * @address 0x138020
     * @size 0x30
     * @unknownret
     */
    void ClearTexAnime(void);

    /**
     * @mangled TextureAnime__10CCharacterFi
     * @address 0x138050
     * @size 0x30
     * @unknownret
     */
    void TextureAnime(int);

    /**
     * @mangled TexAnimeOn__10CCharacterFi
     * @address 0x138080
     * @size 0x30
     * @unknownret
     */
    void TexAnimeOn(int);

    /**
     * @mangled TexAnimeOff__10CCharacterFi
     * @address 0x1380B0
     * @size 0x30
     * @unknownret
     */
    void TexAnimeOff(int);

    /**
     * @mangled SetFootSound__10CCharacterFffi
     * @address 0x1380E0
     * @size 0x130
     * @unknownret
     */
    void SetFootSound(float, float, int);

    /**
     * @mangled SetFootSoundID__10CCharacterFi
     * @address 0x138210
     * @size 0x10
     * @unknownret
     */
    void SetFootSoundID(int);

    /**
     * @mangled FootSoundEnable__10CCharacterFi
     * @address 0x138220
     * @size 0x10
     * @unknownret
     */
    void FootSoundEnable(int);

    /**
     * @mangled EventEnable__10CCharacterFi
     * @address 0x138230
     * @size 0x10
     * @unknownret
     */
    void EventEnable(int);

    /**
     * @mangled SetEvent__10CCharacterFfiii
     * @address 0x138240
     * @size 0xC0
     * @unknownret
     */
    void SetEvent(float, int, int, int);

    /**
     * @mangled ClearEvent__10CCharacterFi
     * @address 0x138300
     * @size 0x70
     * @unknownret
     */
    void ClearEvent(int);

    /**
     * @mangled SetMotionCamera__10CCharacterFP7CCamera
     * @address 0x138370
     * @size 0x40
     * @unknownret
     */
    void SetMotionCamera(CCamera *);

    /**
     * @mangled GetMotionParam__10CCharacterFiPiPiPiPi
     * @address 0x1383B0
     * @size 0xC0
     * @unknownret
     */
    void GetMotionParam(int, int *, int *, int *, int *);

    /**
     * @mangled GetMotionInfo__10CCharacterFi
     * @address 0x138470
     * @size 0x70
     * @unknownret
     */
    void GetMotionInfo(int);

    /**
     * @mangled GetNowTime__10CCharacterFv
     * @address 0x1384E0
     * @size 0x50
     * @unknownret
     */
    void GetNowTime(void);

    /**
     * @mangled Step__10CCharacterFv
     * @address 0x138530
     * @size 0x760
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled ShadowStep__10CCharacterFv
     * @address 0x138C90
     * @size 0x1C0
     * @unknownret
     */
    void ShadowStep(void);

    /**
     * @mangled ClothStep__10CCharacterFi
     * @address 0x138E50
     * @size 0x120
     * @unknownret
     */
    void ClothStep(int);

    /**
     * @mangled ClothFloor__10CCharacterFi
     * @address 0x138F70
     * @size 0x40
     * @unknownret
     */
    void ClothFloor(int);

    /**
     * @mangled SetPosition__10CCharacterFfff
     * @address 0x138FB0
     * @size 0x90
     * @unknownret
     */
    void SetPosition(float, float, float);

    /**
     * @mangled GetWorldPosition__10CCharacterFPf
     * @address 0x139040
     * @size 0x70
     * @unknownret
     */
    void GetWorldPosition(float *);

    /**
     * @mangled SetPosition__10CCharacterFPf
     * @address 0x1390E0
     * @size 0x30
     * @unknownret
     */
    void SetPosition(float *);

    /**
     * @mangled SetPosition__10CCharacterF11CVector3_f_
     * @address 0x139110
     * @size 0x40
     * @unknownret
     */
    void SetPosition(CVector3_f_);

    /**
     * @mangled SetRotation__10CCharacterFfff
     * @address 0x139150
     * @size 0x90
     * @unknownret
     */
    void SetRotation(float, float, float);

    /**
     * @mangled SetRotation__10CCharacterFPf
     * @address 0x1391E0
     * @size 0x30
     * @unknownret
     */
    void SetRotation(float *);

    /**
     * @mangled SetRotation__10CCharacterF11CVector3_f_
     * @address 0x139210
     * @size 0x40
     * @unknownret
     */
    void SetRotation(CVector3_f_);

    /**
     * @mangled SetScale__10CCharacterFfff
     * @address 0x139250
     * @size 0x90
     * @unknownret
     */
    void SetScale(float, float, float);

    /**
     * @mangled SetScale__10CCharacterFPf
     * @address 0x1392E0
     * @size 0x30
     * @unknownret
     */
    void SetScale(float *);

    /**
     * @mangled Draw__10CCharacterFv
     * @address 0x139310
     * @size 0x3F0
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled DrawShadow__10CCharacterFv
     * @address 0x139700
     * @size 0xF0
     * @unknownret
     */
    void DrawShadow(void);

    /**
     * @mangled LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
     * @address 0x1397F0
     * @size 0x30
     * @unknownret
     */
    void LoadPackData(unsigned int *, char *, CDataAlloc2_1_ *, CDataAlloc2_1_ *);

    /**
     * @mangled LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_
     * @address 0x139820
     * @size 0x30
     * @unknownret
     */
    void LoadPackData(unsigned int *, char *, CDataAlloc2_1_ *, CDataAlloc2_1_ *, CDataAlloc2_1_ *);

    /**
     * @mangled LoadPackData2__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_i
     * @address 0x139850
     * @size 0x40
     * @unknownret
     */
    void LoadPackData2(unsigned int *, char *, CDataAlloc2_1_ *, int, CDataAlloc2_1_ *, int);

    /**
     * @mangled LoadPackData3__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_ii
     * @address 0x139890
     * @size 0x40
     * @unknownret
     */
    void LoadPackData3(unsigned int *, char *, CDataAlloc2_1_ *, int, CDataAlloc2_1_ *, int, int);

    /**
     * @mangled DeleteExtendTexture__10CCharacterFi
     * @address 0x1398D0
     * @size 0xC0
     * @unknownret
     */
    void DeleteExtendTexture(int);

    /**
     * @mangled DeleteExtendMotion__10CCharacterFv
     * @address 0x139990
     * @size 0x40
     * @unknownret
     */
    void DeleteExtendMotion(void);

    /**
     * @mangled Initialize__10CCharacterFv
     * @address 0x1399D0
     * @size 0x2D0
     * @unknownret
     */
    void Initialize(void);

    /**
     * @mangled PickUpPoly__10CCharacterFPfP6CCPoly
     * @address 0x156710
     * @size 0x2D0
     * @unknownret
     */
    void PickUpPoly(float *, CCPoly *);
};

class CMainChara {
public:
    /**
     * @mangled Draw__10CMainCharaFv
     * @address 0x139CA0
     * @size 0x20
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled Initialize__10CMainCharaFv
     * @address 0x139CC0
     * @size 0x50
     * @unknownret
     */
    void Initialize(void);
};
