.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DancerShadow__Fv
/* 00BB20 01DB7820 80FFBD27 */  addiu       $29, $29, -0x80
/* 00BB24 01DB7824 3000BF7F */  sq          $31, 0x30($29)
/* 00BB28 01DB7828 2000B27F */  sq          $18, 0x20($29)
/* 00BB2C 01DB782C 1000B17F */  sq          $17, 0x10($29)
/* 00BB30 01DB7830 0000B07F */  sq          $16, 0x0($29)
/* 00BB34 01DB7834 DF01013C */  lui         $1, %hi(UraEventMan + 0x1CBC)
/* 00BB38 01DB7838 6C7B248C */  lw          $4, %lo(UraEventMan + 0x1CBC)($1)
/* 00BB3C 01DB783C DE01023C */  lui         $2, %hi(LIT_891__5)
/* 00BB40 01DB7840 20DF4524 */  addiu       $5, $2, %lo(LIT_891__5)
/* 00BB44 01DB7844 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00BB48 01DB7848 00000000 */   nop
/* 00BB4C 01DB784C 28264070 */  paddub      $4, $2, $0
/* 00BB50 01DB7850 4000A527 */  addiu       $5, $29, 0x40
/* 00BB54 01DB7854 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 00BB58 01DB7858 00000000 */   nop
/* 00BB5C 01DB785C 7000B227 */  addiu       $18, $29, 0x70
/* 00BB60 01DB7860 00004CC6 */  lwc1        $f12, 0x0($18)
/* 00BB64 01DB7864 7400B127 */  addiu       $17, $29, 0x74
/* 00BB68 01DB7868 00002DC6 */  lwc1        $f13, 0x0($17)
/* 00BB6C 01DB786C 7800B027 */  addiu       $16, $29, 0x78
/* 00BB70 01DB7870 00000EC6 */  lwc1        $f14, 0x0($16)
/* 00BB74 01DB7874 A0DE760C */  jal         DrawShadow__Ffff
/* 00BB78 01DB7878 00000000 */   nop
/* 00BB7C 01DB787C DF01013C */  lui         $1, %hi(UraEventMan + 0x1CBC)
/* 00BB80 01DB7880 6C7B248C */  lw          $4, %lo(UraEventMan + 0x1CBC)($1)
/* 00BB84 01DB7884 DE01023C */  lui         $2, %hi(LIT_892__6)
/* 00BB88 01DB7888 28DF4524 */  addiu       $5, $2, %lo(LIT_892__6)
/* 00BB8C 01DB788C C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00BB90 01DB7890 00000000 */   nop
/* 00BB94 01DB7894 28264070 */  paddub      $4, $2, $0
/* 00BB98 01DB7898 4000A527 */  addiu       $5, $29, 0x40
/* 00BB9C 01DB789C 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 00BBA0 01DB78A0 00000000 */   nop
/* 00BBA4 01DB78A4 00004CC6 */  lwc1        $f12, 0x0($18)
/* 00BBA8 01DB78A8 00002DC6 */  lwc1        $f13, 0x0($17)
/* 00BBAC 01DB78AC 00000EC6 */  lwc1        $f14, 0x0($16)
/* 00BBB0 01DB78B0 A0DE760C */  jal         DrawShadow__Ffff
/* 00BBB4 01DB78B4 00000000 */   nop
/* 00BBB8 01DB78B8 3000BF7B */  lq          $31, 0x30($29)
/* 00BBBC 01DB78BC 2000B27B */  lq          $18, 0x20($29)
/* 00BBC0 01DB78C0 1000B17B */  lq          $17, 0x10($29)
/* 00BBC4 01DB78C4 0000B07B */  lq          $16, 0x0($29)
/* 00BBC8 01DB78C8 8000BD27 */  addiu       $29, $29, 0x80
/* 00BBCC 01DB78CC 0800E003 */  jr          $31
/* 00BBD0 01DB78D0 00000000 */   nop
/* 00BBD4 01DB78D4 00000000 */  nop
/* 00BBD8 01DB78D8 00000000 */  nop
/* 00BBDC 01DB78DC 00000000 */  nop
