.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetDmg__17CSHOT_EFFECT_PACKFi
/* AE710 001AE610 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* AE714 001AE614 0000BF7F */  sq         $31, 0x0($sp)
/* AE718 001AE618 0300013C */  lui        $at, (0x326E0 >> 16)
/* AE71C 001AE61C 21088100 */  addu       $at, $4, $at
/* AE720 001AE620 E026268C */  lw         $6, (0x326E0 & 0xFFFF)($at)
/* AE724 001AE624 FFFF0324 */  addiu      $3, $0, -0x1
/* AE728 001AE628 0600C310 */  beq        $6, $3, .L001AE644
/* AE72C 001AE62C 00000000 */   nop
/* AE730 001AE630 60A10234 */  ori        $2, $0, 0xA160
/* AE734 001AE634 1810C200 */  mult       $2, $6, $2
/* AE738 001AE638 21208200 */  addu       $4, $4, $2
/* AE73C 001AE63C C4B8060C */  jal        SetDmg__12CSHOT_EFFECTFi
/* AE740 001AE640 00000000 */   nop
.L001AE644:
/* AE744 001AE644 0000BF7B */  lq         $31, 0x0($sp)
/* AE748 001AE648 1000BD27 */  addiu      $sp, $sp, 0x10
/* AE74C 001AE64C 0800E003 */  jr         $31
/* AE750 001AE650 00000000 */   nop
/* AE754 001AE654 00000000 */  nop
/* AE758 001AE658 00000000 */  nop
/* AE75C 001AE65C 00000000 */  nop
