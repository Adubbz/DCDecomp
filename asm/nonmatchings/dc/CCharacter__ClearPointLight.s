.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ClearPointLight__10CCharacterFv
/* 37FA0 00137EA0 28360070 */  paddub     $6, $0, $0
/* 37FA4 00137EA4 09000010 */  b          .L00137ECC
/* 37FA8 00137EA8 00000000 */   nop
.L00137EAC:
/* 37FAC 00137EAC 40180600 */  sll        $3, $6, 1
/* 37FB0 00137EB0 21186600 */  addu       $3, $3, $6
/* 37FB4 00137EB4 00190300 */  sll        $3, $3, 4
/* 37FB8 00137EB8 21286400 */  addu       $5, $3, $4
/* 37FBC 00137EBC 280DA0AC */  sw         $0, 0xD28($5)
/* 37FC0 00137EC0 80BF033C */  lui        $3, (0xBF800000 >> 16)
/* 37FC4 00137EC4 2C0DA3AC */  sw         $3, 0xD2C($5)
/* 37FC8 00137EC8 0100C624 */  addiu      $6, $6, 0x1
.L00137ECC:
/* 37FCC 00137ECC 0200C328 */  slti       $3, $6, 0x2
/* 37FD0 00137ED0 F6FF6014 */  bnez       $3, .L00137EAC
/* 37FD4 00137ED4 00000000 */   nop
/* 37FD8 00137ED8 0800E003 */  jr         $31
/* 37FDC 00137EDC 00000000 */   nop
