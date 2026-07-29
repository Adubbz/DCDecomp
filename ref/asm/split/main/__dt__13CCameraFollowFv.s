.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __dt__13CCameraFollowFv
/* 024D80 00124C80 D0FFBD27 */  addiu       $29, $29, -0x30
/* 024D84 00124C84 2000BF7F */  sq          $31, 0x20($29)
/* 024D88 00124C88 1000B17F */  sq          $17, 0x10($29)
/* 024D8C 00124C8C 0000B07F */  sq          $16, 0x0($29)
/* 024D90 00124C90 288E8070 */  paddub      $17, $4, $0
/* 024D94 00124C94 2886A070 */  paddub      $16, $5, $0
/* 024D98 00124C98 0E002012 */  beqz        $17, .L00124CD4
/* 024D9C 00124C9C 00000000 */   nop
/* 024DA0 00124CA0 2A00023C */  lui         $2, %hi(__vt__13CCameraFollow)
/* 024DA4 00124CA4 90104224 */  addiu       $2, $2, %lo(__vt__13CCameraFollow)
/* 024DA8 00124CA8 B80222AE */  sw          $2, 0x2B8($17)
/* 024DAC 00124CAC 282E0070 */  paddub      $5, $0, $0
/* 024DB0 00124CB0 DC91040C */  jal         __dt__7CCameraFv
/* 024DB4 00124CB4 00000000 */   nop
/* 024DB8 00124CB8 3C141000 */  dsll32      $2, $16, 16
/* 024DBC 00124CBC 3F140200 */  dsra32      $2, $2, 16
/* 024DC0 00124CC0 04004018 */  blez        $2, .L00124CD4
/* 024DC4 00124CC4 00000000 */   nop
/* 024DC8 00124CC8 28262072 */  paddub      $4, $17, $0
/* 024DCC 00124CCC 5489040C */  jal         __dl__FPv
/* 024DD0 00124CD0 00000000 */   nop
.L00124CD4:
/* 024DD4 00124CD4 28162072 */  paddub      $2, $17, $0
/* 024DD8 00124CD8 2000BF7B */  lq          $31, 0x20($29)
/* 024DDC 00124CDC 1000B17B */  lq          $17, 0x10($29)
/* 024DE0 00124CE0 0000B07B */  lq          $16, 0x0($29)
/* 024DE4 00124CE4 3000BD27 */  addiu       $29, $29, 0x30
/* 024DE8 00124CE8 0800E003 */  jr          $31
/* 024DEC 00124CEC 00000000 */   nop
