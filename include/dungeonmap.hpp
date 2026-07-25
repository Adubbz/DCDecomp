#pragma once

#include "common.h"

class CDungeonMap {
public:
    /* ?ret */ void SetNPC(int, unsigned int *, int, float *, float *, int, int, CDataAlloc2_1_ *); // @ 0x1C1C00 (0x270 bytes) -- mangled: SetNPC__11CDungeonMapFiPUiiPfPfiiP14CDataAlloc2_1_
    /* ?ret */ void ClearNPC_Cash(void); // @ 0x1C1E70 (0x40 bytes) -- mangled: ClearNPC_Cash__11CDungeonMapFv
    /* ?ret */ void ReservNPC_Draw(int, float, float, float, int); // @ 0x1C1EB0 (0xD0 bytes) -- mangled: ReservNPC_Draw__11CDungeonMapFifffi
    /* ?ret */ void DrawNPCDraw(void); // @ 0x1C1F80 (0x270 bytes) -- mangled: DrawNPCDraw__11CDungeonMapFv
    /* ?ret */ void StepNPC(void); // @ 0x1C21F0 (0xC0 bytes) -- mangled: StepNPC__11CDungeonMapFv
    /* ?ret */ void NPCSetMotion(int, int); // @ 0x1C22B0 (0x40 bytes) -- mangled: NPCSetMotion__11CDungeonMapFii
    /* ?ret */ void NPCSetMotion(int, int, float, int); // @ 0x1C22F0 (0x40 bytes) -- mangled: NPCSetMotion__11CDungeonMapFiifi
    /* ?ret */ void GetFrameSearch(char *); // @ 0x1C2330 (0x90 bytes) -- mangled: GetFrameSearch__11CDungeonMapFPc
    /* ?ret */ void DrawMapFreeStyle(void); // @ 0x1C23C0 (0x100 bytes) -- mangled: DrawMapFreeStyle__11CDungeonMapFv
    /* ?ret */ void DrawMapCalc(int); // @ 0x1C24C0 (0x1D0 bytes) -- mangled: DrawMapCalc__11CDungeonMapFi
    /* ?ret */ void DrawMap(CCameraFollow *, CFrameVu1 *); // @ 0x1C2690 (0x930 bytes) -- mangled: DrawMap__11CDungeonMapFP13CCameraFollowP9CFrameVu1
    /* ?ret */ void DrawBGModel(CCamera *); // @ 0x1C2FC0 (0xA0 bytes) -- mangled: DrawBGModel__11CDungeonMapFP7CCamera
    /* ?ret */ void DrawDummyModel(CCamera *); // @ 0x1C3060 (0x120 bytes) -- mangled: DrawDummyModel__11CDungeonMapFP7CCamera
    /* ?ret */ void DrawMiniMap(float *, float); // @ 0x1C3180 (0x840 bytes) -- mangled: DrawMiniMap__11CDungeonMapFPff
    /* ?ret */ void checkMask(float, float); // @ 0x1C39C0 (0x240 bytes) -- mangled: checkMask__11CDungeonMapFff
    /* ?ret */ void FlushCheckMask(void); // @ 0x1C3C00 (0xC0 bytes) -- mangled: FlushCheckMask__11CDungeonMapFv
    /* ?ret */ void DrawFireFreeStyle(CFrameVu1 *, CCameraFollow *); // @ 0x1C3CC0 (0x400 bytes) -- mangled: DrawFireFreeStyle__11CDungeonMapFP9CFrameVu1P13CCameraFollow
    /* ?ret */ void DrawFire(CFrameVu1 *, CCameraFollow *); // @ 0x1C40C0 (0x550 bytes) -- mangled: DrawFire__11CDungeonMapFP9CFrameVu1P13CCameraFollow
    /* ?ret */ void DrawRaster(CFrameVu1 *); // @ 0x1C4610 (0x330 bytes) -- mangled: DrawRaster__11CDungeonMapFP9CFrameVu1
    /* ?ret */ void DrawWater(float *, int); // @ 0x1C4940 (0x4A0 bytes) -- mangled: DrawWater__11CDungeonMapFPfi
    /* ?ret */ void DrawItemBox(float *); // @ 0x1C4DE0 (0x320 bytes) -- mangled: DrawItemBox__11CDungeonMapFPf
    /* ?ret */ void DrawAtraBoll(float *); // @ 0x1C5100 (0x170 bytes) -- mangled: DrawAtraBoll__11CDungeonMapFPf
    /* ?ret */ void CreateCollision(CCPoly *, CBoxVu0, int); // @ 0x1C5270 (0x150 bytes) -- mangled: CreateCollision__11CDungeonMapFP6CCPoly7CBoxVu0i
    /* ?ret */ void initTrapCircle(void); // @ 0x1C79B0 (0x40 bytes) -- mangled: initTrapCircle__11CDungeonMapFv
    /* ?ret */ void CheckTrapCircle(float *, float); // @ 0x1C79F0 (0xC0 bytes) -- mangled: CheckTrapCircle__11CDungeonMapFPff
    /* ?ret */ void SetupTrapCircle(float *); // @ 0x1C7AB0 (0x120 bytes) -- mangled: SetupTrapCircle__11CDungeonMapFPf
    /* ?ret */ void DrawTrapCircle(void); // @ 0x1C7BD0 (0x1B0 bytes) -- mangled: DrawTrapCircle__11CDungeonMapFv
    /* ?ret */ void DistTrapCircle(void); // @ 0x1C7D80 (0xE0 bytes) -- mangled: DistTrapCircle__11CDungeonMapFv
    /* ?ret */ void StepTrapCircle(void); // @ 0x1C7E60 (0x80 bytes) -- mangled: StepTrapCircle__11CDungeonMapFv
    /* ?ret */ void CheckTreasureBox(float *, float); // @ 0x1C7EE0 (0xC0 bytes) -- mangled: CheckTreasureBox__11CDungeonMapFPff
    /* ?ret */ void CheckAtra(float *, float); // @ 0x1C7FA0 (0xE0 bytes) -- mangled: CheckAtra__11CDungeonMapFPff
    /* ?ret */ void SetAtraBoll(float *, int); // @ 0x1C8080 (0x1C0 bytes) -- mangled: SetAtraBoll__11CDungeonMapFPfi
    /* ?ret */ void SetTreasureBox(float *, int, int, int); // @ 0x1C8240 (0x300 bytes) -- mangled: SetTreasureBox__11CDungeonMapFPfiii
    /* ?ret */ void buildEventData(int, int, int); // @ 0x1C8540 (0x680 bytes) -- mangled: buildEventData__11CDungeonMapFiii
    /* ?ret */ void SetMimicEvent(float, float, float, int, int); // @ 0x1C8BC0 (0x290 bytes) -- mangled: SetMimicEvent__11CDungeonMapFfffii
    /* ?ret */ void RsetMimicEvent(void); // @ 0x1C8E50 (0x80 bytes) -- mangled: RsetMimicEvent__11CDungeonMapFv
    /* ?ret */ void GetActiveIvent(CFrameVu1 *); // @ 0x1C8ED0 (0x150 bytes) -- mangled: GetActiveIvent__11CDungeonMapFP9CFrameVu1
    /* ?ret */ void buildDummyModel(void); // @ 0x1C9020 (0x5B0 bytes) -- mangled: buildDummyModel__11CDungeonMapFv
    /* ?ret */ void GetRoomLinkInfo(void); // @ 0x1C95D0 (0xC70 bytes) -- mangled: GetRoomLinkInfo__11CDungeonMapFv
    /* ?ret */ void SetUnderLoad(void); // @ 0x1CA240 (0x50 bytes) -- mangled: SetUnderLoad__11CDungeonMapFv
    /* ?ret */ void CreatPartsList(int *, int, int, int); // @ 0x1CA290 (0x1F0 bytes) -- mangled: CreatPartsList__11CDungeonMapFPiiii
    /* ?ret */ void BuildCharaSpecialParts(void); // @ 0x1CA480 (0xDB0 bytes) -- mangled: BuildCharaSpecialParts__11CDungeonMapFv
    /* ?ret */ void SetCharaDoor(int); // @ 0x1CB230 (0x40 bytes) -- mangled: SetCharaDoor__11CDungeonMapFi
    /* ?ret */ void buildRandomMap(int, int); // @ 0x1CB670 (0x948 bytes) -- mangled: buildRandomMap__11CDungeonMapFii
    /* ?ret */ void initSubmap(CDataAlloc2_1_ *); // @ 0x1CC0F0 (0x3A0 bytes) -- mangled: initSubmap__11CDungeonMapFP14CDataAlloc2_1_
    /* ?ret */ void initalize(void); // @ 0x1CC490 (0x390 bytes) -- mangled: initalize__11CDungeonMapFv
};
