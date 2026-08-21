#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCharacter;
class CRect_i_;
class CTexture;
struct sceVif1Packet;


/** One entry of the pair table at the tail of ClsMes. */
struct CLSMES_PAIR {
    s32 unk_0;
    s32 unk_4;
};

class ClsMes {
public:
    s32 unk_000;
    s32 unk_004;
    s32 unk_008;
    s32 unk_00C;
    s32 unk_010;
    s32 unk_014;
    s32 unk_018;
    s32 unk_01C;
    s32 unk_020;
    s32 unk_024;
    s32 unk_028;
    u8 unk_02C[0x2C];
    s32 unk_058;
    u8 unk_05C[0x30];
    float unk_08C;
    s32 unk_090;
    s32 unk_094;
    s32 unk_098;
    u8 unk_09C[0x8];
    float unk_0A4;
    float unk_0A8;
    s32 unk_0AC;
    s32 unk_0B0;
    s32 unk_0B4;
    s32 unk_0B8;
    s32 unk_0BC;
    s32 unk_0C0;
    u8 unk_0C4[0x15E4];
    s32 unk_16A8;
    s32 unk_16AC;
    s32 unk_16B0;
    s32 unk_16B4;
    s32 unk_16B8;
    s32 unk_16BC;
    s32 unk_16C0;
    s32 unk_16C4;
    s32 unk_16C8;
    s32 unk_16CC;
    s32 unk_16D0;
    s32 unk_16D4;
    u8 unk_16D8[0x8];
    s32 unk_16E0[10];
    s32 unk_1708[8];
    s32 unk_1728;
    s32 unk_172C;
    s32 unk_1730;
    s32 unk_1734;
    s32 unk_1738;
    s32 unk_173C;
    s32 unk_1740;
    s32 unk_1744;
    s32 unk_1748;
    s32 unk_174C;
    CLSMES_PAIR unk_1750[10];
    u8 unk_17A0[0x10];
    void *unk_17B0;
    u8 unk_17B4[4];

    /**
     * @mangled GetGaijiW__6ClsMesFi
     * @address 0x14CB30
     * @size 0xA0
     * @unknownret
     */
    void GetGaijiW(int);

    /**
     * @mangled GetNameLen__6ClsMesFi
     * @address 0x14CBD0
     * @size 0x90
     * @unknownret
     */
    void GetNameLen(int);

    /**
     * @mangled GetNameWidth__6ClsMesFi
     * @address 0x14CC60
     * @size 0x120
     * @unknownret
     */
    void GetNameWidth(int);

    /**
     * @mangled AutoSetSub__6ClsMesFP10CCharacterP10CCharacterPi
     * @address 0x14CFE0
     * @size 0x50
     * @unknownret
     */
    void AutoSetSub(CCharacter *, CCharacter *, int *);

    /**
     * @mangled AutoSet__6ClsMesFPi
     * @address 0x14D030
     * @size 0x630
     * @unknownret
     */
    void AutoSet(int *);

    /**
     * @mangled AbsFukidashiIn__6ClsMesFv
     * @address 0x14D660
     * @size 0x160
     * @unknownret
     */
    void AbsFukidashiIn(void);

    /**
     * @mangled __ct__6ClsMesFv
     * @address 0x14D7C0
     * @size 0x240
     */
    ClsMes(void);

    /**
     * @mangled SetBuff__6ClsMesFPs
     * @address 0x14DA00
     * @size 0x30
     * @unknownret
     */
    void SetBuff(short *);

    /**
     * @mangled SetBuff_system__6ClsMesFPs
     * @address 0x14DA30
     * @size 0x30
     * @unknownret
     */
    void SetBuff_system(short *);

    /**
     * @mangled Preset__6ClsMesFi
     * @address 0x14DA60
     * @size 0x150
     * @unknownret
     */
    void Preset(int);

    /**
     * @mangled SetMesFukidashi__6ClsMesFi
     * @address 0x14DBB0
     * @size 0x1E0
     * @unknownret
     */
    void SetMesFukidashi(int);

    /**
     * @mangled Step__6ClsMesFv
     * @address 0x14DD90
     * @size 0x2F0
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled State__6ClsMesFv
     * @address 0x14E080
     * @size 0xB0
     * @unknownret
     */
    void State(void);

    /**
     * @mangled MyTextureMake_InitAll__6ClsMesFv
     * @address 0x14E130
     * @size 0x40
     * @unknownret
     */
    void MyTextureMake_InitAll(void);

    /**
     * @mangled GoNextPage__6ClsMesFv
     * @address 0x14E170
     * @size 0x50
     * @unknownret
     */
    void GoNextPage(void);

    /**
     * @mangled MyTextureMake_sub__6ClsMesFv
     * @address 0x14E1C0
     * @size 0x1C0
     * @unknownret
     */
    void MyTextureMake_sub(void);

    /**
     * @mangled MyTextureMake__6ClsMesFv
     * @address 0x14E380
     * @size 0x200
     * @unknownret
     */
    void MyTextureMake(void);

    /**
     * @mangled MakeMesWinTbl_value__6ClsMesFPiPi
     * @address 0x14E700
     * @size 0x230
     * @unknownret
     */
    void MakeMesWinTbl_value(int *, int *);

    /**
     * @mangled MakeMesWinTbl_value__6ClsMesFiPiPi
     * @address 0x14E930
     * @size 0x240
     * @unknownret
     */
    void MakeMesWinTbl_value(int, int *, int *);

    /**
     * @mangled MakeMesWinTbl_system__6ClsMesFiPiPi
     * @address 0x14EB70
     * @size 0x480
     * @unknownret
     */
    void MakeMesWinTbl_system(int, int *, int *);

    /**
     * @mangled GetMesLen_system__6ClsMesFi
     * @address 0x14EFF0
     * @size 0x330
     * @unknownret
     */
    void GetMesLen_system(int);

    /**
     * @mangled GetMesWidth_system__6ClsMesFi
     * @address 0x14F320
     * @size 0x190
     * @unknownret
     */
    void GetMesWidth_system(int);

    /**
     * @mangled GetTextLineDataTop__6ClsMesFi
     * @address 0x14F4B0
     * @size 0x70
     * @unknownret
     */
    void GetTextLineDataTop(int);

    /**
     * @mangled GetTextLineDataTop_system__6ClsMesFi
     * @address 0x14F520
     * @size 0x70
     * @unknownret
     */
    void GetTextLineDataTop_system(int);

    /**
     * @mangled InitMesWinTbl__6ClsMesFv
     * @address 0x14F590
     * @size 0x50
     * @unknownret
     */
    void InitMesWinTbl(void);

    /**
     * @mangled SetMesWinTbl__6ClsMesFiiss
     * @address 0x14F5E0
     * @size 0x1A0
     * @unknownret
     */
    void SetMesWinTbl(int, int, short, short);

    /**
     * @mangled CalcSpaceW__6ClsMesFiiPs
     * @address 0x14F780
     * @size 0x150
     * @unknownret
     */
    void CalcSpaceW(int, int, short *);

    /**
     * @mangled MakeMesWinTbl__6ClsMesFi
     * @address 0x14F8D0
     * @size 0x430
     * @unknownret
     */
    void MakeMesWinTbl(int);

    /**
     * @mangled NeedMesWinWH__6ClsMesFiPi
     * @address 0x14FD60
     * @size 0x6B0
     * @unknownret
     */
    void NeedMesWinWH(int, int *);

    /**
     * @mangled MakeMesWin__6ClsMesFi
     * @address 0x150550
     * @size 0x100
     * @unknownret
     */
    void MakeMesWin(int);

    /**
     * @mangled MakeMesTexture__6ClsMesFi
     * @address 0x150650
     * @size 0x1C0
     * @unknownret
     */
    void MakeMesTexture(int);

    /**
     * @mangled Myset2DSprite_Fuchi__6ClsMesFP13sceVif1PacketP8CTextureiiiiiiii
     * @address 0x150810
     * @size 0x3A0
     * @unknownret
     */
    void Myset2DSprite_Fuchi(sceVif1Packet *, CTexture *, int, int, int, int, int, int, int, int);

    /**
     * @mangled MakeFukidashi_sub__6ClsMesFP13sceVif1Packeti
     * @address 0x150F50
     * @size 0xB80
     * @unknownret
     */
    void MakeFukidashi_sub(sceVif1Packet *, int);

    /**
     * @mangled MakeFukidashi__6ClsMesFP13sceVif1Packet
     * @address 0x151AD0
     * @size 0x540
     * @unknownret
     */
    void MakeFukidashi(sceVif1Packet *);

    /**
     * @mangled DrawMesWin_sub__6ClsMesFP8CTextureiii
     * @address 0x152030
     * @size 0x900
     * @unknownret
     */
    void DrawMesWin_sub(CTexture *, int, int, int);

    /**
     * @mangled DrawGaijiFont__6ClsMesFP8CTextureiRC8CRect_i_RC8CRect_i_ii
     * @address 0x152EE0
     * @size 0x308
     * @unknownret
     */
    void DrawGaijiFont(CTexture *, int, const CRect_i_ &, const CRect_i_ &, int, int);

    /**
     * @mangled DrawMesWin__6ClsMesFv
     * @address 0x153310
     * @size 0xC30
     * @unknownret
     */
    void DrawMesWin(void);
};

STATIC_ASSERT(sizeof(ClsMes) == 0x17B8);
