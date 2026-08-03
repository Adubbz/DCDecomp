#pragma once

#include "common.h"

class CUserStatus {
public:
    /**
     * @mangled ChkEventFlag__11CUserStatusFi
     * @address 0x1BDAC0
     * @size 0x60
     */
    int ChkEventFlag(int flag_no);

    /**
     * @mangled ClearEventFlag__11CUserStatusFv
     * @address 0x1BDB20
     * @size 0x40
     */
    void ClearEventFlag(void);

    /**
     * @mangled AddDrink__11CUserStatusFisf
     * @address 0x1BE510
     * @size 0x200
     */
    void AddDrink(int chara_no, s16 amount, float ratio);

    /**
     * @mangled AddNowLife__11CUserStatusFisf
     * @address 0x1BE710
     * @size 0x180
     */
    void AddNowLife(int chara_no, s16 amount, float ratio);

    /**
     * @mangled CheckLife__11CUserStatusFv
     * @address 0x1BE890
     * @size 0x70
     */
    int CheckLife(void);

    /**
     * @mangled SetNextLife__11CUserStatusFisf
     * @address 0x1BE900
     * @size 0x150
     */
    void SetNextLife(int chara_no, s16 value, float ratio);

    /**
     * @mangled Step__11CUserStatusFi
     * @address 0x1BEA50
     * @size 0x390
     */
    void Step(int paused);

    /**
     * @mangled Init__11CUserStatusFv
     * @address 0x1BEDE0
     * @size 0x110
     */
    void Init(void);

private:
    /* CUserStatus is a second view over the same save-slot player-status blob
     * as CDngStatusData (include/dngstatusdata.hpp): every offset the methods
     * above touch coincides with a CDngStatusData field at the same offset
     * (cur_georama @0, max_hp @0x6, hp @0x12, the two float[6] gauges @0x42EC
     * /0x4304, res_limit_zone_current @0x8B10). Only the fields these eight
     * methods actually reach are named; the rest is filler sized to hold the
     * named ones at their confirmed offsets. Total sizeof is NOT confirmed --
     * nothing decompiled so far reads past 0x8B14. */
    s8 cur_georama;             // 0x0000
    char unk_01[3];             // 0x0001
    s8 cur_chara;               // 0x0004
    char unk_05[1];             // 0x0005
    s16 max_hp[6];              // 0x0006
    s16 hp[6];                  // 0x0012
    char unk_01E[0x42CE];       // 0x001E
    float water_max[6];         // 0x42EC
    float water_now[6];         // 0x4304
    char unk_431C[0x4740];      // 0x431C
    s16 next_hp[6];             // 0x8A5C
    s16 life_step[6];           // 0x8A68
    s32 unk_8A74[6];            // 0x8A74
    s32 unk_8A8C[6];            // 0x8A8C
    s8 event_flags[50];         // 0x8AA4
    s16 drink_next[6];          // 0x8AD6
    s16 drink_step[6];          // 0x8AE2
    char unk_8AEE[2];           // 0x8AEE
    float damage_accum[6];      // 0x8AF0
    s32 water_drain_disable;    // 0x8B08
    s32 step_disable;           // 0x8B0C
    s32 res_limit_zone_current; // 0x8B10
};
