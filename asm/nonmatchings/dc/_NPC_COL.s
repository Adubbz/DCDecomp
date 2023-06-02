.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _NPC_COL__FP12RS_STACKDATAi
/* 8F1B0 0018F0B0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 8F1B4 0018F0B4 4000BF7F */  sq         $31, 0x40($sp)
/* 8F1B8 0018F0B8 3000B37F */  sq         $19, 0x30($sp)
/* 8F1BC 0018F0BC 2000B27F */  sq         $18, 0x20($sp)
/* 8F1C0 0018F0C0 1000B17F */  sq         $17, 0x10($sp)
/* 8F1C4 0018F0C4 0000B07F */  sq         $16, 0x0($sp)
/* 8F1C8 0018F0C8 2896A070 */  paddub     $18, $5, $0
/* 8F1CC 0018F0CC 08009324 */  addiu      $19, $4, 0x8
/* 8F1D0 0018F0D0 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8F1D4 0018F0D4 00000000 */   nop
/* 8F1D8 0018F0D8 28864070 */  paddub     $16, $2, $0
/* 8F1DC 0018F0DC 288E0070 */  paddub     $17, $0, $0
/* 8F1E0 0018F0E0 12000010 */  b          .L0018F12C
/* 8F1E4 0018F0E4 00000000 */   nop
.L0018F0E8:
/* 8F1E8 0018F0E8 28266072 */  paddub     $4, $19, $0
/* 8F1EC 0018F0EC 08009324 */  addiu      $19, $4, 0x8
/* 8F1F0 0018F0F0 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8F1F4 0018F0F4 00000000 */   nop
/* 8F1F8 0018F0F8 06004004 */  bltz       $2, .L0018F114
/* 8F1FC 0018F0FC 00000000 */   nop
/* 8F200 0018F100 80200200 */  sll        $4, $2, 2
/* 8F204 0018F104 D401033C */  lui        $3, %hi(D_1D3D244)
/* 8F208 0018F108 44D26324 */  addiu      $3, $3, %lo(D_1D3D244)
/* 8F20C 0018F10C 21186400 */  addu       $3, $3, $4
/* 8F210 0018F110 000070AC */  sw         $16, 0x0($3)
.L0018F114:
/* 8F214 0018F114 FFFF0324 */  addiu      $3, $0, -0x1
/* 8F218 0018F118 03004314 */  bne        $2, $3, .L0018F128
/* 8F21C 0018F11C 00000000 */   nop
/* 8F220 0018F120 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8F224 0018F124 2CD230AC */  sw         $16, -0x2DD4($at)
.L0018F128:
/* 8F228 0018F128 01003126 */  addiu      $17, $17, 0x1
.L0018F12C:
/* 8F22C 0018F12C FFFF4226 */  addiu      $2, $18, -0x1
/* 8F230 0018F130 2A102202 */  slt        $2, $17, $2
/* 8F234 0018F134 ECFF4014 */  bnez       $2, .L0018F0E8
/* 8F238 0018F138 00000000 */   nop
/* 8F23C 0018F13C 01000224 */  addiu      $2, $0, 0x1
/* 8F240 0018F140 4000BF7B */  lq         $31, 0x40($sp)
/* 8F244 0018F144 3000B37B */  lq         $19, 0x30($sp)
/* 8F248 0018F148 2000B27B */  lq         $18, 0x20($sp)
/* 8F24C 0018F14C 1000B17B */  lq         $17, 0x10($sp)
/* 8F250 0018F150 0000B07B */  lq         $16, 0x0($sp)
/* 8F254 0018F154 5000BD27 */  addiu      $sp, $sp, 0x50
/* 8F258 0018F158 0800E003 */  jr         $31
/* 8F25C 0018F15C 00000000 */   nop
