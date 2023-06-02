.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __dt__Q23std9exceptionFv
/* 22690 00122590 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 22694 00122594 2000BF7F */  sq         $31, 0x20($sp)
/* 22698 00122598 1000BE7F */  sq         $fp, 0x10($sp)
/* 2269C 0012259C 0000B07F */  sq         $16, 0x0($sp)
/* 226A0 001225A0 28868070 */  paddub     $16, $4, $0
/* 226A4 001225A4 09000012 */  beqz       $16, .L001225CC
/* 226A8 001225A8 21F0A003 */   addu      $fp, $sp, $0
/* 226AC 001225AC 2A00033C */  lui        $3, %hi(__vt__Q23std9exception)
/* 226B0 001225B0 3C140500 */  dsll32     $2, $5, 16
/* 226B4 001225B4 70106324 */  addiu      $3, $3, %lo(__vt__Q23std9exception)
/* 226B8 001225B8 3F140200 */  dsra32     $2, $2, 16
/* 226BC 001225BC 03004018 */  blez       $2, .L001225CC
/* 226C0 001225C0 000003AE */   sw        $3, 0x0($16)
/* 226C4 001225C4 5489040C */  jal        __dl__FPv
/* 226C8 001225C8 00000000 */   nop
.L001225CC:
/* 226CC 001225CC 05000010 */  b          .L001225E4
/* 226D0 001225D0 28160072 */   paddub    $2, $16, $0
/* 226D4 001225D4 D08A040C */  jal        __unexpected
/* 226D8 001225D8 3000C427 */   addiu     $4, $fp, 0x30
.L001225DC:
/* 226DC 001225DC FFFF0010 */  b          .L001225DC
/* 226E0 001225E0 00000000 */   nop
.L001225E4:
/* 226E4 001225E4 21E8C003 */  addu       $sp, $fp, $0
/* 226E8 001225E8 2000BF7B */  lq         $31, 0x20($sp)
/* 226EC 001225EC 1000BE7B */  lq         $fp, 0x10($sp)
/* 226F0 001225F0 0000B07B */  lq         $16, 0x0($sp)
/* 226F4 001225F4 0800E003 */  jr         $31
/* 226F8 001225F8 5000BD27 */   addiu     $sp, $sp, 0x50
/* 226FC 001225FC 00000000 */  nop
