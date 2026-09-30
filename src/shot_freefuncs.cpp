#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#include "shot_freefuncs.hpp"

// These tables precede the template of CharaHeight's inline table in .data, so they stand
// above the header that defines it.

/**
 * Number of floors in each dungeon.
 */
static int maxFloorTbl[7] = {15, 17, 18, 18, 15, 25, 100};

/**
 * Each character's default weapon.
 */
static int defWeapon[6] = {0x101, 0x12B, 0x13A, 0x14B, 0x15B, 0x16B};

#include <libvu0.h>

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "btactstatus.hpp"
#include "btmisc.hpp"
#include "character.hpp"
#include "charaheight.hpp"
#include "clothread.hpp"
#include "clsmes.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dranmapfield.hpp"
#include "dun/gameloop.hpp"
#include "dungeoneventman.hpp"
#include "dungeonmap.hpp"
#include "frame.hpp"
#include "healeffect.hpp"
#include "hitvalue.hpp"
#include "itemdata.hpp"
#include "mainselect.hpp"
#include "mathutil.hpp"
#include "menu_inventory.hpp"
#include "mglib.hpp"
#include "monstorunit.hpp"
#include "motionmodel.hpp"
#include "nowload.hpp"
#include "rect.hpp"
#include "snd.hpp"
#include "texture.hpp"
#include "userstatus.hpp"

s32 DebugStatus[21];
float StatusColor[3];

/**
 * The water the party is standing in and the nearest water surface.
 */
CHECK_WATER_INFO CheckWaterInfo;

/**
 * The rings spreading across the water.
 */
WATER_WAVE_LING WaterWaveLing[6];

/**
 * The name of the map held in the jump cache.
 */
char BtCfgCash[64];

/**
 * The frames remaining before the next ring appears.
 */
int WaterWaveLingWait;

/**
 * Frames remaining before healing water restores the party again.
 */
int healingSpeed;

/**
 * Whether the healing effect still owes the scene its ambient colour back.
 */
int healingSpeed_flg;

/**
 * The period of the low-life warning pulse.
 */
int statusAlarmRate;

/**
 * The phase of the low-life warning pulse.
 */
float statusAlarmCounter;

/**
 * The colour of a full life bar.
 */
u8 statusRGBColor_life[4];

/**
 * The colour of a full weapon bar.
 */
u8 statusRGBColor_weapon[4];

/**
 * The colour of a bar below three tenths.
 */
u8 statusRGBColor_30[4];

/**
 * The warning colour of a bar below a seventh.
 */
u8 statusRGBColor_15[4];

/**
 * The second colour of a full life bar.
 */
u8 statusRGBColor_life_2[4];

/**
 * The second colour of a full weapon bar.
 */
u8 statusRGBColor_weapon_2[4];

/**
 * The second colour of a bar below three tenths.
 */
u8 statusRGBColor_30_2[4];

/**
 * The second warning colour of a bar below a seventh.
 */
u8 statusRGBColor_15_2[4];

/**
 * Clears the water-splash effects.
 *
 * @mangled WaterSplash_Init__Fv
 * @address 0x1AF360
 * @size 0x48
 */
void WaterSplash_Init(void) {
    int i;

    Water_Splash_actFlag = 0;
    CheckWaterInfo.in_water = 0;

    for (i = 0; i < 6; i++) {
        WaterWaveLing[i].life = 0;
    }

    WaterWaveLingWait = 0;
}

/**
 * Reports whether the party stands in the water of the nearest map part, records the surface
 * point in CheckWaterInfo and starts the splash as they enter it.
 *
 * @mangled CheckHealingWater__Fv
 * @address 0x1AF3B0
 * @size 0x328
 */
int CheckHealingWater(void) {
    float position[4];
    float water_position[4];
    PARTS_WATER *nearest_water;
    float nearest_distance;
    float water_x;
    float water_y;
    float water_z;
    int row;
    int column;

    nearest_distance = 160.0f;
    sceVu0CopyVector(position, CharaMain.pos);

    for (row = 0; row < 16; row++) {
        for (column = 0; column < 16; column++) {
            int parts_no = NowDngMap->cells[row * 20 + column].parts_no;

            if (parts_no != -1) {
                CDungeonParts *part = &NowDngMap->parts[parts_no];
                PARTS_WATER *water = &part->water;

                if (part->water.used != 0) {
                    water_position[0] = 160.0f * column;
                    water_position[1] = water->vertex[0][1];
                    water_position[2] = 160.0f * row;

                    float distance = DistVector(position, water_position);

                    if (distance < nearest_distance) {
                        nearest_water = water;
                        nearest_distance = distance;
                        water_x = water_position[0];
                        water_y = water_position[1];
                        water_z = water_position[2];
                    }
                }
            }
        }
    }

    if (nearest_distance < 160.0f && position[0] >= water_x + nearest_water->vertex[0][0] &&
        position[0] < water_x + nearest_water->vertex[3][0] &&
        position[2] >= water_z + nearest_water->vertex[0][2] &&
        position[2] < water_z + nearest_water->vertex[3][2] && position[1] < water_y) {
        position[1] = water_y;
        sceVu0CopyVector(CheckWaterInfo.surface_position, position);
        BtActStatus.in_water = 1;

        if (Water_Splash_actFlag == 0 && CheckWaterInfo.in_water == 0 &&
            CheckWaterInfo.dry_position[1] - CheckWaterInfo.surface_position[1] > 0.5f) {
            Water_Splash.SetPosition(CheckWaterInfo.surface_position);
            Water_Splash.SetMotion(0, 6);
            SndSePlay(0x223, -1, 0);
            Water_Splash_actFlag = 1;
        }

        CheckWaterInfo.in_water = 1;
        return 1;
    }

    sceVu0CopyVector(CheckWaterInfo.dry_position, position);
    CheckWaterInfo.in_water = 0;
    return 0;
}

/**
 * Holds the position and extent of a dungeon part's healing zone.
 */
struct HEAL_ZONE {
    float pos[4]; /**< Centre of the healing zone. */
    float width;  /**< Width of the healing zone. */
    float depth;  /**< Depth of the healing zone. */
    s32 on;       /**< Whether the healing zone is active. */
};

/**
 * Reports whether the party stands in a healing zone.
 *
 * @mangled CheckHealZone__Fv
 * @address 0x1AF6E0
 * @size 0x29C
 */
int CheckHealZone(void) {
    float position[4];
    float center[4];
    float low[4];
    float high[4];
    int column;
    int row;
    int parts_no;
    int hit;
    CDungeonParts *part;
    HEAL_ZONE *zone;

    sceVu0CopyVector(position, CharaMain.pos);
    BtActStatus.in_water = 0;

    column = (80.0f + position[0]) / 160.0f;
    row = (80.0f + position[2]) / 160.0f;
    parts_no = NowDngMap->cells[row * 20 + column].parts_no;

    if (parts_no == MAP_PARTS_NONE) {
        return 0;
    }

    part = &NowDngMap->parts[parts_no];
    zone = (HEAL_ZONE *) part->heal_pos;
    hit = 0;
    if (part->heal_on == 0) {
        return 0;
    }
    sceVu0CopyVector(center, zone->pos);
    center[0] += 160.0f * column;
    center[2] += 160.0f * row;
    sceVu0CopyVector(low, center);
    sceVu0CopyVector(high, center);
    low[0] -= zone->width / 2.0f;
    low[2] -= zone->depth / 2.0f;
    high[0] += zone->width / 2.0f;
    high[2] += zone->depth / 2.0f;

    if (position[0] >= low[0] && position[0] <= high[0] && position[2] >= low[2] &&
        position[2] < high[2] && position[1] < center[1]) {
        BtActStatus.in_water = 1;
        return 1;
    }

    if (zone == NULL) {
        return 0;
    }
    return zone->on ? hit : 0;
}

/**
 * Restores the party while they stand in healing water.
 *
 * @mangled HealingWater__Fv
 * @address 0x1AF980
 * @size 0x158
 */
void HealingWater(void) {
    float position[4];
    int chara;
    int max_hp;
    int now_hp;

    if (CheckHealZone() || CheckHealingWater()) {
        if (healingSpeed <= 0) {
            chara = UserStatus->cur_chara;
            UserStatus->AddDrink(chara, 0xFF, 255.0f);
            UserStatus->AddNowLife(chara, 0xFF, 255.0f);
            healingSpeed = 10;
        } else {
            healingSpeed--;
        }

        if (HealEffect.active == 0) {
            max_hp = UserStatus->max_hp[UserStatus->cur_chara];
            now_hp = UserStatus->hp[UserStatus->cur_chara];

            if (!(now_hp == max_hp)) {
                sceVu0CopyVector(position, CharaMain.pos);
                HealEffect.Set(position);
                SndSePlay(0x1B8, -1, 0);
                healingSpeed_flg = 1;
            }
        } else if (healingSpeed_flg) {
            setUnitAmbientAnime(60.0f, 1.0f, 0.0f, 122.0f, 208.0f);
            healingSpeed_flg = 0;
        }
    }
}

/**
 * Draws the rings spreading on the water.
 *
 * @mangled DrawWaterLing__Fv
 * @address 0x1AFAE0
 * @size 0x27C
 */
void DrawWaterLing(void) {
    float corner[4][4];
    int screen[4][4];
    sceGsAlpha alpha;
    sceGsZbuf zbuf;
    CTexture *ripple;
    int i;
    int visible;
    int j;
    float radius;
    float x;
    float y;
    float near;
    float left;
    float z;
    float right;
    float far;

    ripple = TexManager.GetTexture("d00e01", -1);

    alpha = mgAlpha;
    alpha.bits.a = 0;
    alpha.bits.b = 2;
    alpha.bits.c = 0;
    alpha.bits.d = 1;
    MGSetGsALPHA(&alpha);

    zbuf = mgZBuffer;
    zbuf.bits.zmsk = 1;
    MGSetGsZBUF(&zbuf);

    for (i = 0; i < 6; i++) {
        if (WaterWaveLing[i].life > 0) {
            radius = WaterWaveLing[i].radius;
            x = WaterWaveLing[i].center[0];
            left = x - radius;
            corner[0][0] = left;
            y = WaterWaveLing[i].center[1];
            corner[0][1] = y;
            z = WaterWaveLing[i].center[2];
            near = z - radius;
            corner[0][2] = near;
            right = radius + x;
            corner[1][0] = right;
            corner[1][1] = y;
            corner[1][2] = near;
            corner[2][0] = left;
            corner[2][1] = y;
            far = radius + z;
            corner[2][2] = far;
            corner[3][0] = right;
            corner[3][1] = y;
            corner[3][2] = far;

            visible = 1;
            for (j = 0; j < 4; j++) {
                corner[j][3] = 1.0f;
                if (MGRotTransPers(screen[j], corner[j], 0) == 0) {
                    visible = 0;
                }
            }

            if (visible) {
                float fade = 2.8444445f * WaterWaveLing[i].life;
                set3DSprite(Vif1Packet, ripple, CRect_i_(0, 64, 64, 64), screen[0], screen[1],
                            screen[2], screen[3], fade);
            }
        }
    }

    MGSetGsALPHA(NULL);
    MGSetGsZBUF(NULL);
}

/**
 * Advances the rings spreading on the water.
 *
 * @mangled StepWaterLing__Fv
 * @address 0x1AFD60
 * @size 0x130
 */
void StepWaterLing(void) {
    int i;

    if (CheckWaterInfo.in_water != 0) {
        WaterWaveLingWait++;

        if (WaterWaveLingWait >= 20) {
            WaterWaveLingWait = 0;

            for (i = 0; i < 6; i++) {
                if (WaterWaveLing[i].life == 0) {
                    sceVu0CopyVector(WaterWaveLing[i].center, CheckWaterInfo.surface_position);
                    WaterWaveLing[i].radius = 2.0f;
                    WaterWaveLing[i].life = 45;
                    break;
                }
            }
        }
    }

    for (i = 0; i < 6; i++) {
        if (WaterWaveLing[i].life > 0) {
            WaterWaveLing[i].radius += 0.2f;
            WaterWaveLing[i].life--;
        }
    }
}

/**
 * Mixes the battle music against the ambience by the distance to the nearest active monster
 * and returns that distance.
 *
 * @mangled SetBattleStyle__Fii
 * @address 0x1AFE90
 * @size 0x1D0
 */
void BtBattleMusic_Excg(float distance, float *field_volume, float *battle_volume);

static inline int MonstorAliveCheck(int no, int alive) {
    if (no >= 0 && no < 17) {
        alive = NowMonstorUnit->monster[no].revealed;
    }
    return alive;
}

float SetBattleStyle(int map_no, int preserve_bgm) {
    float nearest = 10000;
    sceVu0FVECTOR position;
    sceVu0FVECTOR player;
    float bgm_volume;
    float ambient_volume;
    int alive;

    sceVu0CopyVector(player, CharaMain.pos);
    for (int i = 0; i < 16; i++) {
        if (NowMonstorUnit->monster[i].state == -1) {
            continue;
        }
        alive = MonstorAliveCheck(i, alive);
        if (alive == 0) {
            continue;
        }
        NowMonstorUnit->chara[i][0].GetPosition(position);
        float distance = DistVector(player, position);
        if (distance < nearest) {
            nearest = distance;
        }
    }
    if (map_no != 5) {
        CUserStatus *status;
        int floors = maxFloorTbl[map_no];
        status = UserStatus;
        if (status->cur_floor < floors - 1) {
            BtBattleMusic_Excg(nearest, &bgm_volume, &ambient_volume);
            if (ambient_volume > 0.0f) {
                SndAmbientPlay(0);
            }
            if (preserve_bgm == 0) {
                SndSetBgmVolf(bgm_volume);
            }
            SndAmbientSetVolf(ambient_volume);
        }
    }
    return nearest;
}

/**
 * Draws a three-digit value out of the number sheet.
 *
 * @mangled ValuePrint__FiiiiUc
 * @address 0x1B0060
 * @size 0x1F8
 */
int ValuePrint(int x, int y, int value, int palette, unsigned char alpha) {
    CTexture *texture = TexManager.GetTexture("stayframe", -1);
    int source_y = palette * 12 + 0xB0;
    int hundreds_shown = 0;
    int digit = value / 100;
    if (digit > 0) {
        set2DSprite(Vif1Packet, texture, CRect_i_(x, y, 12, 12), CRect_i_(digit * 12, source_y, 12, 12), alpha);
        value -= digit * 100;
        x += 12;
        hundreds_shown++;
    }
    digit = value / 10;
    set2DSprite(Vif1Packet, texture, CRect_i_(x, y, 12, 12), CRect_i_(digit * 12, source_y, 12, 12), alpha);
    digit = value % 10;
    set2DSprite(Vif1Packet, texture, CRect_i_(x + 12, y, 12, 12), CRect_i_(digit * 12, source_y, 12, 12), alpha);
    return hundreds_shown + 2;
}

/**
 * Clears the pulse that warns of low life.
 *
 * @mangled BtStatusAlarmInit__Fv
 * @address 0x1B0260
 * @size 0xB8
 */
void BtStatusAlarmInit(void) {
    statusAlarmRate = 128;
    statusAlarmCounter = 0.0f;

    statusRGBColor_life[0] = 0x40;
    statusRGBColor_life[1] = 0xC1;
    statusRGBColor_life[2] = 0x82;
    statusRGBColor_life[3] = 0x80;

    statusRGBColor_weapon[0] = 0xFF;
    statusRGBColor_weapon[1] = 0x80;
    statusRGBColor_weapon[2] = 0x00;
    statusRGBColor_weapon[3] = 0x80;

    statusRGBColor_30[0] = 0xFF;
    statusRGBColor_30[1] = 0x00;
    statusRGBColor_30[2] = 0xC6;
    statusRGBColor_30[3] = 0x80;

    statusRGBColor_15[0] = 0xFF;
    statusRGBColor_15[1] = 0x00;
    statusRGBColor_15[2] = 0x00;
    statusRGBColor_15[3] = 0x80;

    statusRGBColor_life_2[0] = 0x00;
    statusRGBColor_life_2[1] = 0x81;
    statusRGBColor_life_2[2] = 0xFF;
    statusRGBColor_life_2[3] = 0x80;

    statusRGBColor_weapon_2[0] = 0xFF;
    statusRGBColor_weapon_2[1] = 0x20;
    statusRGBColor_weapon_2[2] = 0x00;
    statusRGBColor_weapon_2[3] = 0x80;

    statusRGBColor_30_2[0] = 0x3F;
    statusRGBColor_30_2[1] = 0x00;
    statusRGBColor_30_2[2] = 0x31;
    statusRGBColor_30_2[3] = 0x80;

    statusRGBColor_15_2[0] = 0x3F;
    statusRGBColor_15_2[1] = 0x00;
    statusRGBColor_15_2[2] = 0x00;
    statusRGBColor_15_2[3] = 0x80;
}

/**
 * Advances the pulse that warns of low life.
 *
 * @mangled BtStatusAlarmAnime__Fv
 * @address 0x1B0320
 * @size 0xC8
 */
void BtStatusAlarmAnime(void) {
    statusAlarmCounter += 0.10471976f;

    if (!(statusAlarmCounter < 3.1415927f)) {
        statusAlarmCounter -= 3.1415927f;
    }

    statusAlarmRate = 192 - (int) (2.0f * (64.0f * sinf(statusAlarmCounter)));
    statusRGBColor_15[3] = 192 - (int) (2.0f * (64.0f * sinf(statusAlarmCounter)));
}

/**
 * Chooses the colour a status bar draws in from how full it is.
 *
 * @mangled BtGetStatusPal__Fiff
 * @address 0x1B03F0
 * @size 0x80
 */
u8 *BtGetStatusPal(int bar, float max, float value) {
    u8 *color;

    if (!(value <= 0.2f * max)) {
        if (bar == 0) {
            color = statusRGBColor_life;
        } else {
            color = statusRGBColor_weapon;
        }
        return color;
    }

    if (value <= 0.3f * max && !(value <= 0.15f * max)) {
        return statusRGBColor_30;
    }

    return statusRGBColor_15;
}

/**
 * Chooses the second colour a status bar draws in from how full it is.
 *
 * @mangled BtGetStatusPal2__Fiff
 * @address 0x1B0470
 * @size 0x80
 */
u8 *BtGetStatusPal2(int bar, float max, float value) {
    u8 *color;

    if (!(value <= 0.2f * max)) {
        if (bar == 0) {
            color = statusRGBColor_life_2;
        } else {
            color = statusRGBColor_weapon_2;
        }
        return color;
    }

    if (value <= 0.3f * max && !(value <= 0.15f * max)) {
        return statusRGBColor_30_2;
    }

    return statusRGBColor_15_2;
}

/**
 * Draws the dungeon HUD with life, weapon, water, quick-item and floor indicators.
 *
 * @mangled topStatusInfo__Fiii
 * @address 0x1B04F0
 * @size 0x1438
 */
void topStatusInfo(int y, int selected_item, int floor) {
    int alpha;
    CTexture *icons;
    CTexture *frame;
    int cells;
    spRGBA *upper;
    spRGBA *lower;
    y -= 10;
    y += BtActStatus.hud_shake_y;
    icons = TexManager.GetTexture("itempack", -1);
    frame = TexManager.GetTexture("stayframe", -1);

    // Life: a frame stretched to the character's maximum, the bar, and "now/max".
    float life = UserStatus->hp[UserStatus->cur_chara];
    float life_max = UserStatus->max_hp[UserStatus->cur_chara];
    int length = (int) (0.74f * life_max);
    if (length < 2) {
        length = 2;
    }
    cells = (length >> 2) + 1;
    if (cells < 2) {
        cells = 2;
    }
    alpha = 0x80;
    if (life <= 0.2f * life_max) {
        alpha = statusAlarmRate;
    }
    upper = (spRGBA *) BtGetStatusPal(0, life_max, life);
    lower = (spRGBA *) BtGetStatusPal2(0, life_max, life);
    set2DSprite(Vif1Packet, icons, CRect_i_(0x30, y, 4, 0x10), CRect_i_(0x68, 0x70, 4, 0x10), alpha);
    for (int i = 0; i < cells - 2; i++) {
        set2DSprite(Vif1Packet, icons, CRect_i_(i * 4 + 0x34, y, 4, 0x10), CRect_i_(0x6C, 0x70, 4, 0x10),
                    alpha);
    }
    set2DSprite(Vif1Packet, icons, CRect_i_((cells - 1) * 4 + 0x30, y, 4, 0x10), CRect_i_(0x70, 0x70, 4, 0x10),
                alpha);
    if (life > 0.0f) {
        length = (int) (0.74f * life);
        set2DSpriteC4(Vif1Packet, CRect_i_(0x34, y + 5, length - 2, 6), upper, lower, upper, lower);
    }
    cells = (cells - 1) * 4 + 0x38;
    cells += ValuePrint(cells, y + 7, (int) life, 0, alpha) * 10;
    set2DSprite(Vif1Packet, frame, CRect_i_(cells, y + 7, 0xC, 0xC), CRect_i_(0x78, 0xB0, 0xC, 0xC), alpha);
    ValuePrint(cells + 10, y + 7, (int) life_max, 0, alpha);
    set2DSprite(Vif1Packet, icons, CRect_i_(0x20, y, 0x10, 0x10), CRect_i_(0x40, 0xA0, 0x10, 0x10), alpha);

    // Weapon durability and progress toward the next weapon level.
    CUserStatus *user = UserStatus;
    s8 wielder = user->cur_chara;
    s8 *slots = user->equipped_weapon_slot;
    float durability_max = ((CUserStatus *) user)->chara_weapons[user->cur_chara][slots[wielder]].durability;
    float durability = ((CUserStatus *) user)->chara_weapons[wielder][(s8) slots[wielder]].durability_f;
    float bar = 1.4949495f * durability_max;
    length = (int) bar;
    if (length < 2) {
        length = 2;
    }
    cells = (length >> 2) + 2;
    if (cells < 2) {
        cells = 2;
    }
    alpha = 0x80;
    if (durability <= 0.2f * durability_max) {
        alpha = statusAlarmRate;
    }
    upper = (spRGBA *) BtGetStatusPal(1, durability_max, durability);
    lower = (spRGBA *) BtGetStatusPal2(1, durability_max, durability);
    set2DSprite(Vif1Packet, icons, CRect_i_(0x30, y + 0x11, 4, 0x10), CRect_i_(0x68, 0x70, 4, 0x10), alpha);
    for (int i = 0; i < cells - 2; i++) {
        set2DSprite(Vif1Packet, icons, CRect_i_(i * 4 + 0x34, y + 0x11, 4, 0x10),
                    CRect_i_(0x6C, 0x70, 4, 0x10), alpha);
    }
    set2DSprite(Vif1Packet, icons, CRect_i_((cells - 1) * 4 + 0x30, y + 0x11, 4, 0x10),
                CRect_i_(0x70, 0x70, 4, 0x10), alpha);
    if (durability > 0.0f) {
        length = (int) (1.4949495f * durability);
        set2DSpriteC4(Vif1Packet, CRect_i_(0x34, y + 0x16, length - 2, 6), upper, lower, upper, lower);
    }
    int width;
    WEAPON_HAVE *weapon =
        &UserStatus->chara_weapons[UserStatus->cur_chara][UserStatus->equipped_weapon_slot[UserStatus->cur_chara]];
    int exp_max = GetWeaponMaxExp(weapon);
    width = (int) bar;
    MGFillBox(CRect_i_(0x340, ((y + 0x1F) >> 1) * 16, (width - 1) * 16, 0x10), 0x40, 0x40, 0x40, alpha);
    if (weapon->experience > 0) {
        int filled = (int) ((float) weapon->experience * ((float) width / (float) exp_max));
        MGFillBox(CRect_i_(0x340, ((y + 0x1F) >> 1) * 16, (filled - 1) * 16, 0x10), 0, 0xA2, 0xFF, alpha);
    }
    cells = (cells - 1) * 4 + 0x38;
    int shown = (int) durability;
    if (durability - (float) shown > 0.0f) {
        shown++;
    }
    cells += ValuePrint(cells, y + 0x18, shown, 0, alpha) * 10;
    set2DSprite(Vif1Packet, frame, CRect_i_(cells, y + 0x18, 0xC, 0xC), CRect_i_(0x78, 0xB0, 0xC, 0xC), alpha);
    ValuePrint(cells + 10, y + 0x18, (int) durability_max, 0, alpha);
    set2DSprite(Vif1Packet, icons, CRect_i_(0x20, y + 0x10, 0x10, 0x10), CRect_i_(0x40, 0xB0, 0x10, 0x10),
                alpha);

    // Water: one drop for every ten, the empty drops behind the full ones.
    float water_max = UserStatus->water_max[UserStatus->cur_chara];
    float water = UserStatus->water_now[UserStatus->cur_chara];
    alpha = 0x80;
    if (water < 0.15f * water_max) {
        alpha = statusAlarmRate;
    }
    set2DSprite(Vif1Packet, icons, CRect_i_(0x20, y + 0x22, 0x12, 0x14), CRect_i_(0x64, 0x84, 0x12, 0x14),
                alpha);
    int drops = (int) water_max / 10;
    for (cells = 0; cells < drops; cells++) {
        set2DSprite(Vif1Packet, icons, CRect_i_(cells * 0x12 + 0x32, y + 0x22, 0x12, 0x14),
                    CRect_i_(0x64, 0x98, 0x12, 0x14), alpha);
    }
    if ((int) water_max % 10 != 0) {
        set2DSprite(Vif1Packet, icons, CRect_i_(drops * 0x12 + 0x32, y + 0x22, 0x12, 0x14),
                    CRect_i_(0x64, 0xAC, 0x18, 0x14), alpha);
    }
    int full_drops = (int) water / 10;
    for (cells = 0; cells < full_drops; cells++) {
        set2DSprite(Vif1Packet, icons, CRect_i_(cells * 0x12 + 0x33, y + 0x22, 0x10, 0x14),
                    CRect_i_(0, 0x48, 0x10, 0x14), 0x50);
    }
    int leftover = (int) water % 10;
    if (leftover != 0) {
        set2DSprite(Vif1Packet, icons, CRect_i_(full_drops * 0x12 + 0x33, y + 0x22, 0x10, 0x14),
                    CRect_i_((3 - (int) ((float) leftover / 2.5f)) * 16, 0x48, 0x10, 0x14), 0x50);
    }

    // Quick-use items; a speed-up item pulses while it is in force.
    /** Phase of the quick-item vertical animation. */
    static float popupYRate = -3.1415927f;
    popupYRate += 0.20943952f;
    if (!(popupYRate < 3.1415927f)) {
        popupYRate -= 6.2831855f;
    }
    /** Phase of the active quick-item frame glow. */
    static float popupRGBRate = -3.1415927f;
    popupRGBRate += 0.19634955f;
    if (!(popupRGBRate < 0.0f)) {
        popupRGBRate -= 3.1415927f;
    }
    ITEM_PACK *pack = &UserStatus->item_pack;
    for (int i = 0; i < 3; i++) {
        int bob = 0;
        int glow = 0;
        if (BtBySpeedFlag != 0 && pack->quick_item_slot[i] == 0x9C) {
            glow = (int) (64.0f * sinf(popupRGBRate)) + 0x3F;
            bob = 0;
        }
        set2DSprite(Vif1Packet, icons, CRect_i_(i * 40 + 0x126, y + 2, 0x24, 0x24), CRect_i_(0x24, 0x5C, 0x24, 0x24),
                    glow + 0x80);
        if (pack->quick_item_slot[i] != -1) {
            set2DSprite(Vif1Packet, icons, CRect_i_(i * 40 + 0x128, y + 4 + bob, 0x1F, 0x1F),
                        CRect_i_((i << 5) + 0x20, 0, 0x1F, 0x1F));
            if (pack->quick_item_qty[i] > 1) {
                int tens = pack->quick_item_qty[i] / 10;
                if (tens > 0) {
                    set2DSprite(Vif1Packet, frame, CRect_i_(i * 40 + 0x12F, y + 0x17, 0xC, 0xC),
                                CRect_i_(tens * 12, 0xD4, 0xC, 0xC));
                }
                set2DSprite(Vif1Packet, frame, CRect_i_(i * 40 + 0x13B, y + 0x17, 0xC, 0xC),
                            CRect_i_(pack->quick_item_qty[i] % 10 * 12, 0xD4, 0xC, 0xC));
            }
        }
    }

    // Floor number, or the mark of the last floor.
    set2DSprite(Vif1Packet, icons, CRect_i_(0x1FC, y, 0x66, 0x29), CRect_i_(0x9A, 1, 0x66, 0x29));
    if (BtUraDongeon != 0) {
        set2DSprite(Vif1Packet, icons, CRect_i_(0x23C, y, 0x26, 0x29), CRect_i_(0xDA, 0x2B, 0x26, 0x29));
    }
    if (BtEquipMasuisyou != 0) {
        set2DSprite(Vif1Packet, icons, CRect_i_(0x1FE, y + 5, 0x20, 0x20), CRect_i_(0, 0xA0, 0x20, 0x20));
    }
    if (BtEquipMap != 0) {
        set2DSprite(Vif1Packet, icons, CRect_i_(0x21E, y + 5, 0x20, 0x20), CRect_i_(0x20, 0xA0, 0x20, 0x20));
    }
    int last_floor = maxFloorTbl[UserStatus->cur_georama];
    if (floor + 1 == last_floor) {
        set2DSprite(Vif1Packet, frame, CRect_i_(0x23C, y + 0x12, 0x26, 0x11), CRect_i_(0x78, 0x9E, 0x26, 0x12));
    } else {
        int x;
        if (floor + 1 >= 10) {
            x = 0x245;
        } else {
            x = 0x23F;
        }
        if (floor + 1 >= 10) {
#ifdef PAL
            set2DSprite(Vif1Packet, frame, CRect_i_(x - 4, y + 0xA, 0xE, 0x11),
                        CRect_i_((floor + 1) / 10 * 12, 0x9E, 0xC, 0x12));
#else
            set2DSprite(Vif1Packet, frame, CRect_i_(x - 4, y + 0x12, 0xE, 0x11),
                        CRect_i_((floor + 1) / 10 * 12, 0x9E, 0xC, 0x12));
#endif
        }
#ifdef PAL
        set2DSprite(Vif1Packet, frame, CRect_i_(x + 9, y + 0xA, 0xE, 0x11),
                    CRect_i_((floor + 1) % 10 * 12, 0x9E, 0xC, 0x12));
#else
        set2DSprite(Vif1Packet, frame, CRect_i_(x + 9, y + 0x12, 0xE, 0x11),
                    CRect_i_((floor + 1) % 10 * 12, 0x9E, 0xC, 0x12));
#endif
    }

    // Brackets enclose the selected quick-use item.
    selected_item *= 40;
    set2DSprite(Vif1Packet, frame, CRect_i_(selected_item + 0xFC, y, 0x10, 0x10), CRect_i_(0x4A, 0x48, 0x10, 0x10));
    set2DSprite(Vif1Packet, frame, CRect_i_(selected_item + 0x113, y, 0x10, 0x10), CRect_i_(0x5A, 0x48, 0x10, 0x10));
    set2DSprite(Vif1Packet, frame, CRect_i_(selected_item + 0xFC, y + 0x16, 0x10, 0x10), CRect_i_(0x4A, 0x58, 0x10, 0x10));
    set2DSprite(Vif1Packet, frame, CRect_i_(selected_item + 0x113, y + 0x16, 0x10, 0x10), CRect_i_(0x5A, 0x58, 0x10, 0x10));

    // The equipped weapon's portrait fades in with the panel.
    y -= BtActStatus.hud_shake_y;
    alpha = y + 0x6A;
#ifdef PAL
    set2DSprite(Vif1Packet, icons, CRect_i_(0x18, 0x1AC, 0x2A, 0x1D), CRect_i_(0x78, 0x37, 0x2A, 0x1D), alpha);
    set2DSprite(Vif1Packet, icons, CRect_i_(0x45, 0x1A8, 0x2B, 0x10), CRect_i_(0xA2, 0x37, 0x2B, 0x10), alpha);
#else
    set2DSprite(Vif1Packet, icons, CRect_i_(0x18, 0x18C, 0x2A, 0x1D), CRect_i_(0x78, 0x37, 0x2A, 0x1D), alpha);
    set2DSprite(Vif1Packet, icons, CRect_i_(0x45, 0x188, 0x2B, 0x10), CRect_i_(0xA2, 0x37, 0x2B, 0x10), alpha);
#endif
    int chara = UserStatus->cur_chara;
    int u = 0;
    int v = 0;
    int item = UserStatus->chara_weapons[chara][UserStatus->equipped_weapon_slot[chara]].item_no;
    if (item == defWeapon[UserStatus->cur_chara] + 1) {
        v = 0x20;
    }
    if (item == defWeapon[UserStatus->cur_chara]) {
        v = u = 0x20;
    }
#ifdef PAL
    set2DSprite(Vif1Packet, icons, CRect_i_(0x1D, 0x1A4, 0x20, 0x20), CRect_i_(u, v, 0x20, 0x20), alpha);
#else
    set2DSprite(Vif1Packet, icons, CRect_i_(0x1D, 0x184, 0x20, 0x20), CRect_i_(u, v, 0x20, 0x20), alpha);
#endif
}

/**
 * Reports whether the party is suffering one status ailment.
 *
 * @mangled StatusErrCheck__Fi
 * @address 0x1B1930
 * @size 0x28
 */
int StatusErrCheck(int status) {
    return (UserStatus->ailments[UserStatus->cur_chara] & status) ? 1 : 0;
}

/**
 * Chooses the tint the party's status ailment gives them.
 *
 * @mangled BtStatusErrColorSet__Fv
 * @address 0x1B1960
 * @size 0xE8
 */
int BtStatusErrColorSet(void) {
    int status;
    int ailing;

    ailing = 0;
    status = UserStatus->ailments[UserStatus->cur_chara];

    if (status & 4) {
        StatusColor[0] = 127.5f;
        StatusColor[1] = 127.5f;
        StatusColor[2] = 127.5f;
        ailing = 1;
    }

    if (status & 0x40) {
        StatusColor[0] = 50.0f;
        StatusColor[1] = 75.0f;
        StatusColor[2] = 127.5f;
        ailing = 1;
    }

    if (status & 0x10) {
        StatusColor[0] = 47.0f;
        StatusColor[1] = 0.5f;
        StatusColor[2] = 63.75f;
        ailing = 1;
    }

    if (status & 8) {
        StatusColor[0] = 127.5f;
        StatusColor[1] = 80.0f;
        StatusColor[2] = 15.0f;
        ailing = 1;
    }

    return ailing;
}

/**
 * Steps since poison last took its toll.
 */
int poison_counter;

/**
 * Advances the party's status ailments and applies what they cost.
 *
 * @mangled BtStatusErrStep__Fv
 * @address 0x1B1A50
 * @size 0x154
 */
#if defined(PAL) && !defined(NON_MATCHING)
// NON_MATCHING under PAL: 7 left -- 10.0f loads before the other arguments of AddNowLife; its
// evaluate_first 1 orders it but swaps the status and chara registers.
void BtStatusErrStep(void);
INCLUDE_ASM("asm/pal/nonmatchings/shot_freefuncs", BtStatusErrStep__Fv);
/* Retail's data for the function the marker above supplies. */
unsigned int pal_at1188__2[4] __attribute__((aligned(16))) = {0x00000000, 0x00000000, 0x00000000, 0x3F800000};
#pragma name_counter 562
#else
void BtStatusErrStep(void) {
    int flags;
    CUserStatus *status = UserStatus;
    s8 *cur_chara = &status->cur_chara;

    flags = status->ailments[*cur_chara];
    poison_counter++;

    // Poison takes 4% of the character's max HP every 180 steps and shows the loss over them.
    if ((flags & 0x10) && poison_counter >= 180) {
        int chara = *cur_chara;
        int max_hp = status->max_hp[chara];
        int damage = 0.04 * max_hp;
        status->AddNowLife((s8) chara, -damage, 10.0f);

        float position[4] = {0.0f, 0.0f, 0.0f, 1.0f};
        position[1] = CharaHeight(UserStatus);
        HitValueEntry(NowHitValue, position, damage, 2, CharaMain.frame);
    }

    if (poison_counter >= 180) {
        poison_counter = 0;
    }

    BtStatusErrColorSet();
}
#endif

/**
 * Inflicts one status ailment on the party.
 *
 * @mangled BtSetStatusErr__Fi
 * @address 0x1B1BB0
 * @size 0x1CC
 */
void BtSetStatusErr(int status) {
    int chara;

    chara = UserStatus->cur_chara;

    switch (status) {
        case 4:
            UserStatus->ailments[chara] |= status;
            UserStatus->ailments[chara] &= ~0x58;
            UserStatus->ailment_frames[chara] = 300;
            SndSePlay(0x6B, -1, 0);
            break;

        case 8:
            if (!(UserStatus->ailments[chara] & 4)) {
                UserStatus->ailments[chara] |= status;
                UserStatus->ailment_frames[chara] = 1800;
            }
            break;

        case 0x10:
            if (!(UserStatus->ailments[chara] & 0xC)) {
                UserStatus->ailments[chara] |= status;
                UserStatus->ailments[chara] &= ~0x40;
                SndSePlay(0x6B, -1, 0);
            }
            break;

        case 0x20:
            UserStatus->ailments[chara] |= status;
            SndSePlay(0x6B, -1, 0);
            break;

        case 0x40:
            if (!(UserStatus->ailments[chara] & 0x1C)) {
                UserStatus->ailments[chara] |= status;
                SndSePlay(0x6B, -1, 0);
            }
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
    CTexture *texture = TexManager.GetTexture("itempack", -1);
    int status_flags[5] = {4, 8, 0x10, 0x20, 0x40};
    int icon_cells[5][2] = {{1, 0}, {0, 1}, {1, 1}, {1, 2}, {0, 2}};
    int status = UserStatus->ailments[UserStatus->cur_chara];
    for (int icon = 4; icon >= 0; icon--) {
        if (status & status_flags[icon]) {
            set2DSprite(Vif1Packet, texture, CRect_i_(430, y - 10, 62, 35),
                        CRect_i_(icon_cells[icon][0] * 62 + 132, icon_cells[icon][1] * 36 + 84, 62, 36));
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
void setItemToReserved(char *page_name, int x, int y, char *item_name, int dsax, int dsay) {
    CTexture *page;
    CTexture *item;
    int sbp;
    int sbw;
    int dbp;
    int dbw;

    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(Vif1Packet, 0x3F, 0);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);

    page = TexManager.GetTexture(page_name, -1);
    item = TexManager.GetTexture(item_name, -1);

    sbp = page->tex0 & 0x3FFF;
    dbp = item->tex0 & 0x3FFF;
    sbw = (page->tex0 >> 14) & 0x3F;
    dbw = (item->tex0 >> 14) & 0x3F;

    MoveImageTest(Vif1Packet, sbp, sbw, 0x13, CRect_i_(x, y, 0x20, 0x20), dbp, dbw, 0x13, dsax, dsay, 0);

    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(Vif1Packet, 0x3F, 0);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);
}

/**
 * Whether the jump cache holds a map.
 */
int BtCfgFlag;

/**
 * The message shown for the cached map jump.
 */
int BtSteebMsgNo;

/**
 * Clears the cached map-jump data.
 *
 * @mangled BtMapJumpCashClear__Fv
 * @address 0x1B20C0
 * @size 0x1C
 */
void BtMapJumpCashClear(void) {
    BtCfgCash[0] = '\0';
    BtCfgFlag = 0;
    BtSteebMsgNo = -1;
}

/**
 * Size, in quadwords, of the arena an allocator was given.
 */
static inline int ArenaLimit(CDataAlloc2<1> &arena) {
    return arena.limit;
}

/**
 * Loads the steeb message file for the current floor if it changed, then reads the map a jump
 * leads to, its treasure-box models and item-get motions; returns 0 when that map is already
 * loaded, 1 otherwise.
 *
 * @mangled BtMapJumpLoad__FPc
 * @address 0x1B20E0
 * @size 0x70C
 */
int BtMapJumpLoad(char *map_name) {
    char mpd_path[64];
    char cfg_path[64];
    char mes_path[64];
    int mes_size;
    int size;

    CUserStatus *status = UserStatus;
    int msg_no = status->cur_georama;
    int floor = status->cur_floor;

    // From dungeon 6 on, the message file also changes every twenty floors.
    if (msg_no >= 6) {
        if (floor >= 20) {
            msg_no++;
        }
        if (floor >= 40) {
            msg_no++;
        }
        if (floor >= 60) {
            msg_no++;
        }
        if (floor >= 80) {
            msg_no++;
        }
    }

    if (msg_no != BtSteebMsgNo) {
        BtSteebMesBuffer.used = 0;
        u_char *mes = BtSteebMesBuffer.base + BtSteebMesBuffer.used * 16;
        if (status->cur_georama == 6) {
            sprintf(mes_path, "dun/message/ww_mes/steve07_%d_%d.mes", msg_no - 5, LanguageCode);
        } else {
            sprintf(mes_path, "dun/message/ww_mes/steve0%d_%d.mes", msg_no + 1, LanguageCode);
        }
        LoadFile(mes_path, mes, &mes_size);
        wait_now_loading_vsync();
        DngMesStb.SetBuff((short *) mes);
        BtSteebMesBuffer.Alloc((((mes_size >> 6) + 1) << 6) >> 4);
        BtSteebMesBuffer.Align64();
        BtSteebMsgNo = msg_no;
    }

    TexManager.DeleteTextureBlock(42);
    MainMonstorUnit.CleanViewMonstor(0);
    NowDngMap = &MainDungeonMap;
    NowEventMan = &DngEventMan;

    if (strcmp(BtCfgCash, map_name) == 0 && BtCfgFlag != 0) {
        return 0;
    }
    strcpy(BtCfgCash, map_name);

    MapModelBuffer.used = 0;
    u_int *pack = read_buffer;
    read_buffer = old_read_buffer;

    int i;
    DRAN_MAP_FIELD_SET *field_set = (DRAN_MAP_FIELD_SET *) NowDranMapField;
    for (i = 0; i < 12; i++) {
        field_set->field[i].Initialize();
        field_set->collision[i] = NULL;
        field_set->state[i] = 3;
    }
    field_set->field_count = 0;
    field_set->collision_count = 0;

    MainDungeonMap.initSubmap(&MapModelBuffer);
    for (int slot = 0; slot < 64; slot++) {
        CDungeonEvent *event = &DngEventMan.slot[slot];
        event->name[0] = '\0';
        event->script_no = -1;
        event->parts_id = -1;
        event->switch_on = 0;
        event->enabled = 0;
    }
    for (int record = 0; record < 96; record++) {
        CDungeonEventData *data = &DngEventMan.event[record];
        data->event = NULL;
        data->switch_on = 0;
        data->enabled = 0;
        data->hold = 0;
        data->chara_done = -1;
    }

    strcpy(mpd_path, "dun/mpd_pack/");
    strcat(mpd_path, map_name);
    strcat(mpd_path, ".mpd");
    strcpy(cfg_path, "dun/");
    strcat(cfg_path, map_name);
    strcat(cfg_path, ".cfg");
    TEIGIAnalyz(cfg_path);

    size = 0;
    LoadFile(mpd_path, (void *) read_buffer, &size);
    wait_now_loading_vsync();
    if (size >= 6400000) {
        printf("MAPDATA BUFFER OVER!! %d\n", size);
        exit__2(1);
    }

    TEIGIImgLoad(read_buffer, &MapModelBuffer);
    TEIGIMdsLoad(read_buffer, 0);

    CFrameAttr attr;
    attr.fog_enable = 1;
    attr.clip_depth = 100.0f;
    attr.clip_enable = 0;
    attr.program_option = 0;
    NowDngMap->box_body_model = LoadMDSFilePack(read_buffer, "ibox_0.mds", &MapModelBuffer);
    NowDngMap->box_lid_model = LoadMDSFilePack(read_buffer, "ibox_t.mds", &MapModelBuffer);
    NowDngMap->box_collision_model =
        LoadCollisionFilePack(read_buffer, "ibox_a.mds", &MapModelBuffer);
    NowDngMap->box_body_model->SetAttr(attr, 1, 0);
    NowDngMap->box_lid_model->SetAttr(attr, 1, 0);
    NowDngMap->chest_body_model = LoadMDSFilePack(read_buffer, "iboxs_0.mds", &MapModelBuffer);
    NowDngMap->chest_lid_model = LoadMDSFilePack(read_buffer, "iboxs_t.mds", &MapModelBuffer);
    NowDngMap->chest_collision_model = LoadCollisionFilePack(read_buffer, "iboxs_a.mds", &MapModelBuffer);
    NowDngMap->chest_body_model->SetAttr(attr, 1, 0);
    NowDngMap->chest_lid_model->SetAttr(attr, 1, 0);

    itemOpenSmall.LoadPack(read_buffer, "dun/etc/itemget_s/d01i02m", &MapModelBuffer,
                           &MapModelBuffer, &itemOpenSmall_info, 0);
    itemOpenBig.LoadPack(read_buffer, "dun/etc/itemget_b/d01i01m", &MapModelBuffer,
                         &MapModelBuffer, &itemOpenBig_info, 0);

    // The monsters get whatever the map left of its buffer.
    int map_used = MapModelBuffer.used;
    u_char *monster_base = MapModelBuffer.base + map_used * 16;
    long monster_size = 0xA7F80 - map_used;
    MonstorModelBuffer.base = monster_base;
    MonstorModelBuffer.limit = monster_size;
    MonstorModelBuffer.used = 0;
    read_buffer = pack;

    printf("TotalMem = %d\n", 0xA7F80);
    printf("MapVisualData   [%x]  %d/%d\n", MapModelBuffer.base + MapModelBuffer.used * 16,
           MapModelBuffer.used, ArenaLimit(MapModelBuffer));
    printf("MonstorData     [%x]  %d/%d\n", MonstorModelBuffer.base + MonstorModelBuffer.used * 16,
           MonstorModelBuffer.used, ArenaLimit(MonstorModelBuffer));
    BtCfgFlag = 1;
    return 1;
}

/**
 * Draws a textured cell in world space.
 *
 * @mangled BtSet3DCellModel__FPfP8CTexturefiiiii
 * @address 0x1B27F0
 * @size 0x108
 */
void BtSet3DCellModel(float *world, CTexture *texture, float size, int x, int y, int width,
                      int height, int alpha) {
    int top_left[4];
    int top_right[4];
    int bottom_left[4];
    int bottom_right[4];
    CRect_i_ source;

    world[3] = 1.0f;

    if (MGRotTransPers3DSprite(top_left, bottom_right, world, size, size / 2.0f, 0) == 1) {
        top_right[0] = bottom_right[0];
        top_right[1] = top_left[1];
        top_right[2] = top_left[2];
        bottom_left[0] = top_left[0];
        bottom_left[1] = bottom_right[1];
        bottom_left[2] = bottom_right[2];

        source.x = x;
        source.y = y;
        source.width = width;
        source.height = height;

        set3DSprite(Vif1Packet, texture, source, top_left, top_right, bottom_left, bottom_right,
                    alpha);
    }
}
