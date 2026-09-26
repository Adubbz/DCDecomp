#include "collisiondata.hpp"

#include <cstdio>
#include <cstring>

#include "debugfont.hpp"
#include "gamepad.hpp"
#include "snd.hpp"

extern "C" int DebugStatus[21];
extern "C" int DebugInfoCode[15];
extern "C" char *DebugInfoMsg[15];
extern "C" int DebugInfoNowCursor;
extern "C" CDebugFont DbgMsg;
extern "C" char nameblock[64];

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

#ifdef NON_MATCHING
/**
 * Moves through the debug overlay's pages with the pad.
 *
 * @mangled DebugInfomationIF__Fv
 * @address 0x1B47C0
 * @size 0xE78
 */
int DebugInfomationIF(void) {
    if (GamePad.Down(0x400) != 0) {
        DebugStatus[0] = 0;
        GamePad.AutoRepeatOff();
        GamePad.MenuModeOff();
        return 1;
    }
    int count = 0;
    while (count < 15 && DebugInfoCode[count] != -1) {
        count++;
    }
    if (count == 0) {
        return 0;
    }
    if (GamePad.Down(0x4000) != 0) {
        DebugInfoNowCursor = (DebugInfoNowCursor + 1) % count;
    }
    if (GamePad.Down(0x1000) != 0) {
        DebugInfoNowCursor--;
        if (DebugInfoNowCursor < 0) {
            DebugInfoNowCursor = count - 1;
        }
    }
    int code = DebugInfoCode[DebugInfoNowCursor];
    if (GamePad.Down(0x10) != 0 && code == 90) {
        DebugStatus[0] = 0;
        DebugStatus[12] = 1;
        GamePad.AutoRepeatOff();
        GamePad.MenuModeOff();
        return 40;
    }
    if (GamePad.Down(0x20) != 0) {
        if (code == 40 || code == 60 || code == 80 || code == 90 || code == 100 ||
            code == 120) {
            DebugStatus[0] = 0;
            GamePad.AutoRepeatOff();
            GamePad.MenuModeOff();
            return code;
        }
        if (code == 130) {
            SndSePlay(DebugStatus[18], -1, 0);
        }
    }
    if (GamePad.Down(0x2000) != 0) {
        switch (code) {
            case 10:
            case 20:
            case 30:
            case 50:
            case 70:
            case 110:
                DebugStatus[code / 10] = !DebugStatus[code / 10];
                break;
            case 100:
                DebugStatus[14] = (DebugStatus[14] + 1) % 5;
                break;
            case 120:
                DebugStatus[17] = (DebugStatus[17] + 1) % 6;
                break;
            case 130:
                DebugStatus[18]++;
                break;
            case 140:
                DebugStatus[19] = (DebugStatus[19] + 1) % 6;
                break;
            case 150:
                DebugStatus[20] = (DebugStatus[20] + 1) % 3;
                break;
        }
    }
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/collisiondata", DebugInfomationIF__Fv);
#endif

INCLUDE_RODATA("asm/nonmatchings/collisiondata", @1825);
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

#ifdef NON_MATCHING
/**
 * Reports which recorded hit reaches the player.
 *
 * @mangled CheckHitUser__14CCollisionDataFPfif
 * @address 0x1B5920
 * @size 0x1BC
 */
int CCollisionData::CheckHitUser(float *position, int mask, float height) {
    sceVu0FVECTOR user_position;
    sceVu0CopyVector(user_position, position);
    user_position[1] = 0.0f;
    float user_bottom = position[1];
    float user_top = user_bottom + height;
    for (int i = 0; i < 96; i++) {
        COLLISION_HIT *record = &hit[i];
        if (active[i] == 0 || (mask & record->unk_48) == 0 ||
            record->unk_70 != record->unk_74) {
            continue;
        }
        sceVu0FVECTOR hit_position;
        sceVu0CopyVector(hit_position, record->pos);
        hit_position[1] = 0.0f;
        if (DistVector(user_position, hit_position) > record->radius) {
            continue;
        }
        float hit_bottom = record->pos[1] - record->radius;
        float hit_top = record->pos[1] + record->radius;
        if ((user_top <= hit_top && hit_bottom < user_top) ||
            (user_bottom <= hit_top && hit_bottom < user_bottom) ||
            (hit_top <= user_top && user_bottom < hit_bottom) ||
            (user_top <= hit_top && hit_bottom < user_bottom)) {
            return i;
        }
    }
    return -1;
}
#else
INCLUDE_ASM("asm/nonmatchings/collisiondata", CheckHitUser__14CCollisionDataFPfif);
#endif

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
