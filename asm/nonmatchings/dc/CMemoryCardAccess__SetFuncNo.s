.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetFuncNo__17CMemoryCardAccessFi
/* 113C90 00213B90 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 113C94 00213B94 0000BF7F */  sq         $31, 0x0($sp)
/* 113C98 00213B98 BC0085AC */  sw         $5, 0xBC($4)
/* 113C9C 00213B9C C40080AC */  sw         $0, 0xC4($4)
/* 113CA0 00213BA0 01000224 */  addiu      $2, $0, 0x1
/* 113CA4 00213BA4 0300A214 */  bne        $5, $2, .L00213BB4
/* 113CA8 00213BA8 00000000 */   nop
/* 113CAC 00213BAC 3D000224 */  addiu      $2, $0, 0x3D
/* 113CB0 00213BB0 E00082AC */  sw         $2, 0xE0($4)
.L00213BB4:
/* 113CB4 00213BB4 01000424 */  addiu      $4, $0, 0x1
/* 113CB8 00213BB8 282E0070 */  paddub     $5, $0, $0
/* 113CBC 00213BBC 28360070 */  paddub     $6, $0, $0
/* 113CC0 00213BC0 C079040C */  jal        sceMcSync
/* 113CC4 00213BC4 00000000 */   nop
/* 113CC8 00213BC8 0000BF7B */  lq         $31, 0x0($sp)
/* 113CCC 00213BCC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 113CD0 00213BD0 0800E003 */  jr         $31
/* 113CD4 00213BD4 00000000 */   nop
/* 113CD8 00213BD8 00000000 */  nop
/* 113CDC 00213BDC 00000000 */  nop
