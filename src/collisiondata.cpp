#include "collisiondata.hpp"

#ifdef NON_MATCHING
/** Key items waiting to be dropped, one entry each, -1 where a slot is free. */
static int gateKeyStack[32];
#endif

INCLUDE_ASM("asm/nonmatchings/collisiondata", DebugInfomationDraw__Fv);
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
INCLUDE_ASM("asm/nonmatchings/collisiondata", DebugInfomationInit__Fv);
/**
 * Moves through the debug overlay's pages with the pad.
 *
 * @mangled DebugInfomationIF__Fv
 * @address 0x1B47C0
 * @size 0xE78
 */
INCLUDE_ASM("asm/nonmatchings/collisiondata", DebugInfomationIF__Fv);
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
#ifdef NON_MATCHING
void ClearGateKeyStack(void) {
    for (int i = 0; i < 32; i++) {
        gateKeyStack[i] = -1;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/collisiondata", ClearGateKeyStack__Fv);
#endif
#ifdef NON_MATCHING
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
#else
INCLUDE_ASM("asm/nonmatchings/collisiondata", SetGateKeyStack__Fi);
#endif
/**
 * Builds a resource path by putting one of the fixed prefixes before a name.
 *
 * @mangled NameExchg__FPci
 * @address 0x1B5740
 * @size 0x60
 */
INCLUDE_ASM("asm/nonmatchings/collisiondata", NameExchg__FPci);

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
INCLUDE_ASM("asm/nonmatchings/collisiondata", CheckHitUser__14CCollisionDataFPfif);
/**
 * Records the push a hit gives whatever it struck.
 *
 * @mangled SetKickBack__14CCollisionDataFPfffi
 * @address 0x1B5AE0
 * @size 0xA4
 */
#ifdef NON_MATCHING
void CCollisionData::SetKickBack(float *origin, float speed, float decay, int mode) {
    hit[now_hit].knockback_origin[0] = origin[0];
    hit[now_hit].knockback_origin[1] = origin[1];
    hit[now_hit].knockback_origin[2] = origin[2];
    hit[now_hit].knockback_speed = speed;
    hit[now_hit].knockback_decay = decay;
    hit[now_hit].knockback_mode = mode;
}
#else
INCLUDE_ASM("asm/nonmatchings/collisiondata", SetKickBack__14CCollisionDataFPfffi);
#endif
