.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExitMenuOption__Fv
/* 11E880 0021E780 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 11E884 0021E784 1000BF7F */  sq         $31, 0x10($sp)
/* 11E888 0021E788 0000B07F */  sq         $16, 0x0($sp)
/* 11E88C 0021E78C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11E890 0021E790 408A228C */  lw         $2, -0x75C0($at)
/* 11E894 0021E794 15004014 */  bnez       $2, .L0021E7EC
/* 11E898 0021E798 00000000 */   nop
/* 11E89C 0021E79C CC01023C */  lui        $2, %hi(GamePad)
/* 11E8A0 0021E7A0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11E8A4 0021E7A4 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* 11E8A8 0021E7A8 00000000 */   nop
/* 11E8AC 0021E7AC CC01023C */  lui        $2, %hi(GamePad)
/* 11E8B0 0021E7B0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11E8B4 0021E7B4 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* 11E8B8 0021E7B8 00000000 */   nop
/* 11E8BC 0021E7BC CC01023C */  lui        $2, %hi(GamePad)
/* 11E8C0 0021E7C0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11E8C4 0021E7C4 00500524 */  addiu      $5, $0, 0x5000
/* 11E8C8 0021E7C8 1E000624 */  addiu      $6, $0, 0x1E
/* 11E8CC 0021E7CC 09000724 */  addiu      $7, $0, 0x9
/* 11E8D0 0021E7D0 58AD040C */  jal        SetAutoRepeat__8CGamePadFiii
/* 11E8D4 0021E7D4 00000000 */   nop
/* 11E8D8 0021E7D8 CC01023C */  lui        $2, %hi(GamePad)
/* 11E8DC 0021E7DC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11E8E0 0021E7E0 78000524 */  addiu      $5, $0, 0x78
/* 11E8E4 0021E7E4 48AE040C */  jal        MenuModeOn__8CGamePadFi
/* 11E8E8 0021E7E8 00000000 */   nop
.L0021E7EC:
/* 11E8EC 0021E7EC 1C8D848F */  lw         $4, -0x72E4($gp)
/* 11E8F0 0021E7F0 7860050C */  jal        GetDngStatus__9CSaveDataFv
/* 11E8F4 0021E7F4 00000000 */   nop
/* 11E8F8 0021E7F8 28864070 */  paddub     $16, $2, $0
/* 11E8FC 0021E7FC 1C8D848F */  lw         $4, -0x72E4($gp)
/* 11E900 0021E800 D05E050C */  jal        GetMenuCursor__9CSaveDataFv
/* 11E904 0021E804 00000000 */   nop
/* 11E908 0021E808 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11E90C 0021E80C 648A238C */  lw         $3, -0x759C($at)
/* 11E910 0021E810 000043A4 */  sh         $3, 0x0($2)
/* 11E914 0021E814 00004384 */  lh         $3, 0x0($2)
/* 11E918 0021E818 04006010 */  beqz       $3, .L0021E82C
/* 11E91C 0021E81C 00000000 */   nop
/* 11E920 0021E820 28264070 */  paddub     $4, $2, $0
/* 11E924 0021E824 B862050C */  jal        InitPos__11CMenuCursorFv
/* 11E928 0021E828 00000000 */   nop
.L0021E82C:
/* 11E92C 0021E82C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11E930 0021E830 688A238C */  lw         $3, -0x7598($at)
/* 11E934 0021E834 1497828F */  lw         $2, -0x68EC($gp)
/* 11E938 0021E838 1C0043AC */  sw         $3, 0x1C($2)
/* 11E93C 0021E83C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11E940 0021E840 6C8A238C */  lw         $3, -0x7594($at)
/* 11E944 0021E844 1497828F */  lw         $2, -0x68EC($gp)
/* 11E948 0021E848 100043AC */  sw         $3, 0x10($2)
/* 11E94C 0021E84C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11E950 0021E850 708A238C */  lw         $3, -0x7590($at)
/* 11E954 0021E854 1497828F */  lw         $2, -0x68EC($gp)
/* 11E958 0021E858 140043AC */  sw         $3, 0x14($2)
/* 11E95C 0021E85C 1497828F */  lw         $2, -0x68EC($gp)
/* 11E960 0021E860 1400438C */  lw         $3, 0x14($2)
/* 11E964 0021E864 282E0070 */  paddub     $5, $0, $0
/* 11E968 0021E868 01000224 */  addiu      $2, $0, 0x1
/* 11E96C 0021E86C 0A284300 */  movz       $5, $2, $3
/* 11E970 0021E870 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 11E974 0021E874 641A050C */  jal        SetStereoMode__6CSoundFi
/* 11E978 0021E878 00000000 */   nop
/* 11E97C 0021E87C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11E980 0021E880 748A248C */  lw         $4, -0x758C($at)
/* 11E984 0021E884 1497838F */  lw         $3, -0x68EC($gp)
/* 11E988 0021E888 080064AC */  sw         $4, 0x8($3)
/* 11E98C 0021E88C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11E990 0021E890 788A248C */  lw         $4, -0x7588($at)
/* 11E994 0021E894 1497838F */  lw         $3, -0x68EC($gp)
/* 11E998 0021E898 0C0064AC */  sw         $4, 0xC($3)
/* 11E99C 0021E89C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11E9A0 0021E8A0 7C8A238C */  lw         $3, -0x7584($at)
/* 11E9A4 0021E8A4 3C4303AE */  sw         $3, 0x433C($16)
/* 11E9A8 0021E8A8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11E9AC 0021E8AC 808A248C */  lw         $4, -0x7580($at)
/* 11E9B0 0021E8B0 1497838F */  lw         $3, -0x68EC($gp)
/* 11E9B4 0021E8B4 280064AC */  sw         $4, 0x28($3)
/* 11E9B8 0021E8B8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11E9BC 0021E8BC 848A248C */  lw         $4, -0x757C($at)
/* 11E9C0 0021E8C0 1497838F */  lw         $3, -0x68EC($gp)
/* 11E9C4 0021E8C4 240064AC */  sw         $4, 0x24($3)
/* 11E9C8 0021E8C8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11E9CC 0021E8CC 888A248C */  lw         $4, -0x7578($at)
/* 11E9D0 0021E8D0 1497838F */  lw         $3, -0x68EC($gp)
/* 11E9D4 0021E8D4 2C0064AC */  sw         $4, 0x2C($3)
/* 11E9D8 0021E8D8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11E9DC 0021E8DC 8C8A248C */  lw         $4, -0x7574($at)
/* 11E9E0 0021E8E0 1497838F */  lw         $3, -0x68EC($gp)
/* 11E9E4 0021E8E4 200064AC */  sw         $4, 0x20($3)
/* 11E9E8 0021E8E8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11E9EC 0021E8EC 908A248C */  lw         $4, -0x7570($at)
/* 11E9F0 0021E8F0 1497838F */  lw         $3, -0x68EC($gp)
/* 11E9F4 0021E8F4 180064AC */  sw         $4, 0x18($3)
/* 11E9F8 0021E8F8 1000BF7B */  lq         $31, 0x10($sp)
/* 11E9FC 0021E8FC 0000B07B */  lq         $16, 0x0($sp)
/* 11EA00 0021E900 2000BD27 */  addiu      $sp, $sp, 0x20
/* 11EA04 0021E904 0800E003 */  jr         $31
/* 11EA08 0021E908 00000000 */   nop
/* 11EA0C 0021E90C 00000000 */  nop
