#pragma once

// memcard.cpp's SaveMenuFunc table names the save menu's steps, which this unit defines static:
// the PS2 link makes them global (object_fixups.json, globalize_symbols). Each gets a global
// symbol under the name the table references, which also keeps clang from dropping the static
// as unused.

static int SaveMenuKeySaveCheck();
static int SaveMenuKeySaveDecide();
static int SaveMenuKeySave();
static int SaveMenuKeyEndSave();
static int SaveMenuKeyLoadDecide();
static int SaveMenuKeyLoad();
static int SaveMenuKeyArart();
static int SaveMenuKeyNewDirSelect();
static int SaveMenuKeyNewDir();
static int SaveMenuKeyFormat();
static int SaveMenuKeyUnFormat();
static int SaveMenuKeyDifVersion();
static int SaveMenuKeyDelete();
static int SaveMenuKeyCopy();
static int SaveMenuKeyAfterEnding();
static int SaveMenuKeySaveDecideEnding();
static int SaveMenuKeySaveEnding();
static int SaveMenuKeyEndSaveEnding();

int PortExportSaveMenuKeySaveCheck() asm("_Z20SaveMenuKeySaveCheckv");
int PortExportSaveMenuKeySaveDecide() asm("_Z21SaveMenuKeySaveDecidev");
int PortExportSaveMenuKeySave() asm("_Z15SaveMenuKeySavev");
int PortExportSaveMenuKeyEndSave() asm("_Z18SaveMenuKeyEndSavev");
int PortExportSaveMenuKeyLoadDecide() asm("_Z21SaveMenuKeyLoadDecidev");
int PortExportSaveMenuKeyLoad() asm("_Z15SaveMenuKeyLoadv");
int PortExportSaveMenuKeyArart() asm("_Z16SaveMenuKeyArartv");
int PortExportSaveMenuKeyNewDirSelect() asm("_Z23SaveMenuKeyNewDirSelectv");
int PortExportSaveMenuKeyNewDir() asm("_Z17SaveMenuKeyNewDirv");
int PortExportSaveMenuKeyFormat() asm("_Z17SaveMenuKeyFormatv");
int PortExportSaveMenuKeyUnFormat() asm("_Z19SaveMenuKeyUnFormatv");
int PortExportSaveMenuKeyDifVersion() asm("_Z21SaveMenuKeyDifVersionv");
int PortExportSaveMenuKeyDelete() asm("_Z17SaveMenuKeyDeletev");
int PortExportSaveMenuKeyCopy() asm("_Z15SaveMenuKeyCopyv");
int PortExportSaveMenuKeyAfterEnding() asm("_Z22SaveMenuKeyAfterEndingv");
int PortExportSaveMenuKeySaveDecideEnding() asm("_Z27SaveMenuKeySaveDecideEndingv");
int PortExportSaveMenuKeySaveEnding() asm("_Z21SaveMenuKeySaveEndingv");
int PortExportSaveMenuKeyEndSaveEnding() asm("_Z24SaveMenuKeyEndSaveEndingv");

int PortExportSaveMenuKeySaveCheck() {
    return SaveMenuKeySaveCheck();
}

int PortExportSaveMenuKeySaveDecide() {
    return SaveMenuKeySaveDecide();
}

int PortExportSaveMenuKeySave() {
    return SaveMenuKeySave();
}

int PortExportSaveMenuKeyEndSave() {
    return SaveMenuKeyEndSave();
}

int PortExportSaveMenuKeyLoadDecide() {
    return SaveMenuKeyLoadDecide();
}

int PortExportSaveMenuKeyLoad() {
    return SaveMenuKeyLoad();
}

int PortExportSaveMenuKeyArart() {
    return SaveMenuKeyArart();
}

int PortExportSaveMenuKeyNewDirSelect() {
    return SaveMenuKeyNewDirSelect();
}

int PortExportSaveMenuKeyNewDir() {
    return SaveMenuKeyNewDir();
}

int PortExportSaveMenuKeyFormat() {
    return SaveMenuKeyFormat();
}

int PortExportSaveMenuKeyUnFormat() {
    return SaveMenuKeyUnFormat();
}

int PortExportSaveMenuKeyDifVersion() {
    return SaveMenuKeyDifVersion();
}

int PortExportSaveMenuKeyDelete() {
    return SaveMenuKeyDelete();
}

int PortExportSaveMenuKeyCopy() {
    return SaveMenuKeyCopy();
}

int PortExportSaveMenuKeyAfterEnding() {
    return SaveMenuKeyAfterEnding();
}

int PortExportSaveMenuKeySaveDecideEnding() {
    return SaveMenuKeySaveDecideEnding();
}

int PortExportSaveMenuKeySaveEnding() {
    return SaveMenuKeySaveEnding();
}

int PortExportSaveMenuKeyEndSaveEnding() {
    return SaveMenuKeyEndSaveEnding();
}
