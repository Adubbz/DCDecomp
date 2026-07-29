.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel checkErr__11CRandomItemFv
/* 0D7040 001D6F40 281E0070 */  paddub      $3, $0, $0
/* 0D7044 001D6F44 10000010 */  b           .L001D6F88
/* 0D7048 001D6F48 00000000 */   nop
.L001D6F4C:
/* 0D704C 001D6F4C 80100300 */  sll         $2, $3, 2
/* 0D7050 001D6F50 21104400 */  addu        $2, $2, $4
/* 0D7054 001D6F54 14054524 */  addiu       $5, $2, 0x514
/* 0D7058 001D6F58 1405428C */  lw          $2, 0x514($2)
/* 0D705C 001D6F5C 09004018 */  blez        $2, .L001D6F84
/* 0D7060 001D6F60 00000000 */   nop
/* 0D7064 001D6F64 03004128 */  slti        $1, $2, 0x3
/* 0D7068 001D6F68 06002010 */  beqz        $1, .L001D6F84
/* 0D706C 001D6F6C 00000000 */   nop
/* 0D7070 001D6F70 03000224 */  addiu       $2, $0, 0x3
/* 0D7074 001D6F74 0000A2AC */  sw          $2, 0x0($5)
/* 0D7078 001D6F78 01000224 */  addiu       $2, $0, 0x1
/* 0D707C 001D6F7C 06000010 */  b           .L001D6F98
/* 0D7080 001D6F80 00000000 */   nop
.L001D6F84:
/* 0D7084 001D6F84 01006324 */  addiu       $3, $3, 0x1
.L001D6F88:
/* 0D7088 001D6F88 20006228 */  slti        $2, $3, 0x20
/* 0D708C 001D6F8C EFFF4014 */  bnez        $2, .L001D6F4C
/* 0D7090 001D6F90 00000000 */   nop
/* 0D7094 001D6F94 28160070 */  paddub      $2, $0, $0
.L001D6F98:
/* 0D7098 001D6F98 0800E003 */  jr          $31
/* 0D709C 001D6F9C 00000000 */   nop
