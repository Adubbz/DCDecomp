.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetAttachData__Fi
/* D0FF0 001D0EF0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* D0FF4 001D0EF4 0000BF7F */  sq         $31, 0x0($sp)
/* D0FF8 001D0EF8 1C00A527 */  addiu      $5, $sp, 0x1C
/* D0FFC 001D0EFC 8C43070C */  jal        GetItemTypeInfo__FiPc
/* D1000 001D0F00 00000000 */   nop
/* D1004 001D0F04 1C00A383 */  lb         $3, 0x1C($sp)
/* D1008 001D0F08 0A006014 */  bnez       $3, .L001D0F34
/* D100C 001D0F0C 00000000 */   nop
/* D1010 001D0F10 2A084000 */  slt        $at, $2, $0
/* D1014 001D0F14 07002014 */  bnez       $at, .L001D0F34
/* D1018 001D0F18 00000000 */   nop
/* D101C 001D0F1C 40190200 */  sll        $3, $2, 5
/* D1020 001D0F20 2800023C */  lui        $2, %hi(AttachList)
/* D1024 001D0F24 60CA4224 */  addiu      $2, $2, %lo(AttachList)
/* D1028 001D0F28 21104300 */  addu       $2, $2, $3
/* D102C 001D0F2C 02000010 */  b          .L001D0F38
/* D1030 001D0F30 00000000 */   nop
.L001D0F34:
/* D1034 001D0F34 28160070 */  paddub     $2, $0, $0
.L001D0F38:
/* D1038 001D0F38 0000BF7B */  lq         $31, 0x0($sp)
/* D103C 001D0F3C 2000BD27 */  addiu      $sp, $sp, 0x20
/* D1040 001D0F40 0800E003 */  jr         $31
/* D1044 001D0F44 00000000 */   nop
/* D1048 001D0F48 00000000 */  nop
/* D104C 001D0F4C 00000000 */  nop
