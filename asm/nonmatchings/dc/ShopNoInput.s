.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ShopNoInput__FPiii
/* E7040 001E6F40 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E7044 001E6F44 0000BF7F */  sq         $31, 0x0($sp)
/* E7048 001E6F48 0400A004 */  bltz       $5, .L001E6F5C
/* E704C 001E6F4C 00000000 */   nop
/* E7050 001E6F50 C900A128 */  slti       $at, $5, 0xC9
/* E7054 001E6F54 02002014 */  bnez       $at, .L001E6F60
/* E7058 001E6F58 00000000 */   nop
.L001E6F5C:
/* E705C 001E6F5C 282E0070 */  paddub     $5, $0, $0
.L001E6F60:
/* E7060 001E6F60 6400A128 */  slti       $at, $5, 0x64
/* E7064 001E6F64 0B002010 */  beqz       $at, .L001E6F94
/* E7068 001E6F68 00000000 */   nop
/* E706C 001E6F6C 1500A128 */  slti       $at, $5, 0x15
/* E7070 001E6F70 02002014 */  bnez       $at, .L001E6F7C
/* E7074 001E6F74 00000000 */   nop
/* E7078 001E6F78 282E0070 */  paddub     $5, $0, $0
.L001E6F7C:
/* E707C 001E6F7C 3CB8070C */  jal        InitItemShop2__FPiii
/* E7080 001E6F80 00000000 */   nop
/* E7084 001E6F84 01000224 */  addiu      $2, $0, 0x1
/* E7088 001E6F88 C49482A7 */  sh         $2, -0x6B3C($gp)
/* E708C 001E6F8C 09000010 */  b          .L001E6FB4
/* E7090 001E6F90 00000000 */   nop
.L001E6F94:
/* E7094 001E6F94 9CFFA524 */  addiu      $5, $5, -0x64
/* E7098 001E6F98 0600A128 */  slti       $at, $5, 0x6
/* E709C 001E6F9C 02002014 */  bnez       $at, .L001E6FA8
/* E70A0 001E6FA0 00000000 */   nop
/* E70A4 001E6FA4 282E0070 */  paddub     $5, $0, $0
.L001E6FA8:
/* E70A8 001E6FA8 24A1070C */  jal        InitChargeShop__FPiii
/* E70AC 001E6FAC 00000000 */   nop
/* E70B0 001E6FB0 C49480A7 */  sh         $0, -0x6B3C($gp)
.L001E6FB4:
/* E70B4 001E6FB4 01000224 */  addiu      $2, $0, 0x1
/* E70B8 001E6FB8 0000BF7B */  lq         $31, 0x0($sp)
/* E70BC 001E6FBC 1000BD27 */  addiu      $sp, $sp, 0x10
/* E70C0 001E6FC0 0800E003 */  jr         $31
/* E70C4 001E6FC4 00000000 */   nop
/* E70C8 001E6FC8 00000000 */  nop
/* E70CC 001E6FCC 00000000 */  nop
