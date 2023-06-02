.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdGetLXf__Fi
/* 699A0 001698A0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 699A4 001698A4 0000BF7F */  sq         $31, 0x0($sp)
/* 699A8 001698A8 F0A5050C */  jal        check_key_mode__Fi
/* 699AC 001698AC 00000000 */   nop
/* 699B0 001698B0 07004010 */  beqz       $2, .L001698D0
/* 699B4 001698B4 00000000 */   nop
/* 699B8 001698B8 CC01023C */  lui        $2, %hi(GamePad)
/* 699BC 001698BC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 699C0 001698C0 C4AD040C */  jal        GetLXf__8CGamePadFv
/* 699C4 001698C4 00000000 */   nop
/* 699C8 001698C8 02000010 */  b          .L001698D4
/* 699CC 001698CC 00000000 */   nop
.L001698D0:
/* 699D0 001698D0 00008044 */  mtc1       $0, $f0
.L001698D4:
/* 699D4 001698D4 0000BF7B */  lq         $31, 0x0($sp)
/* 699D8 001698D8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 699DC 001698DC 0800E003 */  jr         $31
/* 699E0 001698E0 00000000 */   nop
/* 699E4 001698E4 00000000 */  nop
/* 699E8 001698E8 00000000 */  nop
/* 699EC 001698EC 00000000 */  nop
