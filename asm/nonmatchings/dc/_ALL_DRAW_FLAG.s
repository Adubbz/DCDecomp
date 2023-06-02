.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _ALL_DRAW_FLAG__FP12RS_STACKDATAi
/* BD0A0 001BCFA0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BD0A4 001BCFA4 0000BF7F */  sq         $31, 0x0($sp)
/* BD0A8 001BCFA8 01000224 */  addiu      $2, $0, 0x1
/* BD0AC 001BCFAC 0400A214 */  bne        $5, $2, .L001BCFC0
/* BD0B0 001BCFB0 00000000 */   nop
/* BD0B4 001BCFB4 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BD0B8 001BCFB8 00000000 */   nop
/* BD0BC 001BCFBC 709D82AF */  sw         $2, -0x6290($gp)
.L001BCFC0:
/* BD0C0 001BCFC0 01000224 */  addiu      $2, $0, 0x1
/* BD0C4 001BCFC4 0000BF7B */  lq         $31, 0x0($sp)
/* BD0C8 001BCFC8 1000BD27 */  addiu      $sp, $sp, 0x10
/* BD0CC 001BCFCC 0800E003 */  jr         $31
/* BD0D0 001BCFD0 00000000 */   nop
/* BD0D4 001BCFD4 00000000 */  nop
/* BD0D8 001BCFD8 00000000 */  nop
/* BD0DC 001BCFDC 00000000 */  nop
