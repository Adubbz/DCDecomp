.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndSePlay__Fiffi
/* 5A860 0015A760 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 5A864 0015A764 5000BF7F */  sq         $31, 0x50($sp)
/* 5A868 0015A768 4000B37F */  sq         $19, 0x40($sp)
/* 5A86C 0015A76C 3000B27F */  sq         $18, 0x30($sp)
/* 5A870 0015A770 2000B17F */  sq         $17, 0x20($sp)
/* 5A874 0015A774 1000B07F */  sq         $16, 0x10($sp)
/* 5A878 0015A778 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 5A87C 0015A77C 289E8070 */  paddub     $19, $4, $0
/* 5A880 0015A780 066D0046 */  mov.s      $f20, $f13
/* 5A884 0015A784 2896A070 */  paddub     $18, $5, $0
/* 5A888 0015A788 2C68050C */  jal        GetSeInfo__Fi
/* 5A88C 0015A78C 00000000 */   nop
/* 5A890 0015A790 28864070 */  paddub     $16, $2, $0
/* 5A894 0015A794 18000012 */  beqz       $16, .L0015A7F8
/* 5A898 0015A798 00000000 */   nop
/* 5A89C 0015A79C 5C6A050C */  jal        SndGetVolf__Fif
/* 5A8A0 0015A7A0 00000000 */   nop
/* 5A8A4 0015A7A4 288E4070 */  paddub     $17, $2, $0
/* 5A8A8 0015A7A8 06A30046 */  mov.s      $f12, $f20
/* 5A8AC 0015A7AC 8C6A050C */  jal        SndGetPanf__Ff
/* 5A8B0 0015A7B0 00000000 */   nop
/* 5A8B4 0015A7B4 28464070 */  paddub     $8, $2, $0
/* 5A8B8 0015A7B8 04000286 */  lh         $2, 0x4($16)
/* 5A8BC 0015A7BC 02004104 */  bgez       $2, .L0015A7C8
/* 5A8C0 0015A7C0 00000000 */   nop
/* 5A8C4 0015A7C4 7F001124 */  addiu      $17, $0, 0x7F
.L0015A7C8:
/* 5A8C8 0015A7C8 28266072 */  paddub     $4, $19, $0
/* 5A8CC 0015A7CC 8068050C */  jal        GetPortNo__Fi
/* 5A8D0 0015A7D0 00000000 */   nop
/* 5A8D4 0015A7D4 00000682 */  lb         $6, 0x0($16)
/* 5A8D8 0015A7D8 01000782 */  lb         $7, 0x1($16)
/* 5A8DC 0015A7DC 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5A8E0 0015A7E0 282E4070 */  paddub     $5, $2, $0
/* 5A8E4 0015A7E4 7F000924 */  addiu      $9, $0, 0x7F
/* 5A8E8 0015A7E8 28562072 */  paddub     $10, $17, $0
/* 5A8EC 0015A7EC 285E4072 */  paddub     $11, $18, $0
/* 5A8F0 0015A7F0 7C15050C */  jal        SE_Play__6CSoundFiiiiiii
/* 5A8F4 0015A7F4 00000000 */   nop
.L0015A7F8:
/* 5A8F8 0015A7F8 5000BF7B */  lq         $31, 0x50($sp)
/* 5A8FC 0015A7FC 4000B37B */  lq         $19, 0x40($sp)
/* 5A900 0015A800 3000B27B */  lq         $18, 0x30($sp)
/* 5A904 0015A804 2000B17B */  lq         $17, 0x20($sp)
/* 5A908 0015A808 1000B07B */  lq         $16, 0x10($sp)
/* 5A90C 0015A80C 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 5A910 0015A810 6000BD27 */  addiu      $sp, $sp, 0x60
/* 5A914 0015A814 0800E003 */  jr         $31
/* 5A918 0015A818 00000000 */   nop
/* 5A91C 0015A81C 00000000 */  nop
