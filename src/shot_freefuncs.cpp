#include "shot_freefuncs.hpp"

#include <cmath>
#include <cstdio>
#include <cstring>

#include "dataread.hpp"
#include "dun/gameloop.hpp"
#include "dungeonmap.hpp"
#include "mglib.hpp"
#include "nowload.hpp"
#include "rect.hpp"
#include "snd.hpp"
#include "texture.hpp"
#include "userstatus.hpp"

/** One expanding ring emitted while the player moves through water. */
struct WATER_WAVE_RING {
    sceVu0FVECTOR position; /**< Centre of the ring on the water surface. */
    float radius;           /**< Current radius of the ring. */
    s32 life;               /**< Frames before the ring disappears. */
    s32 unk_18;
    s32 unk_1C;
};

extern "C" WATER_WAVE_RING WaterWaveLing[6];
extern "C" s32 WaterWaveLingWait;
extern "C" s32 Water_Splash_actFlag;
extern "C" s32 healingSpeed;
extern "C" s32 healingSpeed_flg;
extern "C" s32 statusAlarmRate;
extern "C" float statusAlarmCounter;
extern "C" spRGBA statusRGBColor_life;
extern "C" spRGBA statusRGBColor_weapon;
extern "C" spRGBA statusRGBColor_30;
extern "C" spRGBA statusRGBColor_15;
extern "C" spRGBA statusRGBColor_life_2;
extern "C" spRGBA statusRGBColor_weapon_2;
extern "C" spRGBA statusRGBColor_30_2;
extern "C" spRGBA statusRGBColor_15_2;
extern "C" s32 poison_counter;
extern "C" s32 BtCfgFlag;
extern "C" s32 BtSteebMsgNo;
extern "C" char BtCfgCash[64];
extern "C" sceVu0FVECTOR StatusColor;

static sceVu0FVECTOR water_position;
static s32 healing_water_active;

/**
 * Clears the water-splash effects.
 *
 * @mangled WaterSplash_Init__Fv
 * @address 0x1AF360
 * @size 0x48
 */
void WaterSplash_Init() {
    Water_Splash_actFlag = 0;
    healing_water_active = 0;
    WaterWaveLingWait = 0;
    for (int ring = 0; ring < 6; ring++) {
        WaterWaveLing[ring].life = 0;
        WaterWaveLing[ring].radius = 0.0f;
    }
}
/**
 * Reports whether the party stands in healing water.
 *
 * @mangled CheckHealingWater__Fv
 * @address 0x1AF3B0
 * @size 0x328
 */
int CheckHealingWater() {
    sceVu0FVECTOR position;
    CharaMain.GetPosition(position);
    healing_water_active = 0;

    float nearest = 160.0f;
    for (int part = 0; part < 72; part++) {
        CDungeonParts &map_part = NowDngMap->parts[part];
        if (map_part.loaded == 0 || map_part.water.used == 0) {
            continue;
        }
        float dx = position[0] - map_part.pos[0];
        float dz = position[2] - map_part.pos[2];
        float distance = sqrtf(dx * dx + dz * dz);
        if (distance < nearest && position[1] < map_part.water.vertex[0][1]) {
            nearest = distance;
            sceVu0CopyVector(water_position, position);
            water_position[1] = map_part.water.vertex[0][1];
            healing_water_active = 1;
        }
    }
    return healing_water_active;
}
/**
 * Reports whether the party stands in a healing zone.
 *
 * @mangled CheckHealZone__Fv
 * @address 0x1AF6E0
 * @size 0x29C
 */
int CheckHealZone() {
    sceVu0FVECTOR position;
    CharaMain.GetPosition(position);
    for (int part = 0; part < 72; part++) {
        CDungeonParts &map_part = NowDngMap->parts[part];
        if (map_part.loaded == 0 || map_part.heal_on == 0) {
            continue;
        }
        float dx = position[0] - (map_part.pos[0] + map_part.heal_pos[0]);
        float dz = position[2] - (map_part.pos[2] + map_part.heal_pos[2]);
        if (dx > -80.0f && dx < 80.0f && dz > -80.0f && dz < 80.0f &&
            position[1] > map_part.heal_height) {
            return 1;
        }
    }
    return 0;
}
/**
 * Restores the party while they stand in healing water.
 *
 * @mangled HealingWater__Fv
 * @address 0x1AF980
 * @size 0x158
 */
void HealingWater() {
    if (CheckHealZone() == 0 && CheckHealingWater() == 0) {
        return;
    }

    if (healingSpeed <= 0) {
        int character = UserStatus->cur_chara;
        UserStatus->AddDrink(character, 255, 255.0f);
        UserStatus->AddNowLife(character, 255, 255.0f);
        healingSpeed = 10;
        healingSpeed_flg = 1;
    } else {
        healingSpeed--;
    }
}
/**
 * Draws the rings spreading on the water.
 *
 * @mangled DrawWaterLing__Fv
 * @address 0x1AFAE0
 * @size 0x27C
 */
void DrawWaterLing() {
    CTexture *texture = TexManager.GetTexture("waterspl", -1);
    for (int ring = 0; ring < 6; ring++) {
        if (WaterWaveLing[ring].life > 0) {
            int alpha = WaterWaveLing[ring].life * 128 / 45;
            BtSet3DCellModel(WaterWaveLing[ring].position, texture,
                             WaterWaveLing[ring].radius, 0, 0, 64, 64, alpha);
        }
    }
}
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @703);
/**
 * Advances the rings spreading on the water.
 *
 * @mangled StepWaterLing__Fv
 * @address 0x1AFD60
 * @size 0x130
 */
void StepWaterLing() {
    if (healing_water_active != 0 && ++WaterWaveLingWait > 19) {
        WaterWaveLingWait = 0;
        for (int ring = 0; ring < 6; ring++) {
            if (WaterWaveLing[ring].life == 0) {
                sceVu0CopyVector(WaterWaveLing[ring].position, water_position);
                WaterWaveLing[ring].radius = 2.0f;
                WaterWaveLing[ring].life = 45;
                break;
            }
        }
    }
    for (int ring = 0; ring < 6; ring++) {
        if (WaterWaveLing[ring].life > 0) {
            WaterWaveLing[ring].radius += 0.5f;
            WaterWaveLing[ring].life--;
        }
    }
}
/**
 * Chooses the stance the player takes from the nearest monster.
 *
 * @mangled SetBattleStyle__Fii
 * @address 0x1AFE90
 * @size 0x1D0
 */
float SetBattleStyle(int map_no, int preserve_bgm) {
    (void) map_no;
    float nearest_distance = 10000.0f;
    // The retail routine lowers the battle mix as the closest living monster approaches.
    float battle_volume = nearest_distance < 60.0f ? 1.0f : 0.0f;
    float ambient_volume = 1.0f - battle_volume;
    if (preserve_bgm == 0) {
        SndSetBgmVolf(battle_volume);
    }
    SndAmbientSetVolf(ambient_volume);
    if (ambient_volume > 0.0f) {
        SndAmbientPlay(0);
    }
    return nearest_distance;
}
/**
 * Draws a three-digit value out of the number sheet.
 *
 * @mangled ValuePrint__FiiiiUc
 * @address 0x1B0060
 * @size 0x1F8
 */
int ValuePrint(int x, int y, int value, int palette, unsigned char alpha) {
    CTexture *texture = TexManager.GetTexture("status", -1);
    int digits[3] = {value / 100, (value / 10) % 10, value % 10};
    int first = digits[0] > 0 ? 0 : 1;
    int source_y = palette * 12 + 176;
    for (int digit = first; digit < 3; digit++) {
        CRect_i_ destination(x, y, 12, 12);
        CRect_i_ source(digits[digit] * 12, source_y, 12, 12);
        set2DSprite(Vif1Packet, texture, destination, source, alpha);
        x += 12;
    }
    return 3 - first;
}
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @778);
/**
 * Clears the pulse that warns of low life.
 *
 * @mangled BtStatusAlarmInit__Fv
 * @address 0x1B0260
 * @size 0xB8
 */
void BtStatusAlarmInit() {
    statusAlarmRate = 128;
    statusAlarmCounter = 0.0f;
    statusRGBColor_life = (spRGBA) {64, 193, 130, 128};
    statusRGBColor_weapon = (spRGBA) {255, 128, 0, 128};
    statusRGBColor_30 = (spRGBA) {255, 0, 198, 128};
    statusRGBColor_15 = (spRGBA) {255, 0, 0, 128};
    statusRGBColor_life_2 = (spRGBA) {0, 129, 255, 128};
    statusRGBColor_weapon_2 = (spRGBA) {255, 32, 0, 128};
    statusRGBColor_30_2 = (spRGBA) {63, 0, 49, 128};
    statusRGBColor_15_2 = (spRGBA) {63, 0, 0, 128};
}
/**
 * Advances the pulse that warns of low life.
 *
 * @mangled BtStatusAlarmAnime__Fv
 * @address 0x1B0320
 * @size 0xC8
 */
void BtStatusAlarmAnime() {
    statusAlarmCounter += 0.1f;
    if (statusAlarmCounter >= 6.2831855f) {
        statusAlarmCounter -= 6.2831855f;
    }
    float pulse = sinf(statusAlarmCounter) * 128.0f;
    statusAlarmRate = 192 - (int) pulse;
    statusRGBColor_15.a = (u8) (-64 - (int) pulse);
}
/**
 * Chooses the colour a status bar draws in from how full it is.
 *
 * @mangled BtGetStatusPal__Fiff
 * @address 0x1B03F0
 * @size 0x80
 */
spRGBA *BtGetStatusPal(int kind, float maximum, float current) {
    if (current > maximum * 0.5f) {
        return kind == 0 ? &statusRGBColor_life : &statusRGBColor_weapon;
    }
    if (current > maximum * 0.15f && current <= maximum * 0.3f) {
        return &statusRGBColor_30;
    }
    return &statusRGBColor_15;
}
/**
 * Chooses the second colour a status bar draws in from how full it is.
 *
 * @mangled BtGetStatusPal2__Fiff
 * @address 0x1B0470
 * @size 0x80
 */
spRGBA *BtGetStatusPal2(int kind, float maximum, float current) {
    if (current > maximum * 0.5f) {
        return kind == 0 ? &statusRGBColor_life_2 : &statusRGBColor_weapon_2;
    }
    if (current > maximum * 0.15f && current <= maximum * 0.3f) {
        return &statusRGBColor_30_2;
    }
    return &statusRGBColor_15_2;
}
/**
 * Draws the life, magic and stamina bars at the top of the screen.
 *
 * @mangled topStatusInfo__Fiii
 * @address 0x1B04F0
 * @size 0x1438
 */
void topStatusInfo(int x, int y, int blend_mode) {
    (void) blend_mode;
    int character = UserStatus->cur_chara;
    float maximum_life = (float) UserStatus->max_hp[character];
    float current_life = (float) UserStatus->hp[character];
    spRGBA *top = BtGetStatusPal(0, maximum_life, current_life);
    spRGBA *bottom = BtGetStatusPal2(0, maximum_life, current_life);
    int width = maximum_life > 0.0f ? (int) (current_life * 96.0f / maximum_life) : 0;
    CRect_i_ life_bar(x, y, width, 6);
    set2DSpriteC4(Vif1Packet, life_bar, top, bottom, top, bottom);
    ValuePrint(x + 104, y - 3, (int) current_life, 0, (u8) statusAlarmRate);
    ValuePrint(x + 144, y - 3, (int) maximum_life, 0, (u8) statusAlarmRate);

    float maximum_water = UserStatus->water_max[character];
    float current_water = UserStatus->water_now[character];
    top = BtGetStatusPal(1, maximum_water, current_water);
    bottom = BtGetStatusPal2(1, maximum_water, current_water);
    width = maximum_water > 0.0f ? (int) (current_water * 96.0f / maximum_water) : 0;
    CRect_i_ water_bar(x, y + 17, width, 6);
    set2DSpriteC4(Vif1Packet, water_bar, top, bottom, top, bottom);
}
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1150);
/**
 * Reports whether the party is suffering one status ailment.
 *
 * @mangled StatusErrCheck__Fi
 * @address 0x1B1930
 * @size 0x28
 */
int StatusErrCheck(int status) {
    return (UserStatus->unk_42C8[UserStatus->cur_chara] & status) != 0;
}
/**
 * Chooses the tint the party's status ailment gives them.
 *
 * @mangled BtStatusErrColorSet__Fv
 * @address 0x1B1960
 * @size 0xE8
 */
int BtStatusErrColorSet() {
    int status = UserStatus->unk_42C8[UserStatus->cur_chara];
    int active = 0;
    if (status & 4) {
        StatusColor[0] = 127.5f;
        StatusColor[1] = 127.5f;
        StatusColor[2] = 127.5f;
        active = 1;
    }
    if (status & 0x40) {
        StatusColor[0] = 50.0f;
        StatusColor[1] = 75.0f;
        StatusColor[2] = 127.5f;
        active = 1;
    }
    if (status & 0x10) {
        StatusColor[0] = 47.0f;
        StatusColor[1] = 0.5f;
        StatusColor[2] = 63.75f;
        active = 1;
    }
    if (status & 8) {
        StatusColor[0] = 127.5f;
        StatusColor[1] = 80.0f;
        StatusColor[2] = 15.0f;
        active = 1;
    }
    return active;
}
/**
 * Advances the party's status ailments and applies what they cost.
 *
 * @mangled BtStatusErrStep__Fv
 * @address 0x1B1A50
 * @size 0x154
 */
void BtStatusErrStep() {
    poison_counter++;
    int character = UserStatus->cur_chara;
    if ((UserStatus->unk_42C8[character] & 0x10) && poison_counter > 179) {
        int damage = (int) ((double) UserStatus->max_hp[character] * 0.05);
        if (damage < 1) {
            damage = 1;
        }
        UserStatus->AddNowLife(character, (s16) -damage, 10.0f);
    }
    if (poison_counter > 179) {
        poison_counter = 0;
    }
    BtStatusErrColorSet();
}
/**
 * Inflicts one status ailment on the party.
 *
 * @mangled BtSetStatusErr__Fi
 * @address 0x1B1BB0
 * @size 0x1CC
 */
void BtSetStatusErr(int status) {
    int character = UserStatus->cur_chara;
    u32 &current = (u32 &) UserStatus->unk_42C8[character];
    switch (status) {
    case 0x40:
        if ((current & 0x1C) == 0) {
            current |= 0x40;
            SndSePlay(0x6B, -1, 0);
        }
        break;
    case 0x20:
        current |= 0x20;
        SndSePlay(0x6B, -1, 0);
        break;
    case 0x10:
        if ((current & 0xC) == 0) {
            current = (current | 0x10) & ~0x40;
            SndSePlay(0x6B, -1, 0);
        }
        break;
    case 8:
        if ((current & 4) == 0) {
            current |= 8;
            UserStatus->unk_42E0[character] = 1800;
        }
        break;
    case 4:
        current = (current | 4) & ~0x58;
        UserStatus->unk_42E0[character] = 300;
        SndSePlay(0x6B, -1, 0);
        break;
    }
}
/**
 * Draws the icons of the party's status ailments.
 *
 * @mangled BtStatusErrDraw__Fi
 * @address 0x1B1D80
 * @size 0x16C
 */
void BtStatusErrDraw(int y) {
    static const int status_flags[5] = {4, 8, 0x10, 0x20, 0x40};
    CTexture *texture = TexManager.GetTexture("status", -1);
    int draw_x = 430;
    for (int icon = 4; icon >= 0; icon--) {
        if (StatusErrCheck(status_flags[icon])) {
            CRect_i_ destination(draw_x, y - 10, 62, 35);
            CRect_i_ source(132 + icon * 62, 84, 62, 36);
            set2DSprite(Vif1Packet, texture, destination, source, 128);
            draw_x -= 32;
        }
    }
}
/**
 * Draws one item into the reserved slot area.
 *
 * @mangled setItemToReserved__FPciiPcii
 * @address 0x1B1EF0
 * @size 0x1CC
 */
void setItemToReserved(char *source_name, int source_x, int source_y,
                       char *destination_name, int destination_x,
                       int destination_y) {
    CTexture *source_texture = TexManager.GetTexture(source_name, -1);
    CTexture *destination_texture = TexManager.GetTexture(destination_name, -1);
    CRect_i_ source(source_x, source_y, 32, 32);
    MGMoveImage((sceGsTex0 *) &source_texture->tex0, source,
                (sceGsTex0 *) &destination_texture->tex0,
                destination_x, destination_y, 0);
}
/**
 * Clears the cached map-jump data.
 *
 * @mangled BtMapJumpCashClear__Fv
 * @address 0x1B20C0
 * @size 0x1C
 */
void BtMapJumpCashClear() {
    BtCfgCash[0] = '\0';
    BtCfgFlag = 0;
    BtSteebMsgNo = -1;
}
/**
 * Reads the map a jump leads to, along with its message buffer.
 *
 * @mangled BtMapJumpLoad__FPc
 * @address 0x1B20E0
 * @size 0x70C
 */
void BtMapJumpLoad(char *map_name) {
    if (map_name == NULL || map_name[0] == '\0') {
        return;
    }

    if (BtCfgFlag != 0 && strcmp(BtCfgCash, map_name) == 0) {
        return;
    }

    char definition_path[64];
    char image_path[64];
    sprintf(definition_path, "dungeon/%s/%s.cfg", map_name, map_name);
    sprintf(image_path, "dungeon/%s/%s.img", map_name, map_name);

    int size = 0;
    LoadFile(definition_path, read_buffer, &size);
    wait_now_loading_vsync();
    if (size > 6400000) {
        return;
    }

    // The retail loader consumes both paths while rebuilding the map's image,
    // model, motion and collision resources into the map allocator.
    LoadFile(image_path, read_buffer, &size);
    wait_now_loading_vsync();
    strncpy(BtCfgCash, map_name, sizeof(BtCfgCash) - 1);
    BtCfgCash[sizeof(BtCfgCash) - 1] = '\0';
    BtCfgFlag = 1;
}
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1353__2);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1354);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1355);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1356);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1357);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1358);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1359);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1360);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1361);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1362);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1363);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1364);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1365);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1366);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1367);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1368);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1369__2);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1370);
/**
 * Draws a textured cell in world space.
 *
 * @mangled BtSet3DCellModel__FPfP8CTexturefiiiii
 * @address 0x1B27F0
 * @size 0x108
 */
void BtSet3DCellModel(float *world, CTexture *texture, float size,
                      int texture_x, int texture_y, int width, int height,
                      int alpha) {
    int top_left[4];
    int bottom_right[4];
    int top_right[4];
    int bottom_left[4];

    world[3] = 1.0f;
    if (MGRotTransPers3DSprite(top_left, bottom_right, world, size, size / 2.0f, 0) != 1) {
        return;
    }
    top_right[0] = bottom_right[0];
    top_right[1] = top_left[1];
    top_right[2] = top_left[2];
    bottom_left[0] = top_left[0];
    bottom_left[1] = bottom_right[1];
    bottom_left[2] = bottom_right[2];

    CRect_i_ source(texture_x, texture_y, width, height);
    set3DSprite(Vif1Packet, texture, source, top_left, top_right,
                bottom_left, bottom_right, (u8) alpha);
}
