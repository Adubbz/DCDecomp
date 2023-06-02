.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetItemData__Fi
/* D0F80 001D0E80 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* D0F84 001D0E84 0000BF7F */  sq         $31, 0x0($sp)
/* D0F88 001D0E88 1C00A527 */  addiu      $5, $sp, 0x1C
/* D0F8C 001D0E8C 8C43070C */  jal        GetItemTypeInfo__FiPc
/* D0F90 001D0E90 00000000 */   nop
/* D0F94 001D0E94 1C00A483 */  lb         $4, 0x1C($sp)
/* D0F98 001D0E98 01000324 */  addiu      $3, $0, 0x1
/* D0F9C 001D0E9C 0C008314 */  bne        $4, $3, .L001D0ED0
/* D0FA0 001D0EA0 00000000 */   nop
/* D0FA4 001D0EA4 2A084000 */  slt        $at, $2, $0
/* D0FA8 001D0EA8 09002014 */  bnez       $at, .L001D0ED0
/* D0FAC 001D0EAC 00000000 */   nop
/* D0FB0 001D0EB0 80180200 */  sll        $3, $2, 2
/* D0FB4 001D0EB4 21106200 */  addu       $2, $3, $2
/* D0FB8 001D0EB8 80180200 */  sll        $3, $2, 2
/* D0FBC 001D0EBC 2800023C */  lui        $2, %hi(ITEM_LIST)
/* D0FC0 001D0EC0 A0D04224 */  addiu      $2, $2, %lo(ITEM_LIST)
/* D0FC4 001D0EC4 21104300 */  addu       $2, $2, $3
/* D0FC8 001D0EC8 02000010 */  b          .L001D0ED4
/* D0FCC 001D0ECC 00000000 */   nop
.L001D0ED0:
/* D0FD0 001D0ED0 28160070 */  paddub     $2, $0, $0
.L001D0ED4:
/* D0FD4 001D0ED4 0000BF7B */  lq         $31, 0x0($sp)
/* D0FD8 001D0ED8 2000BD27 */  addiu      $sp, $sp, 0x20
/* D0FDC 001D0EDC 0800E003 */  jr         $31
/* D0FE0 001D0EE0 00000000 */   nop
/* D0FE4 001D0EE4 00000000 */  nop
/* D0FE8 001D0EE8 00000000 */  nop
/* D0FEC 001D0EEC 00000000 */  nop
