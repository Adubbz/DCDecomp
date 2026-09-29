#include "collisiondata.hpp"

#include <cstdio>
#include <cstring>

#include "camerafollow.hpp"
#include "debugfont.hpp"
#include "dngmessageman.hpp"
#include "dun/gameloop.hpp"
#include "dungeoneventman.hpp"
#include "dungeonmap.hpp"
#include "gamepad.hpp"
#include "hitmark.hpp"
#include "itemdata.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "snd.hpp"

/**
 * The action code of each debug overlay line, ended by -1.
 */
int DebugInfoCode[15] = {10, 20, 41, 70, 50, 150, 100, 30, 110, 80, 90, 120, 130, 140, -1};

// clang-format off
/**
 * The format of each debug overlay line, ended by a null entry.
 */
char *DebugInfoMsg[15] = {
    DebugInfoMsgMiniMapView, DebugInfoMsgCollision,  DebugInfoMsgBgmPlay,     DebugInfoMsgParameter,
    DebugInfoMsgViewInfo,    DebugInfoMsgUltraMan,   DebugInfoMsgReloadEnemy, DebugInfoMsgItemPutZone,
    DebugInfoMsgLightMode,   DebugInfoMsgFloorAtraGet, DebugInfoMsgEventTest, DebugInfoMsgSetStatus,
    DebugInfoMsgSePlay,      DebugInfoMsgSetChrKey,  NULL,
};
// clang-format on

/**
 * The debug overlay line the cursor is on.
 */
int DebugInfoNowCursor;

/** Key items waiting to be dropped, one entry each, -1 where a slot is free. */
int gateKeyStack[32];

/**
 * The path NameExchg builds.
 */
char nameblock[64];

/**
 * Draws the dungeon debug overlay and its current menu selection.
 *
 * @mangled DebugInfomationDraw__Fv
 * @address 0x1B3780
 * @size 0xF70
 */
void DebugInfomationDraw(void) {
    if (DebugStatus[0] != 1) {
        if (DebugStatus[4] != 0) {
            sceVu0FVECTOR pos;
            sceVu0FVECTOR rot;
            sceVu0FVECTOR cpos;
            sceVu0FVECTOR cref;
            float angle;
            float dist;
            float height;
            int ix;
            float lx;
            int iz;
            float lz;
            float lcx;
            float lcy;
            float lcz;
            float lrx;
            float lry;
            float y;
            float lrz;
            CDungeonEventData *data;
            int num;

            DbgMsg.len = sprintf(DbgMsg.text, " ---Infomation---\n");
            sceVu0CopyVector(pos, CharaMain.pos);
            CharaMain.GetRotation(rot);
            NowCamera__3->GetPos(cpos);
            NowCamera__3->GetRef(cref);
            angle = NowCamera__3->GetAngle();
            dist = NowCamera__3->GetDistance();
            height = NowCamera__3->GetHeight();
            ix = (int) ((pos[0] - 80.0f) / 160.0f) * 160;
            lx = pos[0] - ix - 160.0f;
            y = pos[1];
            iz = (int) ((pos[2] - 80.0f) / 160.0f) * 160;
            lz = pos[2] - iz - 160.0f;
            lcx = cpos[0] - ix - 160.0f;
            lcy = cpos[1];
            lcz = cpos[2] - iz - 160.0f;
            lrx = cref[0] - ix - 160.0f;
            lry = cref[1];
            lrz = cref[2] - iz - 160.0f;
            DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], "gpos %.2f/ %.2f/ %.2f\n", pos[0], pos[1], pos[2]);
            DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], "lpos %.2f/ %.2f/ %.2f\n", lx, y, lz);
            DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], "rot %.2f/ %.2f/ %.2f\n", rot[0], rot[1], rot[2]);
            DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], "CAM\n");
            DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], "cpos %.2f/ %.2f/ %.2f\n", cpos[0], cpos[1], cpos[2]);
            DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], "cref %.2f/ %.2f/ %.2f\n", cref[0], cref[1], cref[2]);
            DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], "lcpos %.2f/ %.2f/ %.2f\n", lcx, lcy, lcz);
            DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], "lcref %.2f/ %.2f/ %.2f\n", lrx, lry, lrz);
            DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], "Angle = %.3f\n", angle);
            DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], "Dist = %.3f\n", dist);
            DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], "Height = %.3f\n", height);
            DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], "RANDOM MAP CODE = %d\n", NowDngMap->map_seed);
            DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], "WeaponList Ver 2000/%d\n", VERSION_VOL);
            data = NowEventMan->SearchDataSlotPos(pos);
            num = 0;
            if (data != NULL) {
                num = 1;
            }
            num = NowEventMan->GetDataNum();
            DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], "EventID = %d\n", num);
            MGFillBox(CRect_i_(0x200, 0x280, 0x1000, 0x700), 8, 8, 8, 0x60);
            DbgMsg.Draw();
        }
        return;
    }
    DbgMsg.len = sprintf(DbgMsg.text, "");
    char *onoff[2] = {"OFF", "ON"};
    char *mainsub[2] = {"MAIN", "SUB"};
    char *chars[6] = {"RESET", "STONE", "BIN2", "POISON", "CURSE", "NEBA2"};
    char *types[3] = {"HUMAN   ", "SUPERMAN", "ULTRAMAN"};
    char buf[32];
    for (int i = 0; DebugInfoMsg[i] != NULL; i++) {
        if (DebugInfoNowCursor == i) {
            DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], ">>");
        } else {
            DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], "  ");
        }
        switch (DebugInfoCode[i]) {
            case 0:
                DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], DebugInfoMsg[i]);
                break;
            case 40:
                DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], DebugInfoMsg[i], DebugStatus[8]);
                break;
            case 41:
                if (DebugStatus[9] == -1) {
                    DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], DebugInfoMsg[i], "OFF");
                } else {
                    sprintf(buf, "%d", DebugStatus[9] + 1);
                    DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], DebugInfoMsg[i], buf);
                }
                break;
            case 70:
                DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], DebugInfoMsg[i], onoff[DebugStatus[10]]);
                break;
            case 20:
                DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], DebugInfoMsg[i], onoff[DebugStatus[5]]);
                break;
            case 50:
                DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], DebugInfoMsg[i], onoff[DebugStatus[4]]);
                break;
            case 30:
                DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], DebugInfoMsg[i], onoff[DebugStatus[6]]);
                break;
            case 10:
                DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], DebugInfoMsg[i], onoff[DebugStatus[3]]);
                break;
            case 150:
                DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], DebugInfoMsg[i], types[DebugStatus[20]]);
                break;
            case 100:
                DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], DebugInfoMsg[i], DebugStatus[14], DebugStatus[15]);
                break;
            case 80:
                DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], DebugInfoMsg[i]);
                break;
            case 110:
                DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], DebugInfoMsg[i], mainsub[DebugStatus[16]]);
                break;
            case 90:
                DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], DebugInfoMsg[i], DebugStatus[11]);
                break;
            case 120:
                DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], DebugInfoMsg[i], chars[DebugStatus[17]]);
                break;
            case 130:
                DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], DebugInfoMsg[i], DebugStatus[18]);
                break;
            case 140:
                DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], DebugInfoMsg[i], DebugStatus[19]);
                break;
        }
    }
    MGFillBox(CRect_i_(0x200, 0x280, 0x1000, 0x700), 8, 8, 8, 0x60);
    DbgMsg.Draw();
}

/**
 * Clears the debug overlay's state.
 *
 * @mangled DebugInfomationInit__Fv
 * @address 0x1B46F0
 * @size 0xC8
 */
void DebugInfomationInit(void) {
    DebugStatus[0] = 0;
    DebugStatus[1] = 0;
    DebugStatus[2] = 0;
    DebugStatus[3] = 0;
    DebugStatus[5] = 1;
    DebugStatus[6] = 0;
    DebugStatus[4] = 0;
    DebugStatus[7] = 0;
    DebugStatus[8] = 150;
    DebugStatus[9] = -1;
    DebugStatus[10] = 0;
    DebugStatus[11] = 100;
    DebugStatus[12] = 0;
    DebugStatus[13] = 16;
    DebugStatus[14] = 0;
    DebugStatus[15] = 16;
    DebugStatus[16] = 0;
    DebugStatus[17] = 0;
    DebugStatus[18] = 400;
    DebugStatus[19] = 1;
    DebugStatus[20] = 0;
}

/**
 * Resets every runtime event record of the event manager to an idle, unheld state.
 */
static inline void ClearEventData(CDungeonEventMan *event_man) {
    int i;

    for (i = 0; i < 96; i++) {
        CDungeonEventData *data = &event_man->event[i];

        data->event = NULL;
        data->unk_34 = 0;
        data->enabled = 0;
        data->hold = 0;
        data->chara_done = -1;
    }
}

/**
 * Marks the floor's event places, treasure boxes, atla balls and room links unused and resets their counts.
 */
static inline void ClearMapEvent(CDungeonMap *map) {
    int i;

    for (i = 0; i < 48; i++) {
        map->events[i].kind = -1;
        map->events[i].unk_2C = 0;
    }
    for (i = 0; i < 24; i++) {
        map->boxes[i].used = 0;
        map->boxes[i].lid_angle = 0;
        map->boxes[i].unk_30 = 0;
    }
    map->box_num = 0;
    for (i = 0; i < 8; i++) {
        map->atra[i].used = 0;
    }
    map->atra_num = 0;
    for (i = 0; i < 4; i++) {
        map->room_link[i].used = 0;
    }
}

/**
 * Moves through the debug overlay's pages with the pad.
 *
 * @mangled DebugInfomationIF__Fv
 * @address 0x1B47C0
 * @size 0xE78
 */
int DebugInfomationIF(void) {
    int i;

    if (GamePad.Down(0x400)) {
        DebugStatus[0] = 0;
        GamePad.AutoRepeatOff();
        GamePad.MenuModeOff();
        return 1;
    }
    if (GamePad.Down(0x10)) {
        switch (DebugInfoCode[DebugInfoNowCursor]) {
            case 90:
                DebugStatus[0] = 0;
                DebugStatus[12] = 1;
                GamePad.AutoRepeatOff();
                GamePad.MenuModeOff();
                return 40;
        }
    }
    if (GamePad.Down(0x20)) {
        switch (DebugInfoCode[DebugInfoNowCursor]) {
            case 40:
                DebugStatus[0] = 0;
                GamePad.AutoRepeatOff();
                GamePad.MenuModeOff();
                return 40;
            case 60:
                DebugStatus[0] = 0;
                GamePad.AutoRepeatOff();
                GamePad.MenuModeOff();
                return 60;
            case 100:
                DebugStatus[0] = 0;
                GamePad.AutoRepeatOff();
                GamePad.MenuModeOff();
                return 100;
            case 80:
                DebugStatus[0] = 0;
                GamePad.AutoRepeatOff();
                GamePad.MenuModeOff();
                return 80;
            case 90:
                DebugStatus[0] = 0;
                DebugStatus[12] = 0;
                GamePad.AutoRepeatOff();
                GamePad.MenuModeOff();
                return 90;
            case 120:
                DebugStatus[0] = 0;
                GamePad.AutoRepeatOff();
                GamePad.MenuModeOff();
                return 120;
            case 130:
                SndSePlay(DebugStatus[18], -1, 0);
                break;
            case 140:
                DebugStatus[0] = 0;
                GamePad.AutoRepeatOff();
                GamePad.MenuModeOff();
                ClearEventData(NowEventMan);
                printf("trap num = %d\n", NowDngMap->SetCharaDoor(DebugStatus[19]));
                ClearMapEvent(NowDngMap);
                {
                    int mode = NowDngMap->unk_BDEC;

                    NowEventMan->SetupEvent(NowDngMap, mode);
                }
                return 140;
        }
    }
    for (i = 0; DebugInfoCode[i] != -1; i++) {
    }
    switch (DebugStatus[2]) {
        case 0:
            if (GamePad.Down(0x4000)) {
                if (DebugInfoNowCursor == i - 1) {
                    DebugInfoNowCursor = 0;
                } else {
                    DebugInfoNowCursor++;
                }
            }
            if (GamePad.Down(0x1000)) {
                if (DebugInfoNowCursor == 0) {
                    DebugInfoNowCursor = i - 1;
                } else {
                    DebugInfoNowCursor--;
                }
            }
            if (GamePad.Down(0x2000)) {
                switch (DebugInfoCode[DebugInfoNowCursor]) {
                    case 10:
                        if (DebugStatus[3] == 0) {
                            DebugStatus[3] = 1;
                        } else {
                            DebugStatus[3] = 0;
                        }
                        break;
                    case 20:
                        if (DebugStatus[5] == 0) {
                            DebugStatus[5] = 1;
                        } else {
                            DebugStatus[5] = 0;
                        }
                        break;
                    case 30:
                        if (DebugStatus[6] == 0) {
                            DebugStatus[6] = 1;
                        } else {
                            DebugStatus[6] = 0;
                        }
                        break;
                    case 50:
                        if (DebugStatus[4] == 0) {
                            DebugStatus[4] = 1;
                        } else {
                            DebugStatus[4] = 0;
                        }
                        break;
                    case 70:
                        if (DebugStatus[10] == 0) {
                            DebugStatus[10] = 1;
                        } else {
                            DebugStatus[10] = 0;
                        }
                        break;
                    case 150:
                        if (DebugStatus[20] == 2) {
                            DebugStatus[20] = 0;
                        } else {
                            DebugStatus[20]++;
                        }
                        break;
                    case 100:
                        if (DebugStatus[14] < 4) {
                            DebugStatus[14]++;
                        } else {
                            DebugStatus[14] = 0;
                        }
                        break;
                    case 41:
                        DebugStatus[9]++;
                        if (DebugStatus[9] != -1) {
                            SndBgmLoad(DebugStatus[9] * 10 + 100);
                            SndBgmPlay(0);
                        } else {
                            SndBgmStop();
                        }
                        break;
                    case 90:
                        DebugStatus[11]++;
                        break;
                    case 110:
                        if (DebugStatus[16] == 0) {
                            DebugStatus[16] = 1;
                        } else {
                            DebugStatus[16] = 0;
                        }
                        break;
                    case 120:
                        if (DebugStatus[17] == 5) {
                            DebugStatus[17] = 0;
                        } else {
                            DebugStatus[17]++;
                        }
                        break;
                    case 130:
                        DebugStatus[18]++;
                        break;
                    case 140:
                        if (DebugStatus[19] >= 5) {
                            DebugStatus[19] = 0;
                        } else {
                            DebugStatus[19]++;
                        }
                        break;
                }
            }
            if (GamePad.Down(0x8000)) {
                switch (DebugInfoCode[DebugInfoNowCursor]) {
                    case 10:
                        if (DebugStatus[3] == 0) {
                            DebugStatus[3] = 1;
                        } else {
                            DebugStatus[3] = 0;
                        }
                        break;
                    case 20:
                        if (DebugStatus[5] == 0) {
                            DebugStatus[5] = 1;
                        } else {
                            DebugStatus[5] = 0;
                        }
                        break;
                    case 30:
                        if (DebugStatus[6] == 0) {
                            DebugStatus[6] = 1;
                        } else {
                            DebugStatus[6] = 0;
                        }
                        break;
                    case 50:
                        if (DebugStatus[4] == 0) {
                            DebugStatus[4] = 1;
                        } else {
                            DebugStatus[4] = 0;
                        }
                        break;
                    case 70:
                        if (DebugStatus[10] == 0) {
                            DebugStatus[10] = 1;
                        } else {
                            DebugStatus[10] = 0;
                        }
                        break;
                    case 150:
                        if (DebugStatus[20] == 0) {
                            DebugStatus[20] = 2;
                        } else {
                            DebugStatus[20]--;
                        }
                        break;
                    case 100:
                        if (DebugStatus[14] > 0) {
                            DebugStatus[14]--;
                        } else {
                            DebugStatus[14] = 4;
                        }
                        break;
                    case 41:
                        if (DebugStatus[9] > -1) {
                            DebugStatus[9]--;
                        }
                        if (DebugStatus[9] != -1) {
                            SndBgmLoad(DebugStatus[9] * 10 + 100);
                            SndBgmPlay(0);
                        } else {
                            SndBgmStop();
                        }
                        break;
                    case 90:
                        if (DebugStatus[11] > 0) {
                            DebugStatus[11]--;
                        }
                        break;
                    case 110:
                        if (DebugStatus[16] == 0) {
                            DebugStatus[16] = 1;
                        } else {
                            DebugStatus[16] = 0;
                        }
                        break;
                    case 120:
                        if (DebugStatus[17] == 0) {
                            DebugStatus[17] = 5;
                        } else {
                            DebugStatus[17]--;
                        }
                        break;
                    case 130:
                        DebugStatus[18]--;
                        break;
                    case 140:
                        if (DebugStatus[19] <= 0) {
                            DebugStatus[19] = 5;
                        } else {
                            DebugStatus[19]--;
                        }
                        break;
                }
            }
            if (GamePad.Down(4)) {
                switch (DebugInfoCode[DebugInfoNowCursor]) {
                    case 90:
                        if (DebugStatus[11] > 0) {
                            DebugStatus[11] -= 10;
                        }
                        if (DebugStatus[11] < 0) {
                            DebugStatus[11] = 0;
                        }
                        break;
                    case 100:
                        if (DebugStatus[15] > 0) {
                            DebugStatus[15]--;
                        } else {
                            DebugStatus[15] = 16;
                        }
                        break;
                    case 130:
                        if (DebugStatus[18] > 0) {
                            DebugStatus[18] -= 10;
                        }
                        if (DebugStatus[18] < 0) {
                            DebugStatus[18] = 0;
                        }
                        break;
                }
            }
            if (GamePad.Down(8)) {
                switch (DebugInfoCode[DebugInfoNowCursor]) {
                    case 90:
                        DebugStatus[11] += 10;
                        break;
                    case 100:
                        if (DebugStatus[15] < 16) {
                            DebugStatus[15]++;
                        } else {
                            DebugStatus[15] = 0;
                        }
                        break;
                    case 130:
                        DebugStatus[18] += 10;
                        break;
                }
            }
            break;
    }
    return 0;
}

/**
 * Empties the list of key items waiting to be dropped.
 *
 * @mangled ClearGateKeyStack__Fv
 * @address 0x1B5640
 * @size 0x3C
 */
void ClearGateKeyStack(void) {
    for (int i = 0; i < 32; i++) {
        gateKeyStack[i] = -1;
    }
}

int SetGateKeyStack(int item) {
    if (item == -1) {
        return 0;
    }
    // One of a key item is enough, so a second is refused rather than stacked.
    for (int i = 0; i < 32; i++) {
        if (item == gateKeyStack[i]) {
            return 0;
        }
    }
    for (int i = 0; i < 32; i++) {
        if (gateKeyStack[i] == -1) {
            gateKeyStack[i] = item;
            return 1;
        }
    }
    return 0;
}

/**
 * Builds a resource path by putting one of the fixed prefixes before a name.
 *
 * @mangled NameExchg__FPci
 * @address 0x1B5740
 * @size 0x60
 */
char *NameExchg(char *name, int language) {
    strcpy(nameblock, LanguageStr[language][1]);
    strcat(nameblock, name);
    return nameblock;
}

int CCollisionData::Set(float *pos, int damage, int life, float radius, float unknown0, int unknown1,
                        int kind, int flags, int unknown2) {
    for (int i = 0; i < 96; i++) {
        if (active[i] == 0) {
            active[i] = 1;
            sceVu0CopyVector(hit[i].pos, pos);
            hit[i].unk_10[0] = hit[i].unk_10[1] = hit[i].unk_10[2] = 0.0f;
            hit[i].unk_10[3] = 1.0f;
            hit[i].velocity[0] = hit[i].velocity[1] = hit[i].velocity[2] = 0.0f;
            hit[i].velocity[0] = 1.0f;
            hit[i].damage = damage;
            hit[i].unk_38 = unknown0;
            hit[i].life = life;
            hit[i].radius = radius;
            hit[i].unk_48 = unknown1;
            hit[i].kind = kind;
            hit[i].flags = flags;
            hit[i].unk_54 = unknown2;
            hit[i].owner = -1;
            hit[i].monster_no = -1;
            hit[i].unk_60 = -1;
            hit[i].vs_monster = NULL;
            hit[i].weapon_flags = 1;
            hit[i].target_kind = -1;
            hit[i].knockback_origin[0] = hit[i].knockback_origin[1] = hit[i].knockback_origin[2] = 0.0f;
            hit[i].knockback_origin[3] = 1.0f;
            hit[i].knockback_speed = 0.0f;
            hit[i].knockback_decay = 0.0f;
            hit[i].knockback_mode = 0;
            hit[i].unk_70 = hit[i].unk_74 = 0;
            now_hit = i;
            return i;
        }
    }
    // With every record in use nothing is set and no index is returned.
}

/**
 * Reports which recorded hit reaches the player.
 *
 * @mangled CheckHitUser__14CCollisionDataFPfif
 * @address 0x1B5920
 * @size 0x1BC
 */
int CCollisionData::CheckHitUser(float *position, int mask, float height) {
    sceVu0FVECTOR user_position;
    sceVu0FVECTOR hit_position;
    sceVu0CopyVector(user_position, position);
    user_position[1] = 0.0f;
    float user_top;
    float user_bottom = position[1];
    user_top = user_bottom + height;
    for (int i = 0; i < 96; i++) {
        if (active[i] == 0 || (mask & hit[i].unk_48) == 0 || hit[i].unk_70 != hit[i].unk_74) {
            continue;
        }
        sceVu0CopyVector(hit_position, hit[i].pos);
        hit_position[1] = 0.0f;
        if (DistVector(user_position, hit_position) > hit[i].radius) {
            continue;
        }
        int miss = 1;
        float hit_top = hit[i].pos[1] + hit[i].radius;
        float hit_bottom = hit[i].pos[1] - hit[i].radius;
        if (!(hit_top < user_top) && hit_bottom < user_top) {
            miss = 0;
        }
        if (!(hit_top < user_bottom) && hit_bottom < user_bottom) {
            miss = 0;
        }
        if (hit_top <= user_top && !(hit_bottom <= user_bottom)) {
            miss = 0;
        }
        if (!(hit_top < user_top) && hit_bottom < user_bottom) {
            miss = 0;
        }
        if (miss == 0) {
            return i;
        }
    }
    return -1;
}

/**
 * Records the push a hit gives whatever it struck.
 *
 * @mangled SetKickBack__14CCollisionDataFPfffi
 * @address 0x1B5AE0
 * @size 0xA4
 */
void CCollisionData::SetKickBack(float *origin, float speed, float decay, int mode) {
    hit[now_hit].knockback_origin[0] = origin[0];
    hit[now_hit].knockback_origin[1] = origin[1];
    hit[now_hit].knockback_origin[2] = origin[2];
    hit[now_hit].knockback_speed = speed;
    hit[now_hit].knockback_decay = decay;
    hit[now_hit].knockback_mode = mode;
}
