.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_CHARA_POS__FP12RS_STACKDATAi
/* 8E1A0 0018E0A0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8E1A4 0018E0A4 0000BF7F */  sq         $31, 0x0($sp)
/* 8E1A8 0018E0A8 1000A527 */  addiu      $5, $sp, 0x10
/* 8E1AC 0018E0AC 7C2D060C */  jal        GetPosition__FP12RS_STACKDATAPf
/* 8E1B0 0018E0B0 00000000 */   nop
/* 8E1B4 0018E0B4 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8E1B8 0018E0B8 1CD2248C */  lw         $4, -0x2DE4($at)
/* 8E1BC 0018E0BC 1000A527 */  addiu      $5, $sp, 0x10
/* 8E1C0 0018E0C0 A000998C */  lw         $25, 0xA0($4)
/* 8E1C4 0018E0C4 1400398F */  lw         $25, 0x14($25)
/* 8E1C8 0018E0C8 09F82003 */  jalr       $25
/* 8E1CC 0018E0CC 00000000 */   nop
/* 8E1D0 0018E0D0 01000224 */  addiu      $2, $0, 0x1
/* 8E1D4 0018E0D4 0000BF7B */  lq         $31, 0x0($sp)
/* 8E1D8 0018E0D8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 8E1DC 0018E0DC 0800E003 */  jr         $31
/* 8E1E0 0018E0E0 00000000 */   nop
/* 8E1E4 0018E0E4 00000000 */  nop
/* 8E1E8 0018E0E8 00000000 */  nop
/* 8E1EC 0018E0EC 00000000 */  nop
