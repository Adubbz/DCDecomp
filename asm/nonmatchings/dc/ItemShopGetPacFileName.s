.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ItemShopGetPacFileName__FiiPc
/* EDB80 001EDA80 F0FEBD27 */  addiu      $sp, $sp, -0x110
/* EDB84 001EDA84 1000BF7F */  sq         $31, 0x10($sp)
/* EDB88 001EDA88 0000B07F */  sq         $16, 0x0($sp)
/* EDB8C 001EDA8C 2886C070 */  paddub     $16, $6, $0
/* EDB90 001EDA90 2900023C */  lui        $2, %hi(_2123)
/* EDB94 001EDA94 50284724 */  addiu      $7, $2, %lo(_2123)
/* EDB98 001EDA98 2000A627 */  addiu      $6, $sp, 0x20
/* EDB9C 001EDA9C 09000324 */  addiu      $3, $0, 0x9
.L001EDAA0:
/* EDBA0 001EDAA0 0000E278 */  lq         $2, 0x0($7)
/* EDBA4 001EDAA4 1000E724 */  addiu      $7, $7, 0x10
/* EDBA8 001EDAA8 FFFF6324 */  addiu      $3, $3, -0x1
/* EDBAC 001EDAAC 0000C27C */  sq         $2, 0x0($6)
/* EDBB0 001EDAB0 1000C624 */  addiu      $6, $6, 0x10
/* EDBB4 001EDAB4 FAFF601C */  bgtz       $3, .L001EDAA0
/* EDBB8 001EDAB8 00000000 */   nop
/* EDBBC 001EDABC C0100400 */  sll        $2, $4, 3
/* EDBC0 001EDAC0 21104400 */  addu       $2, $2, $4
/* EDBC4 001EDAC4 C0100200 */  sll        $2, $2, 3
/* EDBC8 001EDAC8 21185D00 */  addu       $3, $2, $sp
/* EDBCC 001EDACC 80100500 */  sll        $2, $5, 2
/* EDBD0 001EDAD0 21104300 */  addu       $2, $2, $3
/* EDBD4 001EDAD4 B000A427 */  addiu      $4, $sp, 0xB0
/* EDBD8 001EDAD8 2000458C */  lw         $5, 0x20($2)
/* EDBDC 001EDADC 5A15040C */  jal        strcpy
/* EDBE0 001EDAE0 00000000 */   nop
/* EDBE4 001EDAE4 B000A427 */  addiu      $4, $sp, 0xB0
/* EDBE8 001EDAE8 2A00023C */  lui        $2, %hi(_2126)
/* EDBEC 001EDAEC D8D24524 */  addiu      $5, $2, %lo(_2126)
/* EDBF0 001EDAF0 BC14040C */  jal        strcat
/* EDBF4 001EDAF4 00000000 */   nop
/* EDBF8 001EDAF8 2900023C */  lui        $2, %hi(_2124)
/* EDBFC 001EDAFC E0284524 */  addiu      $5, $2, %lo(_2124)
/* EDC00 001EDB00 D000A427 */  addiu      $4, $sp, 0xD0
/* EDC04 001EDB04 04000324 */  addiu      $3, $0, 0x4
.L001EDB08:
/* EDC08 001EDB08 0000A278 */  lq         $2, 0x0($5)
/* EDC0C 001EDB0C 1000A524 */  addiu      $5, $5, 0x10
/* EDC10 001EDB10 FFFF6324 */  addiu      $3, $3, -0x1
/* EDC14 001EDB14 0000827C */  sq         $2, 0x0($4)
/* EDC18 001EDB18 10008424 */  addiu      $4, $4, 0x10
/* EDC1C 001EDB1C FAFF601C */  bgtz       $3, .L001EDB08
/* EDC20 001EDB20 00000000 */   nop
/* EDC24 001EDB24 D000A427 */  addiu      $4, $sp, 0xD0
/* EDC28 001EDB28 B000A527 */  addiu      $5, $sp, 0xB0
/* EDC2C 001EDB2C BC14040C */  jal        strcat
/* EDC30 001EDB30 00000000 */   nop
/* EDC34 001EDB34 28260072 */  paddub     $4, $16, $0
/* EDC38 001EDB38 D000A527 */  addiu      $5, $sp, 0xD0
/* EDC3C 001EDB3C 5A15040C */  jal        strcpy
/* EDC40 001EDB40 00000000 */   nop
/* EDC44 001EDB44 1000BF7B */  lq         $31, 0x10($sp)
/* EDC48 001EDB48 0000B07B */  lq         $16, 0x0($sp)
/* EDC4C 001EDB4C 1001BD27 */  addiu      $sp, $sp, 0x110
/* EDC50 001EDB50 0800E003 */  jr         $31
/* EDC54 001EDB54 00000000 */   nop
/* EDC58 001EDB58 00000000 */  nop
/* EDC5C 001EDB5C 00000000 */  nop
