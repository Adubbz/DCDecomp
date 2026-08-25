#include "sysmes.hpp"
#include "clsmes.hpp"
#include "dataread.hpp"
#include "gamepad.hpp"
#include "mainselect.hpp"
#include "mglib.hpp"
#include <cstdio>
#include <cstring>
#include "texture.hpp"
#include "itemdata.hpp"
#include "memcard.hpp"
#include "snd.hpp"

extern "C" int CheckChar__Fc__3(char value);

extern "C" int SkipSpace__FR9input_str__3(input_str& input)
{
    char* text;
    int position;

    text = input.data;
    position = input.pos;
    while (position < input.size) {
        if (CheckChar__Fc__3(text[position])) break;
        position++;
    }
    input.pos = position;

    if (position >= input.size) return 0;
    return 1;
}

extern "C" int CheckChar__Fc__3(char value)
{
    int whitespace = 0;

    if (value == ' ') whitespace = 1;
    if (value == '\t') whitespace = 1;
    if (value == '\n') whitespace = 1;
    if (value == '\r') whitespace = 1;
    return !whitespace;
}

extern "C" void PreProcess__FR9input_str__2(input_str& input)
{
    u8* text = (u8*)input.data;
    int position = 0;

    while (position < input.size) {
        if (text[position] == '/' && text[position + 1] == '/') {
            while (position < input.size) {
                if (text[position] == '\n' || text[position] == '\r') break;
                text[position] = ' ';
                position++;
            }
        }
        if (text[position] == '/' && text[position + 1] == '*') {
            while (position < input.size) {
                if (text[position] == '*' && text[position + 1] == '/') {
                    text[position] = ' ';
                    text[position + 1] = ' ';
                    break;
                }
                text[position] = ' ';
                position++;
            }
            continue;
        }
        position++;
    }
}

/* The town's own message window, which everything with something to say to the player goes through
   and which the map editor's gate calls into before doing the same thing to a window of its own.
   It is set up once and asks for none of what the class can do — no speech bubble, no typing
   animation, no page marker — so a system message is one line of at most 26 characters that
   appears whole, sits under the picture for as many frames as its caller asked for, and goes. */

/* The message file is read straight into this one off the disc, and the drive transfers by DMA
   into whole cache lines. */
/* The language is spelled into the file name rather than chosen between names, and the read that
   fails falls back to one fixed file rather than to no text at all. */
void InitSystemMes()
{
    short* data = mes_data;
    int size;

    char name[64] = "meswin/system_a";

    if (LanguageCode > 0) {
        sprintf(name, "meswin/system_a_%d", LanguageCode);
    }
    strcat(name, ".mes");

    if (!LoadFile2(name, data, &size, 0)) {
        LoadFile("meswin/system_ae.bin", data, &size);
    }

    SystemMessage.Preset(1);
    SystemMessage.fukidashi = 0;
    SystemMessage.stay_frame = 1;
    SystemMessage.text_rate = 0;
    SystemMessage.text_rate_set = 0;
    SystemMessage.edge_alpha = 0;
    SystemMessage.page_arrow = 0;
    SystemMessage.fade_speed = 1.0f;
    SystemMessage.columns = 26;
    SystemMessage.rows = 1;
    SystemMessage.centre_rows = 0;
    SystemMessage.edge_alpha = 2;
    SystemMessage.unk_17B0 = mes_buff;
    SystemMessage.tex_block = 26;
    SystemMessage.SetBuff(data);
    SystemMessage.SetBuff_system(SystemMes);
}

void ClearSystemMes()
{
    SystemMessage.MakeMesWin(-1);
    SystemMesNo = -1;
    SystemMesCount = 0;
    SystemMesInputKey = 0;
    SystemMesWait = 0;
}

int SystemMesCheck()
{
    return SystemMesCount > 0;
}

/* A message counts down to nothing and is cleared at one rather than at zero, so the frame that
   would have shown it empty is the frame it goes away on. A message that asked for a button holds
   at two until the button is pressed. */
void SystemMesStep()
{
    if (SystemMesWait > 0) {
        SystemMesWait--;
        return;
    }
    if (SystemMesCount == 1) ClearSystemMes();
    if (SystemMesNo > 0) SystemMessage.Step();
    if (SystemMesInputKey == 0 || SystemMesCount != 2 || GamePad.Down(64)) {
        if (SystemMesCount > 0) SystemMesCount--;
    }
}

/* The window's own textures are put back every frame it is drawn, because whatever the game drew
   in between is free to have taken the video memory they were in. The line is centred by the width
   the text actually laid out to, which is not known until the window has been made. */
void SystemMesDraw()
{
    int x;
    int cols;

    if (SystemMesWait > 0) return;
    if (SystemMesNo <= 0) return;
    TexManager.ReloadTexture(Vif1Packet, SystemMessage.tex_block);
    cols = SystemMessage.text_columns;
    x = 320;
    x -= cols * 14 / 2;
    setbilinear(0);
    SystemMessage.text_x = x;
    SystemMessage.text_y = 345;
    SystemMessage.auto_pos = SystemMesPosition;
    SystemMessage.DrawMesWin();
}

/* Which message an item announces is decided by the band its number falls in, and the fourth band
   is the common items, whose message the item's own record names. */
void ItemGetMes(int item, int value, int count, int input_key)
{
    int* number;
    int no;
    COM_ITEM_INFO* info;

    int arg[4] = { -1, -1, -1, -1 };
    int num[4] = { 0, 0, 0, 0 };

    number = num;
    num[0] = value;
    SystemMessage.value_show = 0;
    SystemMessage.value_signed = 1;
    if (value < 0) {
        num[0] = 0;
        SystemMessage.value_signed = 0;
    }
    arg[0] = item + 100;
    no = 10;
    if (item >= 81) no += 10;
    if (item >= 145) no += 10;
    if (item >= 257) {
        no = 10;
        info = GetCommonItemInfo(item);
        if (!info) {
            printf("item_no: %d  is NULL\n", item);
        } else {
            arg[0] = info->msg + 100;
        }
    }
    SetSystemMes(no, count, 8, input_key, arg, number);
}

void AtraGetMes(int map, int no, int count)
{
    int arg[4] = { -1, -1, -1, -1 };

    arg[0] = GetAtraMsgNo(map, no);
    SetSystemMes(40, count, 8, 1, arg, 0);
}

void TecGetMes(int tec, int count)
{
    int arg[4] = { -1, -1, -1, -1 };

    arg[0] = tec + 500;
    SetSystemMes(50, count, 8, 1, arg, 0);
}

void MaxUpMes(int value, int count)
{
    int number[4] = { 0, -1, -1, -1 };

    number[0] = value;
    SetSystemMes(51, count, 8, 1, 0, number);
}

/* A party member out of range names the first one rather than saying nothing, which is the clamp
   the message further down makes one member along. */
void DeadMes(int member, int count)
{
    if (member < 0 || member > 5) member = 0;

    int arg[4] = { 0, -1, -1, -1 };

    arg[0] = member + 50;
    SetSystemMes(60, count, 8, 1, arg, 0);
}

void AllDeadMes(int count)
{
    SetSystemMes(61, count, 8, 1, 0, 0);
}

void NotGetAtraMes(int member, int count)
{
    if (member < 0 || member > 5) member = 1;

    int arg[4] = { 0, -1, -1, -1 };

    arg[0] = member + 50;
    SetSystemMes(70, count, 8, 0, arg, 0);
}

void DontGetItemMes(int kind)
{
    int no;

    no = 72;
    if (kind == 2) no = 81;
    SetSystemMes(no, 40, 8, 1, 0, 0);
}

/* A negative entry in either list means *leave the slot empty* rather than substitute a negative
   number, so every slot is cleared before it is written and only four of each are ever filled. */
void SetSystemMes(int no, int count, int position, int input_key, int* arg, int* number)
{
    int i;

    SystemMesInputKey = input_key;
    if (arg) {
        for (i = 0; i < 4; i++) {
            SystemMessage.mes_no[i] = -1;
            if (*arg >= 0) SystemMessage.mes_no[i] = *arg;
            arg++;
        }
    }
    if (number) {
        for (i = 0; i < 4; i++) {
            SystemMessage.values[i] = -1;
            if (*number >= 0) SystemMessage.values[i] = *number;
            number++;
        }
    }
    SystemMessage.MakeMesWin(no);
    SystemMesNo = no;
    SystemMesCount = count;
    SystemMesPosition = position;
}

void pretest(float matrix[4][4], float* translation)
{
    register float* matrix_data = &matrix[0][0];
    register float* offset = translation;

    asm {
        lqc2 vf10, 0(matrix_data)
        lqc2 vf11, 16(matrix_data)
        lqc2 vf12, 32(matrix_data)
        lqc2 vf13, 48(matrix_data)
        lqc2 vf14, 0(offset)
    }
}

void Trans_AddCell(float* output, float* position)
{
    register float* destination = output;
    register float* source = position;

    asm {
        lqc2 vf16, 0(source)
        vmulax ACC, vf10, vf16
        vmadday ACC, vf11, vf16
        vmaddaz ACC, vf12, vf16
        vmaddw vf17, vf13, vf16
        vadd.xz vf16, vf16, vf14
        sqc2 vf17, 0(destination)
        sqc2 vf16, 0(source)
    }
}
