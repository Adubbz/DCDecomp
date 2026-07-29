#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCharacter;
class CRect_i_;
class CTexture;
struct sceVif1Packet;


class ClsMes {
public:
    /* ?ret */ void GetGaijiW(int); // @ 0x14CB30 (0xA0 bytes) -- mangled: GetGaijiW__6ClsMesFi
    /* ?ret */ void GetNameLen(int); // @ 0x14CBD0 (0x90 bytes) -- mangled: GetNameLen__6ClsMesFi
    /* ?ret */ void GetNameWidth(int); // @ 0x14CC60 (0x120 bytes) -- mangled: GetNameWidth__6ClsMesFi
    /* ?ret */ void AutoSetSub(CCharacter *, CCharacter *, int *); // @ 0x14CFE0 (0x50 bytes) -- mangled: AutoSetSub__6ClsMesFP10CCharacterP10CCharacterPi
    /* ?ret */ void AutoSet(int *); // @ 0x14D030 (0x630 bytes) -- mangled: AutoSet__6ClsMesFPi
    /* ?ret */ void AbsFukidashiIn(void); // @ 0x14D660 (0x160 bytes) -- mangled: AbsFukidashiIn__6ClsMesFv
    ClsMes(void); // @ 0x14D7C0 (0x240 bytes) -- mangled: __ct__6ClsMesFv
    /* ?ret */ void SetBuff(short *); // @ 0x14DA00 (0x30 bytes) -- mangled: SetBuff__6ClsMesFPs
    /* ?ret */ void SetBuff_system(short *); // @ 0x14DA30 (0x30 bytes) -- mangled: SetBuff_system__6ClsMesFPs
    /* ?ret */ void Preset(int); // @ 0x14DA60 (0x150 bytes) -- mangled: Preset__6ClsMesFi
    /* ?ret */ void SetMesFukidashi(int); // @ 0x14DBB0 (0x1E0 bytes) -- mangled: SetMesFukidashi__6ClsMesFi
    /* ?ret */ void Step(void); // @ 0x14DD90 (0x2F0 bytes) -- mangled: Step__6ClsMesFv
    /* ?ret */ void State(void); // @ 0x14E080 (0xB0 bytes) -- mangled: State__6ClsMesFv
    /* ?ret */ void MyTextureMake_InitAll(void); // @ 0x14E130 (0x40 bytes) -- mangled: MyTextureMake_InitAll__6ClsMesFv
    /* ?ret */ void GoNextPage(void); // @ 0x14E170 (0x50 bytes) -- mangled: GoNextPage__6ClsMesFv
    /* ?ret */ void MyTextureMake_sub(void); // @ 0x14E1C0 (0x1C0 bytes) -- mangled: MyTextureMake_sub__6ClsMesFv
    /* ?ret */ void MyTextureMake(void); // @ 0x14E380 (0x200 bytes) -- mangled: MyTextureMake__6ClsMesFv
    /* ?ret */ void MakeMesWinTbl_value(int *, int *); // @ 0x14E700 (0x230 bytes) -- mangled: MakeMesWinTbl_value__6ClsMesFPiPi
    /* ?ret */ void MakeMesWinTbl_value(int, int *, int *); // @ 0x14E930 (0x240 bytes) -- mangled: MakeMesWinTbl_value__6ClsMesFiPiPi
    /* ?ret */ void MakeMesWinTbl_system(int, int *, int *); // @ 0x14EB70 (0x480 bytes) -- mangled: MakeMesWinTbl_system__6ClsMesFiPiPi
    /* ?ret */ void GetMesLen_system(int); // @ 0x14EFF0 (0x330 bytes) -- mangled: GetMesLen_system__6ClsMesFi
    /* ?ret */ void GetMesWidth_system(int); // @ 0x14F320 (0x190 bytes) -- mangled: GetMesWidth_system__6ClsMesFi
    /* ?ret */ void GetTextLineDataTop(int); // @ 0x14F4B0 (0x70 bytes) -- mangled: GetTextLineDataTop__6ClsMesFi
    /* ?ret */ void GetTextLineDataTop_system(int); // @ 0x14F520 (0x70 bytes) -- mangled: GetTextLineDataTop_system__6ClsMesFi
    /* ?ret */ void InitMesWinTbl(void); // @ 0x14F590 (0x50 bytes) -- mangled: InitMesWinTbl__6ClsMesFv
    /* ?ret */ void SetMesWinTbl(int, int, short, short); // @ 0x14F5E0 (0x1A0 bytes) -- mangled: SetMesWinTbl__6ClsMesFiiss
    /* ?ret */ void CalcSpaceW(int, int, short *); // @ 0x14F780 (0x150 bytes) -- mangled: CalcSpaceW__6ClsMesFiiPs
    /* ?ret */ void MakeMesWinTbl(int); // @ 0x14F8D0 (0x430 bytes) -- mangled: MakeMesWinTbl__6ClsMesFi
    /* ?ret */ void NeedMesWinWH(int, int *); // @ 0x14FD60 (0x6B0 bytes) -- mangled: NeedMesWinWH__6ClsMesFiPi
    /* ?ret */ void MakeMesWin(int); // @ 0x150550 (0x100 bytes) -- mangled: MakeMesWin__6ClsMesFi
    /* ?ret */ void MakeMesTexture(int); // @ 0x150650 (0x1C0 bytes) -- mangled: MakeMesTexture__6ClsMesFi
    /* ?ret */ void Myset2DSprite_Fuchi(sceVif1Packet *, CTexture *, int, int, int, int, int, int, int, int); // @ 0x150810 (0x3A0 bytes) -- mangled: Myset2DSprite_Fuchi__6ClsMesFP13sceVif1PacketP8CTextureiiiiiiii
    /* ?ret */ void MakeFukidashi_sub(sceVif1Packet *, int); // @ 0x150F50 (0xB80 bytes) -- mangled: MakeFukidashi_sub__6ClsMesFP13sceVif1Packeti
    /* ?ret */ void MakeFukidashi(sceVif1Packet *); // @ 0x151AD0 (0x540 bytes) -- mangled: MakeFukidashi__6ClsMesFP13sceVif1Packet
    /* ?ret */ void DrawMesWin_sub(CTexture *, int, int, int); // @ 0x152030 (0x900 bytes) -- mangled: DrawMesWin_sub__6ClsMesFP8CTextureiii
    /* ?ret */ void DrawGaijiFont(CTexture *, int, const CRect_i_ &, const CRect_i_ &, int, int); // @ 0x152EE0 (0x308 bytes) -- mangled: DrawGaijiFont__6ClsMesFP8CTextureiRC8CRect_i_RC8CRect_i_ii
    /* ?ret */ void DrawMesWin(void); // @ 0x153310 (0xC30 bytes) -- mangled: DrawMesWin__6ClsMesFv
};
