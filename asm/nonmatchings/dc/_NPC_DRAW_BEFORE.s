.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _NPC_DRAW_BEFORE__FP12RS_STACKDATAi
/* 8F310 0018F210 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 8F314 0018F214 4000BF7F */  sq         $31, 0x40($sp)
/* 8F318 0018F218 3000B37F */  sq         $19, 0x30($sp)
/* 8F31C 0018F21C 2000B27F */  sq         $18, 0x20($sp)
/* 8F320 0018F220 1000B17F */  sq         $17, 0x10($sp)
/* 8F324 0018F224 0000B07F */  sq         $16, 0x0($sp)
/* 8F328 0018F228 2896A070 */  paddub     $18, $5, $0
/* 8F32C 0018F22C 08009324 */  addiu      $19, $4, 0x8
/* 8F330 0018F230 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8F334 0018F234 00000000 */   nop
/* 8F338 0018F238 28864070 */  paddub     $16, $2, $0
/* 8F33C 0018F23C 288E0070 */  paddub     $17, $0, $0
/* 8F340 0018F240 0D000010 */  b          .L0018F278
/* 8F344 0018F244 00000000 */   nop
.L0018F248:
/* 8F348 0018F248 28266072 */  paddub     $4, $19, $0
/* 8F34C 0018F24C 08009324 */  addiu      $19, $4, 0x8
/* 8F350 0018F250 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8F354 0018F254 00000000 */   nop
/* 8F358 0018F258 06004004 */  bltz       $2, .L0018F274
/* 8F35C 0018F25C 00000000 */   nop
/* 8F360 0018F260 80180200 */  sll        $3, $2, 2
/* 8F364 0018F264 D401023C */  lui        $2, %hi(D_1D3D384)
/* 8F368 0018F268 84D34224 */  addiu      $2, $2, %lo(D_1D3D384)
/* 8F36C 0018F26C 21104300 */  addu       $2, $2, $3
/* 8F370 0018F270 000050AC */  sw         $16, 0x0($2)
.L0018F274:
/* 8F374 0018F274 01003126 */  addiu      $17, $17, 0x1
.L0018F278:
/* 8F378 0018F278 FFFF4226 */  addiu      $2, $18, -0x1
/* 8F37C 0018F27C 2A102202 */  slt        $2, $17, $2
/* 8F380 0018F280 F1FF4014 */  bnez       $2, .L0018F248
/* 8F384 0018F284 00000000 */   nop
/* 8F388 0018F288 01000224 */  addiu      $2, $0, 0x1
/* 8F38C 0018F28C 4000BF7B */  lq         $31, 0x40($sp)
/* 8F390 0018F290 3000B37B */  lq         $19, 0x30($sp)
/* 8F394 0018F294 2000B27B */  lq         $18, 0x20($sp)
/* 8F398 0018F298 1000B17B */  lq         $17, 0x10($sp)
/* 8F39C 0018F29C 0000B07B */  lq         $16, 0x0($sp)
/* 8F3A0 0018F2A0 5000BD27 */  addiu      $sp, $sp, 0x50
/* 8F3A4 0018F2A4 0800E003 */  jr         $31
/* 8F3A8 0018F2A8 00000000 */   nop
/* 8F3AC 0018F2AC 00000000 */  nop
