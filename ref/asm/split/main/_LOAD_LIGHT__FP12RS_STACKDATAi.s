.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _LOAD_LIGHT__FP12RS_STACKDATAi
/* 0939B0 001938B0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0939B4 001938B4 2000BF7F */  sq          $31, 0x20($29)
/* 0939B8 001938B8 1000B17F */  sq          $17, 0x10($29)
/* 0939BC 001938BC 0000B07F */  sq          $16, 0x0($29)
/* 0939C0 001938C0 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 0939C4 001938C4 00000000 */   nop
/* 0939C8 001938C8 28864070 */  paddub      $16, $2, $0
/* 0939CC 001938CC 0E000106 */  bgez        $16, .L00193908
/* 0939D0 001938D0 00000000 */   nop
/* 0939D4 001938D4 D401023C */  lui         $2, %hi(EdEventInfo + 0x330)
/* 0939D8 001938D8 00D54424 */  addiu       $4, $2, %lo(EdEventInfo + 0x330)
/* 0939DC 001938DC D401023C */  lui         $2, %hi(EdEventInfo + 0x370)
/* 0939E0 001938E0 40D54524 */  addiu       $5, $2, %lo(EdEventInfo + 0x370)
/* 0939E4 001938E4 2CB7040C */  jal         MGGetPLight__FPA4_fPA4_f
/* 0939E8 001938E8 00000000 */   nop
/* 0939EC 001938EC D401023C */  lui         $2, %hi(EdEventInfo + 0x3B0)
/* 0939F0 001938F0 80D54424 */  addiu       $4, $2, %lo(EdEventInfo + 0x3B0)
/* 0939F4 001938F4 4CB7040C */  jal         MGGetAmbient__FPf
/* 0939F8 001938F8 00000000 */   nop
/* 0939FC 001938FC 01000224 */  addiu       $2, $0, 0x1
/* 093A00 00193900 1F000010 */  b           .L00193980
/* 093A04 00193904 00000000 */   nop
.L00193908:
/* 093A08 00193908 0200012A */  slti        $1, $16, 0x2
/* 093A0C 0019390C 04002014 */  bnez        $1, .L00193920
/* 093A10 00193910 00000000 */   nop
/* 093A14 00193914 28160070 */  paddub      $2, $0, $0
/* 093A18 00193918 19000010 */  b           .L00193980
/* 093A1C 0019391C 00000000 */   nop
.L00193920:
/* 093A20 00193920 80891000 */  sll         $17, $16, 6
/* 093A24 00193924 D501023C */  lui         $2, %hi(save_l)
/* 093A28 00193928 10A54224 */  addiu       $2, $2, %lo(save_l)
/* 093A2C 0019392C 21285100 */  addu        $5, $2, $17
/* 093A30 00193930 D401023C */  lui         $2, %hi(EdEventInfo + 0x330)
/* 093A34 00193934 00D54424 */  addiu       $4, $2, %lo(EdEventInfo + 0x330)
/* 093A38 00193938 1086040C */  jal         sceVu0CopyMatrix
/* 093A3C 0019393C 00000000 */   nop
/* 093A40 00193940 D501023C */  lui         $2, %hi(save_c)
/* 093A44 00193944 90A54224 */  addiu       $2, $2, %lo(save_c)
/* 093A48 00193948 21285100 */  addu        $5, $2, $17
/* 093A4C 0019394C D401023C */  lui         $2, %hi(EdEventInfo + 0x370)
/* 093A50 00193950 40D54424 */  addiu       $4, $2, %lo(EdEventInfo + 0x370)
/* 093A54 00193954 1086040C */  jal         sceVu0CopyMatrix
/* 093A58 00193958 00000000 */   nop
/* 093A5C 0019395C 00191000 */  sll         $3, $16, 4
/* 093A60 00193960 D501023C */  lui         $2, %hi(save_a)
/* 093A64 00193964 10A64224 */  addiu       $2, $2, %lo(save_a)
/* 093A68 00193968 21284300 */  addu        $5, $2, $3
/* 093A6C 0019396C D401023C */  lui         $2, %hi(EdEventInfo + 0x3B0)
/* 093A70 00193970 80D54424 */  addiu       $4, $2, %lo(EdEventInfo + 0x3B0)
/* 093A74 00193974 0C86040C */  jal         sceVu0CopyVector
/* 093A78 00193978 00000000 */   nop
/* 093A7C 0019397C 01000224 */  addiu       $2, $0, 0x1
.L00193980:
/* 093A80 00193980 2000BF7B */  lq          $31, 0x20($29)
/* 093A84 00193984 1000B17B */  lq          $17, 0x10($29)
/* 093A88 00193988 0000B07B */  lq          $16, 0x0($29)
/* 093A8C 0019398C 3000BD27 */  addiu       $29, $29, 0x30
/* 093A90 00193990 0800E003 */  jr          $31
/* 093A94 00193994 00000000 */   nop
/* 093A98 00193998 00000000 */  nop
/* 093A9C 0019399C 00000000 */  nop
