.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtSystemScriptRun__FiP14CDataAlloc2_1_
/* BB9F0 001BB8F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BB9F4 001BB8F4 0000BF7F */  sq         $31, 0x0($sp)
/* BB9F8 001BB8F8 109E868F */  lw         $6, -0x61F0($gp)
/* BB9FC 001BB8FC EC5C060C */  jal        EdEventInit__FiP14CDataAlloc2_1_Pc
/* BBA00 001BB900 00000000 */   nop
/* BBA04 001BB904 0000BF7B */  lq         $31, 0x0($sp)
/* BBA08 001BB908 1000BD27 */  addiu      $sp, $sp, 0x10
/* BBA0C 001BB90C 0800E003 */  jr         $31
/* BBA10 001BB910 00000000 */   nop
/* BBA14 001BB914 00000000 */  nop
/* BBA18 001BB918 00000000 */  nop
/* BBA1C 001BB91C 00000000 */  nop
