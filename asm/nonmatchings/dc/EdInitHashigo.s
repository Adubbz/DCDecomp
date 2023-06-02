.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdInitHashigo__FP13ED_EVENT_INFOP14ED_EVENT_PARAM
/* 6D820 0016D720 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 6D824 0016D724 2000BF7F */  sq         $31, 0x20($sp)
/* 6D828 0016D728 1000B17F */  sq         $17, 0x10($sp)
/* 6D82C 0016D72C 0000B07F */  sq         $16, 0x0($sp)
/* 6D830 0016D730 28868070 */  paddub     $16, $4, $0
/* 6D834 0016D734 288EA070 */  paddub     $17, $5, $0
/* 6D838 0016D738 0000A38C */  lw         $3, 0x0($5)
/* 6D83C 0016D73C 04000224 */  addiu      $2, $0, 0x4
/* 6D840 0016D740 0C006214 */  bne        $3, $2, .L0016D774
/* 6D844 0016D744 00000000 */   nop
/* 6D848 0016D748 D0030426 */  addiu      $4, $16, 0x3D0
/* 6D84C 0016D74C 10002526 */  addiu      $5, $17, 0x10
/* 6D850 0016D750 0C86040C */  jal        sceVu0CopyVector
/* 6D854 0016D754 00000000 */   nop
/* 6D858 0016D758 C0030426 */  addiu      $4, $16, 0x3C0
/* 6D85C 0016D75C 20002526 */  addiu      $5, $17, 0x20
/* 6D860 0016D760 0C86040C */  jal        sceVu0CopyVector
/* 6D864 0016D764 00000000 */   nop
/* 6D868 0016D768 000400AE */  sw         $0, 0x400($16)
/* 6D86C 0016D76C 0B000010 */  b          .L0016D79C
/* 6D870 0016D770 00000000 */   nop
.L0016D774:
/* 6D874 0016D774 C0030426 */  addiu      $4, $16, 0x3C0
/* 6D878 0016D778 10002526 */  addiu      $5, $17, 0x10
/* 6D87C 0016D77C 0C86040C */  jal        sceVu0CopyVector
/* 6D880 0016D780 00000000 */   nop
/* 6D884 0016D784 D0030426 */  addiu      $4, $16, 0x3D0
/* 6D888 0016D788 20002526 */  addiu      $5, $17, 0x20
/* 6D88C 0016D78C 0C86040C */  jal        sceVu0CopyVector
/* 6D890 0016D790 00000000 */   nop
/* 6D894 0016D794 01000224 */  addiu      $2, $0, 0x1
/* 6D898 0016D798 000402AE */  sw         $2, 0x400($16)
.L0016D79C:
/* 6D89C 0016D79C E0030426 */  addiu      $4, $16, 0x3E0
/* 6D8A0 0016D7A0 30002526 */  addiu      $5, $17, 0x30
/* 6D8A4 0016D7A4 0C86040C */  jal        sceVu0CopyVector
/* 6D8A8 0016D7A8 00000000 */   nop
/* 6D8AC 0016D7AC 5000228E */  lw         $2, 0x50($17)
/* 6D8B0 0016D7B0 6C004CC4 */  lwc1       $f12, 0x6C($2)
/* 6D8B4 0016D7B4 2C44040C */  jal        fptosi
/* 6D8B8 0016D7B8 00000000 */   nop
/* 6D8BC 0016D7BC 200402AE */  sw         $2, 0x420($16)
/* 6D8C0 0016D7C0 5000238E */  lw         $3, 0x50($17)
/* 6D8C4 0016D7C4 1C00638C */  lw         $3, 0x1C($3)
/* 6D8C8 0016D7C8 040403AE */  sw         $3, 0x404($16)
/* 6D8CC 0016D7CC 5000238E */  lw         $3, 0x50($17)
/* 6D8D0 0016D7D0 2000638C */  lw         $3, 0x20($3)
/* 6D8D4 0016D7D4 080403AE */  sw         $3, 0x408($16)
/* 6D8D8 0016D7D8 2000BF7B */  lq         $31, 0x20($sp)
/* 6D8DC 0016D7DC 1000B17B */  lq         $17, 0x10($sp)
/* 6D8E0 0016D7E0 0000B07B */  lq         $16, 0x0($sp)
/* 6D8E4 0016D7E4 3000BD27 */  addiu      $sp, $sp, 0x30
/* 6D8E8 0016D7E8 0800E003 */  jr         $31
/* 6D8EC 0016D7EC 00000000 */   nop
