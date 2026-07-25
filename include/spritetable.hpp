#pragma once

#include "common.h"

class CSpriteTable {
public:
    /* ?ret */ void DrawTable(void); // @ 0x12BA20 (0x470 bytes) -- mangled: DrawTable__12CSpriteTableFv
    /* ?ret */ void AddTable(int, int, MG_SPRITE *, int, int); // @ 0x12BE90 (0x160 bytes) -- mangled: AddTable__12CSpriteTableFiiP9MG_SPRITEii
    /* ?ret */ void AddTable(int, int, sceGsTex0 *, RECT *, int, int); // @ 0x12BFF0 (0x70 bytes) -- mangled: AddTable__12CSpriteTableFiiP9sceGsTex0P4RECTii
    /* ?ret */ void Initialize(SPRITE_TABLE *, int, int); // @ 0x12C060 (0x60 bytes) -- mangled: Initialize__12CSpriteTableFP12SPRITE_TABLEii
    /* ?ret */ void GetNext(void); // @ 0x12C0C0 (0x30 bytes) -- mangled: GetNext__12CSpriteTableFv
    /* ?ret */ void ClearPointer(void); // @ 0x12C0F0 (0x80 bytes) -- mangled: ClearPointer__12CSpriteTableFv
};
