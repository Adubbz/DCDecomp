.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtBattleMusic_Stop__Fv
/* 0B7740 001B7640 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0B7744 001B7644 0000BF7F */  sq          $31, 0x0($29)
/* 0B7748 001B7648 E893838F */  lw          $3, -0x6C18($28)
/* 0B774C 001B764C 0A006010 */  beqz        $3, .L001B7678
/* 0B7750 001B7650 00000000 */   nop
/* 0B7754 001B7654 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0B7758 001B7658 00608244 */  mtc1        $2, $f12
/* 0B775C 001B765C 6467050C */  jal         SndSetBgmVolf__Ff
/* 0B7760 001B7660 00000000 */   nop
/* 0B7764 001B7664 00608044 */  mtc1        $0, $f12
/* 0B7768 001B7668 906C050C */  jal         SndAmbientSetVolf__Ff
/* 0B776C 001B766C 00000000 */   nop
/* 0B7770 001B7670 88DD060C */  jal         BtBattleMusic_Init__Fv
/* 0B7774 001B7674 00000000 */   nop
.L001B7678:
/* 0B7778 001B7678 0000BF7B */  lq          $31, 0x0($29)
/* 0B777C 001B767C 1000BD27 */  addiu       $29, $29, 0x10
/* 0B7780 001B7680 0800E003 */  jr          $31
/* 0B7784 001B7684 00000000 */   nop
/* 0B7788 001B7688 00000000 */  nop
/* 0B778C 001B768C 00000000 */  nop
