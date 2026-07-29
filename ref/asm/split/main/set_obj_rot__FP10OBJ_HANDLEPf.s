.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel set_obj_rot__FP10OBJ_HANDLEPf
/* 08ABA0 0018AAA0 B0FFBD27 */  addiu       $29, $29, -0x50
/* 08ABA4 0018AAA4 4000BF7F */  sq          $31, 0x40($29)
/* 08ABA8 0018AAA8 3000B37F */  sq          $19, 0x30($29)
/* 08ABAC 0018AAAC 2000B27F */  sq          $18, 0x20($29)
/* 08ABB0 0018AAB0 1000B17F */  sq          $17, 0x10($29)
/* 08ABB4 0018AAB4 0000B07F */  sq          $16, 0x0($29)
/* 08ABB8 0018AAB8 289E8070 */  paddub      $19, $4, $0
/* 08ABBC 0018AABC 2896A070 */  paddub      $18, $5, $0
/* 08ABC0 0018AAC0 0000848C */  lw          $4, 0x0($4)
/* 08ABC4 0018AAC4 0A008010 */  beqz        $4, .L0018AAF0
/* 08ABC8 0018AAC8 00000000 */   nop
/* 08ABCC 0018AACC 00004CC6 */  lwc1        $f12, 0x0($18)
/* 08ABD0 0018AAD0 04004DC6 */  lwc1        $f13, 0x4($18)
/* 08ABD4 0018AAD4 08004EC6 */  lwc1        $f14, 0x8($18)
/* 08ABD8 0018AAD8 A000998C */  lw          $25, 0xA0($4)
/* 08ABDC 0018AADC 3000398F */  lw          $25, 0x30($25)
/* 08ABE0 0018AAE0 09F82003 */  jalr        $25
/* 08ABE4 0018AAE4 00000000 */   nop
/* 08ABE8 0018AAE8 23000010 */  b           .L0018AB78
/* 08ABEC 0018AAEC 00000000 */   nop
.L0018AAF0:
/* 08ABF0 0018AAF0 0400648E */  lw          $4, 0x4($19)
/* 08ABF4 0018AAF4 0A008010 */  beqz        $4, .L0018AB20
/* 08ABF8 0018AAF8 00000000 */   nop
/* 08ABFC 0018AAFC 00004CC6 */  lwc1        $f12, 0x0($18)
/* 08AC00 0018AB00 04004DC6 */  lwc1        $f13, 0x4($18)
/* 08AC04 0018AB04 08004EC6 */  lwc1        $f14, 0x8($18)
/* 08AC08 0018AB08 A000998C */  lw          $25, 0xA0($4)
/* 08AC0C 0018AB0C 3000398F */  lw          $25, 0x30($25)
/* 08AC10 0018AB10 09F82003 */  jalr        $25
/* 08AC14 0018AB14 00000000 */   nop
/* 08AC18 0018AB18 17000010 */  b           .L0018AB78
/* 08AC1C 0018AB1C 00000000 */   nop
.L0018AB20:
/* 08AC20 0018AB20 28860070 */  paddub      $16, $0, $0
/* 08AC24 0018AB24 11000010 */  b           .L0018AB6C
/* 08AC28 0018AB28 00000000 */   nop
.L0018AB2C:
/* 08AC2C 0018AB2C 80181000 */  sll         $3, $16, 2
/* 08AC30 0018AB30 21187300 */  addu        $3, $3, $19
/* 08AC34 0018AB34 08007124 */  addiu       $17, $3, 0x8
/* 08AC38 0018AB38 0800648C */  lw          $4, 0x8($3)
/* 08AC3C 0018AB3C 0A008010 */  beqz        $4, .L0018AB68
/* 08AC40 0018AB40 00000000 */   nop
/* 08AC44 0018AB44 02000524 */  addiu       $5, $0, 0x2
/* 08AC48 0018AB48 A0A3040C */  jal         SetRotType__6CFrameFi
/* 08AC4C 0018AB4C 00000000 */   nop
/* 08AC50 0018AB50 0000248E */  lw          $4, 0x0($17)
/* 08AC54 0018AB54 00004CC6 */  lwc1        $f12, 0x0($18)
/* 08AC58 0018AB58 04004DC6 */  lwc1        $f13, 0x4($18)
/* 08AC5C 0018AB5C 08004EC6 */  lwc1        $f14, 0x8($18)
/* 08AC60 0018AB60 70A3040C */  jal         SetRotation__6CFrameFfff
/* 08AC64 0018AB64 00000000 */   nop
.L0018AB68:
/* 08AC68 0018AB68 01001026 */  addiu       $16, $16, 0x1
.L0018AB6C:
/* 08AC6C 0018AB6C 0C00032A */  slti        $3, $16, 0xC
/* 08AC70 0018AB70 EEFF6014 */  bnez        $3, .L0018AB2C
/* 08AC74 0018AB74 00000000 */   nop
.L0018AB78:
/* 08AC78 0018AB78 4000BF7B */  lq          $31, 0x40($29)
/* 08AC7C 0018AB7C 3000B37B */  lq          $19, 0x30($29)
/* 08AC80 0018AB80 2000B27B */  lq          $18, 0x20($29)
/* 08AC84 0018AB84 1000B17B */  lq          $17, 0x10($29)
/* 08AC88 0018AB88 0000B07B */  lq          $16, 0x0($29)
/* 08AC8C 0018AB8C 5000BD27 */  addiu       $29, $29, 0x50
/* 08AC90 0018AB90 0800E003 */  jr          $31
/* 08AC94 0018AB94 00000000 */   nop
/* 08AC98 0018AB98 00000000 */  nop
/* 08AC9C 0018AB9C 00000000 */  nop
