#include "dngstatusdata.hpp"

#include "itemdata.hpp"
#include "userstatus.hpp"

/* CDngStatusData's and CUserStatus's methods are interleaved in retail
 * (SetNowFloor..SearchItemIndexNo, ChkEventFlag..ClearEventFlag, LostItem..
 * CheckDefaultWeapon, AddDrink..Init, SetDead..GetAtraData), so both classes
 * live in this one translation unit, in that order.
 *
 * TEMPORARY: four functions here are still retail's own instructions.
 * CUserStatus::AddDrink, AddNowLife, SetNextLife and Step differ from retail
 * in register allocation only -- correct size, addressing and branch
 * structure, but MWCC assigns the scaled-index and base temps to different
 * registers (3, 15, 13 and 68 instructions under mwcc 2.3.3). See
 * docs/RE/dngstatusdata.md and docs/RE/mwcc_register_allocator.md.
 *
 * Elsewhere such a function is left to its own .s object, which cannot work
 * here: retail interleaves these four with functions that do match (CheckLife
 * sits between AddNowLife and SetNextLife), and MWCC emits a TU's functions as
 * one contiguous .text, so a hole cannot be filled from outside without moving
 * everything after it. So each keeps its place with retail's own instructions
 * as an `asm` body, generated into build/generated/asm (see CMakeLists.txt).
 * The C++ that does not match sits beside it under `#if DNG_COMPILE_UNMATCHED`,
 * which is off.
 *
 * To retire one: make its C++ match, then delete its guard, the `asm` body and
 * its name from ASM_BODY_FUNCS in CMakeLists.txt. */

#include <cstdio>
#include <cstdlib>

/* Named only so the `asm` bodies at the bottom of this file can branch to
 * them. `fptosi` is MWCC's float-to-int helper, which the compiler calls by
 * itself from ordinary C++; the second is this file's own
 * CUserStatus::AddNowLife, spelled the way it is mangled because an asm body
 * resolves names through the assembler, not through C++ lookup. Both go when
 * the four unmatched functions do. */
extern "C" void fptosi(void);
extern "C" void AddNowLife__11CUserStatusFisf(void);

extern "C" int ItemDataToHaveCopy__Fi(int item_id);
struct ATTACH_LIST;
extern "C" void SetAttachMentValue__FiisP11ATTACH_LIST(int item_id, int slot, s16 qty, ATTACH_LIST *attach);
extern "C" void WepDataListToHaveCopy__FiP11WEAPON_HAVE(int item_id, WEAPON_HAVE *out);

/* The weapon the player currently has equipped; its `flags` field carries the
 * two water-drain modifiers CUserStatus::Step applies. */
extern "C" WEAPON_HAVE *NowWeaponHave;

/* Default weapon id per character (weapon ids are >= 257; see CheckWeaponUser). */
extern "C" s32 defWeapon__3[];

/* Per-item-id character-ownership table used by GetItem to auto-route weapon
 * pickups to the owning character's weapon slots. Accessed with a 19-word
 * (76-byte) stride per item id; byte 2 of word index 57 within that stride
 * holds the owning character index. The table starts at retail address
 * 0x275998, which falls +0x208 into the labelled symbol ItemPutListTbl12 @
 * 0x275790 in ref/asm/sections/main/main.data.s -- no standalone label exists
 * at 0x275998 itself, so the extra offset is folded into the index
 * expression. */
extern "C" s8 ItemPutListTbl12[];

/* Three 24-byte (6 x s32) per-character tables read by Initialize, labelled in
 * ref/asm/sections/main/main.data.s. LIT_781 holds the six weapon-id range
 * boundaries CheckWeaponUser uses; retail copies it to the stack and never
 * reads it (a dead copy that must be reproduced). LIT_782 holds per-character
 * starting HP, read as the low 16 bits of each slot. LIT_783__2 holds a second
 * per-character s32 stat of unconfirmed meaning. */
struct StatTable6 {
    s32 v[6];
};
extern "C" StatTable6 LIT_781;
extern "C" StatTable6 LIT_782;
extern "C" StatTable6 LIT_783__2;

static inline int GetMaxDungeonItems() {
    return 100;
}

/* Number of atra_grid slots per floor (atra_grid[georama][floor][0..8)). */
static inline int GetMaxAtraSlotNo() {
    return 8;
}

/* @ 0x1BD900 (0x40 bytes) -- SetNowFloor__14CDngStatusDataFi */
void CDngStatusData::SetNowFloor(int floor) {

    this->prev_floor = this->cur_floor;
    this->cur_floor  = floor;

    int cur_georama   = this->cur_georama;
    s8 *base          = this->floor_reached;
    s8 *floor_reached = base + cur_georama;
    if (floor > *floor_reached) {
        *floor_reached = floor;
    }
}

/* Item-id ranges are semantic: [132,257)=dungeon items (quick-slots + 103-slot
 * inventory), [81,132)=consumables (43-slot array, only first 40 searched
 * here), [257,+)=weapons (per-character 11-slot equipment, only first 10 of
 * 11 slots searched here). */
/* @ 0x1BD940 (0x180 bytes) -- SearchItemIndexNo__14CDngStatusDataFi */
int CDngStatusData::SearchItemIndexNo(int item_id) {
    int i;
    int valid;

    if (!(valid = item_id < 132) && item_id < 257) {
        for (i = 0; (valid = i < 3) != 0; i++) {
            if (this->quick_item_slot[i] == item_id) {
                return i;
            }
        }
    }

    if (!(valid = item_id <= 131) && item_id < 257) {
        for (i = 0; (valid = i < this->item_capacity) != 0; i++) {
            if (this->dungeon_items[i] == item_id) {
                return i;
            }
        }
    }

    if (!(valid = item_id < 81) && item_id < 132) {
        for (i = 0; (valid = i < 40) != 0; i++) {
            if (this->consumable_items[i].id == item_id) {
                return i;
            }
        }
    }

    if (!(valid = item_id < 257)) {
        int j;
        for (j = 0; (valid = j < this->party_size) != 0; j++) {
            for (i = 0; (valid = i < 10) != 0; i++) {
                if (this->chara_weapons[j][i].id == item_id) {
                    return i;
                }
            }
        }
    }

    return -1;
}

/* Reads one of the 50 story event flags. The range guard is `&&` in retail,
 * not `||` -- both halves can never hold at once, so it never fires and the
 * out-of-range read it was meant to stop happens anyway. Reproduced as
 * written; that dead guard is also why nobody noticed its bound is 51, one
 * past the 50 flags ClearEventFlag actually clears. */
/* @ 0x1BDAC0 (0x60 bytes) -- ChkEventFlag__11CUserStatusFi */
int CUserStatus::ChkEventFlag(int flag_no) {
    if (flag_no < 0 && flag_no > 50) {
        printf("err flag\n");
        return 0;
    }

    return this->event_flags[flag_no];
}

/* @ 0x1BDB20 (0x40 bytes) -- ClearEventFlag__11CUserStatusFv */
void CUserStatus::ClearEventFlag(void) {
    int i;
    int valid;

    for (i = 0; (valid = i < 50) != 0; i++) {
        this->event_flags[i] = 0;
    }
}

/* @ 0x1BDB60 (0x60 bytes) -- LostItem__14CDngStatusDataFi */
int CDngStatusData::LostItem(int item_id) {
    int i;
    int valid;

    for (i = 0; (valid = i < 103) != 0; i++) {
        if (this->dungeon_items[i] == item_id) {
            this->dungeon_items[i] = -1;
            this->item_vol[i]      = 0;
            return i;
        }
    }

    return -1;
}

/* @ 0x1BDBC0 (0x130 bytes) -- LostGateKey__14CDngStatusDataFv */
void CDngStatusData::LostGateKey(void) {
    int i;
    int valid;

    for (i = 0; (valid = i < 103) != 0; i++) {
        if (this->dungeon_items[i] == 195) {
            this->dungeon_items[i] = -1;
        }
        if (this->dungeon_items[i] == 196) {
            this->dungeon_items[i] = -1;
        }
        if (this->dungeon_items[i] == 198) {
            this->dungeon_items[i] = -1;
        }
        if (this->dungeon_items[i] == 201) {
            this->dungeon_items[i] = -1;
        }
        if (this->dungeon_items[i] == 202) {
            this->dungeon_items[i] = -1;
        }
        if (this->dungeon_items[i] == 203) {
            this->dungeon_items[i] = -1;
        }
        if (this->dungeon_items[i] == 204) {
            this->dungeon_items[i] = -1;
        }
        if (this->dungeon_items[i] == 205) {
            this->dungeon_items[i] = -1;
        }
        if (this->dungeon_items[i] == 206) {
            this->dungeon_items[i] = -1;
        }
        if (!(valid = this->dungeon_items[i] < 216) && this->dungeon_items[i] < 223) {
            this->dungeon_items[i] = -1;
        }
    }
}

/* @ 0x1BDCF0 (0x50 bytes) -- GetLiveUnit__14CDngStatusDataFv */
int CDngStatusData::GetLiveUnit(void) {
    int result = 0;
    int i;
    int valid;

    for (i = 0; (valid = i < this->party_size) != 0; i++) {
        if (this->hp[i] > 0) {
            result++;
        }
    }

    return result;
}

/* @ 0x1BDD40 (0x190 bytes) -- CheckItemGet__14CDngStatusDataFi */
int CDngStatusData::CheckItemGet(int item_id) {
    int result = 0;

    if ((u32) (item_id - 233) <= 1 || item_id == 238) {
        return 0;
    }

    {
        int valid;
        int i;
        if (!(valid = item_id < GetDungeonItemStart()) && item_id < GetDungeonItemEnd()) {
            int count = 0;
            int k;

            for (i = 0; (valid = i < GetMaxDungeonItems()) != 0; i++) {
                if (!(valid = this->dungeon_items[i] < 132) && this->dungeon_items[i] < 257) {
                    count++;
                }
            }

            for (k = 0; (valid = k < 3) != 0; k++) {
                if (this->quick_item_slot[k] != -1) {
                    count += this->quick_item_qty[k];
                }
            }

            if (count < this->item_capacity) {
                result = 0;
            } else {
                return 1;
            }
        }

        if (!(valid = item_id < 81) && item_id < 132) {
            int count = 0;
            int j;

            for (j = 0; (valid = j < 40) != 0; j++) {
                s16 v = this->consumable_items[j].id;
                if (!(valid = v < 81) && v < 132) {
                    count++;
                }
            }

            /* Retail assigns `result` here rather than returning it, so the
             * two-constant tail stays a real branch instead of collapsing to
             * a movn/movz conditional move. */
            if (count < 40) {
                result = 0;
            } else {
                return 2;
            }
        }
    }

    return result;
}

/* @ 0x1BDED0 (0xC0 bytes) -- CheckWeaponUser__14CDngStatusDataFi */
int CDngStatusData::CheckWeaponUser(int weapon_id) {
    int result = -1;
    int valid;

    if (!(valid = weapon_id < 257) && weapon_id < 299) {
        result = 0;
    }
    if (!(valid = weapon_id < 299) && weapon_id < 314) {
        result = 1;
    }
    if (!(valid = weapon_id < 314) && weapon_id < 331) {
        result = 2;
    }
    if (!(valid = weapon_id < 331) && weapon_id < 347) {
        result = 3;
    }
    if (!(valid = weapon_id < 347) && weapon_id < 363) {
        result = 4;
    }
    if (!(valid = weapon_id < 363) && weapon_id < 377) {
        result = 5;
    }

    return result;
}

/* @ 0x1BDF90 (0xC0 bytes) -- CheckWeaponRot__14CDngStatusDataFi */
int CDngStatusData::CheckWeaponRot(int weapon_id) {
    int chara_no = this->CheckWeaponUser(weapon_id);
    if (chara_no == -1) {
        return -1;
    }

    /* Retail places this early-out physically LAST (right before the
     * epilogue, falling through with no extra jump) rather than as an
     * early return -- the loop's "return count" path is emitted first.
     * The goto reproduces that exact block layout/branch-threading. */
    int valid;
    if ((valid = weapon_id < 257) != 0) {
        goto ret_minus1;
    }

    {
        int count = 0;
        int i;
        for (i = 0; (valid = i < 10) != 0; i++) {
            if (!(valid = this->chara_weapons[chara_no][i].id < 257)) {
                count++;
            }
        }
        return count;
    }

ret_minus1:
    return -1;
}

/* Index 6 is the bonus "Deamon Shaft" dungeon (0-5 are the six story
 * georama dungeons). */
/* @ 0x1BE050 (0x10 bytes) -- ClearDeamonShaft__14CDngStatusDataFv */
void CDngStatusData::ClearDeamonShaft(void) {
    this->floor_reached[6] = -1;
}

/* Routes by the same id ranges as SearchItemIndexNo. Dungeon items (103-slot
 * array) and consumables (43-slot array) are both sized capacity+3 to allow
 * temporary overflow before overflow_flag is latched. Weapons are auto-routed
 * to their owning character via the per-item ownership table (see
 * ItemPutListTbl12 above), not the id-range heuristic CheckWeaponUser uses. */
/* @ 0x1BE060 (0x400 bytes) -- GetItem__14CDngStatusDataFii */
int CDngStatusData::GetItem(int item_id, int qty) {
    int valid;

    printf("GetITEM No === %d\n", item_id);

    if (!(valid = item_id < 132) && item_id < 257) {
        int i;
        for (i = 0; (valid = i < 103) != 0; i++) {
            if (this->dungeon_items[i] < 132) {
                if (item_id == 238) {
                    this->special_flag_238 = 1;
                    return 0;
                }

                int count = 0;
                int j;
                for (j = 0; (valid = j < 103) != 0; j++) {
                    if (!(valid = this->dungeon_items[j] < 132)) {
                        count++;
                    }
                }
                int k;
                for (k = 0; (valid = k < 3) != 0; k++) {
                    if (this->quick_item_slot[k] != -1) {
                        count += this->quick_item_qty[k];
                    }
                }

                if (count + 1 > this->item_capacity) {
                    this->overflow_flag = 1;
                }

                int have_copy = ItemDataToHaveCopy__Fi(item_id);
                if (this->overflow_flag != 0) {
                    int m;
                    for (m = 0; (valid = m < 3) != 0; m++) {
                        if (this->dungeon_items[this->item_capacity + m] == -1) {
                            this->dungeon_items[this->item_capacity + m] = item_id;
                            this->item_vol[this->item_capacity + m]      = have_copy;
                            return i;
                        }
                    }
                } else {
                    this->dungeon_items[i] = item_id;
                    this->item_vol[i]      = have_copy;
                }
                return i;
            }
        }
    }

    if (!(valid = item_id < 81) && item_id < 132) {
        int n;
        for (n = 0; (valid = n < 43) != 0; n++) {
            if (this->consumable_items[n].id < 81) {
                this->consumable_items[n].id = item_id;
                SetAttachMentValue__FiisP11ATTACH_LIST(item_id, n, qty, (ATTACH_LIST *) 0);

                int count = 0;
                int ii;
                for (ii = 0; (valid = ii < 43) != 0; ii++) {
                    s16 v = this->consumable_items[ii].id;
                    if (!(valid = v < 81) && v < 132) {
                        count++;
                    }
                }
                if (count > 40) {
                    this->overflow_flag++;
                }
                return n;
            }
        }
    }

    if (!(valid = item_id < 257)) {
        printf("get weapon!! %d\n", item_id);
        int chara_no = ItemPutListTbl12[750 + item_id * 76];

        int jj;
        for (jj = 0; (valid = jj < 11) != 0; jj++) {
            if (this->chara_weapons[chara_no][jj].id < 257) {
                WepDataListToHaveCopy__FiP11WEAPON_HAVE(item_id, &this->chara_weapons[chara_no][jj]);

                int count = 0;
                int kk;
                for (kk = 0; (valid = kk < 10) != 0; kk++) {
                    if (!(valid = this->chara_weapons[chara_no][kk].id < 257)) {
                        count++;
                    }
                }
                if (!(valid = count < 10)) {
                    this->overflow_flag = 1;
                }
                return jj;
            }
        }
    }

    return -1;
}

/* @ 0x1BE460 (0x50 bytes) -- CheckActItemSlot__14CDngStatusDataFi */
int CDngStatusData::CheckActItemSlot(int item_id) {
    int i;
    int valid;

    for (i = 0; (valid = i < 3) != 0; i++) {
        if (this->quick_item_slot[i] == item_id) {
            return i;
        }
    }

    return -1;
}

/* True if the character's currently-equipped weapon slot doesn't hold their
 * canonical default weapon (defWeapon__3[chara_no]). */
/* @ 0x1BE4B0 (0x60 bytes) -- CheckDefaultWeapon__14CDngStatusDataFi */
int CDngStatusData::CheckDefaultWeapon(int chara_no) {
    s32 def_weapon = defWeapon__3[chara_no];
    if (def_weapon == this->chara_weapons[chara_no][this->equipped_weapon_slot[chara_no]].id) {
        return 0;
    }
    return 1;
}

#if DNG_COMPILE_UNMATCHED
/* Adds to a character's water gauge. With ratio == 0 the gauge moves
 * instantly; otherwise the target is latched into drink_next[] and
 * drink_step[] holds the per-frame delta CUserStatus::Step applies, signed so
 * that a zero-rounding step still moves the gauge one unit in the right
 * direction. */
/* @ 0x1BE510 (0x200 bytes) -- AddDrink__11CUserStatusFisf */
void CUserStatus::AddDrink(int chara_no, s16 amount, float ratio) {
    if (this->drink_step[chara_no] != 0) {
        this->water_now[chara_no]  = (float) this->drink_next[chara_no];
        this->drink_step[chara_no] = 0;
    }

    if (0.0f == ratio) {
        this->water_now[chara_no] = this->water_now[chara_no] + (float) amount;
        if (this->water_now[chara_no] >= this->water_max[chara_no]) {
            this->water_now[chara_no] = this->water_max[chara_no];
        }
    } else {
        this->drink_next[chara_no] = this->water_now[chara_no] + (float) amount;
        if (this->drink_next[chara_no] <= 0) {
            this->drink_next[chara_no] = 0;
        }
        if ((float) this->drink_next[chara_no] >= this->water_max[chara_no]) {
            this->drink_next[chara_no] = this->water_max[chara_no];
        }

        this->drink_step[chara_no] = ratio * (((float) this->drink_next[chara_no] - this->water_now[chara_no]) / 100.0f);
        if (this->drink_step[chara_no] == 0) {
            if ((float) this->drink_next[chara_no] - this->water_now[chara_no] < 0.0f) {
                this->drink_step[chara_no] = -1;
            } else {
                this->drink_step[chara_no] = 1;
            }
        }
    }
}
#else
/* Retail's own instructions, so this keeps its place in this translation
 * unit while the C++ above does not match yet. Generated into
 * build/generated/asm by scripts/build/gen_asm_body.py; see CMakeLists.txt,
 * "Retail instructions as asm bodies". */
asm void CUserStatus::AddDrink(int chara_no, s16 amount, float ratio) {
#include "AddDrink__11CUserStatusFisf.inc"
}
#endif /* DNG_COMPILE_UNMATCHED */

#if DNG_COMPILE_UNMATCHED
/* Same instant/interpolated split as AddDrink, for HP. */
/* @ 0x1BE710 (0x180 bytes) -- AddNowLife__11CUserStatusFisf */
void CUserStatus::AddNowLife(int chara_no, s16 amount, float ratio) {
    int valid;

    if (this->life_step[chara_no] != 0) {
        this->hp[chara_no]        = this->next_hp[chara_no];
        this->life_step[chara_no] = 0;
    }

    if (0.0f == ratio) {
        this->hp[chara_no] = this->hp[chara_no] + amount;
        if (this->hp[chara_no] <= 0) {
            this->hp[chara_no] = 0;
        }
        {
            s16 cur = this->hp[chara_no];
            if (!(valid = cur < this->max_hp[chara_no])) {
                this->hp[chara_no] = this->max_hp[chara_no];
            }
        }
    } else {
        this->next_hp[chara_no] = this->hp[chara_no] + amount;
        if (this->next_hp[chara_no] <= 0) {
            this->next_hp[chara_no] = 0;
        }
        {
            s16 cur = this->next_hp[chara_no];
            if (!(valid = cur < this->max_hp[chara_no])) {
                this->next_hp[chara_no] = this->max_hp[chara_no];
            }
        }

        this->life_step[chara_no] = ratio * ((float) (this->next_hp[chara_no] - this->hp[chara_no]) / 100.0f);
        if (this->life_step[chara_no] == 0) {
            if (this->next_hp[chara_no] - this->hp[chara_no] < 0) {
                this->life_step[chara_no] = -1;
            } else {
                this->life_step[chara_no] = 1;
            }
        }
    }
}
#else
/* Retail's own instructions, so these keep their place in this
 * translation unit while the C++ above does not match yet. Generated
 * into build/generated/asm by scripts/build/gen_asm_body.py; see
 * CMakeLists.txt, "Retail instructions as asm bodies". */
asm void CUserStatus::AddNowLife(int chara_no, s16 amount, float ratio) {
#include "AddNowLife__11CUserStatusFisf.inc"
}
#endif /* DNG_COMPILE_UNMATCHED */

/* Alive iff the active character has HP left -- and, while an interpolated HP
 * change is in flight, iff its target is above zero too. */
/* @ 0x1BE890 (0x70 bytes) -- CheckLife__11CUserStatusFv */
int CUserStatus::CheckLife(void) {
    if (this->life_step[this->cur_chara] != 0 && this->next_hp[this->cur_chara] <= 0) {
        return 0;
    }
    if (this->hp[this->cur_chara] <= 0) {
        return 0;
    }

    return 1;
}

#if DNG_COMPILE_UNMATCHED
/* Sets an absolute HP target (clamped to 0..max_hp), instantly or
 * interpolated, per the same rules as AddNowLife. */
/* @ 0x1BE900 (0x150 bytes) -- SetNextLife__11CUserStatusFisf */
void CUserStatus::SetNextLife(int chara_no, s16 value, float ratio) {
    int valid;

    if (this->life_step[chara_no] != 0) {
        this->hp[chara_no]        = this->next_hp[chara_no];
        this->life_step[chara_no] = 0;
    }

    if ((int) value <= 0) {
        value = 0;
    }
    if (!(valid = (int) value < (int) this->max_hp[chara_no])) {
        value = this->max_hp[chara_no];
    }

    if (0.0f == ratio) {
        this->hp[chara_no] = value;
    } else {
        this->next_hp[chara_no] = value;

        this->life_step[chara_no] = ratio * ((float) (this->next_hp[chara_no] - this->hp[chara_no]) / 100.0f);
        if (this->life_step[chara_no] == 0) {
            if (this->next_hp[chara_no] - this->hp[chara_no] < 0) {
                this->life_step[chara_no] = -1;
            } else {
                this->life_step[chara_no] = 1;
            }
        }
    }
}

/* Per-frame update: drains the active character's water gauge at a rate that
 * scales with dungeon depth (and is multiplied by the level-11 restriction
 * zone and by two equipped-weapon flags), costs 1 HP per 120 frames once the
 * gauge is empty, then advances every character's in-flight water and HP
 * interpolations by one step. */
/* @ 0x1BEA50 (0x390 bytes) -- Step__11CUserStatusFi */
void CUserStatus::Step(int paused) {
    if (this->step_disable != 0) {
        return;
    }

    float rate = 1.0f + 0.2f * (float) this->cur_georama;
    rate       = 0.003f * rate;

    if (this->water_drain_disable == 0 && paused == 0) {
        if (this->water_now[this->cur_chara] <= 0.0f) {
            this->water_now[this->cur_chara] = 0.0f;
        } else {
            if (this->res_limit_zone_current == 11) {
                rate = 5.0f * rate;
            }

            int weapon_flags = NowWeaponHave->flags;
            if ((weapon_flags & 8) != 0) {
                rate *= 0.8f;
            }
            if ((weapon_flags & 0x10) != 0) {
                rate *= 2.0f;
            }

            if (paused == 0) {
                this->water_now[this->cur_chara] -= rate;
            }
            if (this->water_now[this->cur_chara] <= 0.0f) {
                this->water_now[this->cur_chara] = 0.0f;
            }
        }

        if (this->water_now[this->cur_chara] <= 0.0f) {
            this->damage_accum[this->cur_chara] += 0.008333334f;
        }

        if (this->damage_accum[this->cur_chara] >= 1.0f) {
            this->damage_accum[this->cur_chara] = 0.0f;
            this->AddNowLife(this->cur_chara, -1, 10.0f);
        }
    }

    int i;
    int valid;

    for (i = 0; (valid = i < 6) != 0; i++) {
        if (this->drink_step[i] != 0) {
            this->water_now[i] = this->water_now[i] + (float) this->drink_step[i];

            if (this->drink_step[i] < 0) {
                if (this->water_now[i] <= (float) this->drink_next[i]) {
                    this->water_now[i]  = (float) this->drink_next[i];
                    this->drink_step[i] = 0;
                }
            }
            if (this->drink_step[i] > 0) {
                if (this->water_now[i] >= (float) this->drink_next[i]) {
                    this->water_now[i]  = (float) this->drink_next[i];
                    this->drink_step[i] = 0;
                }
            }
        }
    }

    for (i = 0; (valid = i < 6) != 0; i++) {
        if (this->life_step[i] != 0) {
            this->hp[i] = this->hp[i] + this->life_step[i];

            if (this->life_step[i] < 0) {
                if (this->hp[i] <= this->next_hp[i]) {
                    this->hp[i]        = this->next_hp[i];
                    this->life_step[i] = 0;
                }
            }
            if (this->life_step[i] > 0) {
                if (this->hp[i] >= this->next_hp[i]) {
                    this->hp[i]        = this->next_hp[i];
                    this->life_step[i] = 0;
                }
            }
        }
    }
}
#else
/* Retail's own instructions, so these keep their place in this
 * translation unit while the C++ above does not match yet. Generated
 * into build/generated/asm by scripts/build/gen_asm_body.py; see
 * CMakeLists.txt, "Retail instructions as asm bodies". */
asm void CUserStatus::SetNextLife(int chara_no, s16 value, float ratio) {
#include "SetNextLife__11CUserStatusFisf.inc"
}

asm void CUserStatus::Step(int paused) {
#include "Step__11CUserStatusFi.inc"
}
#endif /* DNG_COMPILE_UNMATCHED */

/* @ 0x1BEDE0 (0x110 bytes) -- Init__11CUserStatusFv */
void CUserStatus::Init(void) {
    int i;
    int valid;

    for (i = 0; (valid = i < 6) != 0; i++) {
        this->damage_accum[i] = 0.0f;
    }

    this->water_drain_disable    = 0;
    this->step_disable           = 0;
    this->res_limit_zone_current = -1;

    this->ClearEventFlag();

    int j;
    for (j = 0; (valid = j < 6) != 0; j++) {
        this->life_step[j] = 0;
    }

    for (j = 0; (valid = j < 6) != 0; j++) {
        this->unk_8A8C[j]   = 0;
        this->unk_8A74[j]   = 0;
        this->drink_step[j] = 0;
    }
}

/* Right-shifts dead_mask by 1 - a party-order bitmask being collapsed when
 * the lead character dies/is removed, rather than a specific bit cleared. */
/* @ 0x1BEEF0 (0x20 bytes) -- SetDead__14CDngStatusDataFv */
void CDngStatusData::SetDead(void) {
    this->dead_mask = (u32) (u16) this->dead_mask >> 1;
}

/* Looks up the current floor's "Res Limit Zone" id and latches it into
 * res_limit_zone_current if the floor has one assigned. */
/* @ 0x1BEF10 (0x50 bytes) -- SetResLimmitZone__14CDngStatusDataFv */
void CDngStatusData::SetResLimmitZone(void) {
    int zone = this->res_limit_zone_id[this->cur_georama][this->cur_floor];
    if (zone != -1) {
        this->res_limit_zone_current = zone;
    }
}

/* Randomly (~50/50) assigns level-10 or level-11 restriction zones to 3-4
 * random floors per georama (georamas 1-5 only; georama 0 untouched). The
 * float divisor is RAND_MAX+1 (2^31), i.e. rand()/(RAND_MAX+1) scaled by the
 * floor count / 100 to pick a floor index / percentile roll.
 *
 * Each branch of the zone-level choice also writes `valid`; that dead store
 * is what keeps retail's real branch instead of a movn/movz conditional move,
 * and it forces the roll comparison into a real register rather than `at`. */
/* @ 0x1BEF60 (0x3E0 bytes) -- InitResLimmitZone__14CDngStatusDataFv */
void CDngStatusData::InitResLimmitZone(void) {
    int idx;
    int roll;
    int i;
    int valid;

    for (i = 0; (valid = i < 3) != 0; i++) {
        int zone;
        idx  = (int) ((15.0f * (float) rand()) / 2147483648.0f);
        roll = (int) ((100.0f * (float) rand()) / 2147483648.0f);
        if (!(valid = roll < 50)) {
            zone  = 10;
            valid = 0;
        } else {
            zone  = 11;
            valid = 1;
        }
        this->res_limit_zone_id[1][idx] = zone;
    }

    for (i = 0; (valid = i < 3) != 0; i++) {
        int zone;
        idx  = (int) ((16.0f * (float) rand()) / 2147483648.0f);
        roll = (int) ((100.0f * (float) rand()) / 2147483648.0f);
        if (!(valid = roll < 50)) {
            zone  = 10;
            valid = 0;
        } else {
            zone  = 11;
            valid = 1;
        }
        this->res_limit_zone_id[2][idx] = zone;
    }

    for (i = 0; (valid = i < 3) != 0; i++) {
        int zone;
        idx  = (int) ((16.0f * (float) rand()) / 2147483648.0f);
        roll = (int) ((100.0f * (float) rand()) / 2147483648.0f);
        if (!(valid = roll < 50)) {
            zone  = 10;
            valid = 0;
        } else {
            zone  = 11;
            valid = 1;
        }
        this->res_limit_zone_id[3][idx] = zone;
    }

    for (i = 0; (valid = i < 4) != 0; i++) {
        int zone;
        idx  = (int) ((14.0f * (float) rand()) / 2147483648.0f);
        roll = (int) ((100.0f * (float) rand()) / 2147483648.0f);
        if (!(valid = roll < 50)) {
            zone  = 10;
            valid = 0;
        } else {
            zone  = 11;
            valid = 1;
        }
        this->res_limit_zone_id[4][idx] = zone;
    }

    for (i = 0; (valid = i < 4) != 0; i++) {
        int zone;
        idx  = (int) ((23.0f * (float) rand()) / 2147483648.0f);
        roll = (int) ((100.0f * (float) rand()) / 2147483648.0f);
        if (!(valid = roll < 50)) {
            zone  = 10;
            valid = 0;
        } else {
            zone  = 11;
            valid = 1;
        }
        this->res_limit_zone_id[5][idx] = zone;
    }
}

/* The five inventory fields at 0x4360..0x450A form one contiguous block that
 * Initialize's final loop addresses through a single base pointer, with the
 * two arrays reached by small (+14/+220) displacements off it rather than
 * their full struct offsets. Reproducing retail's instruction order needs the
 * base to be struct-typed: subscripting through it yields MWCC's index-first
 * `addu index, base`, whereas the equivalent raw `s8 *` plus casts yields
 * base-first. */
struct DNG_ITEM_BLOCK {
    s8 item_capacity;
    char unk_01;
    s16 quick_item_slot[3];
    s16 quick_item_qty[3];
    s16 dungeon_items[103];
    s16 item_vol[103];
};

/* Resets the whole class to a fresh-game state: party HP/weapons/atra grid/
 * kills/restriction zones/inventory all cleared, then character 0 is given
 * the starting weapon (item 258) via GetItem. */
/* @ 0x1BF340 (0x3C0 bytes) -- Initialize__14CDngStatusDataFv */
void CDngStatusData::Initialize(void) {
    this->cur_georama = -1;
    this->unk_01      = 0;
    this->cur_floor   = -1;
    this->prev_floor  = -1;
    this->unk_04      = 0;
    this->party_size  = 1;

    StatTable6 local1 = LIT_781;
    StatTable6 local2 = LIT_782;
    StatTable6 local3 = LIT_783__2;

    int t;
    int q;
    int k;
    int m;
    int j;
    int i;
    int valid;

    for (t = 0; (valid = t < 6) != 0; t++) {
        this->max_hp[t]               = local2.v[t];
        this->hp[t]                   = local2.v[t];
        this->unk_field_1[t]          = local3.v[t];
        this->unk_field_4468[t]       = 0;
        this->unk_field_2[t]          = 0;
        this->equipped_weapon_slot[t] = -1;

        for (q = 0; (valid = q < 11) != 0; q++) {
            this->chara_weapons[t][q].id = -1;
        }

        this->stat_float_a[t] = 30.0f;
        this->stat_float_b[t] = 30.0f;
        this->unk_field_3[t]  = 0;
    }

    this->equipped_weapon_slot[0] = 0;
    this->GetItem(258, 0);
    this->special_flag_238 = 0;
    this->config_mirror    = 1;
    this->overflow_flag    = 0;

    for (k = 0; (valid = k < 7) != 0; k++) {
        this->floor_reached[k] = -1;
    }

    for (m = 0; (valid = m < 6) != 0; m++) {
        for (k = 0; (valid = k < 100) != 0; k++) {
            this->kills[m][k] = 0;
        }
    }

    for (t = 0; (valid = t < 6) != 0; t++) {
        for (k = 0; (valid = k < 25) != 0; k++) {
            this->res_limit_zone_id[t][k] = -1;
        }
    }

    this->InitResLimmitZone();

    for (t = 0; (valid = t < 6) != 0; t++) {
        for (k = 0; (valid = k < 40) != 0; k++) {
            for (j = 0; (valid = j < 8) != 0; j++) {
                this->atra_grid[t][k][j] = -1;
            }
        }
    }

    for (m = 0; (valid = m < 6) != 0; m++) {
        for (q = 0; (valid = q < 100) != 0; q++) {
            this->atra_registry[m][q].id = -1;
        }
    }

    this->dead_mask            = 0;
    DNG_ITEM_BLOCK *item_block = (DNG_ITEM_BLOCK *) &this->item_capacity;
    this->item_capacity        = 50;
    this->quick_item_slot[0]   = -1;
    this->quick_item_slot[1]   = -1;
    this->quick_item_slot[2]   = -1;

    for (t = 0; (valid = t < 103) != 0; t++) {
        item_block->dungeon_items[t] = -1;
        item_block->item_vol[t]      = 0;
    }

    for (i = 0; (valid = i < 43) != 0; i++) {
        this->consumable_items[i].id = -1;
    }
}

/* Per-(georama, floor) monster kill counter, indexed by the CURRENT
 * georama/floor for AddKills but by explicit params for ChkKills. */
/* @ 0x1BF700 (0x40 bytes) -- AddKills__14CDngStatusDataFv */
void CDngStatusData::AddKills(void) {
    this->kills[this->cur_georama][this->cur_floor]++;
}

/* @ 0x1BF740 (0x30 bytes) -- ChkKills__14CDngStatusDataFii */
s16 CDngStatusData::ChkKills(int georama_no, int floor) {
    return this->kills[georama_no][floor];
}

/* Counts already-collected (-3) atra slots on a floor. Returns 0 for
 * georama_no == 6. */
/* @ 0x1BF770 (0x80 bytes) -- GetAtraNum__14CDngStatusDataFii */
int CDngStatusData::GetAtraNum(int georama_no, int floor) {
    if (georama_no == 6) {
        return 0;
    }

    int result = 0;
    int i;
    int valid;
    for (i = 0; (valid = i < 8) != 0; i++) {
        if (this->atra_grid[georama_no][floor][i] == -3) {
            result++;
        }
    }

    return result;
}

/* Counts non-(-1) entries in atra_grid[georama_no][floor][0..8), i.e. how
 * many atra slots are assigned to this floor. Returns 0 for georama_no==6. */
/* @ 0x1BF7F0 (0x80 bytes) -- GetMaxAtraNum__14CDngStatusDataFii */
int CDngStatusData::GetMaxAtraNum(int georama_no, int floor) {
    if (georama_no == 6) {
        return 0;
    }

    int result = 0;
    int i;
    int valid;
    for (i = 0; (valid = i < 8) != 0; i++) {
        if (this->atra_grid[georama_no][floor][i] != -1) {
            result++;
        }
    }

    return result;
}

/* @ 0x1BF870 (0x80 bytes) -- SetGetAtra__14CDngStatusDataFiii */
int CDngStatusData::SetGetAtra(int georama_no, int floor, int atra_id) {
    int i;

    if (georama_no == 6) {
        i = 0;
    } else {
        int valid;
        for (i = 0; (valid = i < 8) != 0; i++) {
            if (this->atra_grid[georama_no][floor][i] == -1) {
                this->atra_grid[georama_no][floor][i] = atra_id;
                return i;
            }
        }
        i = -1;
    }

    return i;
}

/* Copies atra_grid[georama_no][floor][0..8) into out8. No-op for
 * georama_no==6. */
/* @ 0x1BF8F0 (0x60 bytes) -- SetCopyAtraList__14CDngStatusDataFiiPi */
void CDngStatusData::SetCopyAtraList(int georama_no, int floor, int *out8) {
    if (georama_no != 6) {
        int i;
        int valid;
        for (i = 0; (valid = i < 8) != 0; i++) {
            out8[i] = this->atra_grid[georama_no][floor][i];
        }
    }
}

/* Marks the matching (or wildcard, -2) atra slot on this floor collected (-3)
 * and drops the registry refcount for that id, freeing the entry at zero.
 * The two loops use separate counters and the second's refcount test is
 * phrased as an early return -- both are needed to reproduce retail's
 * register allocation and branch threading. */
/* @ 0x1BF950 (0x160 bytes) -- GetAtraData__14CDngStatusDataFiii */
void CDngStatusData::GetAtraData(int georama_no, int floor, int atra_id) {
    if (georama_no < 6) {
        int i;
        int valid;
        int j;

        for (i = 0; (valid = i < GetMaxAtraSlotNo()) != 0; i++) {
            if (this->atra_grid[georama_no][floor][i] == atra_id) {
                this->atra_grid[georama_no][floor][i] = -3;
                this->atra_registry[georama_no][atra_id].refcount--;
                if (this->atra_registry[georama_no][atra_id].refcount == 0) {
                    this->atra_registry[georama_no][atra_id].id = -1;
                }
                return;
            }
        }

        for (j = 0; (valid = j < GetMaxAtraSlotNo()) != 0; j++) {
            if (this->atra_grid[georama_no][floor][j] == -2) {
                this->atra_grid[georama_no][floor][j] = -3;
                this->atra_registry[georama_no][atra_id].refcount--;
                if (this->atra_registry[georama_no][atra_id].refcount != 0) {
                    return;
                }
                this->atra_registry[georama_no][atra_id].id = -1;
                return;
            }
        }
    }
}
