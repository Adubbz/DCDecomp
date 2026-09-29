#pragma once

#include "common.h"

#include "itemdata.hpp"

/**
 * Stores one attachment slot in the dungeon inventory.
 */
struct DNG_CONSUMABLE {
    s16 id; /**< Attachment in the slot, or an id below 81 if the slot is empty. */
    char unk_02[30];
};

STATIC_ASSERT(sizeof(DNG_CONSUMABLE) == 0x20);

/**
 * Stores the dungeon inventory and its quick-use slots.
 */
struct ITEM_PACK {
    s8 num;                 /**< Slots the pack holds. */
    s8 item_count;          /**< Dungeon items carried, counting every copy in a quick-use slot. */
    s16 quick_item_slot[3]; /**< Item in each quick-use slot, or -1. */
    s16 quick_item_qty[3];  /**< How many of that item each quick-use slot holds. */
    s16 item[103];          /**< Item in each slot, or -1. */
    s16 item_vol[103];      /**< How much is left in each slot's copy of its item. */
};

STATIC_ASSERT(sizeof(ITEM_PACK) == 0x1AA);

/**
 * Records what has become of one atla of one floor.
 */
struct ATRA_SAVE {
    s32 id;       /**< Atla the record is for, or -1 once no slot asks for it. */
    s32 floor;    /**< Floor the atla lies on counted from one, or -1 or -2 for any upper or lower floor. */
    s32 refcount; /**< How many of the floor's atla slots still ask for this atla. */
};

STATIC_ASSERT(sizeof(ATRA_SAVE) == 0xC);

/**
 * Stores the party's characters, inventory, and dungeon progress.
 */
class CUserStatus {
public:
    /**
     * @mangled ChkEventFlag__11CUserStatusFi
     * @address 0x1BDAC0
     * @size 0x5C
     */
    int ChkEventFlag(int flag_no);

    /**
     * @mangled ClearEventFlag__11CUserStatusFv
     * @address 0x1BDB20
     * @size 0x34
     */
    void ClearEventFlag(void);

    /**
     * @mangled AddDrink__11CUserStatusFisf
     * @address 0x1BE510
     * @size 0x1FC
     */
    void AddDrink(int chara_no, s16 amount, float ratio);

    /**
     * @mangled AddNowLife__11CUserStatusFisf
     * @address 0x1BE710
     * @size 0x178
     */
    void AddNowLife(int chara_no, s16 amount, float ratio);

    /**
     * @mangled CheckLife__11CUserStatusFv
     * @address 0x1BE890
     * @size 0x68
     */
    int CheckLife(void);

    /**
     * @mangled SetNextLife__11CUserStatusFisf
     * @address 0x1BE900
     * @size 0x144
     */
    void SetNextLife(int chara_no, s16 value, float ratio);

    /**
     * Drains the active character's water, then moves every water and HP gauge one step.
     *
     * @mangled Step__11CUserStatusFi
     * @address 0x1BEA50
     * @size 0x388
     */
    void Step(int paused);

    /**
     * @mangled Init__11CUserStatusFv
     * @address 0x1BEDE0
     * @size 0x108
     */
    void Init(void);

public:
    /* CDngStatusData extends this layout with its dungeon tail. The fields are
     * public because retail reaches into them from outside both classes. */
    s8 cur_georama;                  /**< Current town and dungeon index. */
    char unk_01[1];                  // 0x0001
    s8 cur_floor;                    // 0x0002
    s8 prev_floor;                   /**< Floor occupied before the current floor. */
    s8 cur_chara;                    /**< Index of the currently controlled party member. */
    s8 party_size;                   // 0x0005
    s16 max_hp[6];                   /**< Maximum life of each party member. */
    s16 hp[6];                       /**< Current displayed life of each party member. */
    char unk_01E[0x25A];             // 0x001E
    s32 atra_grid[6][40][8];         /**< Atla each floor slot asks for, or -1 empty, -2 any atla, -3 collected. */
    ATRA_SAVE atra_registry[6][100]; /**< Atla each dungeon's floor slots still ask for. */
    s16 kills[6][100];               /**< Monsters defeated on each dungeon floor. */
    char unk_4148[200];              // 0x4148
    char res_limit_zone_id[6][25];   /**< Restriction-zone identifiers by dungeon and floor. */
    char unk_42A6[25];               // 0x42A6
    s8 floor_reached[7];             /**< Deepest floor reached in each dungeon, or -1 if never entered. */
    char unk_42C6[2];                // 0x42C6
    s32 unk_42C8[6];                 // 0x42C8
    s16 unk_42E0[6];                 // 0x42E0
    float water_max[6];              /**< Most water each character can hold, ten to a drop. */
    float water_now[6];              /**< Water each character holds now. */
    s32 overflow_flag;               /**< Whether the player carries more items than the pack holds. */
    s32 special_flag_238;            /**< Set when item 238 is picked up. */
    s32 skill_owned[6];              /**< Whether each character has received their event skill. */
    s32 minimap_status;              /**< Current minimap visibility mode. */
    s8 equipped_weapon_slot[6];      /**< Specifies each character's equipped weapon slot. */

    union {
        u16 money;        /**< Gilda the party carries. */
        s16 money_signed; /**< Signed view of the Gilda the party carries. */
    };

    s32 unk_4348[6]; // 0x4348

    union {
        ITEM_PACK item_pack; /**< Dungeon items the player carries. */

        /* The battle code walks the pack as halfwords from its start, indexing by
         * 1-based quick-use slot: [slot] is that slot's item and [slot + 3] its count. */
        s16 active_item[3];
    };

    char unk_450A[2];                    // 0x450A
    WEAPON_HAVE chara_weapons[6][11];    /**< Specifies the weapons owned by each character. */
    DNG_CONSUMABLE consumable_items[43]; /**< Specifies the stored consumable items. */
    s16 next_hp[6];                      // 0x8A5C
    s16 life_step[6];                    // 0x8A68
    s32 unk_8A74[6];                     // 0x8A74
    s32 unk_8A8C[6];                     // 0x8A8C
    s8 event_flags[50];                  // 0x8AA4
    s16 drink_next[6];                   // 0x8AD6
    s16 drink_step[6];                   // 0x8AE2
    char unk_8AEE[2];                    // 0x8AEE
    float damage_accum[6];               // 0x8AF0
    s32 water_drain_disable;             // 0x8B08
    s32 step_disable;                    // 0x8B0C
    s32 res_limit_zone_current;          // 0x8B10
    s32 active_item_vol[3];              // 0x8B14
};

STATIC_ASSERT(sizeof(CUserStatus) == 0x8B20);
