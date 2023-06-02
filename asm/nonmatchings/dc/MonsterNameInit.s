.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MonsterNameInit__FP6ClsMesPsPUc
/* 10EC80 0020EB80 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 10EC84 0020EB84 3000BF7F */  sq         $31, 0x30($sp)
/* 10EC88 0020EB88 2000B27F */  sq         $18, 0x20($sp)
/* 10EC8C 0020EB8C 1000B17F */  sq         $17, 0x10($sp)
/* 10EC90 0020EB90 0000B07F */  sq         $16, 0x0($sp)
/* 10EC94 0020EB94 28968070 */  paddub     $18, $4, $0
/* 10EC98 0020EB98 288EA070 */  paddub     $17, $5, $0
/* 10EC9C 0020EB9C 2886C070 */  paddub     $16, $6, $0
/* 10ECA0 0020EBA0 189680AF */  sw         $0, -0x69E8($gp)
/* 10ECA4 0020EBA4 07004016 */  bnez       $18, .L0020EBC4
/* 10ECA8 0020EBA8 00000000 */   nop
/* 10ECAC 0020EBAC 2A00023C */  lui        $2, %hi(_1287_2)
/* 10ECB0 0020EBB0 A0E14424 */  addiu      $4, $2, %lo(_1287_2)
/* 10ECB4 0020EBB4 A611040C */  jal        printf
/* 10ECB8 0020EBB8 00000000 */   nop
/* 10ECBC 0020EBBC 6B000010 */  b          .L0020ED6C
/* 10ECC0 0020EBC0 00000000 */   nop
.L0020EBC4:
/* 10ECC4 0020EBC4 189692AF */  sw         $18, -0x69E8($gp)
/* 10ECC8 0020EBC8 46000224 */  addiu      $2, $0, 0x46
/* 10ECCC 0020EBCC 180042AE */  sw         $2, 0x18($18)
/* 10ECD0 0020EBD0 0A000224 */  addiu      $2, $0, 0xA
/* 10ECD4 0020EBD4 1C0042AE */  sw         $2, 0x1C($18)
/* 10ECD8 0020EBD8 200040AE */  sw         $0, 0x20($18)
/* 10ECDC 0020EBDC 240040AE */  sw         $0, 0x24($18)
/* 10ECE0 0020EBE0 280040AE */  sw         $0, 0x28($18)
/* 10ECE4 0020EBE4 900040AE */  sw         $0, 0x90($18)
/* 10ECE8 0020EBE8 01000224 */  addiu      $2, $0, 0x1
/* 10ECEC 0020EBEC 940042AE */  sw         $2, 0x94($18)
/* 10ECF0 0020EBF0 A80040C6 */  lwc1       $f0, 0xA8($18)
/* 10ECF4 0020EBF4 A40040E6 */  swc1       $f0, 0xA4($18)
/* 10ECF8 0020EBF8 AC0040AE */  sw         $0, 0xAC($18)
/* 10ECFC 0020EBFC B40040AE */  sw         $0, 0xB4($18)
/* 10ED00 0020EC00 B80040AE */  sw         $0, 0xB8($18)
/* 10ED04 0020EC04 BC0040AE */  sw         $0, 0xBC($18)
/* 10ED08 0020EC08 C00040AE */  sw         $0, 0xC0($18)
/* 10ED0C 0020EC0C 643D050C */  jal        InitMesWinTbl__6ClsMesFv
/* 10ED10 0020EC10 00000000 */   nop
/* 10ED14 0020EC14 A816428E */  lw         $2, 0x16A8($18)
/* 10ED18 0020EC18 AC1642AE */  sw         $2, 0x16AC($18)
/* 10ED1C 0020EC1C B01640AE */  sw         $0, 0x16B0($18)
/* 10ED20 0020EC20 B41640AE */  sw         $0, 0x16B4($18)
/* 10ED24 0020EC24 B81640AE */  sw         $0, 0x16B8($18)
/* 10ED28 0020EC28 FFFF0224 */  addiu      $2, $0, -0x1
/* 10ED2C 0020EC2C BC1642AE */  sw         $2, 0x16BC($18)
/* 10ED30 0020EC30 80000224 */  addiu      $2, $0, 0x80
/* 10ED34 0020EC34 D41642AE */  sw         $2, 0x16D4($18)
/* 10ED38 0020EC38 28260070 */  paddub     $4, $0, $0
/* 10ED3C 0020EC3C 06000010 */  b          .L0020EC58
/* 10ED40 0020EC40 00000000 */   nop
.L0020EC44:
/* 10ED44 0020EC44 FFFF0324 */  addiu      $3, $0, -0x1
/* 10ED48 0020EC48 80100400 */  sll        $2, $4, 2
/* 10ED4C 0020EC4C 21105200 */  addu       $2, $2, $18
/* 10ED50 0020EC50 E01643AC */  sw         $3, 0x16E0($2)
/* 10ED54 0020EC54 01008424 */  addiu      $4, $4, 0x1
.L0020EC58:
/* 10ED58 0020EC58 0A008228 */  slti       $2, $4, 0xA
/* 10ED5C 0020EC5C F9FF4014 */  bnez       $2, .L0020EC44
/* 10ED60 0020EC60 00000000 */   nop
/* 10ED64 0020EC64 281E0070 */  paddub     $3, $0, $0
/* 10ED68 0020EC68 05000010 */  b          .L0020EC80
/* 10ED6C 0020EC6C 00000000 */   nop
.L0020EC70:
/* 10ED70 0020EC70 80100300 */  sll        $2, $3, 2
/* 10ED74 0020EC74 21105200 */  addu       $2, $2, $18
/* 10ED78 0020EC78 081740AC */  sw         $0, 0x1708($2)
/* 10ED7C 0020EC7C 01006324 */  addiu      $3, $3, 0x1
.L0020EC80:
/* 10ED80 0020EC80 08006228 */  slti       $2, $3, 0x8
/* 10ED84 0020EC84 FAFF4014 */  bnez       $2, .L0020EC70
/* 10ED88 0020EC88 00000000 */   nop
/* 10ED8C 0020EC8C 281740AE */  sw         $0, 0x1728($18)
/* 10ED90 0020EC90 2C1740AE */  sw         $0, 0x172C($18)
/* 10ED94 0020EC94 01000224 */  addiu      $2, $0, 0x1
/* 10ED98 0020EC98 301742AE */  sw         $2, 0x1730($18)
/* 10ED9C 0020EC9C 341740AE */  sw         $0, 0x1734($18)
/* 10EDA0 0020ECA0 FFFF0224 */  addiu      $2, $0, -0x1
/* 10EDA4 0020ECA4 381742AE */  sw         $2, 0x1738($18)
/* 10EDA8 0020ECA8 3C1742AE */  sw         $2, 0x173C($18)
/* 10EDAC 0020ECAC 401742AE */  sw         $2, 0x1740($18)
/* 10EDB0 0020ECB0 441740AE */  sw         $0, 0x1744($18)
/* 10EDB4 0020ECB4 481740AE */  sw         $0, 0x1748($18)
/* 10EDB8 0020ECB8 28260070 */  paddub     $4, $0, $0
/* 10EDBC 0020ECBC 07000010 */  b          .L0020ECDC
/* 10EDC0 0020ECC0 00000000 */   nop
.L0020ECC4:
/* 10EDC4 0020ECC4 FFFF0324 */  addiu      $3, $0, -0x1
/* 10EDC8 0020ECC8 C0100400 */  sll        $2, $4, 3
/* 10EDCC 0020ECCC 21105200 */  addu       $2, $2, $18
/* 10EDD0 0020ECD0 501743AC */  sw         $3, 0x1750($2)
/* 10EDD4 0020ECD4 541743AC */  sw         $3, 0x1754($2)
/* 10EDD8 0020ECD8 01008424 */  addiu      $4, $4, 0x1
.L0020ECDC:
/* 10EDDC 0020ECDC 0A008228 */  slti       $2, $4, 0xA
/* 10EDE0 0020ECE0 F8FF4014 */  bnez       $2, .L0020ECC4
/* 10EDE4 0020ECE4 00000000 */   nop
/* 10EDE8 0020ECE8 1896848F */  lw         $4, -0x69E8($gp)
/* 10EDEC 0020ECEC 04000524 */  addiu      $5, $0, 0x4
/* 10EDF0 0020ECF0 9836050C */  jal        Preset__6ClsMesFi
/* 10EDF4 0020ECF4 00000000 */   nop
/* 10EDF8 0020ECF8 1A000324 */  addiu      $3, $0, 0x1A
/* 10EDFC 0020ECFC 1896828F */  lw         $2, -0x69E8($gp)
/* 10EE00 0020ED00 4C1743AC */  sw         $3, 0x174C($2)
/* 10EE04 0020ED04 1896828F */  lw         $2, -0x69E8($gp)
/* 10EE08 0020ED08 B01750AC */  sw         $16, 0x17B0($2)
/* 10EE0C 0020ED0C 01000324 */  addiu      $3, $0, 0x1
/* 10EE10 0020ED10 1896828F */  lw         $2, -0x69E8($gp)
/* 10EE14 0020ED14 140043AC */  sw         $3, 0x14($2)
/* 10EE18 0020ED18 1896848F */  lw         $4, -0x69E8($gp)
/* 10EE1C 0020ED1C 282E2072 */  paddub     $5, $17, $0
/* 10EE20 0020ED20 8036050C */  jal        SetBuff__6ClsMesFPs
/* 10EE24 0020ED24 00000000 */   nop
/* 10EE28 0020ED28 1896848F */  lw         $4, -0x69E8($gp)
/* 10EE2C 0020ED2C 388D858F */  lw         $5, -0x72C8($gp)
/* 10EE30 0020ED30 8C36050C */  jal        SetBuff_system__6ClsMesFPs
/* 10EE34 0020ED34 00000000 */   nop
/* 10EE38 0020ED38 01000224 */  addiu      $2, $0, 0x1
/* 10EE3C 0020ED3C 209682A7 */  sh         $2, -0x69E0($gp)
/* 10EE40 0020ED40 1C8D848F */  lw         $4, -0x72E4($gp)
/* 10EE44 0020ED44 CC5E050C */  jal        GetConfigData__9CSaveDataFv
/* 10EE48 0020ED48 00000000 */   nop
/* 10EE4C 0020ED4C 06004010 */  beqz       $2, .L0020ED68
/* 10EE50 0020ED50 00000000 */   nop
/* 10EE54 0020ED54 2000438C */  lw         $3, 0x20($2)
/* 10EE58 0020ED58 2B180300 */  sltu       $3, $0, $3
/* 10EE5C 0020ED5C 01006338 */  xori       $3, $3, 0x1
/* 10EE60 0020ED60 FF006330 */  andi       $3, $3, 0xFF
/* 10EE64 0020ED64 209683A7 */  sh         $3, -0x69E0($gp)
.L0020ED68:
/* 10EE68 0020ED68 249680A7 */  sh         $0, -0x69DC($gp)
.L0020ED6C:
/* 10EE6C 0020ED6C 3000BF7B */  lq         $31, 0x30($sp)
/* 10EE70 0020ED70 2000B27B */  lq         $18, 0x20($sp)
/* 10EE74 0020ED74 1000B17B */  lq         $17, 0x10($sp)
/* 10EE78 0020ED78 0000B07B */  lq         $16, 0x0($sp)
/* 10EE7C 0020ED7C 4000BD27 */  addiu      $sp, $sp, 0x40
/* 10EE80 0020ED80 0800E003 */  jr         $31
/* 10EE84 0020ED84 00000000 */   nop
/* 10EE88 0020ED88 00000000 */  nop
/* 10EE8C 0020ED8C 00000000 */  nop
