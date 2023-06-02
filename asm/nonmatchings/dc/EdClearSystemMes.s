.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdClearSystemMes__Fv
/* 736E0 001735E0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 736E4 001735E4 0000BF7F */  sq         $31, 0x0($sp)
/* 736E8 001735E8 3480050C */  jal        ClearSystemMes__Fv
/* 736EC 001735EC 00000000 */   nop
/* 736F0 001735F0 D201023C */  lui        $2, %hi(EditSystemMes)
/* 736F4 001735F4 102C4424 */  addiu      $4, $2, %lo(EditSystemMes)
/* 736F8 001735F8 FFFF0524 */  addiu      $5, $0, -0x1
/* 736FC 001735FC 5441050C */  jal        MakeMesWin__6ClsMesFi
/* 73700 00173600 00000000 */   nop
/* 73704 00173604 FFFF0324 */  addiu      $3, $0, -0x1
/* 73708 00173608 588783AF */  sw         $3, -0x78A8($gp)
/* 7370C 0017360C 7C8F80AF */  sw         $0, -0x7084($gp)
/* 73710 00173610 988F80AF */  sw         $0, -0x7068($gp)
/* 73714 00173614 5C8783AF */  sw         $3, -0x78A4($gp)
/* 73718 00173618 9C8F80AF */  sw         $0, -0x7064($gp)
/* 7371C 0017361C 948F80AF */  sw         $0, -0x706C($gp)
/* 73720 00173620 848F80AF */  sw         $0, -0x707C($gp)
/* 73724 00173624 888F80AF */  sw         $0, -0x7078($gp)
/* 73728 00173628 8C8F80AF */  sw         $0, -0x7074($gp)
/* 7372C 0017362C 908F80AF */  sw         $0, -0x7070($gp)
/* 73730 00173630 0000BF7B */  lq         $31, 0x0($sp)
/* 73734 00173634 1000BD27 */  addiu      $sp, $sp, 0x10
/* 73738 00173638 0800E003 */  jr         $31
/* 7373C 0017363C 00000000 */   nop
