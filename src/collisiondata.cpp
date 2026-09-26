#include "collisiondata.hpp"

#include <cstdio>
#include <cstring>

#include "debugfont.hpp"
#include "dun/gameloop.hpp"
#include "dungeoneventman.hpp"
#include "dungeonmap.hpp"
#include "gamepad.hpp"
#include "snd.hpp"

extern "C" int DebugStatus[21];
extern "C" int DebugInfoCode[15];
extern "C" char *DebugInfoMsg[15];
extern "C" int DebugInfoNowCursor;
extern "C" CDebugFont DbgMsg;
extern "C" char nameblock[64];

/** The event manager of the floor the dungeon is running. */
extern CDungeonEventMan *NowEventMan;

/**
 * The Japanese and American image path prefixes. NameExchg reads it as rows
 * of two indexed by language and takes the second of the row, so language 0
 * gives the American prefix; retail sizes the table for the one row.
 */
extern "C" char *LanguageStr[1][2];

/** Key items waiting to be dropped, one entry each, -1 where a slot is free. */
extern "C" int gateKeyStack[32];

#ifdef NON_MATCHING
/**
 * Draws the dungeon debug overlay and its current menu selection.
 *
 * @mangled DebugInfomationDraw__Fv
 * @address 0x1B3780
 * @size 0xF70
 */
void DebugInfomationDraw(void) {
    if (DebugStatus[0] == 0) {
        return;
    }
    DbgMsg.len = sprintf(DbgMsg.text, "DEBUG INFORMATION\n");
    for (int i = 0; i < 15 && DebugInfoMsg[i] != NULL; i++) {
        DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], i == DebugInfoNowCursor ? ">>" : "  ");
        int code = DebugInfoCode[i];
        if (code == 10 || code == 20 || code == 30 || code == 50 || code == 70 || code == 110) {
            DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], DebugInfoMsg[i],
                                  DebugStatus[code / 10]);
        } else if (code == 100) {
            DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], DebugInfoMsg[i], DebugStatus[14],
                                  DebugStatus[15]);
        } else {
            DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], "%s", DebugInfoMsg[i]);
        }
        DbgMsg.len += sprintf(&DbgMsg.text[DbgMsg.len], "\n");
    }
    DbgMsg.Draw();
}
#else
INCLUDE_ASM("asm/nonmatchings/collisiondata", DebugInfomationDraw__Fv);
#endif

INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1542);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1543);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1545);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1546);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1548);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1549);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1550);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1551);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1552);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1553);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1555);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1556__2);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1557__2);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1615);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1616);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1617);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1618);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1619);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1620);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1621);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1622);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1623);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1624);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1625);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1626);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1627__3);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1628);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1629);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1630);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1631);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1632__2);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1633);

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

/** Empties every runtime event record of the event manager. */
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

/** Frees the floor's event places, treasure boxes, atla balls and room links. */
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
 * Moves the debug overlay's cursor with the pad and changes the setting under
 * it. Returns the code of an entry that closes the overlay, or 0.
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

INCLUDE_RODATA("asm/nonmatchings/collisiondata", @511);
INCLUDE_RODATA("asm/nonmatchings/collisiondata", @512);

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
