.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __dt__13CCameraFollowFv
/* 24D80 00124C80 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 24D84 00124C84 2000BF7F */  sq         $31, 0x20($sp)
/* 24D88 00124C88 1000B17F */  sq         $17, 0x10($sp)
/* 24D8C 00124C8C 0000B07F */  sq         $16, 0x0($sp)
/* 24D90 00124C90 288E8070 */  paddub     $17, $4, $0
/* 24D94 00124C94 2886A070 */  paddub     $16, $5, $0
/* 24D98 00124C98 0E002012 */  beqz       $17, .L00124CD4
/* 24D9C 00124C9C 00000000 */   nop
/* 24DA0 00124CA0 2A00023C */  lui        $2, %hi(__vt__13CCameraFollow)
/* 24DA4 00124CA4 90104224 */  addiu      $2, $2, %lo(__vt__13CCameraFollow)
/* 24DA8 00124CA8 B80222AE */  sw         $2, 0x2B8($17)
/* 24DAC 00124CAC 282E0070 */  paddub     $5, $0, $0
/* 24DB0 00124CB0 DC91040C */  jal        __dt__7CCameraFv
/* 24DB4 00124CB4 00000000 */   nop
/* 24DB8 00124CB8 3C141000 */  dsll32     $2, $16, 16
/* 24DBC 00124CBC 3F140200 */  dsra32     $2, $2, 16
/* 24DC0 00124CC0 04004018 */  blez       $2, .L00124CD4
/* 24DC4 00124CC4 00000000 */   nop
/* 24DC8 00124CC8 28262072 */  paddub     $4, $17, $0
/* 24DCC 00124CCC 5489040C */  jal        __dl__FPv
/* 24DD0 00124CD0 00000000 */   nop
.L00124CD4:
/* 24DD4 00124CD4 28162072 */  paddub     $2, $17, $0
/* 24DD8 00124CD8 2000BF7B */  lq         $31, 0x20($sp)
/* 24DDC 00124CDC 1000B17B */  lq         $17, 0x10($sp)
/* 24DE0 00124CE0 0000B07B */  lq         $16, 0x0($sp)
/* 24DE4 00124CE4 3000BD27 */  addiu      $sp, $sp, 0x30
/* 24DE8 00124CE8 0800E003 */  jr         $31
/* 24DEC 00124CEC 00000000 */   nop
