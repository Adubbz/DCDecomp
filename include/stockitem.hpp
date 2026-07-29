#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct ATTACH_LIST;
struct WEAPON_HAVE;


class CStockItem {
public:
    /* ?ret */ void Initialize(void); // @ 0x23F590 (0x70 bytes) -- mangled: Initialize__10CStockItemFv
    /* ?ret */ void SearchSpace(int, int); // @ 0x23F600 (0xC0 bytes) -- mangled: SearchSpace__10CStockItemFii
    /* ?ret */ void SetItemToPos(int, short *, short *); // @ 0x23F6C0 (0x30 bytes) -- mangled: SetItemToPos__10CStockItemFiPsPs
    /* ?ret */ void GetItemInfo(int, short *, short *); // @ 0x23F6F0 (0x20 bytes) -- mangled: GetItemInfo__10CStockItemFiPsPs
    /* ?ret */ void SetWepToPos(int, WEAPON_HAVE *); // @ 0x23F710 (0x80 bytes) -- mangled: SetWepToPos__10CStockItemFiP11WEAPON_HAVE
    /* ?ret */ void GetWeaponInfo(int, WEAPON_HAVE *); // @ 0x23F790 (0x40 bytes) -- mangled: GetWeaponInfo__10CStockItemFiP11WEAPON_HAVE
    /* ?ret */ void SetAttachToPos(int, ATTACH_LIST *); // @ 0x23F7D0 (0x80 bytes) -- mangled: SetAttachToPos__10CStockItemFiP11ATTACH_LIST
    /* ?ret */ void GetAttachInfo(int, ATTACH_LIST *); // @ 0x23F850 (0x40 bytes) -- mangled: GetAttachInfo__10CStockItemFiP11ATTACH_LIST
    /* ?ret */ void SearchItem(int); // @ 0x23F890 (0x190 bytes) -- mangled: SearchItem__10CStockItemFi
    /* ?ret */ void SeitonChargeItemBoardSub(void); // @ 0x23FB40 (0x130 bytes) -- mangled: SeitonChargeItemBoardSub__10CStockItemFv
    /* ?ret */ void SeitonItem(void); // @ 0x23FC70 (0x80 bytes) -- mangled: SeitonItem__10CStockItemFv
    /* ?ret */ void SeitonAttach(void); // @ 0x23FF10 (0x80 bytes) -- mangled: SeitonAttach__10CStockItemFv
    /* ?ret */ void GetNowModeSpace(int); // @ 0x23FF90 (0xC0 bytes) -- mangled: GetNowModeSpace__10CStockItemFi
};
