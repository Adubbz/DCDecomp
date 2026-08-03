#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CBoxVu0;
class CCPoly;
class CCamera;
class CCameraFollow;
class CDataAlloc2_1_;
class CFrameVu1;


class CDungeonMap {
public:
    /**
     * @mangled SetNPC__11CDungeonMapFiPUiiPfPfiiP14CDataAlloc2_1_
     * @address 0x1C1C00
     * @size 0x270
     * @unknownret
     */
    void SetNPC(int, unsigned int *, int, float *, float *, int, int, CDataAlloc2_1_ *);

    /**
     * @mangled ClearNPC_Cash__11CDungeonMapFv
     * @address 0x1C1E70
     * @size 0x40
     * @unknownret
     */
    void ClearNPC_Cash(void);

    /**
     * @mangled ReservNPC_Draw__11CDungeonMapFifffi
     * @address 0x1C1EB0
     * @size 0xD0
     * @unknownret
     */
    void ReservNPC_Draw(int, float, float, float, int);

    /**
     * @mangled DrawNPCDraw__11CDungeonMapFv
     * @address 0x1C1F80
     * @size 0x270
     * @unknownret
     */
    void DrawNPCDraw(void);

    /**
     * @mangled StepNPC__11CDungeonMapFv
     * @address 0x1C21F0
     * @size 0xC0
     * @unknownret
     */
    void StepNPC(void);

    /**
     * @mangled NPCSetMotion__11CDungeonMapFii
     * @address 0x1C22B0
     * @size 0x40
     * @unknownret
     */
    void NPCSetMotion(int, int);

    /**
     * @mangled NPCSetMotion__11CDungeonMapFiifi
     * @address 0x1C22F0
     * @size 0x40
     * @unknownret
     */
    void NPCSetMotion(int, int, float, int);

    /**
     * @mangled GetFrameSearch__11CDungeonMapFPc
     * @address 0x1C2330
     * @size 0x90
     * @unknownret
     */
    void GetFrameSearch(char *);

    /**
     * @mangled DrawMapFreeStyle__11CDungeonMapFv
     * @address 0x1C23C0
     * @size 0x100
     * @unknownret
     */
    void DrawMapFreeStyle(void);

    /**
     * @mangled DrawMapCalc__11CDungeonMapFi
     * @address 0x1C24C0
     * @size 0x1D0
     * @unknownret
     */
    void DrawMapCalc(int);

    /**
     * @mangled DrawMap__11CDungeonMapFP13CCameraFollowP9CFrameVu1
     * @address 0x1C2690
     * @size 0x930
     * @unknownret
     */
    void DrawMap(CCameraFollow *, CFrameVu1 *);

    /**
     * @mangled DrawBGModel__11CDungeonMapFP7CCamera
     * @address 0x1C2FC0
     * @size 0xA0
     * @unknownret
     */
    void DrawBGModel(CCamera *);

    /**
     * @mangled DrawDummyModel__11CDungeonMapFP7CCamera
     * @address 0x1C3060
     * @size 0x120
     * @unknownret
     */
    void DrawDummyModel(CCamera *);

    /**
     * @mangled DrawMiniMap__11CDungeonMapFPff
     * @address 0x1C3180
     * @size 0x840
     * @unknownret
     */
    void DrawMiniMap(float *, float);

    /**
     * @mangled checkMask__11CDungeonMapFff
     * @address 0x1C39C0
     * @size 0x240
     * @unknownret
     */
    void checkMask(float, float);

    /**
     * @mangled FlushCheckMask__11CDungeonMapFv
     * @address 0x1C3C00
     * @size 0xC0
     * @unknownret
     */
    void FlushCheckMask(void);

    /**
     * @mangled DrawFireFreeStyle__11CDungeonMapFP9CFrameVu1P13CCameraFollow
     * @address 0x1C3CC0
     * @size 0x400
     * @unknownret
     */
    void DrawFireFreeStyle(CFrameVu1 *, CCameraFollow *);

    /**
     * @mangled DrawFire__11CDungeonMapFP9CFrameVu1P13CCameraFollow
     * @address 0x1C40C0
     * @size 0x550
     * @unknownret
     */
    void DrawFire(CFrameVu1 *, CCameraFollow *);

    /**
     * @mangled DrawRaster__11CDungeonMapFP9CFrameVu1
     * @address 0x1C4610
     * @size 0x330
     * @unknownret
     */
    void DrawRaster(CFrameVu1 *);

    /**
     * @mangled DrawWater__11CDungeonMapFPfi
     * @address 0x1C4940
     * @size 0x4A0
     * @unknownret
     */
    void DrawWater(float *, int);

    /**
     * @mangled DrawItemBox__11CDungeonMapFPf
     * @address 0x1C4DE0
     * @size 0x320
     * @unknownret
     */
    void DrawItemBox(float *);

    /**
     * @mangled DrawAtraBoll__11CDungeonMapFPf
     * @address 0x1C5100
     * @size 0x170
     * @unknownret
     */
    void DrawAtraBoll(float *);

    /**
     * @mangled CreateCollision__11CDungeonMapFP6CCPoly7CBoxVu0i
     * @address 0x1C5270
     * @size 0x150
     * @unknownret
     */
    void CreateCollision(CCPoly *, CBoxVu0, int);

    /**
     * @mangled initTrapCircle__11CDungeonMapFv
     * @address 0x1C79B0
     * @size 0x40
     * @unknownret
     */
    void initTrapCircle(void);

    /**
     * @mangled CheckTrapCircle__11CDungeonMapFPff
     * @address 0x1C79F0
     * @size 0xC0
     * @unknownret
     */
    void CheckTrapCircle(float *, float);

    /**
     * @mangled SetupTrapCircle__11CDungeonMapFPf
     * @address 0x1C7AB0
     * @size 0x120
     * @unknownret
     */
    void SetupTrapCircle(float *);

    /**
     * @mangled DrawTrapCircle__11CDungeonMapFv
     * @address 0x1C7BD0
     * @size 0x1B0
     * @unknownret
     */
    void DrawTrapCircle(void);

    /**
     * @mangled DistTrapCircle__11CDungeonMapFv
     * @address 0x1C7D80
     * @size 0xE0
     * @unknownret
     */
    void DistTrapCircle(void);

    /**
     * @mangled StepTrapCircle__11CDungeonMapFv
     * @address 0x1C7E60
     * @size 0x80
     * @unknownret
     */
    void StepTrapCircle(void);

    /**
     * @mangled CheckTreasureBox__11CDungeonMapFPff
     * @address 0x1C7EE0
     * @size 0xC0
     * @unknownret
     */
    void CheckTreasureBox(float *, float);

    /**
     * @mangled CheckAtra__11CDungeonMapFPff
     * @address 0x1C7FA0
     * @size 0xE0
     * @unknownret
     */
    void CheckAtra(float *, float);

    /**
     * @mangled SetAtraBoll__11CDungeonMapFPfi
     * @address 0x1C8080
     * @size 0x1C0
     * @unknownret
     */
    void SetAtraBoll(float *, int);

    /**
     * @mangled SetTreasureBox__11CDungeonMapFPfiii
     * @address 0x1C8240
     * @size 0x300
     * @unknownret
     */
    void SetTreasureBox(float *, int, int, int);

    /**
     * @mangled buildEventData__11CDungeonMapFiii
     * @address 0x1C8540
     * @size 0x680
     * @unknownret
     */
    void buildEventData(int, int, int);

    /**
     * @mangled SetMimicEvent__11CDungeonMapFfffii
     * @address 0x1C8BC0
     * @size 0x290
     * @unknownret
     */
    void SetMimicEvent(float, float, float, int, int);

    /**
     * @mangled RsetMimicEvent__11CDungeonMapFv
     * @address 0x1C8E50
     * @size 0x80
     * @unknownret
     */
    void RsetMimicEvent(void);

    /**
     * @mangled GetActiveIvent__11CDungeonMapFP9CFrameVu1
     * @address 0x1C8ED0
     * @size 0x150
     * @unknownret
     */
    void GetActiveIvent(CFrameVu1 *);

    /**
     * @mangled buildDummyModel__11CDungeonMapFv
     * @address 0x1C9020
     * @size 0x5B0
     * @unknownret
     */
    void buildDummyModel(void);

    /**
     * @mangled GetRoomLinkInfo__11CDungeonMapFv
     * @address 0x1C95D0
     * @size 0xC70
     * @unknownret
     */
    void GetRoomLinkInfo(void);

    /**
     * @mangled SetUnderLoad__11CDungeonMapFv
     * @address 0x1CA240
     * @size 0x50
     * @unknownret
     */
    void SetUnderLoad(void);

    /**
     * @mangled CreatPartsList__11CDungeonMapFPiiii
     * @address 0x1CA290
     * @size 0x1F0
     * @unknownret
     */
    void CreatPartsList(int *, int, int, int);

    /**
     * @mangled BuildCharaSpecialParts__11CDungeonMapFv
     * @address 0x1CA480
     * @size 0xDB0
     * @unknownret
     */
    void BuildCharaSpecialParts(void);

    /**
     * @mangled SetCharaDoor__11CDungeonMapFi
     * @address 0x1CB230
     * @size 0x40
     * @unknownret
     */
    void SetCharaDoor(int);

    /**
     * @mangled buildRandomMap__11CDungeonMapFii
     * @address 0x1CB670
     * @size 0x948
     * @unknownret
     */
    void buildRandomMap(int, int);

    /**
     * @mangled initSubmap__11CDungeonMapFP14CDataAlloc2_1_
     * @address 0x1CC0F0
     * @size 0x3A0
     * @unknownret
     */
    void initSubmap(CDataAlloc2_1_ *);

    /**
     * @mangled initalize__11CDungeonMapFv
     * @address 0x1CC490
     * @size 0x390
     * @unknownret
     */
    void initalize(void);
};
