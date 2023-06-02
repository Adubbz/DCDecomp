.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetCompEvent__14CEditPartsInfoFii
/* 9A1A0 0019A0A0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 9A1A4 0019A0A4 1000BF7F */  sq         $31, 0x10($sp)
/* 9A1A8 0019A0A8 0000B07F */  sq         $16, 0x0($sp)
/* 9A1AC 0019A0AC 2886C070 */  paddub     $16, $6, $0
/* 9A1B0 0019A0B0 F467060C */  jal        GetPartsInfo__14CEditPartsInfoFi
/* 9A1B4 0019A0B4 00000000 */   nop
/* 9A1B8 0019A0B8 0C004010 */  beqz       $2, .L0019A0EC
/* 9A1BC 0019A0BC 00000000 */   nop
/* 9A1C0 0019A0C0 06000012 */  beqz       $16, .L0019A0DC
/* 9A1C4 0019A0C4 00000000 */   nop
/* 9A1C8 0019A0C8 0400438C */  lw         $3, 0x4($2)
/* 9A1CC 0019A0CC 01006334 */  ori        $3, $3, 0x1
/* 9A1D0 0019A0D0 040043AC */  sw         $3, 0x4($2)
/* 9A1D4 0019A0D4 05000010 */  b          .L0019A0EC
/* 9A1D8 0019A0D8 00000000 */   nop
.L0019A0DC:
/* 9A1DC 0019A0DC 0400448C */  lw         $4, 0x4($2)
/* 9A1E0 0019A0E0 FEFF0324 */  addiu      $3, $0, -0x2
/* 9A1E4 0019A0E4 24188300 */  and        $3, $4, $3
/* 9A1E8 0019A0E8 040043AC */  sw         $3, 0x4($2)
.L0019A0EC:
/* 9A1EC 0019A0EC 1000BF7B */  lq         $31, 0x10($sp)
/* 9A1F0 0019A0F0 0000B07B */  lq         $16, 0x0($sp)
/* 9A1F4 0019A0F4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 9A1F8 0019A0F8 0800E003 */  jr         $31
/* 9A1FC 0019A0FC 00000000 */   nop
