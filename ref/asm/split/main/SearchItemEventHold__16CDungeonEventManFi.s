.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SearchItemEventHold__16CDungeonEventManFi
/* 0CCB60 001CCA60 28360070 */  paddub      $6, $0, $0
/* 0CCB64 001CCA64 12000010 */  b           .L001CCAB0
/* 0CCB68 001CCA68 00000000 */   nop
.L001CCA6C:
/* 0CCB6C 001CCA6C 80390600 */  sll         $7, $6, 6
/* 0CCB70 001CCA70 2118E400 */  addu        $3, $7, $4
/* 0CCB74 001CCA74 0010688C */  lw          $8, 0x1000($3)
/* 0CCB78 001CCA78 04000011 */  beqz        $8, .L001CCA8C
/* 0CCB7C 001CCA7C 00000000 */   nop
/* 0CCB80 001CCA80 3810638C */  lw          $3, 0x1038($3)
/* 0CCB84 001CCA84 02000010 */  b           .L001CCA90
/* 0CCB88 001CCA88 00000000 */   nop
.L001CCA8C:
/* 0CCB8C 001CCA8C 281E0070 */  paddub      $3, $0, $0
.L001CCA90:
/* 0CCB90 001CCA90 06006010 */  beqz        $3, .L001CCAAC
/* 0CCB94 001CCA94 00000000 */   nop
/* 0CCB98 001CCA98 2000038D */  lw          $3, 0x20($8)
/* 0CCB9C 001CCA9C 0300A314 */  bne         $5, $3, .L001CCAAC
/* 0CCBA0 001CCAA0 00000000 */   nop
/* 0CCBA4 001CCAA4 2118E400 */  addu        $3, $7, $4
/* 0CCBA8 001CCAA8 301060AC */  sw          $0, 0x1030($3)
.L001CCAAC:
/* 0CCBAC 001CCAAC 0100C624 */  addiu       $6, $6, 0x1
.L001CCAB0:
/* 0CCBB0 001CCAB0 6000C328 */  slti        $3, $6, 0x60
/* 0CCBB4 001CCAB4 EDFF6014 */  bnez        $3, .L001CCA6C
/* 0CCBB8 001CCAB8 00000000 */   nop
/* 0CCBBC 001CCABC 0800E003 */  jr          $31
/* 0CCBC0 001CCAC0 00000000 */   nop
/* 0CCBC4 001CCAC4 00000000 */  nop
/* 0CCBC8 001CCAC8 00000000 */  nop
/* 0CCBCC 001CCACC 00000000 */  nop
