#include "shot_freefuncs.hpp"

#include <libvu0.h>

#include <cmath>
#include <cstdio>
#include <cstring>

#include "character.hpp"
#include "dataread.hpp"
#include "dun/gameloop.hpp"
#include "dungeonmap.hpp"
#include "healeffect.hpp"
#include "hitvalue.hpp"
#include "mathutil.hpp"
#include "mglib.hpp"
#include "monstorunit.hpp"
#include "nowload.hpp"
#include "rect.hpp"
#include "snd.hpp"
#include "texture.hpp"
#include "userstatus.hpp"

#ifdef NON_MATCHING
static sceVu0FVECTOR water_position;
static s32 healing_water_active;
#endif
#ifdef NON_MATCHING
/**
 * How tall the character in play stands, where a status ailment's damage number rises from.
 */
static inline float PoisonCharaHeight(CUserStatus *status) {
    float chara_height[6] = {16.0f, 14.0f, 16.0f, 16.0f, 18.0f, 15.0f};

    return chara_height[status->cur_chara];
}
#endif

extern "C" s32 poison_counter;

/**
 * Copies a rectangular texture region into another texture.
 */
extern void MoveImageTest(sceVif1Packet *, int, int, int, const CRect_i_ &, int, int, int, int, int, int);

/**
 * The name of the map held in the jump cache.
 */
extern char BtCfgCash[64];

/**
 * Whether the jump cache holds a map.
 */
extern int BtCfgFlag;

/**
 * The message shown for the cached map jump.
 */
extern int BtSteebMsgNo;

/**
 * The colour of a full life bar.
 */
extern u8 statusRGBColor_life[4];

/**
 * The colour of a full weapon bar.
 */
extern u8 statusRGBColor_weapon[4];

/**
 * The colour of a bar below three tenths.
 */
extern u8 statusRGBColor_30[4];

/**
 * The warning colour of a bar below a seventh.
 */
extern u8 statusRGBColor_15[4];

/**
 * The second colour of a full life bar.
 */
extern u8 statusRGBColor_life_2[4];

/**
 * The second colour of a full weapon bar.
 */
extern u8 statusRGBColor_weapon_2[4];

/**
 * The second colour of a bar below three tenths.
 */
extern u8 statusRGBColor_30_2[4];

/**
 * The second warning colour of a bar below a seventh.
 */
extern u8 statusRGBColor_15_2[4];

/**
 * The period of the low-life warning pulse.
 */
extern int statusAlarmRate;

/**
 * The phase of the low-life warning pulse.
 */
extern float statusAlarmCounter;

/**
 * The tint applied to the party by status ailments.
 */
extern "C" float StatusColor[3];

/**
 * The healing particles that play in water.
 */
extern "C" CHealEffect HealEffect;

/**
 * Frames remaining before healing water restores the party again.
 */
extern int healingSpeed;

/**
 * Whether the healing effect still owes the scene its ambient colour back.
 */
extern int healingSpeed_flg;

/**
 * The water the party is standing in and the nearest water surface.
 */
extern CHECK_WATER_INFO CheckWaterInfo;

/**
 * The rings spreading across the water.
 */
extern WATER_WAVE_LING WaterWaveLing[6];

/**
 * The frames remaining before the next ring appears.
 */
extern int WaterWaveLingWait;

/**
 * Whether the water splash is active.
 */
extern int Water_Splash_actFlag;

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
    CheckWaterInfo.unk_20 = 0;

    for (i = 0; i < 6; i++) {
        WaterWaveLing[i].unk_14 = 0;
    }

    WaterWaveLingWait = 0;
}

/**
 * Reports whether the party stands in healing water.
 *
 * @mangled CheckHealingWater__Fv
 * @address 0x1AF3B0
 * @size 0x328
 */
#ifdef NON_MATCHING
int CheckHealingWater() {
    sceVu0FVECTOR position;
    CharaMain.GetPosition(position);
    healing_water_active = 0;

    float nearest = 160.0f;
    for (int part = 0; part < 72; part++) {
        CDungeonParts &map_part = NowDngMap->parts[part];
        if (map_part.frame[0] == NULL || map_part.water.used == 0) {
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
#else
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", CheckHealingWater__Fv);
#endif
/**
 * Reports whether the party stands in a healing zone.
 *
 * @mangled CheckHealZone__Fv
 * @address 0x1AF6E0
 * @size 0x29C
 */
#ifdef NON_MATCHING
int CheckHealZone() {
    sceVu0FVECTOR position;
    CharaMain.GetPosition(position);
    for (int part = 0; part < 72; part++) {
        CDungeonParts &map_part = NowDngMap->parts[part];
        if (map_part.frame[0] == NULL || map_part.heal_on == 0) {
            continue;
        }
        float dx = position[0] - (map_part.pos[0] + map_part.heal_pos[0]);
        float dz = position[2] - (map_part.pos[2] + map_part.heal_pos[2]);
        if (dx > -80.0f && dx < 80.0f && dz > -80.0f && dz < 80.0f &&
            position[1] > map_part.heal_pos[1]) {
            return 1;
        }
    }
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", CheckHealZone__Fv);
#endif

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
#ifdef NON_MATCHING
void DrawWaterLing() {
    CTexture *texture = TexManager.GetTexture("waterspl", -1);
    for (int ring = 0; ring < 6; ring++) {
        if (WaterWaveLing[ring].unk_14 > 0) {
            int alpha = WaterWaveLing[ring].unk_14 * 128 / 45;
            BtSet3DCellModel(WaterWaveLing[ring].unk_00, texture,
                             WaterWaveLing[ring].unk_10, 0, 0, 64, 64, alpha);
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", DrawWaterLing__Fv);
#endif
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @703);

/**
 * Advances the rings spreading on the water.
 *
 * @mangled StepWaterLing__Fv
 * @address 0x1AFD60
 * @size 0x130
 */
void StepWaterLing(void) {
    int i;

    if (CheckWaterInfo.unk_20 != 0) {
        WaterWaveLingWait++;

        if (WaterWaveLingWait >= 20) {
            WaterWaveLingWait = 0;

            for (i = 0; i < 6; i++) {
                if (WaterWaveLing[i].unk_14 == 0) {
                    sceVu0CopyVector(WaterWaveLing[i].unk_00, CheckWaterInfo.unk_10);
                    WaterWaveLing[i].unk_10 = 2.0f;
                    WaterWaveLing[i].unk_14 = 45;
                    break;
                }
            }
        }
    }

    for (i = 0; i < 6; i++) {
        if (WaterWaveLing[i].unk_14 > 0) {
            WaterWaveLing[i].unk_10 += 0.2f;
            WaterWaveLing[i].unk_14--;
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
/** Number of floors in each dungeon. */
extern "C" int maxFloorTbl[7];

void BtBattleMusic_Excg(float distance, float *field_volume, float *battle_volume);

static inline int MonstorAliveCheck(int no, int alive) {
    if (no >= 0 && no < 17) {
        alive = NowMonstorUnit->monster[no].unk_0D4;
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
/** The stay frame texture, shared with topStatusInfo. */
extern char StayFrameTextureName[];

/**
 * Draws a three-digit value out of the number sheet.
 *
 * @mangled ValuePrint__FiiiiUc
 * @address 0x1B0060
 * @size 0x1F8
 */
int ValuePrint(int x, int y, int value, int palette, unsigned char alpha) {
    CTexture *texture = TexManager.GetTexture(StayFrameTextureName, -1);
    int source_y = palette * 12 + 0xB0;
    int count = 0;
    int digit = value / 100;
    if (digit > 0) {
        set2DSprite(Vif1Packet, texture, CRect_i_(x, y, 12, 12), CRect_i_(digit * 12, source_y, 12, 12), alpha);
        value -= digit * 100;
        x += 12;
        count++;
    }
    digit = value / 10;
    set2DSprite(Vif1Packet, texture, CRect_i_(x, y, 12, 12), CRect_i_(digit * 12, source_y, 12, 12), alpha);
    digit = value % 10;
    set2DSprite(Vif1Packet, texture, CRect_i_(x + 12, y, 12, 12), CRect_i_(digit * 12, source_y, 12, 12), alpha);
    return count + 2;
}
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @778);
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
 * Draws the life, magic and stamina bars at the top of the screen.
 *
 * @mangled topStatusInfo__Fiii
 * @address 0x1B04F0
 * @size 0x1438
 */
#ifdef NON_MATCHING
void topStatusInfo(int x, int y, int blend_mode) {
    (void) blend_mode;
    int character = UserStatus->cur_chara;
    float maximum_life = (float) UserStatus->max_hp[character];
    float current_life = (float) UserStatus->hp[character];
    spRGBA *top = (spRGBA *) BtGetStatusPal(0, maximum_life, current_life);
    spRGBA *bottom = (spRGBA *) BtGetStatusPal2(0, maximum_life, current_life);
    int width = maximum_life > 0.0f ? (int) (current_life * 96.0f / maximum_life) : 0;
    CRect_i_ life_bar(x, y, width, 6);
    set2DSpriteC4(Vif1Packet, life_bar, top, bottom, top, bottom);
    ValuePrint(x + 104, y - 3, (int) current_life, 0, (u8) statusAlarmRate);
    ValuePrint(x + 144, y - 3, (int) maximum_life, 0, (u8) statusAlarmRate);

    float maximum_water = UserStatus->water_max[character];
    float current_water = UserStatus->water_now[character];
    top = (spRGBA *) BtGetStatusPal(1, maximum_water, current_water);
    bottom = (spRGBA *) BtGetStatusPal2(1, maximum_water, current_water);
    width = maximum_water > 0.0f ? (int) (current_water * 96.0f / maximum_water) : 0;
    CRect_i_ water_bar(x, y + 17, width, 6);
    set2DSpriteC4(Vif1Packet, water_bar, top, bottom, top, bottom);
}
#else
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", topStatusInfo__Fiii);
#endif
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1150);

/** The status panel texture, shared with topStatusInfo. */
extern char StatusTextureName[];
/**
 * Reports whether the party is suffering one status ailment.
 *
 * @mangled StatusErrCheck__Fi
 * @address 0x1B1930
 * @size 0x28
 */
int StatusErrCheck(int status) {
    return (UserStatus->unk_42C8[UserStatus->cur_chara] & status) ? 1 : 0;
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
    status = UserStatus->unk_42C8[UserStatus->cur_chara];

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
 * Advances the party's status ailments and applies what they cost.
 *
 * @mangled BtStatusErrStep__Fv
 * @address 0x1B1A50
 * @size 0x154
 */
#ifdef NON_MATCHING
void BtStatusErrStep() {
    CUserStatus *status = UserStatus;
    s8 *chara_no = &status->cur_chara;
    u_int flags = status->unk_42C8[status->cur_chara];
    poison_counter++;
    if ((flags & 0x10) && poison_counter >= 180) {
        int chara = *chara_no;
        int damage = (int) ((double) status->max_hp[chara] * 0.04);
        status->AddNowLife((s8) chara, (s16) -damage, 10.0f);
        sceVu0FVECTOR position = {0.0f, 0.0f, 0.0f, 1.0f};
        position[1] = PoisonCharaHeight(UserStatus);
        HitValueEntry(NowHitValue, position, damage, 2, CharaMain.frame);
    }
    if (poison_counter >= 180) {
        poison_counter = 0;
    }
    BtStatusErrColorSet();
}
#else
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", BtStatusErrStep__Fv);
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
            UserStatus->unk_42C8[chara] |= status;
            UserStatus->unk_42C8[chara] &= ~0x58;
            UserStatus->unk_42E0[chara] = 300;
            SndSePlay(0x6B, -1, 0);
            break;

        case 8:
            if (!(UserStatus->unk_42C8[chara] & 4)) {
                UserStatus->unk_42C8[chara] |= status;
                UserStatus->unk_42E0[chara] = 1800;
            }
            break;

        case 0x10:
            if (!(UserStatus->unk_42C8[chara] & 0xC)) {
                UserStatus->unk_42C8[chara] |= status;
                UserStatus->unk_42C8[chara] &= ~0x40;
                SndSePlay(0x6B, -1, 0);
            }
            break;

        case 0x20:
            UserStatus->unk_42C8[chara] |= status;
            SndSePlay(0x6B, -1, 0);
            break;

        case 0x40:
            if (!(UserStatus->unk_42C8[chara] & 0x1C)) {
                UserStatus->unk_42C8[chara] |= status;
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
    CTexture *texture = TexManager.GetTexture(StatusTextureName, -1);
    int status_flags[5] = {4, 8, 0x10, 0x20, 0x40};
    int icon_cells[5][2] = {{1, 0}, {0, 1}, {1, 1}, {1, 2}, {0, 2}};
    int status = UserStatus->unk_42C8[UserStatus->cur_chara];
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
 * Reads the map a jump leads to, along with its message buffer.
 *
 * @mangled BtMapJumpLoad__FPc
 * @address 0x1B20E0
 * @size 0x70C
 */
#ifdef NON_MATCHING
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
#else
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", BtMapJumpLoad__FPc);
#endif
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
