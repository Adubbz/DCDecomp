.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _DRAW_SPRITE__FP12RS_STACKDATAi
/* 92FA0 00192EA0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 92FA4 00192EA4 4000BF7F */  sq         $31, 0x40($sp)
/* 92FA8 00192EA8 3000B37F */  sq         $19, 0x30($sp)
/* 92FAC 00192EAC 2000B27F */  sq         $18, 0x20($sp)
/* 92FB0 00192EB0 1000B17F */  sq         $17, 0x10($sp)
/* 92FB4 00192EB4 0000B07F */  sq         $16, 0x0($sp)
/* 92FB8 00192EB8 08009324 */  addiu      $19, $4, 0x8
/* 92FBC 00192EBC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 92FC0 00192EC0 00000000 */   nop
/* 92FC4 00192EC4 28864070 */  paddub     $16, $2, $0
/* 92FC8 00192EC8 28266072 */  paddub     $4, $19, $0
/* 92FCC 00192ECC 08009324 */  addiu      $19, $4, 0x8
/* 92FD0 00192ED0 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 92FD4 00192ED4 00000000 */   nop
/* 92FD8 00192ED8 288E4070 */  paddub     $17, $2, $0
/* 92FDC 00192EDC 28266072 */  paddub     $4, $19, $0
/* 92FE0 00192EE0 08009324 */  addiu      $19, $4, 0x8
/* 92FE4 00192EE4 F428060C */  jal        GetStackString__FP12RS_STACKDATA
/* 92FE8 00192EE8 00000000 */   nop
/* 92FEC 00192EEC 28964070 */  paddub     $18, $2, $0
/* 92FF0 00192EF0 28266072 */  paddub     $4, $19, $0
/* 92FF4 00192EF4 08009324 */  addiu      $19, $4, 0x8
/* 92FF8 00192EF8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 92FFC 00192EFC 00000000 */   nop
/* 93000 00192F00 5000A2AF */  sw         $2, 0x50($sp)
/* 93004 00192F04 28266072 */  paddub     $4, $19, $0
/* 93008 00192F08 08009324 */  addiu      $19, $4, 0x8
/* 9300C 00192F0C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93010 00192F10 00000000 */   nop
/* 93014 00192F14 5400A2AF */  sw         $2, 0x54($sp)
/* 93018 00192F18 28266072 */  paddub     $4, $19, $0
/* 9301C 00192F1C 08009324 */  addiu      $19, $4, 0x8
/* 93020 00192F20 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93024 00192F24 00000000 */   nop
/* 93028 00192F28 5800A2AF */  sw         $2, 0x58($sp)
/* 9302C 00192F2C 28266072 */  paddub     $4, $19, $0
/* 93030 00192F30 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93034 00192F34 00000000 */   nop
/* 93038 00192F38 5C00A2AF */  sw         $2, 0x5C($sp)
/* 9303C 00192F3C C701023C */  lui        $2, %hi(TexManager)
/* 93040 00192F40 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 93044 00192F44 282E4072 */  paddub     $5, $18, $0
/* 93048 00192F48 FFFF0624 */  addiu      $6, $0, -0x1
/* 9304C 00192F4C B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 93050 00192F50 00000000 */   nop
/* 93054 00192F54 04004014 */  bnez       $2, .L00192F68
/* 93058 00192F58 00000000 */   nop
/* 9305C 00192F5C 28160070 */  paddub     $2, $0, $0
/* 93060 00192F60 0C000010 */  b          .L00192F94
/* 93064 00192F64 00000000 */   nop
.L00192F68:
/* 93068 00192F68 28004724 */  addiu      $7, $2, 0x28
/* 9306C 00192F6C D501023C */  lui        $2, %hi(SpriteTable)
/* 93070 00192F70 708E4424 */  addiu      $4, $2, %lo(SpriteTable)
/* 93074 00192F74 282E0072 */  paddub     $5, $16, $0
/* 93078 00192F78 28362072 */  paddub     $6, $17, $0
/* 9307C 00192F7C 5000A827 */  addiu      $8, $sp, 0x50
/* 93080 00192F80 284E0070 */  paddub     $9, $0, $0
/* 93084 00192F84 28560070 */  paddub     $10, $0, $0
/* 93088 00192F88 FCAF040C */  jal        AddTable__12CSpriteTableFiiP9sceGsTex0P4RECTii
/* 9308C 00192F8C 00000000 */   nop
/* 93090 00192F90 01000224 */  addiu      $2, $0, 0x1
.L00192F94:
/* 93094 00192F94 4000BF7B */  lq         $31, 0x40($sp)
/* 93098 00192F98 3000B37B */  lq         $19, 0x30($sp)
/* 9309C 00192F9C 2000B27B */  lq         $18, 0x20($sp)
/* 930A0 00192FA0 1000B17B */  lq         $17, 0x10($sp)
/* 930A4 00192FA4 0000B07B */  lq         $16, 0x0($sp)
/* 930A8 00192FA8 6000BD27 */  addiu      $sp, $sp, 0x60
/* 930AC 00192FAC 0800E003 */  jr         $31
/* 930B0 00192FB0 00000000 */   nop
/* 930B4 00192FB4 00000000 */  nop
/* 930B8 00192FB8 00000000 */  nop
/* 930BC 00192FBC 00000000 */  nop
