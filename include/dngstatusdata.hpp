#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct STATIC_ASSER;


/* Refcounted "atra" (Atlamillia) placement-grid entry. id is the required
 * atra id for a grid slot (-1 = empty, -2 = wildcard/any-atra acceptor, -3 =
 * already collected); refcount is how many un-collected atra_grid slots
 * still reference this id -- GetAtraData decrements it and frees the entry
 * (id=-1) once it reaches 0. unk4 is not yet used by any decompiled function. */
struct DNG_ATRA_REGISTRY_ENTRY {
    s32 id;
    s32 unk4;
    s32 refcount;
};
STATIC_ASSERT(sizeof(DNG_ATRA_REGISTRY_ENTRY) == 0xC);

/* Per-character weapon-inventory slot. Only the item id (s16 at offset 0) is
 * understood so far; the remaining 246 bytes hold the weapon's runtime state
 * (charge/synthesis data). Accessed as a struct member so the compiler folds
 * the field offset into the load displacement (matches retail codegen). */
struct WEAPON_HAVE {
    s16 id;
    char unk_02[236];
    s16 flags; // 0xEE -- bit 3 and bit 4 each scale the water-drain rate (CUserStatus::Step)
    char unk_F0[8];
};
STATIC_ASSERT(sizeof(WEAPON_HAVE) == 0xF8);

/* Consumable-item inventory slot (id is a s16 at offset 0). */
struct DNG_CONSUMABLE {
    s16 id;
    char unk_02[30];
};
STATIC_ASSERT(sizeof(DNG_CONSUMABLE) == 0x20);

class CDngStatusData {
public:
    /**
     * @mangled SetNowFloor__14CDngStatusDataFi
     * @address 0x1BD900
     * @size 0x40
     */
    void SetNowFloor(int floor);

    /**
     * @mangled SearchItemIndexNo__14CDngStatusDataFi
     * @address 0x1BD940
     * @size 0x180
     */
    int SearchItemIndexNo(int item_id);

    /**
     * @mangled LostItem__14CDngStatusDataFi
     * @address 0x1BDB60
     * @size 0x60
     */
    int LostItem(int item_id);

    /**
     * @mangled LostGateKey__14CDngStatusDataFv
     * @address 0x1BDBC0
     * @size 0x130
     */
    void LostGateKey(void);

    /**
     * @mangled GetLiveUnit__14CDngStatusDataFv
     * @address 0x1BDCF0
     * @size 0x50
     */
    int GetLiveUnit(void);

    /**
     * @mangled CheckItemGet__14CDngStatusDataFi
     * @address 0x1BDD40
     * @size 0x190
     */
    int CheckItemGet(int item_id);

    /**
     * @mangled CheckWeaponUser__14CDngStatusDataFi
     * @address 0x1BDED0
     * @size 0xC0
     */
    int CheckWeaponUser(int weapon_id);

    /**
     * @mangled CheckWeaponRot__14CDngStatusDataFi
     * @address 0x1BDF90
     * @size 0xC0
     */
    int CheckWeaponRot(int weapon_id);

    /**
     * @mangled ClearDeamonShaft__14CDngStatusDataFv
     * @address 0x1BE050
     * @size 0x10
     */
    void ClearDeamonShaft(void);

    /**
     * @mangled GetItem__14CDngStatusDataFii
     * @address 0x1BE060
     * @size 0x400
     */
    int GetItem(int item_id, int qty);

    /**
     * @mangled CheckActItemSlot__14CDngStatusDataFi
     * @address 0x1BE460
     * @size 0x50
     */
    int CheckActItemSlot(int item_id);

    /**
     * @mangled CheckDefaultWeapon__14CDngStatusDataFi
     * @address 0x1BE4B0
     * @size 0x60
     */
    int CheckDefaultWeapon(int chara_no);

    /**
     * @mangled SetDead__14CDngStatusDataFv
     * @address 0x1BEEF0
     * @size 0x20
     */
    void SetDead(void);

    /**
     * @mangled SetResLimmitZone__14CDngStatusDataFv
     * @address 0x1BEF10
     * @size 0x50
     */
    void SetResLimmitZone(void);

    /**
     * @mangled InitResLimmitZone__14CDngStatusDataFv
     * @address 0x1BEF60
     * @size 0x3E0
     */
    void InitResLimmitZone(void);

    /**
     * @mangled Initialize__14CDngStatusDataFv
     * @address 0x1BF340
     * @size 0x3C0
     */
    void Initialize(void);

    /**
     * @mangled AddKills__14CDngStatusDataFv
     * @address 0x1BF700
     * @size 0x40
     */
    void AddKills(void);

    /**
     * @mangled ChkKills__14CDngStatusDataFii
     * @address 0x1BF740
     * @size 0x30
     */
    s16 ChkKills(int georama_no, int floor);

    /**
     * @mangled GetAtraNum__14CDngStatusDataFii
     * @address 0x1BF770
     * @size 0x80
     */
    int GetAtraNum(int georama_no, int floor);

    /**
     * @mangled GetMaxAtraNum__14CDngStatusDataFii
     * @address 0x1BF7F0
     * @size 0x80
     */
    int GetMaxAtraNum(int georama_no, int floor);

    /**
     * @mangled SetGetAtra__14CDngStatusDataFiii
     * @address 0x1BF870
     * @size 0x80
     */
    int SetGetAtra(int georama_no, int floor, int atra_id);

    /**
     * @mangled SetCopyAtraList__14CDngStatusDataFiiPi
     * @address 0x1BF8F0
     * @size 0x60
     */
    void SetCopyAtraList(int georama_no, int floor, int *out8);

    /**
     * @mangled GetAtraData__14CDngStatusDataFiii
     * @address 0x1BF950
     * @size 0x160
     */
    void GetAtraData(int georama_no, int floor, int atra_id);

private:
    /* Field names/offsets below come directly from the project's IDA
     * database (already reverse engineered there ahead of this decompile
     * pass); "unk_*" fields are not yet touched by any decompiled function. */
    s8 cur_georama;
    char unk_01;
    s8 cur_floor;
    s8 prev_floor;
    char unk_04;
    s8 party_size;
    s16 max_hp[6];
    s16 hp[6];
    char unk_01E[602];
    s32 atra_grid[6][40][8];
    DNG_ATRA_REGISTRY_ENTRY atra_registry[6][100];
    s16 kills[6][100];
    char unk_4148[200];
    char res_limit_zone_id[6][25];
    char unk_42A6[25];
    s8 floor_reached[7];
    char unk_42C6[2];
    s32 unk_field_4468[6];
    s16 unk_field_2[6];
    float stat_float_a[6];
    float stat_float_b[6];
    s32 overflow_flag;
    s32 special_flag_238;
    s32 unk_field_3[6];
    s32 config_mirror;
    s8 equipped_weapon_slot[6];
    s16 dead_mask;
    s32 unk_field_1[6];
    s8 item_capacity;
    char unk_4361[1];
    s16 quick_item_slot[3];
    s16 quick_item_qty[3];
    s16 dungeon_items[103];
    /* Per-slot "vol": how much is left in that copy of the item. Seeded from
     * ITEM_LIST +10 via ItemDataToHaveCopy, drained by CMenuItemStep::
     * CheckItemVolume, which advances the item id a stage when it empties. */
    s16 item_vol[103];
    char unk_450A[2];
    WEAPON_HAVE chara_weapons[6][11];
    DNG_CONSUMABLE consumable_items[43];
    char unk_8A5C[180];
    s32 res_limit_zone_current;
    char unk_8B14[392];
};
STATIC_ASSERT(sizeof(CDngStatusData) == 0x8C9C);
