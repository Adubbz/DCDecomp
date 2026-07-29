.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Set__21CHIT_MACHINGUN_EFFECTFPf
/* 0AEA80 001AE980 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0AEA84 001AE984 2000BF7F */  sq          $31, 0x20($29)
/* 0AEA88 001AE988 1000B17F */  sq          $17, 0x10($29)
/* 0AEA8C 001AE98C 0000B07F */  sq          $16, 0x0($29)
/* 0AEA90 001AE990 288E8070 */  paddub      $17, $4, $0
/* 0AEA94 001AE994 FFFF1024 */  addiu       $16, $0, -0x1
/* 0AEA98 001AE998 28260070 */  paddub      $4, $0, $0
/* 0AEA9C 001AE99C 0A000010 */  b           .L001AE9C8
/* 0AEAA0 001AE9A0 00000000 */   nop
.L001AE9A4:
/* 0AEAA4 001AE9A4 80180400 */  sll         $3, $4, 2
/* 0AEAA8 001AE9A8 21187100 */  addu        $3, $3, $17
/* 0AEAAC 001AE9AC 0001638C */  lw          $3, 0x100($3)
/* 0AEAB0 001AE9B0 04006104 */  bgez        $3, .L001AE9C4
/* 0AEAB4 001AE9B4 00000000 */   nop
/* 0AEAB8 001AE9B8 28868070 */  paddub      $16, $4, $0
/* 0AEABC 001AE9BC 05000010 */  b           .L001AE9D4
/* 0AEAC0 001AE9C0 00000000 */   nop
.L001AE9C4:
/* 0AEAC4 001AE9C4 01008424 */  addiu       $4, $4, 0x1
.L001AE9C8:
/* 0AEAC8 001AE9C8 10008328 */  slti        $3, $4, 0x10
/* 0AEACC 001AE9CC F5FF6014 */  bnez        $3, .L001AE9A4
/* 0AEAD0 001AE9D0 00000000 */   nop
.L001AE9D4:
/* 0AEAD4 001AE9D4 FFFF0324 */  addiu       $3, $0, -0x1
/* 0AEAD8 001AE9D8 09000312 */  beq         $16, $3, .L001AEA00
/* 0AEADC 001AE9DC 00000000 */   nop
/* 0AEAE0 001AE9E0 00111000 */  sll         $2, $16, 4
/* 0AEAE4 001AE9E4 21202202 */  addu        $4, $17, $2
/* 0AEAE8 001AE9E8 0C86040C */  jal         sceVu0CopyVector
/* 0AEAEC 001AE9EC 00000000 */   nop
/* 0AEAF0 001AE9F0 11000424 */  addiu       $4, $0, 0x11
/* 0AEAF4 001AE9F4 80181000 */  sll         $3, $16, 2
/* 0AEAF8 001AE9F8 21187100 */  addu        $3, $3, $17
/* 0AEAFC 001AE9FC 000164AC */  sw          $4, 0x100($3)
.L001AEA00:
/* 0AEB00 001AEA00 2000BF7B */  lq          $31, 0x20($29)
/* 0AEB04 001AEA04 1000B17B */  lq          $17, 0x10($29)
/* 0AEB08 001AEA08 0000B07B */  lq          $16, 0x0($29)
/* 0AEB0C 001AEA0C 3000BD27 */  addiu       $29, $29, 0x30
/* 0AEB10 001AEA10 0800E003 */  jr          $31
/* 0AEB14 001AEA14 00000000 */   nop
/* 0AEB18 001AEA18 00000000 */  nop
/* 0AEB1C 001AEA1C 00000000 */  nop
