.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PauseOffCheck__Fv
/* 781E0 001780E0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 781E4 001780E4 0000BF7F */  sq         $31, 0x0($sp)
/* 781E8 001780E8 B0DF050C */  jal        run_event_check__Fv
/* 781EC 001780EC 00000000 */   nop
/* 781F0 001780F0 02004010 */  beqz       $2, .L001780FC
/* 781F4 001780F4 00000000 */   nop
/* 781F8 001780F8 9C9080AF */  sw         $0, -0x6F64($gp)
.L001780FC:
/* 781FC 001780FC 0000BF7B */  lq         $31, 0x0($sp)
/* 78200 00178100 1000BD27 */  addiu      $sp, $sp, 0x10
/* 78204 00178104 0800E003 */  jr         $31
/* 78208 00178108 00000000 */   nop
/* 7820C 0017810C 00000000 */  nop
