.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdRunEvent__FiP14CDataAlloc2_1_
/* 97870 00197770 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 97874 00197774 0000BF7F */  sq         $31, 0x0($sp)
/* 97878 00197778 281E8070 */  paddub     $3, $4, $0
/* 9787C 0019777C 2836A070 */  paddub     $6, $5, $0
/* 97880 00197780 D501023C */  lui        $2, %hi(EdEventScript)
/* 97884 00197784 30A44424 */  addiu      $4, $2, %lo(EdEventScript)
/* 97888 00197788 282E6070 */  paddub     $5, $3, $0
/* 9788C 0019778C A85D060C */  jal        RunEvent__FP10CRunScriptiP14CDataAlloc2_1_
/* 97890 00197790 00000000 */   nop
/* 97894 00197794 0000BF7B */  lq         $31, 0x0($sp)
/* 97898 00197798 1000BD27 */  addiu      $sp, $sp, 0x10
/* 9789C 0019779C 0800E003 */  jr         $31
/* 978A0 001977A0 00000000 */   nop
/* 978A4 001977A4 00000000 */  nop
/* 978A8 001977A8 00000000 */  nop
/* 978AC 001977AC 00000000 */  nop
