.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandSHADOW_MODEL__FPPv
/* 3A290 0013A190 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 3A294 0013A194 2000BF7F */  sq         $31, 0x20($sp)
/* 3A298 0013A198 1000B17F */  sq         $17, 0x10($sp)
/* 3A29C 0013A19C 0000B07F */  sq         $16, 0x0($sp)
/* 3A2A0 0013A1A0 288E8070 */  paddub     $17, $4, $0
/* 3A2A4 0013A1A4 08001024 */  addiu      $16, $0, 0x8
/* 3A2A8 0013A1A8 AC8C828F */  lw         $2, -0x7354($gp)
/* 3A2AC 0013A1AC 02004010 */  beqz       $2, .L0013A1B8
/* 3A2B0 0013A1B0 00000000 */   nop
/* 3A2B4 0013A1B4 0E001024 */  addiu      $16, $0, 0xE
.L0013A1B8:
/* 3A2B8 0013A1B8 0000258E */  lw         $5, 0x0($17)
/* 3A2BC 0013A1BC B08C848F */  lw         $4, -0x7350($gp)
/* 3A2C0 0013A1C0 28360070 */  paddub     $6, $0, $0
/* 3A2C4 0013A1C4 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 3A2C8 0013A1C8 00000000 */   nop
/* 3A2CC 0013A1CC 08004014 */  bnez       $2, .L0013A1F0
/* 3A2D0 0013A1D0 00000000 */   nop
/* 3A2D4 0013A1D4 0000258E */  lw         $5, 0x0($17)
/* 3A2D8 0013A1D8 2A00023C */  lui        $2, %hi(_775)
/* 3A2DC 0013A1DC 48904424 */  addiu      $4, $2, %lo(_775)
/* 3A2E0 0013A1E0 A611040C */  jal        printf
/* 3A2E4 0013A1E4 00000000 */   nop
/* 3A2E8 0013A1E8 0A000010 */  b          .L0013A214
/* 3A2EC 0013A1EC 00000000 */   nop
.L0013A1F0:
/* 3A2F0 0013A1F0 28264070 */  paddub     $4, $2, $0
/* 3A2F4 0013A1F4 8C8C858F */  lw         $5, -0x7374($gp)
/* 3A2F8 0013A1F8 28360072 */  paddub     $6, $16, $0
/* 3A2FC 0013A1FC 283E0070 */  paddub     $7, $0, $0
/* 3A300 0013A200 28460070 */  paddub     $8, $0, $0
/* 3A304 0013A204 AC98040C */  jal        LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 3A308 0013A208 00000000 */   nop
/* 3A30C 0013A20C A08C838F */  lw         $3, -0x7360($gp)
/* 3A310 0013A210 C00062AC */  sw         $2, 0xC0($3)
.L0013A214:
/* 3A314 0013A214 2000BF7B */  lq         $31, 0x20($sp)
/* 3A318 0013A218 1000B17B */  lq         $17, 0x10($sp)
/* 3A31C 0013A21C 0000B07B */  lq         $16, 0x0($sp)
/* 3A320 0013A220 3000BD27 */  addiu      $sp, $sp, 0x30
/* 3A324 0013A224 0800E003 */  jr         $31
/* 3A328 0013A228 00000000 */   nop
/* 3A32C 0013A22C 00000000 */  nop
