.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _dpfle
/* 000230 00100130 F0FFBD27 */  addiu       $29, $29, -0x10
/* 000234 00100134 0000BF7F */  sq          $31, 0x0($29)
/* 000238 00100138 E840040C */  jal         dpcmp
/* 00023C 0010013C 00000000 */   nop
/* 000240 00100140 0000BF7B */  lq          $31, 0x0($29)
/* 000244 00100144 2A100200 */  slt         $2, $0, $2
/* 000248 00100148 01004238 */  xori        $2, $2, 0x1
/* 00024C 0010014C 0800E003 */  jr          $31
/* 000250 00100150 1000BD27 */   addiu      $29, $29, 0x10
/* 000254 00100154 00000000 */  nop
/* 000258 00100158 00000000 */  nop
/* 00025C 0010015C 00000000 */  nop
