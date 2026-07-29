.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ItemShopGetPacFileName__FiiPc
/* 0EDB80 001EDA80 F0FEBD27 */  addiu       $29, $29, -0x110
/* 0EDB84 001EDA84 1000BF7F */  sq          $31, 0x10($29)
/* 0EDB88 001EDA88 0000B07F */  sq          $16, 0x0($29)
/* 0EDB8C 001EDA8C 2886C070 */  paddub      $16, $6, $0
/* 0EDB90 001EDA90 2900023C */  lui         $2, %hi(LIT_2123)
/* 0EDB94 001EDA94 50284724 */  addiu       $7, $2, %lo(LIT_2123)
/* 0EDB98 001EDA98 2000A627 */  addiu       $6, $29, 0x20
/* 0EDB9C 001EDA9C 09000324 */  addiu       $3, $0, 0x9
.L001EDAA0:
/* 0EDBA0 001EDAA0 0000E278 */  lq          $2, 0x0($7)
/* 0EDBA4 001EDAA4 1000E724 */  addiu       $7, $7, 0x10
/* 0EDBA8 001EDAA8 FFFF6324 */  addiu       $3, $3, -0x1
/* 0EDBAC 001EDAAC 0000C27C */  sq          $2, 0x0($6)
/* 0EDBB0 001EDAB0 1000C624 */  addiu       $6, $6, 0x10
/* 0EDBB4 001EDAB4 FAFF601C */  bgtz        $3, .L001EDAA0
/* 0EDBB8 001EDAB8 00000000 */   nop
/* 0EDBBC 001EDABC C0100400 */  sll         $2, $4, 3
/* 0EDBC0 001EDAC0 21104400 */  addu        $2, $2, $4
/* 0EDBC4 001EDAC4 C0100200 */  sll         $2, $2, 3
/* 0EDBC8 001EDAC8 21185D00 */  addu        $3, $2, $29
/* 0EDBCC 001EDACC 80100500 */  sll         $2, $5, 2
/* 0EDBD0 001EDAD0 21104300 */  addu        $2, $2, $3
/* 0EDBD4 001EDAD4 B000A427 */  addiu       $4, $29, 0xB0
/* 0EDBD8 001EDAD8 2000458C */  lw          $5, 0x20($2)
/* 0EDBDC 001EDADC 5A15040C */  jal         strcpy
/* 0EDBE0 001EDAE0 00000000 */   nop
/* 0EDBE4 001EDAE4 B000A427 */  addiu       $4, $29, 0xB0
/* 0EDBE8 001EDAE8 2A00023C */  lui         $2, %hi(LIT_2126)
/* 0EDBEC 001EDAEC D8D24524 */  addiu       $5, $2, %lo(LIT_2126)
/* 0EDBF0 001EDAF0 BC14040C */  jal         strcat
/* 0EDBF4 001EDAF4 00000000 */   nop
/* 0EDBF8 001EDAF8 2900023C */  lui         $2, %hi(LIT_2124)
/* 0EDBFC 001EDAFC E0284524 */  addiu       $5, $2, %lo(LIT_2124)
/* 0EDC00 001EDB00 D000A427 */  addiu       $4, $29, 0xD0
/* 0EDC04 001EDB04 04000324 */  addiu       $3, $0, 0x4
.L001EDB08:
/* 0EDC08 001EDB08 0000A278 */  lq          $2, 0x0($5)
/* 0EDC0C 001EDB0C 1000A524 */  addiu       $5, $5, 0x10
/* 0EDC10 001EDB10 FFFF6324 */  addiu       $3, $3, -0x1
/* 0EDC14 001EDB14 0000827C */  sq          $2, 0x0($4)
/* 0EDC18 001EDB18 10008424 */  addiu       $4, $4, 0x10
/* 0EDC1C 001EDB1C FAFF601C */  bgtz        $3, .L001EDB08
/* 0EDC20 001EDB20 00000000 */   nop
/* 0EDC24 001EDB24 D000A427 */  addiu       $4, $29, 0xD0
/* 0EDC28 001EDB28 B000A527 */  addiu       $5, $29, 0xB0
/* 0EDC2C 001EDB2C BC14040C */  jal         strcat
/* 0EDC30 001EDB30 00000000 */   nop
/* 0EDC34 001EDB34 28260072 */  paddub      $4, $16, $0
/* 0EDC38 001EDB38 D000A527 */  addiu       $5, $29, 0xD0
/* 0EDC3C 001EDB3C 5A15040C */  jal         strcpy
/* 0EDC40 001EDB40 00000000 */   nop
/* 0EDC44 001EDB44 1000BF7B */  lq          $31, 0x10($29)
/* 0EDC48 001EDB48 0000B07B */  lq          $16, 0x0($29)
/* 0EDC4C 001EDB4C 1001BD27 */  addiu       $29, $29, 0x110
/* 0EDC50 001EDB50 0800E003 */  jr          $31
/* 0EDC54 001EDB54 00000000 */   nop
/* 0EDC58 001EDB58 00000000 */  nop
/* 0EDC5C 001EDB5C 00000000 */  nop
