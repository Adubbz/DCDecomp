.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_CHARA_POS__FP12RS_STACKDATAi
/* 8E0B0 0018DFB0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8E0B4 0018DFB4 1000BF7F */  sq         $31, 0x10($sp)
/* 8E0B8 0018DFB8 0000B07F */  sq         $16, 0x0($sp)
/* 8E0BC 0018DFBC 28868070 */  paddub     $16, $4, $0
/* 8E0C0 0018DFC0 0300A128 */  slti       $at, $5, 0x3
/* 8E0C4 0018DFC4 04002010 */  beqz       $at, .L0018DFD8
/* 8E0C8 0018DFC8 00000000 */   nop
/* 8E0CC 0018DFCC 28160070 */  paddub     $2, $0, $0
/* 8E0D0 0018DFD0 0D000010 */  b          .L0018E008
/* 8E0D4 0018DFD4 00000000 */   nop
.L0018DFD8:
/* 8E0D8 0018DFD8 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8E0DC 0018DFDC 1CD2248C */  lw         $4, -0x2DE4($at)
/* 8E0E0 0018DFE0 2000A527 */  addiu      $5, $sp, 0x20
/* 8E0E4 0018DFE4 A000998C */  lw         $25, 0xA0($4)
/* 8E0E8 0018DFE8 A000398F */  lw         $25, 0xA0($25)
/* 8E0EC 0018DFEC 09F82003 */  jalr       $25
/* 8E0F0 0018DFF0 00000000 */   nop
/* 8E0F4 0018DFF4 28260072 */  paddub     $4, $16, $0
/* 8E0F8 0018DFF8 2000A527 */  addiu      $5, $sp, 0x20
/* 8E0FC 0018DFFC 942D060C */  jal        SetPosition__FP12RS_STACKDATAPf
/* 8E100 0018E000 00000000 */   nop
/* 8E104 0018E004 01000224 */  addiu      $2, $0, 0x1
.L0018E008:
/* 8E108 0018E008 1000BF7B */  lq         $31, 0x10($sp)
/* 8E10C 0018E00C 0000B07B */  lq         $16, 0x0($sp)
/* 8E110 0018E010 3000BD27 */  addiu      $sp, $sp, 0x30
/* 8E114 0018E014 0800E003 */  jr         $31
/* 8E118 0018E018 00000000 */   nop
/* 8E11C 0018E01C 00000000 */  nop
