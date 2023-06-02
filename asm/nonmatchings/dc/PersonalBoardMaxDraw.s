.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PersonalBoardMaxDraw__FiiiP8CTexturei
/* 130AC0 002309C0 40FFBD27 */  addiu      $sp, $sp, -0xC0
/* 130AC4 002309C4 7000BF7F */  sq         $31, 0x70($sp)
/* 130AC8 002309C8 6000B67F */  sq         $22, 0x60($sp)
/* 130ACC 002309CC 5000B57F */  sq         $21, 0x50($sp)
/* 130AD0 002309D0 4000B47F */  sq         $20, 0x40($sp)
/* 130AD4 002309D4 3000B37F */  sq         $19, 0x30($sp)
/* 130AD8 002309D8 2000B27F */  sq         $18, 0x20($sp)
/* 130ADC 002309DC 1000B17F */  sq         $17, 0x10($sp)
/* 130AE0 002309E0 0000B07F */  sq         $16, 0x0($sp)
/* 130AE4 002309E4 28AE8070 */  paddub     $21, $4, $0
/* 130AE8 002309E8 28A6A070 */  paddub     $20, $5, $0
/* 130AEC 002309EC 289EC070 */  paddub     $19, $6, $0
/* 130AF0 002309F0 2896E070 */  paddub     $18, $7, $0
/* 130AF4 002309F4 28B60071 */  paddub     $22, $8, $0
/* 130AF8 002309F8 D2009026 */  addiu      $16, $20, 0xD2
/* 130AFC 002309FC D8FF7126 */  addiu      $17, $19, -0x28
/* 130B00 00230A00 00010224 */  addiu      $2, $0, 0x100
/* 130B04 00230A04 A000A2AF */  sw         $2, 0xA0($sp)
/* 130B08 00230A08 90000224 */  addiu      $2, $0, 0x90
/* 130B0C 00230A0C A400A2AF */  sw         $2, 0xA4($sp)
/* 130B10 00230A10 30000324 */  addiu      $3, $0, 0x30
/* 130B14 00230A14 A800A3AF */  sw         $3, 0xA8($sp)
/* 130B18 00230A18 AC00A3AF */  sw         $3, 0xAC($sp)
/* 130B1C 00230A1C 9000B0AF */  sw         $16, 0x90($sp)
/* 130B20 00230A20 01002226 */  addiu      $2, $17, 0x1
/* 130B24 00230A24 9400A2AF */  sw         $2, 0x94($sp)
/* 130B28 00230A28 9800A3AF */  sw         $3, 0x98($sp)
/* 130B2C 00230A2C 2F000224 */  addiu      $2, $0, 0x2F
/* 130B30 00230A30 9C00A2AF */  sw         $2, 0x9C($sp)
/* 130B34 00230A34 28264072 */  paddub     $4, $18, $0
/* 130B38 00230A38 9000A527 */  addiu      $5, $sp, 0x90
/* 130B3C 00230A3C A000A627 */  addiu      $6, $sp, 0xA0
/* 130B40 00230A40 283EC072 */  paddub     $7, $22, $0
/* 130B44 00230A44 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 130B48 00230A48 00000000 */   nop
/* 130B4C 00230A4C 2900023C */  lui        $2, %hi(_1521_2)
/* 130B50 00230A50 D0554224 */  addiu      $2, $2, %lo(_1521_2)
/* 130B54 00230A54 8000A327 */  addiu      $3, $sp, 0x80
/* 130B58 00230A58 00004278 */  lq         $2, 0x0($2)
/* 130B5C 00230A5C 0000627C */  sq         $2, 0x0($3)
/* 130B60 00230A60 F7009026 */  addiu      $16, $20, 0xF7
/* 130B64 00230A64 F2FF7126 */  addiu      $17, $19, -0xE
/* 130B68 00230A68 A897828F */  lw         $2, -0x6858($gp)
/* 130B6C 00230A6C 0000438C */  lw         $3, 0x0($2)
/* 130B70 00230A70 02000224 */  addiu      $2, $0, 0x2
/* 130B74 00230A74 02006214 */  bne        $3, $2, .L00230A80
/* 130B78 00230A78 00000000 */   nop
/* 130B7C 00230A7C 02001026 */  addiu      $16, $16, 0x2
.L00230A80:
/* 130B80 00230A80 2826A072 */  paddub     $4, $21, $0
/* 130B84 00230A84 282E0072 */  paddub     $5, $16, $0
/* 130B88 00230A88 28362072 */  paddub     $6, $17, $0
/* 130B8C 00230A8C 283E4072 */  paddub     $7, $18, $0
/* 130B90 00230A90 8000A827 */  addiu      $8, $sp, 0x80
/* 130B94 00230A94 01000924 */  addiu      $9, $0, 0x1
/* 130B98 00230A98 2856C072 */  paddub     $10, $22, $0
/* 130B9C 00230A9C 705F080C */  jal        DrawMenuNumber__FiiiP8CTexture4RECTii
/* 130BA0 00230AA0 00000000 */   nop
/* 130BA4 00230AA4 F4009026 */  addiu      $16, $20, 0xF4
/* 130BA8 00230AA8 DEFF7126 */  addiu      $17, $19, -0x22
/* 130BAC 00230AAC 289E0070 */  paddub     $19, $0, $0
/* 130BB0 00230AB0 BC00A0AF */  sw         $0, 0xBC($sp)
/* 130BB4 00230AB4 A897858F */  lw         $5, -0x6858($gp)
/* 130BB8 00230AB8 0400A48C */  lw         $4, 0x4($5)
/* 130BBC 00230ABC 0900812C */  sltiu      $at, $4, 0x9
/* 130BC0 00230AC0 32002010 */  beqz       $at, .L00230B8C
/* 130BC4 00230AC4 00000000 */   nop
/* 130BC8 00230AC8 2A00023C */  lui        $2, %hi(_1559_2)
/* 130BCC 00230ACC 30F24324 */  addiu      $3, $2, %lo(_1559_2)
/* 130BD0 00230AD0 80100400 */  sll        $2, $4, 2
/* 130BD4 00230AD4 21104300 */  addu       $2, $2, $3
/* 130BD8 00230AD8 0000428C */  lw         $2, 0x0($2)
/* 130BDC 00230ADC 08004000 */  jr         $2
/* 130BE0 00230AE0 00000000 */   nop
/* 130BE4 00230AE4 BC00A527 */  addiu      $5, $sp, 0xBC
/* 130BE8 00230AE8 A4C8080C */  jal        GetNowModeMaxNum__FiPi
/* 130BEC 00230AEC 00000000 */   nop
/* 130BF0 00230AF0 289E4070 */  paddub     $19, $2, $0
/* 130BF4 00230AF4 A897828F */  lw         $2, -0x6858($gp)
/* 130BF8 00230AF8 40004484 */  lh         $4, 0x40($2)
/* 130BFC 00230AFC 51008228 */  slti       $2, $4, 0x51
/* 130C00 00230B00 08004014 */  bnez       $2, .L00230B24
/* 130C04 00230B04 00000000 */   nop
/* 130C08 00230B08 88C7080C */  jal        WhatIsKindofItem__Fi
/* 130C0C 00230B0C 00000000 */   nop
/* 130C10 00230B10 A897838F */  lw         $3, -0x6858($gp)
/* 130C14 00230B14 0400638C */  lw         $3, 0x4($3)
/* 130C18 00230B18 02004314 */  bne        $2, $3, .L00230B24
/* 130C1C 00230B1C 00000000 */   nop
/* 130C20 00230B20 01007326 */  addiu      $19, $19, 0x1
.L00230B24:
/* 130C24 00230B24 2A08B302 */  slt        $at, $21, $19
/* 130C28 00230B28 18002010 */  beqz       $at, .L00230B8C
/* 130C2C 00230B2C 00000000 */   nop
/* 130C30 00230B30 01000224 */  addiu      $2, $0, 0x1
/* 130C34 00230B34 BC00A2AF */  sw         $2, 0xBC($sp)
/* 130C38 00230B38 14000010 */  b          .L00230B8C
/* 130C3C 00230B3C 00000000 */   nop
/* 130C40 00230B40 28260070 */  paddub     $4, $0, $0
/* 130C44 00230B44 09000010 */  b          .L00230B6C
/* 130C48 00230B48 00000000 */   nop
.L00230B4C:
/* 130C4C 00230B4C 40180400 */  sll        $3, $4, 1
/* 130C50 00230B50 2C00A28C */  lw         $2, 0x2C($5)
/* 130C54 00230B54 21104300 */  addu       $2, $2, $3
/* 130C58 00230B58 00004284 */  lh         $2, 0x0($2)
/* 130C5C 00230B5C 02004004 */  bltz       $2, .L00230B68
/* 130C60 00230B60 00000000 */   nop
/* 130C64 00230B64 01007326 */  addiu      $19, $19, 0x1
.L00230B68:
/* 130C68 00230B68 01008424 */  addiu      $4, $4, 0x1
.L00230B6C:
/* 130C6C 00230B6C 2A109500 */  slt        $2, $4, $21
/* 130C70 00230B70 F6FF4014 */  bnez       $2, .L00230B4C
/* 130C74 00230B74 00000000 */   nop
/* 130C78 00230B78 4000A284 */  lh         $2, 0x40($5)
/* 130C7C 00230B7C 2A084000 */  slt        $at, $2, $0
/* 130C80 00230B80 02002014 */  bnez       $at, .L00230B8C
/* 130C84 00230B84 00000000 */   nop
/* 130C88 00230B88 01007326 */  addiu      $19, $19, 0x1
.L00230B8C:
/* 130C8C 00230B8C BC00A28F */  lw         $2, 0xBC($sp)
/* 130C90 00230B90 05004010 */  beqz       $2, .L00230BA8
/* 130C94 00230B94 00000000 */   nop
/* 130C98 00230B98 8400A38F */  lw         $3, 0x84($sp)
/* 130C9C 00230B9C 8C00A28F */  lw         $2, 0x8C($sp)
/* 130CA0 00230BA0 21106200 */  addu       $2, $3, $2
/* 130CA4 00230BA4 8400A2AF */  sw         $2, 0x84($sp)
.L00230BA8:
/* 130CA8 00230BA8 28266072 */  paddub     $4, $19, $0
/* 130CAC 00230BAC 282E0072 */  paddub     $5, $16, $0
/* 130CB0 00230BB0 28362072 */  paddub     $6, $17, $0
/* 130CB4 00230BB4 283E4072 */  paddub     $7, $18, $0
/* 130CB8 00230BB8 8000A827 */  addiu      $8, $sp, 0x80
/* 130CBC 00230BBC 01000924 */  addiu      $9, $0, 0x1
/* 130CC0 00230BC0 2856C072 */  paddub     $10, $22, $0
/* 130CC4 00230BC4 705F080C */  jal        DrawMenuNumber__FiiiP8CTexture4RECTii
/* 130CC8 00230BC8 00000000 */   nop
/* 130CCC 00230BCC 7000BF7B */  lq         $31, 0x70($sp)
/* 130CD0 00230BD0 6000B67B */  lq         $22, 0x60($sp)
/* 130CD4 00230BD4 5000B57B */  lq         $21, 0x50($sp)
/* 130CD8 00230BD8 4000B47B */  lq         $20, 0x40($sp)
/* 130CDC 00230BDC 3000B37B */  lq         $19, 0x30($sp)
/* 130CE0 00230BE0 2000B27B */  lq         $18, 0x20($sp)
/* 130CE4 00230BE4 1000B17B */  lq         $17, 0x10($sp)
/* 130CE8 00230BE8 0000B07B */  lq         $16, 0x0($sp)
/* 130CEC 00230BEC C000BD27 */  addiu      $sp, $sp, 0xC0
/* 130CF0 00230BF0 0800E003 */  jr         $31
/* 130CF4 00230BF4 00000000 */   nop
/* 130CF8 00230BF8 00000000 */  nop
/* 130CFC 00230BFC 00000000 */  nop