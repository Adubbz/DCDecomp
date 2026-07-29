.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandLIGHT_NO__FPPv
/* 074C10 00174B10 0000838C */  lw          $3, 0x0($4)
/* 074C14 00174B14 0000638C */  lw          $3, 0x0($3)
/* 074C18 00174B18 D48F83AF */  sw          $3, -0x702C($28)
/* 074C1C 00174B1C D48F838F */  lw          $3, -0x702C($28)
/* 074C20 00174B20 FFFF6324 */  addiu       $3, $3, -0x1
/* 074C24 00174B24 D48F83AF */  sw          $3, -0x702C($28)
/* 074C28 00174B28 D48F838F */  lw          $3, -0x702C($28)
/* 074C2C 00174B2C 02006104 */  bgez        $3, .L00174B38
/* 074C30 00174B30 00000000 */   nop
/* 074C34 00174B34 D48F80AF */  sw          $0, -0x702C($28)
.L00174B38:
/* 074C38 00174B38 D48F838F */  lw          $3, -0x702C($28)
/* 074C3C 00174B3C 0C006328 */  slti        $3, $3, 0xC
/* 074C40 00174B40 03006014 */  bnez        $3, .L00174B50
/* 074C44 00174B44 00000000 */   nop
/* 074C48 00174B48 0B000324 */  addiu       $3, $0, 0xB
/* 074C4C 00174B4C D48F83AF */  sw          $3, -0x702C($28)
.L00174B50:
/* 074C50 00174B50 0800E003 */  jr          $31
/* 074C54 00174B54 00000000 */   nop
/* 074C58 00174B58 00000000 */  nop
/* 074C5C 00174B5C 00000000 */  nop
