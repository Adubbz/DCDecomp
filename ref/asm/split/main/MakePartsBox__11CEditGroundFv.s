.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MakePartsBox__11CEditGroundFv
/* 0A2D10 001A2C10 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0A2D14 001A2C14 2000BF7F */  sq          $31, 0x20($29)
/* 0A2D18 001A2C18 1000B17F */  sq          $17, 0x10($29)
/* 0A2D1C 001A2C1C 0000B07F */  sq          $16, 0x0($29)
/* 0A2D20 001A2C20 288E8070 */  paddub      $17, $4, $0
/* 0A2D24 001A2C24 28860070 */  paddub      $16, $0, $0
/* 0A2D28 001A2C28 09000010 */  b           .L001A2C50
/* 0A2D2C 001A2C2C 00000000 */   nop
.L001A2C30:
/* 0A2D30 001A2C30 80181000 */  sll         $3, $16, 2
/* 0A2D34 001A2C34 21187100 */  addu        $3, $3, $17
/* 0A2D38 001A2C38 0400648C */  lw          $4, 0x4($3)
/* 0A2D3C 001A2C3C 03008010 */  beqz        $4, .L001A2C4C
/* 0A2D40 001A2C40 00000000 */   nop
/* 0A2D44 001A2C44 C0BB050C */  jal         MakePartsBox__9CEditAreaFv
/* 0A2D48 001A2C48 00000000 */   nop
.L001A2C4C:
/* 0A2D4C 001A2C4C 01001026 */  addiu       $16, $16, 0x1
.L001A2C50:
/* 0A2D50 001A2C50 0400032A */  slti        $3, $16, 0x4
/* 0A2D54 001A2C54 F6FF6014 */  bnez        $3, .L001A2C30
/* 0A2D58 001A2C58 00000000 */   nop
/* 0A2D5C 001A2C5C 2000BF7B */  lq          $31, 0x20($29)
/* 0A2D60 001A2C60 1000B17B */  lq          $17, 0x10($29)
/* 0A2D64 001A2C64 0000B07B */  lq          $16, 0x0($29)
/* 0A2D68 001A2C68 3000BD27 */  addiu       $29, $29, 0x30
/* 0A2D6C 001A2C6C 0800E003 */  jr          $31
/* 0A2D70 001A2C70 00000000 */   nop
/* 0A2D74 001A2C74 00000000 */  nop
/* 0A2D78 001A2C78 00000000 */  nop
/* 0A2D7C 001A2C7C 00000000 */  nop
