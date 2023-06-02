.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetCommonItemDataSystemMsg__Fi
/* D1100 001D1000 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* D1104 001D1004 0000BF7F */  sq         $31, 0x0($sp)
/* D1108 001D1008 F043070C */  jal        GetCommonItemDataMsg__Fi
/* D110C 001D100C 00000000 */   nop
/* D1110 001D1010 64004224 */  addiu      $2, $2, 0x64
/* D1114 001D1014 0000BF7B */  lq         $31, 0x0($sp)
/* D1118 001D1018 1000BD27 */  addiu      $sp, $sp, 0x10
/* D111C 001D101C 0800E003 */  jr         $31
/* D1120 001D1020 00000000 */   nop
/* D1124 001D1024 00000000 */  nop
/* D1128 001D1028 00000000 */  nop
/* D112C 001D102C 00000000 */  nop
