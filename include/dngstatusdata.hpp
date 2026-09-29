#pragma once

#include "userstatus.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct STATIC_ASSER;

/**
 * Extends the party status with dungeon-specific save data.
 */
class CDngStatusData : public CUserStatus {
public:
    /** Returns the number of active party members. */
    s8 GetPartySize() const { return party_size; }

    /** Sets the number of active party members. */
    void SetPartySize(s8 size) { party_size = size; }

    /**
     * @mangled SetNowFloor__14CDngStatusDataFi
     * @address 0x1BD900
     * @size 0x34
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
     * @size 0x54
     */
    int LostItem(int item_id);

    /**
     * @mangled LostGateKey__14CDngStatusDataFv
     * @address 0x1BDBC0
     * @size 0x12C
     */
    void LostGateKey(void);

    /**
     * @mangled GetLiveUnit__14CDngStatusDataFv
     * @address 0x1BDCF0
     * @size 0x44
     */
    int GetLiveUnit(void);

    /**
     * @mangled CheckItemGet__14CDngStatusDataFi
     * @address 0x1BDD40
     * @size 0x184
     */
    int CheckItemGet(int item_id);

    /**
     * @mangled CheckWeaponUser__14CDngStatusDataFi
     * @address 0x1BDED0
     * @size 0xB4
     */
    int CheckWeaponUser(int weapon_id);

    /**
     * @mangled CheckWeaponRot__14CDngStatusDataFi
     * @address 0x1BDF90
     * @size 0xBC
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
     * @size 0x3F8
     */
    int GetItem(int item_id, int qty);

    /**
     * @mangled CheckActItemSlot__14CDngStatusDataFi
     * @address 0x1BE460
     * @size 0x44
     */
    int CheckActItemSlot(int item_id);

    /**
     * @mangled CheckDefaultWeapon__14CDngStatusDataFi
     * @address 0x1BE4B0
     * @size 0x5C
     */
    int CheckDefaultWeapon(int chara_no);

    /**
     * Halves the Gilda carried by the party after a death.
     *
     * @mangled SetDead__14CDngStatusDataFv
     * @address 0x1BEEF0
     * @size 0x14
     */
    void SetDead(void);

    /**
     * @mangled SetResLimmitZone__14CDngStatusDataFv
     * @address 0x1BEF10
     * @size 0x44
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
     * @size 0x3BC
     */
    void Initialize(void);

    /**
     * @mangled AddKills__14CDngStatusDataFv
     * @address 0x1BF700
     * @size 0x3C
     */
    void AddKills(void);

    /**
     * @mangled ChkKills__14CDngStatusDataFii
     * @address 0x1BF740
     * @size 0x2C
     */
    s16 ChkKills(int georama_no, int floor);

    /**
     * @mangled GetAtraNum__14CDngStatusDataFii
     * @address 0x1BF770
     * @size 0x74
     */
    int GetAtraNum(int georama_no, int floor);

    /**
     * @mangled GetMaxAtraNum__14CDngStatusDataFii
     * @address 0x1BF7F0
     * @size 0x74
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
     * @size 0x5C
     */
    void SetCopyAtraList(int georama_no, int floor, int *out_list);

    /**
     * @mangled GetAtraData__14CDngStatusDataFiii
     * @address 0x1BF950
     * @size 0x160
     */
    void GetAtraData(int georama_no, int floor, int atra_id);

public:
    /**
     * Returns one character's active battle-menu status value.
     */
    s32 GetActiveCharaStatus(int chara_no) { return ailments[chara_no]; }

    /**
     * Returns the weapon slot one character has equipped.
     */
    s8 GetEquipWeaponSlot(int chara_no) { return equipped_weapon_slot[chara_no]; }

    char unk_8B20[0x17C];
};

STATIC_ASSERT(sizeof(CDngStatusData) == 0x8C9C);
