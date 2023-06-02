.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _DRAW_BG_SPRITE__FP12RS_STACKDATAi
/* 930C0 00192FC0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 930C4 00192FC4 4000BF7F */  sq         $31, 0x40($sp)
/* 930C8 00192FC8 3000B37F */  sq         $19, 0x30($sp)
/* 930CC 00192FCC 2000B27F */  sq         $18, 0x20($sp)
/* 930D0 00192FD0 1000B17F */  sq         $17, 0x10($sp)
/* 930D4 00192FD4 0000B07F */  sq         $16, 0x0($sp)
/* 930D8 00192FD8 08009324 */  addiu      $19, $4, 0x8
/* 930DC 00192FDC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 930E0 00192FE0 00000000 */   nop
/* 930E4 00192FE4 28864070 */  paddub     $16, $2, $0
/* 930E8 00192FE8 28266072 */  paddub     $4, $19, $0
/* 930EC 00192FEC 08009324 */  addiu      $19, $4, 0x8
/* 930F0 00192FF0 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 930F4 00192FF4 00000000 */   nop
/* 930F8 00192FF8 288E4070 */  paddub     $17, $2, $0
/* 930FC 00192FFC 28266072 */  paddub     $4, $19, $0
/* 93100 00193000 08009324 */  addiu      $19, $4, 0x8
/* 93104 00193004 F428060C */  jal        GetStackString__FP12RS_STACKDATA
/* 93108 00193008 00000000 */   nop
/* 9310C 0019300C 28964070 */  paddub     $18, $2, $0
/* 93110 00193010 28266072 */  paddub     $4, $19, $0
/* 93114 00193014 08009324 */  addiu      $19, $4, 0x8
/* 93118 00193018 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 9311C 0019301C 00000000 */   nop
/* 93120 00193020 5000A2AF */  sw         $2, 0x50($sp)
/* 93124 00193024 28266072 */  paddub     $4, $19, $0
/* 93128 00193028 08009324 */  addiu      $19, $4, 0x8
/* 9312C 0019302C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93130 00193030 00000000 */   nop
/* 93134 00193034 5400A2AF */  sw         $2, 0x54($sp)
/* 93138 00193038 28266072 */  paddub     $4, $19, $0
/* 9313C 0019303C 08009324 */  addiu      $19, $4, 0x8
/* 93140 00193040 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93144 00193044 00000000 */   nop
/* 93148 00193048 5800A2AF */  sw         $2, 0x58($sp)
/* 9314C 0019304C 28266072 */  paddub     $4, $19, $0
/* 93150 00193050 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93154 00193054 00000000 */   nop
/* 93158 00193058 5C00A2AF */  sw         $2, 0x5C($sp)
/* 9315C 0019305C C701023C */  lui        $2, %hi(TexManager)
/* 93160 00193060 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 93164 00193064 282E4072 */  paddub     $5, $18, $0
/* 93168 00193068 FFFF0624 */  addiu      $6, $0, -0x1
/* 9316C 0019306C B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 93170 00193070 00000000 */   nop
/* 93174 00193074 04004014 */  bnez       $2, .L00193088
/* 93178 00193078 00000000 */   nop
/* 9317C 0019307C 28160070 */  paddub     $2, $0, $0
/* 93180 00193080 0C000010 */  b          .L001930B4
/* 93184 00193084 00000000 */   nop
.L00193088:
/* 93188 00193088 28004724 */  addiu      $7, $2, 0x28
/* 9318C 0019308C D501023C */  lui        $2, %hi(SpriteTableBack)
/* 93190 00193090 108F4424 */  addiu      $4, $2, %lo(SpriteTableBack)
/* 93194 00193094 282E0072 */  paddub     $5, $16, $0
/* 93198 00193098 28362072 */  paddub     $6, $17, $0
/* 9319C 0019309C 5000A827 */  addiu      $8, $sp, 0x50
/* 931A0 001930A0 284E0070 */  paddub     $9, $0, $0
/* 931A4 001930A4 28560070 */  paddub     $10, $0, $0
/* 931A8 001930A8 FCAF040C */  jal        AddTable__12CSpriteTableFiiP9sceGsTex0P4RECTii
/* 931AC 001930AC 00000000 */   nop
/* 931B0 001930B0 01000224 */  addiu      $2, $0, 0x1
.L001930B4:
/* 931B4 001930B4 4000BF7B */  lq         $31, 0x40($sp)
/* 931B8 001930B8 3000B37B */  lq         $19, 0x30($sp)
/* 931BC 001930BC 2000B27B */  lq         $18, 0x20($sp)
/* 931C0 001930C0 1000B17B */  lq         $17, 0x10($sp)
/* 931C4 001930C4 0000B07B */  lq         $16, 0x0($sp)
/* 931C8 001930C8 6000BD27 */  addiu      $sp, $sp, 0x60
/* 931CC 001930CC 0800E003 */  jr         $31
/* 931D0 001930D0 00000000 */   nop
/* 931D4 001930D4 00000000 */  nop
/* 931D8 001930D8 00000000 */  nop
/* 931DC 001930DC 00000000 */  nop
