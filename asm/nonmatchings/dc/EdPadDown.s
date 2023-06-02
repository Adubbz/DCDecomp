.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdPadDown__Fii
/* 69A90 00169990 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 69A94 00169994 0000BF7F */  sq         $31, 0x0($sp)
/* 69A98 00169998 281E8070 */  paddub     $3, $4, $0
/* 69A9C 0016999C 2826A070 */  paddub     $4, $5, $0
/* 69AA0 001699A0 F0A5050C */  jal        check_key_mode__Fi
/* 69AA4 001699A4 00000000 */   nop
/* 69AA8 001699A8 08004010 */  beqz       $2, .L001699CC
/* 69AAC 001699AC 00000000 */   nop
/* 69AB0 001699B0 CC01023C */  lui        $2, %hi(GamePad)
/* 69AB4 001699B4 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 69AB8 001699B8 282E6070 */  paddub     $5, $3, $0
/* 69ABC 001699BC 1CAE040C */  jal        Down__8CGamePadFi
/* 69AC0 001699C0 00000000 */   nop
/* 69AC4 001699C4 02000010 */  b          .L001699D0
/* 69AC8 001699C8 00000000 */   nop
.L001699CC:
/* 69ACC 001699CC 28160070 */  paddub     $2, $0, $0
.L001699D0:
/* 69AD0 001699D0 0000BF7B */  lq         $31, 0x0($sp)
/* 69AD4 001699D4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 69AD8 001699D8 0800E003 */  jr         $31
/* 69ADC 001699DC 00000000 */   nop
