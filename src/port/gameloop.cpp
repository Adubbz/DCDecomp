#include "gameloop.hpp"

#include <cstring>

#include "battle_globals.hpp"
#include "btsysscript.hpp"
#include "dataread.hpp"
#include "dataset.hpp"
#include "dun/gameloop.hpp"
#include "gamemode.hpp"
#include "gamepad.hpp"
#include "langset.hpp"
#include "main.hpp"
#include "mainselect.hpp"
#include "menu_save.hpp"
#include "mglib.hpp"
#include "nowload.hpp"
#include "platform/clock.hpp"
#include "platform/input.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "title/opening.hpp"
#include "title/rushmovi.hpp"
#include "title/title.hpp"

int  EditInit(void *param);
int  EditLoop();
void SndInit();

extern s32 mode;
extern s32 mc_mode;
extern s32 NextMapNo;

namespace {

// Words of CSaveData::config that main() reads and writes directly.
constexpr int kConfigVibrationOff = 7;
constexpr int kConfigScreenX = 12;
constexpr int kConfigScreenY = 13;
constexpr int kConfigGameClear = 14;

// CSaveData::map_no is private; retail's main() writes it by offset.
constexpr int kSaveMapNoOffset = 0x1C8;

constexpr int kWarmUpTicks = 60;

// Retail's save_data and config_data are static in main.cpp, so the port
// keeps its own; everything else reaches the save through SaveData.
alignas(64) CSaveData g_save_data;
SV_CONFIG_SYS g_config_data;

s32 *ConfigWords() {
    return static_cast<s32 *>(SaveData->GetConfigData());
}

bool DebugButtonsHeld() {
    return GamePad.On2(PAD_R1) != 0 && GamePad.On2(PAD_R2) != 0 && GamePad.On2(PAD_L1) != 0 && GamePad.On2(PAD_L2) != 0;
}

void UpdatePad() {
    InputPoll();
    GamePad.UpDate();
}

// init_all without the IOP, the CD drive, DevInit's DMA reset and the DMA
// channel handles: the port's replacements need none of them.
void InitAll() {
    InitCDFile();
    MGInit();
    InitMemoryFile();
    BufferAllClear();
    InitReadBG();
}

void ModeInit(int &title_ran, int &exist_data, bool &skip_title) {
    switch (mode) {
        case GAME_MODE_LOADER:
            LoaderInit();
            break;
        case GAME_MODE_LANGUAGE:
            LangsetInit();
            break;
        case GAME_MODE_TITLE:
            LoadSystemMessage();
            GlobalNameInit();
            SndInitialize(4, 30, 4, 5);
            if (!title_ran) {
                title_ran = 1;
                exist_data = InitExistData();
                if (ConfigWords()[kConfigGameClear] != 0) {
                    GameClearFlag = 1;
                }
            }
            TitleInit(exist_data);
            break;
        case GAME_MODE_RUSH_MOVIE:
            SndInitialize(4, 30, 4, 5);
            RushInit();
            if (GamePad.On(PAD_START) != 0) {
                MapJump(800, -1);
                skip_title = true;
            }
            break;
        case GAME_MODE_EDIT:
            EditInit(nullptr);
            break;
        case GAME_MODE_MENU:
            MenuInit();
            break;
        case GAME_MODE_SAVE:
            InitSave();
            break;
        case GAME_MODE_MEMORY_CHECK:
            MemCheckInit();
            break;
        case GAME_MODE_TRIAL_END:
            TrialEndInit();
            break;
        case GAME_MODE_OPENING:
            SndInitialize(4, 30, 4, 5);
            OpeningInit();
            break;
        case GAME_MODE_UNUSED_6:
        case GAME_MODE_UNUSED_8:
        case GAME_MODE_UNUSED_12:
            break;
        default:
            GameInit();
            break;
    }
}

void StartNewGame() {
    char names[6][64];
    for (int i = 0; i < 6; ++i) {
        std::memcpy(names[i], g_save_data.GetCharaName(i), sizeof(names[i]));
    }
    g_save_data.ConvertConfig(&g_config_data);
    std::memset(static_cast<void *>(&g_save_data), 0, sizeof(CSaveData));
    g_save_data.Initialize();
    g_save_data.InvertConfig(&g_config_data);
    for (int i = 0; i < 6; ++i) {
        std::memcpy(g_save_data.GetCharaName(i), names[i], sizeof(names[i]));
    }
    TrialStart();
}

// One frame of the current mode. Returns what the mode's loop returned; a
// non-zero result ends the mode.
int ModeLoop(bool &skip_title) {
    int result = 0;
    switch (mode) {
        case GAME_MODE_LANGUAGE:
            result = LangsetLoop();
            if (result != 0) {
                MapNo = -1;
                mode = GAME_MODE_MEMORY_CHECK;
            }
            break;
        case GAME_MODE_TITLE:
            result = TitleLoop();
            if (result == 1 || result == 2) {
                main_select_menu_no = result == 1 ? 0 : 1;
                std::strcpy(main_select_param, "e01");
                mode = GAME_MODE_EDIT;
            }
            if (result == 3) {
                mode = GAME_MODE_DUNGEON;
                main_select_menu_no = 0;
            }
            if (result == 5) {
                mode = GAME_MODE_OPENING;
            }
            if (result == 1) {
                MapJump(400, -1);
                StartNewGame();
            }
            if (result == 4) {
                MapJump(801, -1);
            }
            if (result == 2) {
                SndInitialize(4, 30, 4, 5);
            }
            break;
        case GAME_MODE_RUSH_MOVIE:
            if (skip_title) {
                result = 1;
                MapJump(800, -1);
                skip_title = false;
            } else {
                result = RushLoop();
                if (result != 0) {
                    MapJump(800, -1);
                }
            }
            break;
        case GAME_MODE_EDIT:
            result = EditLoop();
            // Sequential, as retail tests them: 1 and 2 are overwritten by MENU.
            if (result == 1) {
                mode = GAME_MODE_TITLE;
            }
            if (result == 2) {
                mode = GAME_MODE_EDIT;
            }
            if (result != 0) {
                mode = GAME_MODE_MENU;
            }
            if (result == 3) {
                mode = GAME_MODE_DUNGEON;
            }
            break;
        case GAME_MODE_MENU:
            result = MenuLoop();
            break;
        case GAME_MODE_SAVE:
            result = LoopSave();
            if (result != 0) {
                mode = GAME_MODE_MENU;
            }
            break;
        case GAME_MODE_UNUSED_12:
            // Retail reads a register nothing set; the port's zero keeps the
            // mode running, as an idle mode should.
            break;
        case GAME_MODE_MEMORY_CHECK:
            result = MemCheckLoop();
            if (result != 0) {
                MapNo = 801;
                mode = GAME_MODE_RUSH_MOVIE;
            }
            break;
        case GAME_MODE_TRIAL_END:
            result = TrialEndLoop();
            if (result != 0) {
                MapNo = 800;
                mode = GAME_MODE_TITLE;
            }
            break;
        case GAME_MODE_OPENING:
            result = OpeningLoop();
            if (result != 0) {
                mode = GAME_MODE_TITLE;
                MapJump(0, -1);
            }
            break;
        case GAME_MODE_LOADER:
            result = LoaderLoop();
            if (result != 0) {
                mode = GAME_MODE_DUNGEON;
            }
            break;
        case GAME_MODE_UNUSED_6:
        case GAME_MODE_UNUSED_8:
            break;
        default:
            result = GameLoop();
            if (result != 0) {
                mode = GAME_MODE_MENU;
            }
            break;
    }
    return result;
}

void FollowMapJump() {
    if (NextMapNo < 0) {
        return;
    }
    OldMapNo = MapNo;
    if (NextMapNo < 200) {
        mode = GAME_MODE_EDIT;
        MapNo = NextMapNo;
    } else if (NextMapNo < 300) {
        mode = GAME_MODE_DUNGEON;
        MapNo = NextMapNo;
        LocalMapNo = NextMapNo - 200;
        main_select_menu_no = LocalMapNo;
    } else if (NextMapNo == 400) {
        mode = GAME_MODE_OPENING;
        MapNo = NextMapNo;
        LocalMapNo = 0;
        main_select_menu_no = 0;
    } else if (NextMapNo >= 800) {
        main_select_menu_no = 0;
        std::strcpy(main_select_param, "title");
        if (NextMapNo == 800) {
            mode = GAME_MODE_TITLE;
        }
        if (NextMapNo == 801) {
            mode = GAME_MODE_RUSH_MOVIE;
        }
        MapNo = NextMapNo;
        LocalMapNo = 0;
    }
    if (NextMapNo == 1000) {
        MapNo = -1;
        LocalMapNo = 0;
        mode = GAME_MODE_SAVE;
        mc_mode = SAVE_MENU_MODE_ENDING;
    }
}

} // namespace

int RunGame(int argc, char **argv) {
    // mwInit is not called: the host has run every static constructor.
    DebugMode = 0;
    mode = GAME_MODE_MENU;
    main_select_menu_no = 0;
    std::strcpy(main_select_param, "e01");
    InitAll();

    ClockSyncV();
    GamePad.Init();

    SaveData = &g_save_data;
    NextMapNo = -1;
    MapNo = -1;
    OldMapNo = -1;
    StartEventNo = -1;
    GameClearFlag = 0;
    std::memset(static_cast<void *>(&g_save_data), 0, sizeof(CSaveData));
    g_save_data.Initialize();
    GlobalNameInit();

    for (int tick = 0; tick < kWarmUpTicks; ++tick) {
        ClockSyncV();
        UpdatePad();
        // Holding the four shoulder buttons on pad 2 through the first second turns on debug mode.
        if (DebugButtonsHeld()) {
            DebugMode = 1;
        }
    }
    if (!DebugMode) {
        MapNo = -1;
        mode = GAME_MODE_LANGUAGE;
        GamePad.KeyLock2(1);
    }

    int  title_ran = 0;
    int  exist_data = 0;
    bool data_loaded = false;
    bool skip_title = false;
    for (;;) {
        if (mode != GAME_MODE_UNUSED_12 && !data_loaded) {
            initialize_data();
            data_loaded = true;
        }
        InitReadBG();
        SndInit();

        if (!DebugMode && mode == GAME_MODE_MENU) {
            MapNo = 801;
            mode = GAME_MODE_RUSH_MOVIE;
        }

        LoadOverlay(mode);
        MGSetRenderInfo(800.0f, 10.0f, 65535.0f);
        switch (mode) {
            case GAME_MODE_LOADER:
            case GAME_MODE_MENU:
            case GAME_MODE_MEMORY_CHECK:
            case GAME_MODE_LANGUAGE:
                MapNo = -1;
                OldMapNo = -1;
                break;
        }

        if (mode != GAME_MODE_UNUSED_12 && StartEventNo < 0) {
            init_now_loading(MapNo);
        }
        GamePad.StopVibration();
        if (DebugMode) {
            LoadSystemMessage();
        }

        ModeInit(title_ran, exist_data, skip_title);

        NextMapNo = -1;
        while (check_now_loading() == 0) {
            ClockSyncV();
        }

        MGInitVSyncCallBack(PlayTimeCount);
        ClockSyncV();
        *reinterpret_cast<s32 *>(reinterpret_cast<char *>(SaveData) + kSaveMapNoOffset) = MapNo;

        int result;
        do {
            MGAdjustScreen(ConfigWords()[kConfigScreenX], ConfigWords()[kConfigScreenY]);
            ConfigWords()[kConfigGameClear] = GameClearFlag;

            MGBeginFrame();
            PolyCount = 0;
            old_main_mode = mode;

            result = ModeLoop(skip_title);

            UpdatePad();
            GamePad.VibrationEnable(ConfigWords()[kConfigVibrationOff] == 0);
            GamePad.Step();
            MGEndFrame();

            if (DebugButtonsHeld() && GamePad.Down2(PAD_R3) != 0) {
                DebugMode = !DebugMode;
            }
        } while (result == 0);

        MGBeginFrame();
        MGEndFrame();

        FollowMapJump();
        if (CheckTrialEnd() != 0) {
            mode = GAME_MODE_TRIAL_END;
            MapNo = -1;
            LocalMapNo = -1;
        }

        while (ReadBGSync() != 0) {
            ClockSyncV();
        }
    }
}
