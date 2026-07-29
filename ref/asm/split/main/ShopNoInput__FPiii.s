.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ShopNoInput__FPiii
/* 0E7040 001E6F40 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0E7044 001E6F44 0000BF7F */  sq          $31, 0x0($29)
/* 0E7048 001E6F48 0400A004 */  bltz        $5, .L001E6F5C
/* 0E704C 001E6F4C 00000000 */   nop
/* 0E7050 001E6F50 C900A128 */  slti        $1, $5, 0xC9
/* 0E7054 001E6F54 02002014 */  bnez        $1, .L001E6F60
/* 0E7058 001E6F58 00000000 */   nop
.L001E6F5C:
/* 0E705C 001E6F5C 282E0070 */  paddub      $5, $0, $0
.L001E6F60:
/* 0E7060 001E6F60 6400A128 */  slti        $1, $5, 0x64
/* 0E7064 001E6F64 0B002010 */  beqz        $1, .L001E6F94
/* 0E7068 001E6F68 00000000 */   nop
/* 0E706C 001E6F6C 1500A128 */  slti        $1, $5, 0x15
/* 0E7070 001E6F70 02002014 */  bnez        $1, .L001E6F7C
/* 0E7074 001E6F74 00000000 */   nop
/* 0E7078 001E6F78 282E0070 */  paddub      $5, $0, $0
.L001E6F7C:
/* 0E707C 001E6F7C 3CB8070C */  jal         InitItemShop2__FPiii
/* 0E7080 001E6F80 00000000 */   nop
/* 0E7084 001E6F84 01000224 */  addiu       $2, $0, 0x1
/* 0E7088 001E6F88 C49482A7 */  sh          $2, -0x6B3C($28)
/* 0E708C 001E6F8C 09000010 */  b           .L001E6FB4
/* 0E7090 001E6F90 00000000 */   nop
.L001E6F94:
/* 0E7094 001E6F94 9CFFA524 */  addiu       $5, $5, -0x64
/* 0E7098 001E6F98 0600A128 */  slti        $1, $5, 0x6
/* 0E709C 001E6F9C 02002014 */  bnez        $1, .L001E6FA8
/* 0E70A0 001E6FA0 00000000 */   nop
/* 0E70A4 001E6FA4 282E0070 */  paddub      $5, $0, $0
.L001E6FA8:
/* 0E70A8 001E6FA8 24A1070C */  jal         InitChargeShop__FPiii
/* 0E70AC 001E6FAC 00000000 */   nop
/* 0E70B0 001E6FB0 C49480A7 */  sh          $0, -0x6B3C($28)
.L001E6FB4:
/* 0E70B4 001E6FB4 01000224 */  addiu       $2, $0, 0x1
/* 0E70B8 001E6FB8 0000BF7B */  lq          $31, 0x0($29)
/* 0E70BC 001E6FBC 1000BD27 */  addiu       $29, $29, 0x10
/* 0E70C0 001E6FC0 0800E003 */  jr          $31
/* 0E70C4 001E6FC4 00000000 */   nop
/* 0E70C8 001E6FC8 00000000 */  nop
/* 0E70CC 001E6FCC 00000000 */  nop
