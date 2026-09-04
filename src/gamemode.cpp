#include "common.h"

#include <libmc.h>

#include <cstdio>
#include <cstring>

#include "clsmes.hpp"
#include "dataalloc.hpp"
#include "debugfont.hpp"
#include "gamemode.hpp"
#include "gamepad.hpp"
#include "mainselect.hpp"
#include "memcard.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "snd.hpp"
#include "texture.hpp"

extern int NextMapNo;
extern int mode;
extern int mc_mode;
extern CGamePad GamePad;
extern CDebugFont DebugFont;
extern CDataAlloc2<1> mainCDataAlloc2;
extern u_int *read_buffer;
extern CTexture *StayTexture;
extern ClsMes CommonMenuMes2;
extern ClsMes EditSystemMes;
extern char MesWinTexBuff_01[256];

void InitializeDataBuffer(void);
void SetDataBuffer(CDataAlloc2<1> *buffer, int quads);
void SetPacketReadBuffer(int packet_quads, int read_quads);
void LoadFileMenuData(char *name, u_int *buffer);
int SaveEnableCheck(void);
void DrawMenuSave(char *name);

static int edit_map;
static int sub_map;
static int event_no;
static int mem_check_mode;
static int check_cancel;
static int trial_count;
static int trial_started;

/* The game's top-level modes and the transitions between them: map jumps, the
 * menu, the save and memory-card screens, the trial ending. */

void MapJump(int map_no, int event_no) {
    NextMapNo = map_no;
    StartEventNo = event_no;
}

void MenuInit() {
    static LOADTEXTURE_INFO textures[64] = {{"#frame_buff#640#224#4"},
                                            {"img/ankfont.img"},
                                            {""}};
    float background;
    int result;
    InitializeDataBuffer();
    SetDataBuffer(&TextureData, 100000);
    SetPacketReadBuffer(10000, 100000);
    TexManager.Initialize(16352);
    result = TexManager.EnterTextureFile(textures);
    result = TexManager.LoadTextureBlock(-1, read_buffer);
    MGSetBGColor(0.0f, 0.0f, background = 128.0f, background);
    DebugFont.texture = "frame_buff";
    DebugFont.x = 16;
    DebugFont.y = 16;
    DebugFont.w = 256;
    DebugFont.h = 224;
    DebugFont.alpha = 64;
    GamePad.SetAutoRepeat(61440, 25, 3);
}

/**
 * Draws and operates the developer's top-level map and mode selector.
 */
int MenuLoop() {
    static char *menu[10] = {
        "game start",
        "%se0%d\n",
        "%ss%d\n",
        "interior",
        "dungeon",
        "opening",
        "%sevent%d\n",
        "%smemory card %d\n",
        "%sLanguage %d\n",
        ""};
    static int map_no[10] = {800, 0, 11, 99, 200, 400, 0, 0, 0, -1};

    DebugFont.len = 0;

    int i = 0;
    static int select = 0;

    while (menu[i][0] != 0) {
        i++;
    }

    char *cursor[2] = {" ", ">"};

    if (GamePad.Down(16384)) {
        select++;
    }
    if (GamePad.Down(4096)) {
        select--;
    }
    if (select < 0) {
        select = 0;
    }
    if (select >= i) {
        select = i - 1;
    }

    if (select == 1) {
        if (GamePad.Down(8192)) {
            edit_map++;
        }
        if (GamePad.Down(32768)) {
            edit_map--;
        }
        if (edit_map < 0) {
            edit_map = 0;
        }
        if (edit_map > 4) {
            edit_map = 4;
        }
    }

    if (select == 2) {
        if (GamePad.Down(8192)) {
            sub_map++;
        }
        if (GamePad.Down(32768)) {
            sub_map--;
        }
        if (GamePad.Down(8)) {
            sub_map += 10;
        }
        if (GamePad.Down(4)) {
            sub_map -= 10;
        }
        if (sub_map < 0) {
            sub_map = 98;
        }
        if (sub_map > 98) {
            sub_map = 0;
        }
    }

    if (select == 6) {
        if (GamePad.Down(8192)) {
            event_no++;
        }
        if (GamePad.Down(32768)) {
            event_no--;
        }
        if (GamePad.Down(8)) {
            event_no += 10;
        }
        if (GamePad.Down(4)) {
            event_no -= 10;
        }
        if (event_no < 0) {
            event_no = 2;
        }
        if (event_no > 2) {
            event_no = 0;
        }
    }

    if (select == 7) {
        if (GamePad.Down(8192)) {
            mc_mode++;
        }
        if (GamePad.Down(32768)) {
            mc_mode--;
        }
        if (mc_mode < 0) {
            mc_mode = 3;
        }
        if (mc_mode > 3) {
            mc_mode = 0;
        }
    }

    if (select == 8) {
        if (GamePad.Down(8192)) {
            LanguageCode++;
        }
        if (GamePad.Down(32768)) {
            LanguageCode--;
        }
        if (LanguageCode < 0) {
            LanguageCode = 0;
        }
        if (LanguageCode > 6) {
            LanguageCode = 6;
        }
    }

    DebugFont.len += sprintf(&DebugFont.text[DebugFont.len],
                             "Dark Cloud Ver2.17 2001/05/11\n");
    DebugFont.len += sprintf(&DebugFont.text[DebugFont.len], "%s%s\n", cursor[select == 0],
                             menu[0]);
    DebugFont.len += sprintf(&DebugFont.text[DebugFont.len], menu[1], cursor[select == 1],
                             edit_map + 1);
    DebugFont.len += sprintf(&DebugFont.text[DebugFont.len], menu[2], cursor[select == 2],
                             sub_map + 1);

    for (i = 3; i < 6; i++) {
        DebugFont.len += sprintf(&DebugFont.text[DebugFont.len], "%s%s\n",
                                 cursor[i == select], menu[i]);
    }

    DebugFont.len += sprintf(&DebugFont.text[DebugFont.len], menu[i], cursor[i == select],
                             event_no);
    i++;
    DebugFont.len += sprintf(&DebugFont.text[DebugFont.len], menu[i], cursor[i == select],
                             mc_mode);
    i++;
    DebugFont.len += sprintf(&DebugFont.text[DebugFont.len], menu[i], cursor[i == select],
                             LanguageCode);

    TexManager.ReloadTexture(GetVif1Packet(), 0);
    DebugFont.Draw();

    if (GamePad.Down(32) || GamePad.Down(16)) {
        static int map[3] = {23, 41, 19};
        static int event[3] = {310, 150, 305};

        main_select_padrup = 0;
        if (GamePad.Down(16)) {
            main_select_padrup = 1;
        }
        OldMapNo = -1;
        NextMapNo = -1;
        GamePad.AutoRepeatOff();

        main_select_menu_no = map_no[select];
        mode = 2;

        if (select == 1) {
            main_select_menu_no = edit_map;
            LocalMapNo = edit_map;
        }
        if (select == 2) {
            main_select_menu_no = sub_map + 11;
            LocalMapNo = main_select_menu_no;
        }
        if (select == 6) {
            MapJump(map[event_no], event[event_no]);
            return 1;
        }
        if (select == 7) {
            mode = 13;
            return 1;
        }

        MapNo = main_select_menu_no;
        if (main_select_menu_no == 200) {
            main_select_menu_no = 0;
            mode = 9;
        }
        if (main_select_menu_no == 800) {
            MapNo++;
            main_select_menu_no = 0;
            strcpy(main_select_param, "title");
            mode = 1;
        }
        if (main_select_menu_no == 400) {
            main_select_menu_no = 0;
            mode = 5;
        }
        return 1;
    }

    return 0;
}

void MemCheckInit() {
    static LOADTEXTURE_INFO textures[64] = {{"#frame_buff#640#224#4"},
                                            {"img_1/memory.img"},
                                            {""}};
    int result;
    InitializeDataBuffer();
    SetDataBuffer(&TextureData, 100000);
    SetPacketReadBuffer(10000, 100000);
    TexManager.Initialize(16352);
    result = TexManager.EnterTextureFile(textures);
    TexManager.LoadTextureBlock(-1, read_buffer);
    MGSetBGColor(0.0f, 0.0f, 0.0f, 0.0f);
    if (sceMcInit())
        printf("libmc initialize faild\n");
    mem_check_mode = 0;
    check_cancel = 2;
    trial_count = 0;
    trial_started = 0;
}

int MemCheckLoop() {
    DebugFont.len = 0;
    TexManager.ReloadTexture(GetVif1Packet(), 0);
    switch (mem_check_mode) {
        case 0:
            if (check_cancel > 0)
                break;
            switch (SaveEnableCheck()) {
                case 1:
                    return 1;
                case 0:
                    mem_check_mode = 2;
                    break;
                case -1:
                    mem_check_mode = 3;
                    break;
            }
            break;
        case 1:
            break;
        case 2:
        case 3: {
            CRect_i_ rect;
            rect.x = 0;
            rect.y = 0;
            rect.width = 640;
            rect.height = 448;
            set2DSprite(GetVif1Packet(),
                        TexManager.GetTexture(mem_check_mode == 2 ? "memory01" : "memory02", -1),
                        rect, 0, 0);
            if (GamePad.Down(32)) {
                mem_check_mode = 0;
                check_cancel = 3;
            }
            if (GamePad.Down(64))
                mem_check_mode = 4;
            break;
        }
        case 4:
            return 1;
    }
    check_cancel--;
    if (check_cancel < 0)
        check_cancel = 0;
    return 0;
}

void InitSave() {
    static LOADTEXTURE_INFO textures[64] = {{"#frame_buff#640#448#4", 1},
                                            {"#mes_frame_buff#640#448#4", 26},
                                            {"#fukidashibase#640#224#4", 26},
                                            {"#fontbase#512#256#1", 26},
                                            {"#fuki256#128#128#1", 26},
                                            {"meswin/gaiji.img", 26}};
    InitializeDataBuffer();
    SetDataBuffer(&TextureData, 100000);
    SetPacketReadBuffer(10000, 100000);
    TexManager.Initialize(16352);
    TexManager.EnterTextureFile(textures);
    TexManager.LoadTextureBlock(-1, read_buffer);
    LoadFileMenuData("stayframe.img", read_buffer);
    TexManager.EnterFixTextureZ((u_char *) read_buffer);
    StayTexture = TexManager.GetTexture("stayframe", -1);
    CommonMenuMes2.SetBuff_system(SystemMes);
    EditSystemMes.unk_17B0 = MesWinTexBuff_01;
    InitMenuSave(mc_mode, 1, read_buffer);
}

int LoopSave() {
    int result = MenuSaveKey();
    DrawMenuSave(0);
    return result;
}

void TrialEndInit() {}

int TrialEndLoop() { return 1; }

void TrialStart() {}

int CheckTrialEnd() { return 0; }

INCLUDE_ASM("asm/nonmatchings/gamemode", __as__13MAP_NPC_MODELFRC13MAP_NPC_MODEL);
INCLUDE_ASM("asm/nonmatchings/gamemode", __as__10CCharacterFRC10CCharacter);
INCLUDE_ASM("asm/nonmatchings/gamemode", __as__7CObjectFRC7CObject);
INCLUDE_ASM("asm/nonmatchings/gamemode", __as__6CWaterFR6CWater);
INCLUDE_ASM("asm/nonmatchings/gamemode", __as__14CVisualPolyVu1FRC14CVisualPolyVu1);
INCLUDE_ASM("asm/nonmatchings/gamemode", __as__10CVisualVu1FRC10CVisualVu1);
INCLUDE_ASM("asm/nonmatchings/gamemode", __as__7CVisualFRC7CVisual);
INCLUDE_ASM("asm/nonmatchings/gamemode", __ct__12CategoryAttrFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", Initialize__12CategoryAttrFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", __ct__11CBombEffectFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", Initialize__11CBombEffectFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", __ct__10CMajinBeemFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", Initialize__10CMajinBeemFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", __ct__13MAP_NPC_MODELFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", __ct__10CCharacterFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", __ct__11MotionParamFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", __ct__13CTextureAnimeFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", __ct__7CObjectFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", __ct__12CSHOT_EFFECTFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", __ct__8CHitMarkFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", Alloc__18CDataAlloc_1_6000_Fi);
INCLUDE_ASM("asm/nonmatchings/gamemode", Align64__18CDataAlloc_1_6000_Fv);
