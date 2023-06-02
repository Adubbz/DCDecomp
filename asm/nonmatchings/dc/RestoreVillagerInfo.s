.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RestoreVillagerInfo__FP13VILLAGER_INFO
/* 85880 00185780 28460070 */  paddub     $8, $0, $0
/* 85884 00185784 11000010 */  b          .L001857CC
/* 85888 00185788 00000000 */   nop
.L0018578C:
/* 8588C 0018578C C0180800 */  sll        $3, $8, 3
/* 85890 00185790 21186800 */  addu       $3, $3, $8
/* 85894 00185794 00290300 */  sll        $5, $3, 4
/* 85898 00185798 D401033C */  lui        $3, %hi(restore_info)
/* 8589C 0018579C 20CC6324 */  addiu      $3, $3, %lo(restore_info)
/* 858A0 001857A0 21386500 */  addu       $7, $3, $5
/* 858A4 001857A4 21308500 */  addu       $6, $4, $5
/* 858A8 001857A8 09000524 */  addiu      $5, $0, 0x9
.L001857AC:
/* 858AC 001857AC 0000E378 */  lq         $3, 0x0($7)
/* 858B0 001857B0 1000E724 */  addiu      $7, $7, 0x10
/* 858B4 001857B4 FFFFA524 */  addiu      $5, $5, -0x1
/* 858B8 001857B8 0000C37C */  sq         $3, 0x0($6)
/* 858BC 001857BC 1000C624 */  addiu      $6, $6, 0x10
/* 858C0 001857C0 FAFFA01C */  bgtz       $5, .L001857AC
/* 858C4 001857C4 00000000 */   nop
/* 858C8 001857C8 01000825 */  addiu      $8, $8, 0x1
.L001857CC:
/* 858CC 001857CC 0A000329 */  slti       $3, $8, 0xA
/* 858D0 001857D0 EEFF6014 */  bnez       $3, .L0018578C
/* 858D4 001857D4 00000000 */   nop
/* 858D8 001857D8 0800E003 */  jr         $31
/* 858DC 001857DC 00000000 */   nop
