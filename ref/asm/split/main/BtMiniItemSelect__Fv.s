.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtMiniItemSelect__Fv
/* 0D3500 001D3400 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0D3504 001D3404 0000BF7F */  sq          $31, 0x0($29)
/* 0D3508 001D3408 28260070 */  paddub      $4, $0, $0
/* 0D350C 001D340C B004770C */  jal         SetMIniMapStatus__Fi
/* 0D3510 001D3410 00000000 */   nop
/* 0D3514 001D3414 EA01013C */  lui         $1, %hi(DngMessMan)
/* 0D3518 001D3418 907620AC */  sw          $0, %lo(DngMessMan)($1)
/* 0D351C 001D341C 5C9480AF */  sw          $0, -0x6BA4($28)
/* 0D3520 001D3420 01000324 */  addiu       $3, $0, 0x1
/* 0D3524 001D3424 749D83AF */  sw          $3, -0x628C($28)
/* 0D3528 001D3428 0000BF7B */  lq          $31, 0x0($29)
/* 0D352C 001D342C 1000BD27 */  addiu       $29, $29, 0x10
/* 0D3530 001D3430 0800E003 */  jr          $31
/* 0D3534 001D3434 00000000 */   nop
/* 0D3538 001D3438 00000000 */  nop
/* 0D353C 001D343C 00000000 */  nop
