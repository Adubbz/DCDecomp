.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdWalkToEditMes__Fi
/* 73930 00173830 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 73934 00173834 0000BF7F */  sq         $31, 0x0($sp)
/* 73938 00173838 848F80AF */  sw         $0, -0x707C($gp)
/* 7393C 0017383C 888F80AF */  sw         $0, -0x7078($gp)
/* 73940 00173840 28000224 */  addiu      $2, $0, 0x28
/* 73944 00173844 8C8F82AF */  sw         $2, -0x7074($gp)
/* 73948 00173848 7C010224 */  addiu      $2, $0, 0x17C
/* 7394C 0017384C 908F82AF */  sw         $2, -0x7070($gp)
/* 73950 00173850 948F84AF */  sw         $4, -0x706C($gp)
/* 73954 00173854 6E000424 */  addiu      $4, $0, 0x6E
/* 73958 00173858 78000524 */  addiu      $5, $0, 0x78
/* 7395C 0017385C FFFF0624 */  addiu      $6, $0, -0x1
/* 73960 00173860 283E0070 */  paddub     $7, $0, $0
/* 73964 00173864 2846C070 */  paddub     $8, $6, $0
/* 73968 00173868 28CD050C */  jal        EdSetHelpMes__FiiiPii
/* 7396C 0017386C 00000000 */   nop
/* 73970 00173870 0000BF7B */  lq         $31, 0x0($sp)
/* 73974 00173874 1000BD27 */  addiu      $sp, $sp, 0x10
/* 73978 00173878 0800E003 */  jr         $31
/* 7397C 0017387C 00000000 */   nop
