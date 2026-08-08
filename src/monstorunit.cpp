#include "monstorunit.hpp"

/* Pointer to the active CMonstorUnit instance (retail `NowMonstorUnit`, main.sbss). */
CMonstorUnit *NowMonstorUnit;

INCLUDE_ASM("main", GetMonstorNum__12CMonstorUnitFv);
INCLUDE_ASM("main", DrawMapSymbol__12CMonstorUnitFPf);
INCLUDE_ASM("main", SetKey__12CMonstorUnitFv);
INCLUDE_ASM("main", CheckEventFlag2__12CMonstorUnitFv);
INCLUDE_ASM("main", ArrangementPos__12CMonstorUnitFP11CDungeonMapiii);
INCLUDE_ASM("main", AllBin2__12CMonstorUnitFv);
INCLUDE_ASM("main", PalletSet__12CMonstorUnitFv);
INCLUDE_ASM("main", PalletStep__12CMonstorUnitFv);
INCLUDE_ASM("main", SoundCheck__12CMonstorUnitFv);
INCLUDE_ASM("main", DrawMonstor__12CMonstorUnitFv);
INCLUDE_ASM("main", DrawMonstorCursor__12CMonstorUnitFv);
INCLUDE_ASM("main", set3DCellModel__FPfPcfiiii);
INCLUDE_ASM("main", InitBee__FP6CFramei);
INCLUDE_ASM("main", DrawBee__FP6CFramei);
INCLUDE_ASM("main", DrawShadowMonstor__12CMonstorUnitFv);
INCLUDE_ASM("main", CheckViewLevel__12CMonstorUnitFv);
INCLUDE_ASM("main", SelectAttachi__12CMonstorUnitFv);
INCLUDE_ASM("main", CheckDmg__12CMonstorUnitFv);
INCLUDE_ASM("main", MoveCheck__12CMonstorUnitFPfPfi);
INCLUDE_ASM("main", MoveCheck2__12CMonstorUnitFv);
INCLUDE_ASM("main", MoveChecMonster__12CMonstorUnitFv);
INCLUDE_ASM("main", Step__12CMonstorUnitFi);
INCLUDE_ASM("main", CleanViewMonstor__12CMonstorUnitFi);
INCLUDE_ASM("main", SetupBaseModel__12CMonstorUnitFiiiP14CDataAlloc2_1_);
INCLUDE_ASM("main", SetupViewMonstor__12CMonstorUnitFiPfi);

INCLUDE_RODATA("main", LIT_2233__2);
INCLUDE_RODATA("main", LIT_2237__2);
INCLUDE_RODATA("main", LIT_2328);
INCLUDE_RODATA("main", LIT_2329);
INCLUDE_RODATA("main", LIT_2330);
INCLUDE_RODATA("main", LIT_2331);
INCLUDE_RODATA("main", LIT_870);
INCLUDE_RODATA("main", LIT_960);
INCLUDE_RODATA("main", LIT_979__2);
