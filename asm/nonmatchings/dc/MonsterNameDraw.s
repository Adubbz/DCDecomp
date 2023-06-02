.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MonsterNameDraw__Fv
/* 10EF70 0020EE70 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 10EF74 0020EE74 0000BF7F */  sq         $31, 0x0($sp)
/* 10EF78 0020EE78 1896838F */  lw         $3, -0x69E8($gp)
/* 10EF7C 0020EE7C 05006010 */  beqz       $3, .L0020EE94
/* 10EF80 0020EE80 00000000 */   nop
/* 10EF84 0020EE84 DC3A080C */  jal        GetMonsterNameDrawFlag__Fv
/* 10EF88 0020EE88 00000000 */   nop
/* 10EF8C 0020EE8C 03004014 */  bnez       $2, .L0020EE9C
/* 10EF90 0020EE90 00000000 */   nop
.L0020EE94:
/* 10EF94 0020EE94 37000010 */  b          .L0020EF74
/* 10EF98 0020EE98 00000000 */   nop
.L0020EE9C:
/* 10EF9C 0020EE9C 1C8D848F */  lw         $4, -0x72E4($gp)
/* 10EFA0 0020EEA0 CC5E050C */  jal        GetConfigData__9CSaveDataFv
/* 10EFA4 0020EEA4 00000000 */   nop
/* 10EFA8 0020EEA8 2000438C */  lw         $3, 0x20($2)
/* 10EFAC 0020EEAC 31006014 */  bnez       $3, .L0020EF74
/* 10EFB0 0020EEB0 00000000 */   nop
/* 10EFB4 0020EEB4 1896848F */  lw         $4, -0x69E8($gp)
/* 10EFB8 0020EEB8 BC16838C */  lw         $3, 0x16BC($4)
/* 10EFBC 0020EEBC 2D006004 */  bltz       $3, .L0020EF74
/* 10EFC0 0020EEC0 00000000 */   nop
/* 10EFC4 0020EEC4 1800838C */  lw         $3, 0x18($4)
/* 10EFC8 0020EEC8 0800828C */  lw         $2, 0x8($4)
/* 10EFCC 0020EECC 18104300 */  mult       $2, $2, $3
/* 10EFD0 0020EED0 20004324 */  addiu      $3, $2, 0x20
/* 10EFD4 0020EED4 0000858C */  lw         $5, 0x0($4)
/* 10EFD8 0020EED8 2200A228 */  slti       $2, $5, 0x22
/* 10EFDC 0020EEDC 11004014 */  bnez       $2, .L0020EF24
/* 10EFE0 0020EEE0 00000000 */   nop
/* 10EFE4 0020EEE4 6D02A128 */  slti       $at, $5, 0x26D
/* 10EFE8 0020EEE8 0E002010 */  beqz       $at, .L0020EF24
/* 10EFEC 0020EEEC 00000000 */   nop
/* 10EFF0 0020EEF0 0400858C */  lw         $5, 0x4($4)
/* 10EFF4 0020EEF4 1E00A228 */  slti       $2, $5, 0x1E
/* 10EFF8 0020EEF8 0A004014 */  bnez       $2, .L0020EF24
/* 10EFFC 0020EEFC 00000000 */   nop
/* 10F000 0020EF00 9901A128 */  slti       $at, $5, 0x199
/* 10F004 0020EF04 07002010 */  beqz       $at, .L0020EF24
/* 10F008 0020EF08 00000000 */   nop
/* 10F00C 0020EF0C FB006128 */  slti       $at, $3, 0xFB
/* 10F010 0020EF10 04002010 */  beqz       $at, .L0020EF24
/* 10F014 0020EF14 00000000 */   nop
/* 10F018 0020EF18 0A006128 */  slti       $at, $3, 0xA
/* 10F01C 0020EF1C 06002010 */  beqz       $at, .L0020EF38
/* 10F020 0020EF20 00000000 */   nop
.L0020EF24:
/* 10F024 0020EF24 28260070 */  paddub     $4, $0, $0
/* 10F028 0020EF28 D83A080C */  jal        SetMonsterNameDrawFlag__Fi
/* 10F02C 0020EF2C 00000000 */   nop
/* 10F030 0020EF30 10000010 */  b          .L0020EF74
/* 10F034 0020EF34 00000000 */   nop
.L0020EF38:
/* 10F038 0020EF38 FFFF0224 */  addiu      $2, $0, -0x1
/* 10F03C 0020EF3C 401782AC */  sw         $2, 0x1740($4)
/* 10F040 0020EF40 1896828F */  lw         $2, -0x69E8($gp)
/* 10F044 0020EF44 4C17448C */  lw         $4, 0x174C($2)
/* 10F048 0020EF48 38B4080C */  jal        MenuTextureReload__Fi
/* 10F04C 0020EF4C 00000000 */   nop
/* 10F050 0020EF50 28260070 */  paddub     $4, $0, $0
/* 10F054 0020EF54 046F050C */  jal        setbilinear__Fi
/* 10F058 0020EF58 00000000 */   nop
/* 10F05C 0020EF5C 1896848F */  lw         $4, -0x69E8($gp)
/* 10F060 0020EF60 6437050C */  jal        Step__6ClsMesFv
/* 10F064 0020EF64 00000000 */   nop
/* 10F068 0020EF68 1896848F */  lw         $4, -0x69E8($gp)
/* 10F06C 0020EF6C C44C050C */  jal        DrawMesWin__6ClsMesFv
/* 10F070 0020EF70 00000000 */   nop
.L0020EF74:
/* 10F074 0020EF74 0000BF7B */  lq         $31, 0x0($sp)
/* 10F078 0020EF78 1000BD27 */  addiu      $sp, $sp, 0x10
/* 10F07C 0020EF7C 0800E003 */  jr         $31
/* 10F080 0020EF80 00000000 */   nop
/* 10F084 0020EF84 00000000 */  nop
/* 10F088 0020EF88 00000000 */  nop
/* 10F08C 0020EF8C 00000000 */  nop
