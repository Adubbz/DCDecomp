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
    void SetNowFloor(int floor); // @ 0x1BD900 (0x40 bytes) -- mangled: SetNowFloor__14CDngStatusDataFi
    int SearchItemIndexNo(int item_id); // @ 0x1BD940 (0x180 bytes) -- mangled: SearchItemIndexNo__14CDngStatusDataFi
    int LostItem(int item_id); // @ 0x1BDB60 (0x60 bytes) -- mangled: LostItem__14CDngStatusDataFi
    void LostGateKey(void); // @ 0x1BDBC0 (0x130 bytes) -- mangled: LostGateKey__14CDngStatusDataFv
    int GetLiveUnit(void); // @ 0x1BDCF0 (0x50 bytes) -- mangled: GetLiveUnit__14CDngStatusDataFv
    int CheckItemGet(int item_id); // @ 0x1BDD40 (0x190 bytes) -- mangled: CheckItemGet__14CDngStatusDataFi
    int CheckWeaponUser(int weapon_id); // @ 0x1BDED0 (0xC0 bytes) -- mangled: CheckWeaponUser__14CDngStatusDataFi
    int CheckWeaponRot(int weapon_id); // @ 0x1BDF90 (0xC0 bytes) -- mangled: CheckWeaponRot__14CDngStatusDataFi
    void ClearDeamonShaft(void); // @ 0x1BE050 (0x10 bytes) -- mangled: ClearDeamonShaft__14CDngStatusDataFv
    int GetItem(int item_id, int qty); // @ 0x1BE060 (0x400 bytes) -- mangled: GetItem__14CDngStatusDataFii
    int CheckActItemSlot(int item_id); // @ 0x1BE460 (0x50 bytes) -- mangled: CheckActItemSlot__14CDngStatusDataFi
    int CheckDefaultWeapon(int chara_no); // @ 0x1BE4B0 (0x60 bytes) -- mangled: CheckDefaultWeapon__14CDngStatusDataFi
    void SetDead(void); // @ 0x1BEEF0 (0x20 bytes) -- mangled: SetDead__14CDngStatusDataFv
    void SetResLimmitZone(void); // @ 0x1BEF10 (0x50 bytes) -- mangled: SetResLimmitZone__14CDngStatusDataFv
    void InitResLimmitZone(void); // @ 0x1BEF60 (0x3E0 bytes) -- mangled: InitResLimmitZone__14CDngStatusDataFv
    void Initialize(void); // @ 0x1BF340 (0x3C0 bytes) -- mangled: Initialize__14CDngStatusDataFv
    void AddKills(void); // @ 0x1BF700 (0x40 bytes) -- mangled: AddKills__14CDngStatusDataFv
    s16 ChkKills(int georama_no, int floor); // @ 0x1BF740 (0x30 bytes) -- mangled: ChkKills__14CDngStatusDataFii
    int GetAtraNum(int georama_no, int floor); // @ 0x1BF770 (0x80 bytes) -- mangled: GetAtraNum__14CDngStatusDataFii
    int GetMaxAtraNum(int georama_no, int floor); // @ 0x1BF7F0 (0x80 bytes) -- mangled: GetMaxAtraNum__14CDngStatusDataFii
    int SetGetAtra(int georama_no, int floor, int atra_id); // @ 0x1BF870 (0x80 bytes) -- mangled: SetGetAtra__14CDngStatusDataFiii
    void SetCopyAtraList(int georama_no, int floor, int *out8); // @ 0x1BF8F0 (0x60 bytes) -- mangled: SetCopyAtraList__14CDngStatusDataFiiPi
    void GetAtraData(int georama_no, int floor, int atra_id); // @ 0x1BF950 (0x160 bytes) -- mangled: GetAtraData__14CDngStatusDataFiii

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
    s16 item_qty_or_flag[103];
    char unk_450A[2];
    WEAPON_HAVE chara_weapons[6][11];
    DNG_CONSUMABLE consumable_items[43];
    char unk_8A5C[180];
    s32 res_limit_zone_current;
    char unk_8B14[392];
};
STATIC_ASSERT(sizeof(CDngStatusData) == 0x8C9C);
