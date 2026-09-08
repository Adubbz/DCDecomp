#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 798

#include "monstorunit.hpp"
#include "dungeonmap.hpp"
#include "mathutil.hpp"
#include "mglib.hpp"
#include "snd.hpp"

int CMonstorUnit::GetMonstorNum() {
    int count = 0;
    for (int i = 0; i < 16; i++) {
        if (monster[i].state != -1) {
            count++;
        }
    }
    return count;
}
INCLUDE_ASM("asm/nonmatchings/monstorunit", DrawMapSymbol__12CMonstorUnitFPf);
INCLUDE_RODATA("asm/nonmatchings/monstorunit", @603__2);
INCLUDE_RODATA("asm/nonmatchings/monstorunit", @653__3);
INCLUDE_ASM("asm/nonmatchings/monstorunit", SetKey__12CMonstorUnitFv);
int CMonstorUnit::CheckEventFlag2() {
    for (int i = 0; i < 16; i++) {
        if (monster[i].state == 2 && monster[i].event_flag2_pending != 0) {
            monster[i].event_flag2_pending = 0;
            return monster[i].event_flag2;
        }
    }
    return -1;
}
INCLUDE_ASM("asm/nonmatchings/monstorunit", ArrangementPos__12CMonstorUnitFP11CDungeonMapiii);
void CMonstorUnit::AllBin2() {
    for (int i = 0; i < 16; i++) {
        monster[i].unk_010 = 300;
    }
}
void CMonstorUnit::PalletSet() {
    sceVu0FVECTOR ambient;
    MGGetAmbient(ambient);
    if (monster[unk_090].palette_cycles > 0) {
        ambient[0] = monster[unk_090].palette_color[0];
        ambient[1] = monster[unk_090].palette_color[1];
        ambient[2] = monster[unk_090].palette_color[2];
    }
    ambient[3] = monster[unk_090].palette_alpha;
    if (monster[unk_090].palette_override_pending != 0) {
        ambient[0] = monster[unk_090].palette_override[0];
        ambient[1] = monster[unk_090].palette_override[1];
        ambient[2] = monster[unk_090].palette_override[2];
        monster[unk_090].palette_override_pending = 0;
    }
    MGSetAmbient(ambient);
}
void CMonstorUnit::PalletStep() {
    sceVu0FVECTOR ambient;
    if (monster[unk_090].palette_delay == 0) {
        monster[unk_090].palette_alpha -= monster[unk_090].palette_alpha_step;
        if (monster[unk_090].palette_alpha <= 0.0f) {
            monster[unk_090].palette_alpha = 0.0f;
        }
        if (!(monster[unk_090].palette_alpha < 128.0f)) {
            monster[unk_090].palette_alpha = 128.0f;
        }
    } else {
        monster[unk_090].palette_delay--;
    }
    monster[unk_090].unk_0D0 = monster[unk_090].unk_0D2;
    if (monster[unk_090].palette_alpha <= 32.0f) {
        monster[unk_090].unk_0D0 = 0;
    }
    MGGetAmbient(ambient);
    sceVu0CopyVector(monster[unk_090].palette_color, ambient);
    if (monster[unk_090].palette_cycles > 0) {
        monster[unk_090].palette_blend += monster[unk_090].palette_step;
        if (!(monster[unk_090].palette_step <= 0.0f)) {
            if (!(monster[unk_090].palette_blend < 1.0f)) {
                monster[unk_090].palette_blend = 1.0f;
                monster[unk_090].palette_step *= -1.0f;
            }
        } else if (monster[unk_090].palette_blend <= 0.0f) {
            monster[unk_090].palette_blend = 0.0f;
            monster[unk_090].palette_step *= -1.0f;
            monster[unk_090].palette_cycles--;
        }
        for (int i = 0; i < 3; i++) {
            monster[unk_090].palette_color[i] += monster[unk_090].palette_blend * (monster[unk_090].palette_target[i] - ambient[i]);
        }
    }
}
INCLUDE_ASM("asm/nonmatchings/monstorunit", SoundCheck__12CMonstorUnitFv);
INCLUDE_ASM("asm/nonmatchings/monstorunit", DrawMonstor__12CMonstorUnitFv);
INCLUDE_ASM("asm/nonmatchings/monstorunit", DrawMonstorCursor__12CMonstorUnitFv);
INCLUDE_ASM("asm/nonmatchings/monstorunit", set3DCellModel__FPfPcfiiii);
INCLUDE_ASM("asm/nonmatchings/monstorunit", InitBee__FP6CFramei);
INCLUDE_RODATA("asm/nonmatchings/monstorunit", @915);
INCLUDE_RODATA("asm/nonmatchings/monstorunit", @916);
INCLUDE_ASM("asm/nonmatchings/monstorunit", DrawBee__FP6CFramei);
INCLUDE_RODATA("asm/nonmatchings/monstorunit", @935);
INCLUDE_ASM("asm/nonmatchings/monstorunit", DrawShadowMonstor__12CMonstorUnitFv);
INCLUDE_ASM("asm/nonmatchings/monstorunit", CheckViewLevel__12CMonstorUnitFv);
INCLUDE_ASM("asm/nonmatchings/monstorunit", SelectAttachi__12CMonstorUnitFv);
INCLUDE_ASM("asm/nonmatchings/monstorunit", CheckDmg__12CMonstorUnitFv);
INCLUDE_RODATA("asm/nonmatchings/monstorunit", @1518);
INCLUDE_RODATA("asm/nonmatchings/monstorunit", @1521);
INCLUDE_ASM("asm/nonmatchings/monstorunit", MoveCheck__12CMonstorUnitFPfPfi);
INCLUDE_ASM("asm/nonmatchings/monstorunit", MoveCheck2__12CMonstorUnitFv);
INCLUDE_ASM("asm/nonmatchings/monstorunit", MoveChecMonster__12CMonstorUnitFv);
INCLUDE_ASM("asm/nonmatchings/monstorunit", Step__12CMonstorUnitFi);
INCLUDE_RODATA("asm/nonmatchings/monstorunit", @2233__2);
INCLUDE_RODATA("asm/nonmatchings/monstorunit", @2237__2);
INCLUDE_ASM("asm/nonmatchings/monstorunit", CleanViewMonstor__12CMonstorUnitFi);
INCLUDE_ASM("asm/nonmatchings/monstorunit", SetupBaseModel__12CMonstorUnitFiiiP14CDataAlloc2_1_);
INCLUDE_RODATA("asm/nonmatchings/monstorunit", @2328);
INCLUDE_RODATA("asm/nonmatchings/monstorunit", @2329);
INCLUDE_RODATA("asm/nonmatchings/monstorunit", @2330);
INCLUDE_RODATA("asm/nonmatchings/monstorunit", @2331);
INCLUDE_ASM("asm/nonmatchings/monstorunit", SetupViewMonstor__12CMonstorUnitFiPfi);
