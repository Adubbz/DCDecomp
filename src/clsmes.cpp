#include "clsmes.hpp"

#include <cstdlib>
#include <cstring>

#include "character.hpp"
#include "editpartsinfo.hpp"
#include "rect.hpp"
#include "savedata.hpp"

/**
 * One external character, in the table the Georama editor's parts data ends
 * with. The window indexes it with the character's negative code, so the
 * entries sit before the address the code names.
 */
struct EDIT_GAIJI {
    s16 width; /**< How wide the character draws, in font cells. */
    u8 unk_02[0x1E];
};

STATIC_ASSERT(sizeof(EDIT_GAIJI) == 0x20);

/* The Georama editor's parts data; the message window reads the table of
 * external characters that follows it. */
extern "C" u8 EditPartsData[0x6E28];

/* Random tables the message window shakes its text with. */
extern "C" float RandTbl[64];
extern "C" float RandTbl2[64];

s16 ClsMes::GetGaijiW(int code) {
    if (code >= -0x300 && code < -0x263) {
        if (this->unk_16DC != 0) {
            if (code == -0x2BD) {
                return 5;
            }
            if (code == -0x2BA) {
                return 5;
            }
            if (code == -0x2AB) {
                return 5;
            }
        }
        return this->unk_008 * ((EDIT_GAIJI *) &EditPartsData[0x491C])[code].width;
    }
    return this->unk_008;
}

int ClsMes::GetNameLen(int chara) {
    if (chara < 0) {
        return -1;
    }
    if (chara >= 6) {
        return -1;
    }

    short *name = (short *) SaveData->GetCharaName(chara);

    for (int i = 0; i < 11; i++) {
        if ((u16) name[i] == 0) {
            return i;
        }
    }
    return -1;
}

INCLUDE_ASM("asm/nonmatchings/clsmes", GetNameWidth__6ClsMesFi);
INCLUDE_ASM("asm/nonmatchings/clsmes", Myset2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc);
void ClsMes::AutoSetSub(CCharacter *first, CCharacter *second, int *out_pos) {
    GetScrPosFromChar(first, out_pos);
    GetScrPosFromChar(second, &out_pos[2]);
}

INCLUDE_ASM("asm/nonmatchings/clsmes", AutoSet__6ClsMesFPi);
INCLUDE_ASM("asm/nonmatchings/clsmes", AbsFukidashiIn__6ClsMesFv);
INCLUDE_ASM("asm/nonmatchings/clsmes", __ct__6ClsMesFv);
void ClsMes::SetBuff(short *buff) {
    this->buff = buff;
    this->text = (char *) this->buff;
    this->text += (u16) this->buff[1];
}

void ClsMes::SetBuff_system(short *buff) {
    this->buff_system = buff;
    this->text_system = (char *) this->buff_system;
    this->text_system += (u16) this->buff_system[1];
}

INCLUDE_ASM("asm/nonmatchings/clsmes", Preset__6ClsMesFi);
INCLUDE_ASM("asm/nonmatchings/clsmes", SetMesFukidashi__6ClsMesFi);
INCLUDE_ASM("asm/nonmatchings/clsmes", Step__6ClsMesFv);
int ClsMes::State(void) {
    if (this->unk_090 <= 0.0f) {
        return 0;
    }
    if (0.0f < this->unk_090 && this->unk_090 < 1.0f) {
        return this->unk_094 != 0 ? 1 : 4;
    }
    if (this->unk_0AC != 0) {
        return 5;
    }
    if (this->unk_0B8 >= this->unk_020) {
        return 3;
    }
    return 2;
}

void ClsMes::MyTextureMake_InitAll(void) {
    if (this->unk_17B0 != NULL) {
        memset(this->unk_17B0, 0, 0x100);
    }
}

void ClsMes::GoNextPage(void) {
    if (this->unk_0AC != 0) {
        this->unk_0AC = 0;
        MyTextureMake_InitAll();
        this->unk_16B4 = 0;
        this->unk_0BC = this->unk_0C0;
    }
}

/* MyTextureMake_sub reproduces retail's control flow but comes out four
 * instructions short: retail's switch on the line code carries a dead range
 * check and hoists `this` into the argument register ahead of the compare
 * chain. A short function moves every function after it in the image, so the
 * marker supplies it until the switch comes out at retail's length. */
INCLUDE_ASM("asm/nonmatchings/clsmes", MyTextureMake_sub__6ClsMesFv);
INCLUDE_ASM("asm/nonmatchings/clsmes", MyTextureMake__6ClsMesFv);
INCLUDE_ASM("asm/nonmatchings/clsmes", SetAndGetNameRegistTbl__Fi);
INCLUDE_ASM("asm/nonmatchings/clsmes", MakeMesWinTbl_value__6ClsMesFPiPi);
INCLUDE_RODATA("asm/nonmatchings/clsmes", LIT_821);
INCLUDE_RODATA("asm/nonmatchings/clsmes", LIT_822);
INCLUDE_ASM("asm/nonmatchings/clsmes", MakeMesWinTbl_value__6ClsMesFiPiPi);
INCLUDE_ASM("asm/nonmatchings/clsmes", MakeMesWinTbl_system__6ClsMesFiPiPi);
INCLUDE_ASM("asm/nonmatchings/clsmes", GetMesLen_system__6ClsMesFi);
INCLUDE_ASM("asm/nonmatchings/clsmes", GetMesWidth_system__6ClsMesFi);
short *ClsMes::GetTextLineDataTop(int line) {
    int count = this->buff[0];
    short *body = &this->buff[1];

    for (int i = 0; i < count; i++) {
        if (line == body[i * 2 + 1]) {
            return &body[count] + body[i * 2 + 2];
        }
    }
    return NULL;
}

short *ClsMes::GetTextLineDataTop_system(int line) {
    int count = this->buff_system[0];
    short *body = &this->buff_system[1];

    for (int i = 0; i < count; i++) {
        if (line == body[i * 2 + 1]) {
            return &body[count] + body[i * 2 + 2];
        }
    }
    return NULL;
}

void ClsMes::InitMesWinTbl(void) {
    for (int i = 0; i < MES_WIN_LINE_MAX; i++) {
        this->win_line[i].unk_0 = 0;
        this->win_line[i].unk_2 = 0;
        this->win_line[i].unk_4 = 0;
        this->win_line[i].unk_6 = 0;
        this->win_line[i].unk_7 = 0;
    }
    this->win_line_num = 0;
}

INCLUDE_ASM("asm/nonmatchings/clsmes", SetMesWinTbl__6ClsMesFiiss);
INCLUDE_ASM("asm/nonmatchings/clsmes", CalcSpaceW__6ClsMesFiiPs);
INCLUDE_ASM("asm/nonmatchings/clsmes", MakeMesWinTbl__6ClsMesFi);
void NeedMesWinWH_sub(int *width, int *max_width, int *height, int *max_height,
                      int line_height, int count) {
    if (count <= 0) {
        return;
    }

    *width += count;
    if (*max_width < *width) {
        *max_width = *width;
    }

    *height += count * line_height;
    if (*max_height < *height) {
        *max_height = *height;
    }
}

INCLUDE_ASM("asm/nonmatchings/clsmes", NeedMesWinWH__6ClsMesFiPi);
void MakeRandTbl(float lo, float hi) {
    for (int i = 0; i < 64; i++) {
        RandTbl[i] = ((hi - lo) * (float) rand()) / 2147483648.0f;
        RandTbl[i] += lo;
    }
}

void MakeRandTbl2(float lo, float hi) {
    for (int i = 0; i < 64; i++) {
        RandTbl2[i] = ((hi - lo) * (float) rand()) / 2147483648.0f;
        RandTbl2[i] += lo;
    }
}

int ClsMes::MakeMesWin(int mes_no) {
    if (this->unk_16BC == mes_no) {
        if (this->unk_0B0 == 0) {
            this->unk_090 = 1.0f;
            this->unk_094 = 1;
            GoNextPage();
        }
        return 0;
    }

    this->unk_038 = 0;
    this->unk_0B8 = 0;
    this->unk_0BC = 0;
    this->unk_0C0 = 0;
    this->unk_0B4 = 0.0f;
    MakeMesTexture(mes_no);

    if (this->unk_038 == 0) {
        MakeRandTbl(0.0f, 4.0f);
    } else if (this->unk_038 == 1) {
        MakeRandTbl(2.0f, 6.0f);
    } else if (this->unk_038 == 4) {
        MakeRandTbl(6.8f, 15.2f);
        MakeRandTbl2(0.42f, 0.58f);
    }
    return 0;
}

void ClsMes::MakeMesTexture(int mes_no) {
    int wh[4];

    this->unk_16BC = mes_no;
    if (this->unk_034 != 0) {
        this->unk_090 = 0.0f;
        this->unk_094 = 1;
    }
    this->unk_0AC = 0;
    this->unk_16B4 = 0;
    MyTextureMake_InitAll();
    NeedMesWinWH(mes_no, wh);

    wh[1] += 1;
    wh[3] += this->unk_00C;
    this->unk_018 = wh[0];
    this->unk_01C = wh[1];
    this->unk_024 = wh[2];
    this->unk_028 = wh[3];

    if (this->unk_018 < 4) {
        this->unk_04C = this->unk_008 * 14;
    } else {
        this->unk_04C = this->unk_008 * (int) (5.0f + (5.0f + (float) this->unk_018));
    }
    this->unk_050 = this->unk_00C * (int) (1.5f + (1.5f + (float) this->unk_01C));
    this->unk_044 = this->unk_000 - (int) (5.0f * (float) this->unk_008);
    this->unk_048 = this->unk_004 - (int) (1.5f * (float) this->unk_00C);

    if (MakeMesWinTbl(mes_no) != 0) {
        this->unk_020 = this->win_line_num;
    }
}

INCLUDE_ASM("asm/nonmatchings/clsmes", Myset2DSprite_Fuchi__6ClsMesFP13sceVif1PacketP8CTextureiiiiiiii);
INCLUDE_ASM("asm/nonmatchings/clsmes", DrawMaru__FP13sceVif1Packetiiiiiiii);
INCLUDE_ASM("asm/nonmatchings/clsmes", MakeFukidashi_sub__6ClsMesFP13sceVif1Packeti);
INCLUDE_ASM("asm/nonmatchings/clsmes", MakeFukidashi__6ClsMesFP13sceVif1Packet);
INCLUDE_RODATA("asm/nonmatchings/clsmes", LIT_1556);
INCLUDE_RODATA("asm/nonmatchings/clsmes", LIT_1557);
void SetspRGBA(spRGBA *colour, int r, int g, int b, int a) {
    colour->r = r;
    colour->g = g;
    colour->b = b;
    colour->a = a;
}

INCLUDE_ASM("asm/nonmatchings/clsmes", DrawMesWin_sub__6ClsMesFP8CTextureiii);
INCLUDE_ASM("asm/nonmatchings/clsmes", MyMenuHelpWinDraw__FiiiiiiiP8CTexture);
INCLUDE_ASM("asm/nonmatchings/clsmes", GetPos_AbsPosSet__FiiiiiiiPiPi);
INCLUDE_ASM("asm/nonmatchings/clsmes", DrawGaijiFont__6ClsMesFP8CTextureiRC8CRect_i_RC8CRect_i_ii);
INCLUDE_ASM("asm/nonmatchings/clsmes", DrawMesWin__6ClsMesFv);
INCLUDE_RODATA("asm/nonmatchings/clsmes", LIT_2094);
INCLUDE_RODATA("asm/nonmatchings/clsmes", LIT_2095);
INCLUDE_RODATA("asm/nonmatchings/clsmes", LIT_2096);
INCLUDE_RODATA("asm/nonmatchings/clsmes", LIT_2097);
