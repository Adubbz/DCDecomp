.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdClearSystemMes__Fv
/* 0736E0 001735E0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0736E4 001735E4 0000BF7F */  sq          $31, 0x0($29)
/* 0736E8 001735E8 3480050C */  jal         ClearSystemMes__Fv
/* 0736EC 001735EC 00000000 */   nop
/* 0736F0 001735F0 D201023C */  lui         $2, %hi(EditSystemMes)
/* 0736F4 001735F4 102C4424 */  addiu       $4, $2, %lo(EditSystemMes)
/* 0736F8 001735F8 FFFF0524 */  addiu       $5, $0, -0x1
/* 0736FC 001735FC 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 073700 00173600 00000000 */   nop
/* 073704 00173604 FFFF0324 */  addiu       $3, $0, -0x1
/* 073708 00173608 588783AF */  sw          $3, -0x78A8($28)
/* 07370C 0017360C 7C8F80AF */  sw          $0, -0x7084($28)
/* 073710 00173610 988F80AF */  sw          $0, -0x7068($28)
/* 073714 00173614 5C8783AF */  sw          $3, -0x78A4($28)
/* 073718 00173618 9C8F80AF */  sw          $0, -0x7064($28)
/* 07371C 0017361C 948F80AF */  sw          $0, -0x706C($28)
/* 073720 00173620 848F80AF */  sw          $0, -0x707C($28)
/* 073724 00173624 888F80AF */  sw          $0, -0x7078($28)
/* 073728 00173628 8C8F80AF */  sw          $0, -0x7074($28)
/* 07372C 0017362C 908F80AF */  sw          $0, -0x7070($28)
/* 073730 00173630 0000BF7B */  lq          $31, 0x0($29)
/* 073734 00173634 1000BD27 */  addiu       $29, $29, 0x10
/* 073738 00173638 0800E003 */  jr          $31
/* 07373C 0017363C 00000000 */   nop
