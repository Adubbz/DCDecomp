extern ? ItemAutoGet;
extern ? MenuDbgMsg;

/* InitDebugItemGet (void) */
void InitDebugItemGet__Fv(void) {
    ItemAutoGet.unk0 = 0x6A;
    ItemAutoGet.unk4 = (s32) ((s32) ItemAutoGet.unk0 >> 6);
    ItemAutoGet.unk8 = 0;
    MenuDbgMsg.unk18 = 0;
    MenuDbgMsg.unk10 = "dbgwork_menu";
    MenuDbgMsg.unk0 = 0x15E;
    MenuDbgMsg.unk4 = 0x50;
    MenuDbgMsg.unk8 = 0x100;
    MenuDbgMsg.unkC = 0xE0;
    MenuDbgMsg.unk14 = 0x60;
}
