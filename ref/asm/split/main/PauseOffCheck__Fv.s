.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel PauseOffCheck__Fv
/* 0781E0 001780E0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0781E4 001780E4 0000BF7F */  sq          $31, 0x0($29)
/* 0781E8 001780E8 B0DF050C */  jal         run_event_check__Fv
/* 0781EC 001780EC 00000000 */   nop
/* 0781F0 001780F0 02004010 */  beqz        $2, .L001780FC
/* 0781F4 001780F4 00000000 */   nop
/* 0781F8 001780F8 9C9080AF */  sw          $0, -0x6F64($28)
.L001780FC:
/* 0781FC 001780FC 0000BF7B */  lq          $31, 0x0($29)
/* 078200 00178100 1000BD27 */  addiu       $29, $29, 0x10
/* 078204 00178104 0800E003 */  jr          $31
/* 078208 00178108 00000000 */   nop
/* 07820C 0017810C 00000000 */  nop
