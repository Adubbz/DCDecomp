.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ClothFloor__10CCharacterFi
/* 39070 00138F70 283E0070 */  paddub     $7, $0, $0
/* 39074 00138F74 09000010 */  b          .L00138F9C
/* 39078 00138F78 00000000 */   nop
.L00138F7C:
/* 3907C 00138F7C 80300700 */  sll        $6, $7, 2
/* 39080 00138F80 740C838C */  lw         $3, 0xC74($4)
/* 39084 00138F84 21186600 */  addu       $3, $3, $6
/* 39088 00138F88 0000638C */  lw         $3, 0x0($3)
/* 3908C 00138F8C 02006010 */  beqz       $3, .L00138F98
/* 39090 00138F90 00000000 */   nop
/* 39094 00138F94 480065AC */  sw         $5, 0x48($3)
.L00138F98:
/* 39098 00138F98 0100E724 */  addiu      $7, $7, 0x1
.L00138F9C:
/* 3909C 00138F9C 0400E328 */  slti       $3, $7, 0x4
/* 390A0 00138FA0 F6FF6014 */  bnez       $3, .L00138F7C
/* 390A4 00138FA4 00000000 */   nop
/* 390A8 00138FA8 0800E003 */  jr         $31
/* 390AC 00138FAC 00000000 */   nop
