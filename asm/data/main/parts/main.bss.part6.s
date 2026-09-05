.include "macro.inc"

.include "macro.inc"

.section .bss, "wa"
glabel argStrBuff__2
    /* 01D65C20 */ .space 0x5A00

glabel argValBuff__2
    /* 01D6B620 */ .space 0x16800

glabel pathName
    /* 01D81E20 */ .space 0x100

glabel FrameObjAnim
    /* 01D81F20 */ .space 0x1B00

glabel filePathList
    /* 01D83A20 */ .space 0x1200

glabel frameList
    /* 01D84C20 */ .space 0x120

glabel filePathColList
    /* 01D84D40 */ .space 0x2400

glabel frameListCol
    /* 01D87140 */ .space 0x240

glabel BeeTbl
    /* 01D87380 */ .space 0x1900

glabel MonsterTexAnim
    /* 01D88C80 */ .space 0x6E00

glabel PUSH_INT_DATA
    /* 01D8FA80 */ .space 0x200

glabel GL_INT
    /* 01D8FC80 */ .space 0x28

/* Automatically generated and unreferenced pad */
glabel D_01D8FCA8
    /* 01D8FCA8 */ .space 0x08

glabel ext_func
    /* 01D8FCB0 */ .space 0x400

glabel ShopCashBuffer
    /* 01D900B0 */ .space 0x10

glabel ShopCashBuffer2
    /* 01D900C0 */ .space 0x10

glabel ShopMenu
    /* 01D900D0 */ .space 0x1A8

/* Automatically generated and unreferenced pad */
glabel D_01D90278
    /* 01D90278 */ .space 0x08

glabel ShopDataMove
    /* 01D90280 */ .space 0x10C

/* Automatically generated and unreferenced pad */
glabel D_01D9038C
    /* 01D9038C */ .space 0x04

glabel FishMenu
    /* 01D90390 */ .space 0x28

/* Automatically generated and unreferenced pad */
glabel D_01D903B8
    /* 01D903B8 */ .space 0x08

glabel FishRecordMenu
    /* 01D903C0 */ .space 0x24

/* Automatically generated and unreferenced pad */
glabel D_01D903E4
    /* 01D903E4 */ .space 0x0C

glabel MenuMes
    /* 01D903F0 */ .space 0x20

glabel MenuExCashBuffer
    /* 01D90410 */ .space 0x10

glabel NorMenuIcon
    /* 01D90420 */ .space 0x40

glabel SysCur
    /* 01D90460 */ .space 0x0C

/* Automatically generated and unreferenced pad */
glabel D_01D9046C
    /* 01D9046C */ .space 0x04

glabel MenuChara
    /* 01D90470 */ .space 0x0C

/* Automatically generated and unreferenced pad */
glabel D_01D9047C
    /* 01D9047C */ .space 0x04

glabel MenuCharaFrame
    /* 01D90480 */ .space 0x11B0

glabel DngWeaponFrm
    /* 01D91630 */ .space 0xD440

glabel WepMenu
    /* 01D9EA70 */ .space 0x17C

/* Automatically generated and unreferenced pad */
glabel D_01D9EBEC
    /* 01D9EBEC */ .space 0x04

glabel ItemMenuMode
    /* 01D9EBF0 */ .space 0x188

/* Automatically generated and unreferenced pad */
glabel D_01D9ED78
    /* 01D9ED78 */ .space 0x08

glabel IconAutoGet
    /* 01D9ED80 */ .space 0x30

glabel MenuMove
    /* 01D9EDB0 */ .space 0x20

glabel MenuWeaponModelData
    /* 01D9EDD0 */ .space 0xA8

/* Automatically generated and unreferenced pad */
glabel D_01D9EE78
    /* 01D9EE78 */ .space 0x08

glabel MenuWeaponModelInfo
    /* 01D9EE80 */ .space 0x50

glabel MenuCharaOldAmbient
    /* 01D9EED0 */ .space 0x10

glabel MenureadFile
    /* 01D9EEE0 */ .space 0x40

glabel MenuIconPos
    /* 01D9EF20 */ .space 0x30

glabel EdCur
    /* 01D9EF50 */ .space 0x0C

/* Automatically generated and unreferenced pad */
glabel D_01D9EF5C
    /* 01D9EF5C */ .space 0x04

glabel AnalyzeFill
    /* 01D9EF60 */ .space 0x0C

/* Automatically generated and unreferenced pad */
glabel D_01D9EF6C
    /* 01D9EF6C */ .space 0x14

glabel SaveFileInfo
    /* 01D9EF80 */ .space 0x18C0

glabel mcdmybuf
    /* 01DA0840 */ .space 0x40

glabel sys_config
    /* 01DA0880 */ .space 0x40

glabel "@567__2"
    /* 01DA08C0 */ .space 0x0C

/* Automatically generated and unreferenced pad */
glabel D_01DA08CC
    /* 01DA08CC */ .space 0x04

glabel MenuCamera
    /* 01DA08D0 */ .space 0x2C0

glabel CommonMenuMes1
    /* 01DA0B90 */ .space 0x17B8

/* Automatically generated and unreferenced pad */
glabel D_01DA2348
    /* 01DA2348 */ .space 0x08

glabel CommonMenuMes2
    /* 01DA2350 */ .space 0x17B8

/* Automatically generated and unreferenced pad */
glabel D_01DA3B08
    /* 01DA3B08 */ .space 0x08

glabel CommonMenuMes3
    /* 01DA3B10 */ .space 0x17B8

/* Automatically generated and unreferenced pad */
glabel D_01DA52C8
    /* 01DA52C8 */ .space 0x08

glabel AtoraNameMes
    /* 01DA52D0 */ .space 0x17B8

/* Automatically generated and unreferenced pad */
glabel D_01DA6A88
    /* 01DA6A88 */ .space 0x08

glabel MenuDispRc
    /* 01DA6A90 */ .space 0x10

glabel BtEditPartsInfo
    /* 01DA6AA0 */ .space 0x1628

/* Automatically generated and unreferenced pad */
glabel D_01DA80C8
    /* 01DA80C8 */ .space 0x08

glabel MenuAtoraSel
    /* 01DA80D0 */ .space 0x1AC

/* Automatically generated and unreferenced pad */
glabel D_01DA827C
    /* 01DA827C */ .space 0x04

glabel McAccess
    /* 01DA8280 */ .space 0x7C0

glabel OptionMenu
    /* 01DA8A40 */ .space 0x88

/* Automatically generated and unreferenced pad */
glabel D_01DA8AC8
    /* 01DA8AC8 */ .space 0x08

glabel SaveMenu
    /* 01DA8AD0 */ .space 0x34

/* Automatically generated and unreferenced pad */
glabel D_01DA8B04
    /* 01DA8B04 */ .space 0x0C

glabel SaveMenuMojiTextbl
    /* 01DA8B10 */ .space 0x10

glabel MiniMenu
    /* 01DA8B20 */ .space 0x54

/* Automatically generated and unreferenced pad */
glabel D_01DA8B74
    /* 01DA8B74 */ .space 0x0C

glabel DEnterMenu
    /* 01DA8B80 */ .space 0x1AC

/* Automatically generated and unreferenced pad */
glabel D_01DA8D2C
    /* 01DA8D2C */ .space 0x04

glabel ChangeMenu
    /* 01DA8D30 */ .space 0x60

glabel MenuItemCashBuffer
    /* 01DA8D90 */ .space 0x10

glabel MenuDbgMsg
    /* 01DA8DA0 */ .space 0x21C

/* Automatically generated and unreferenced pad */
glabel D_01DA8FBC
    /* 01DA8FBC */ .space 0x04

glabel ItemAutoGet
    /* 01DA8FC0 */ .space 0x0C

/* Automatically generated and unreferenced pad */
glabel D_01DA8FCC
    /* 01DA8FCC */ .space 0x04

glabel MenuGrobalDir
    /* 01DA8FD0 */ .space 0x40

glabel MenuTrushMark
    /* 01DA9010 */ .space 0x64

/* Automatically generated and unreferenced pad */
glabel D_01DA9074
    /* 01DA9074 */ .space 0x0C

glabel EastKingMsgCls
    /* 01DA9080 */ .space 0x17B8

/* Automatically generated and unreferenced pad */
glabel D_01DAA838
    /* 01DAA838 */ .space 0x08

glabel EastKing
    /* 01DAA840 */ .space 0x1C

/* Automatically generated and unreferenced pad */
glabel D_01DAA85C
    /* 01DAA85C */ .space 0x04

glabel EastKingMsg
    /* 01DAA860 */ .space 0x0C

/* Automatically generated and unreferenced pad */
glabel D_01DAA86C
    /* 01DAA86C */ .space 0x04

glabel ManualMenu
    /* 01DAA870 */ .space 0x34

/* Automatically generated and unreferenced pad */
glabel D_01DAA8A4
    /* 01DAA8A4 */ .space 0x0C

glabel ManualMenuTex
    /* 01DAA8B0 */ .space 0x18

/* Automatically generated and unreferenced pad */
glabel D_01DAA8C8
    /* 01DAA8C8 */ .space 0x08

glabel MenuEffectCashBuffer
    /* 01DAA8D0 */ .space 0x10

glabel MenuWepLevelUp
    /* 01DAA8E0 */ .space 0x1330

glabel ItemVolumeStep
    /* 01DABC10 */ .space 0x2C

/* Automatically generated and unreferenced pad */
glabel D_01DABC3C
    /* 01DABC3C */ .space 0x04

glabel NameSelect
    /* 01DABC40 */ .space 0x2C

/* Automatically generated and unreferenced pad */
glabel D_01DABC6C
    /* 01DABC6C */ .space 0x04

glabel OpenBook
    /* 01DABC70 */ .space 0x0E

/* Automatically generated and unreferenced pad */
glabel D_01DABC7E
    /* 01DABC7E */ .space 0x02

glabel Alpha
    /* 01DABC80 */ .space 0x14

glabel errno
    /* 01DABC94 */ .space 0x04

/* Automatically generated and unreferenced pad */
glabel D_01DABC98
    /* 01DABC98 */ .space 0x68
