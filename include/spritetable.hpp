#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct MG_SPRITE;
struct RECT;
struct SPRITE_TABLE;
struct sceGsTex0;


class CSpriteTable {
public:
    /**
     * @mangled DrawTable__12CSpriteTableFv
     * @address 0x12BA20
     * @size 0x470
     * @unknownret
     */
    void DrawTable(void);

    /**
     * @mangled AddTable__12CSpriteTableFiiP9MG_SPRITEii
     * @address 0x12BE90
     * @size 0x160
     * @unknownret
     */
    void AddTable(int, int, MG_SPRITE *, int, int);

    /**
     * @mangled AddTable__12CSpriteTableFiiP9sceGsTex0P4RECTii
     * @address 0x12BFF0
     * @size 0x70
     * @unknownret
     */
    void AddTable(int, int, sceGsTex0 *, RECT *, int, int);

    /**
     * @mangled Initialize__12CSpriteTableFP12SPRITE_TABLEii
     * @address 0x12C060
     * @size 0x60
     * @unknownret
     */
    void Initialize(SPRITE_TABLE *, int, int);

    /**
     * @mangled GetNext__12CSpriteTableFv
     * @address 0x12C0C0
     * @size 0x30
     * @unknownret
     */
    void GetNext(void);

    /**
     * @mangled ClearPointer__12CSpriteTableFv
     * @address 0x12C0F0
     * @size 0x80
     * @unknownret
     */
    void ClearPointer(void);
};
