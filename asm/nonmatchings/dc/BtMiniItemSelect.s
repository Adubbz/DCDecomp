.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtMiniItemSelect__Fv
/* D3500 001D3400 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* D3504 001D3404 0000BF7F */  sq         $31, 0x0($sp)
/* D3508 001D3408 28260070 */  paddub     $4, $0, $0
/* D350C 001D340C B004770C */  jal        func_1DC12C0
/* D3510 001D3410 00000000 */   nop
/* D3514 001D3414 EA01013C */  lui        $at, (0x1EA7690 >> 16)
/* D3518 001D3418 907620AC */  sw         $0, (0x1EA7690 & 0xFFFF)($at)
/* D351C 001D341C 5C9480AF */  sw         $0, -0x6BA4($gp)
/* D3520 001D3420 01000324 */  addiu      $3, $0, 0x1
/* D3524 001D3424 749D83AF */  sw         $3, -0x628C($gp)
/* D3528 001D3428 0000BF7B */  lq         $31, 0x0($sp)
/* D352C 001D342C 1000BD27 */  addiu      $sp, $sp, 0x10
/* D3530 001D3430 0800E003 */  jr         $31
/* D3534 001D3434 00000000 */   nop
/* D3538 001D3438 00000000 */  nop
/* D353C 001D343C 00000000 */  nop
