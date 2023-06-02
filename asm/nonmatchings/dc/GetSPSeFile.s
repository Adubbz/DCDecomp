.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetSPSeFile__FiPcPc
/* 5B6F0 0015B5F0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 5B6F4 0015B5F4 2000BF7F */  sq         $31, 0x20($sp)
/* 5B6F8 0015B5F8 1000B17F */  sq         $17, 0x10($sp)
/* 5B6FC 0015B5FC 0000B07F */  sq         $16, 0x0($sp)
/* 5B700 0015B600 281E8070 */  paddub     $3, $4, $0
/* 5B704 0015B604 288EA070 */  paddub     $17, $5, $0
/* 5B708 0015B608 2886C070 */  paddub     $16, $6, $0
/* 5B70C 0015B60C 3000A427 */  addiu      $4, $sp, 0x30
/* 5B710 0015B610 2A00023C */  lui        $2, %hi(_751)
/* 5B714 0015B614 F89F4524 */  addiu      $5, $2, %lo(_751)
/* 5B718 0015B618 28366070 */  paddub     $6, $3, $0
/* 5B71C 0015B61C 1614040C */  jal        sprintf
/* 5B720 0015B620 00000000 */   nop
/* 5B724 0015B624 28262072 */  paddub     $4, $17, $0
/* 5B728 0015B628 2A00023C */  lui        $2, %hi(_752)
/* 5B72C 0015B62C 00A04524 */  addiu      $5, $2, %lo(_752)
/* 5B730 0015B630 3000A627 */  addiu      $6, $sp, 0x30
/* 5B734 0015B634 1614040C */  jal        sprintf
/* 5B738 0015B638 00000000 */   nop
/* 5B73C 0015B63C 28260072 */  paddub     $4, $16, $0
/* 5B740 0015B640 2A00023C */  lui        $2, %hi(_350)
/* 5B744 0015B644 789F4524 */  addiu      $5, $2, %lo(_350)
/* 5B748 0015B648 3000A627 */  addiu      $6, $sp, 0x30
/* 5B74C 0015B64C 1614040C */  jal        sprintf
/* 5B750 0015B650 00000000 */   nop
/* 5B754 0015B654 2000BF7B */  lq         $31, 0x20($sp)
/* 5B758 0015B658 1000B17B */  lq         $17, 0x10($sp)
/* 5B75C 0015B65C 0000B07B */  lq         $16, 0x0($sp)
/* 5B760 0015B660 4000BD27 */  addiu      $sp, $sp, 0x40
/* 5B764 0015B664 0800E003 */  jr         $31
/* 5B768 0015B668 00000000 */   nop
/* 5B76C 0015B66C 00000000 */  nop
