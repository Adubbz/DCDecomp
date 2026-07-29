.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetDmg__17CSHOT_EFFECT_PACKFi
/* 0AE710 001AE610 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0AE714 001AE614 0000BF7F */  sq          $31, 0x0($29)
/* 0AE718 001AE618 0300013C */  lui         $1, (0x326E0 >> 16)
/* 0AE71C 001AE61C 21088100 */  addu        $1, $4, $1
/* 0AE720 001AE620 E026268C */  lw          $6, (0x326E0 & 0xFFFF)($1)
/* 0AE724 001AE624 FFFF0324 */  addiu       $3, $0, -0x1
/* 0AE728 001AE628 0600C310 */  beq         $6, $3, .L001AE644
/* 0AE72C 001AE62C 00000000 */   nop
/* 0AE730 001AE630 60A10234 */  ori         $2, $0, 0xA160
/* 0AE734 001AE634 1810C200 */  mult        $2, $6, $2
/* 0AE738 001AE638 21208200 */  addu        $4, $4, $2
/* 0AE73C 001AE63C C4B8060C */  jal         SetDmg__12CSHOT_EFFECTFi
/* 0AE740 001AE640 00000000 */   nop
.L001AE644:
/* 0AE744 001AE644 0000BF7B */  lq          $31, 0x0($29)
/* 0AE748 001AE648 1000BD27 */  addiu       $29, $29, 0x10
/* 0AE74C 001AE64C 0800E003 */  jr          $31
/* 0AE750 001AE650 00000000 */   nop
/* 0AE754 001AE654 00000000 */  nop
/* 0AE758 001AE658 00000000 */  nop
/* 0AE75C 001AE65C 00000000 */  nop
