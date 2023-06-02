.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadMDSFilePack__FPUiPcP14CDataAlloc2_1_
/* B6E70 001B6D70 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* B6E74 001B6D74 3000BF7F */  sq         $31, 0x30($sp)
/* B6E78 001B6D78 2000B27F */  sq         $18, 0x20($sp)
/* B6E7C 001B6D7C 1000B17F */  sq         $17, 0x10($sp)
/* B6E80 001B6D80 0000B07F */  sq         $16, 0x0($sp)
/* B6E84 001B6D84 2896A070 */  paddub     $18, $5, $0
/* B6E88 001B6D88 288EC070 */  paddub     $17, $6, $0
/* B6E8C 001B6D8C 4C00A627 */  addiu      $6, $sp, 0x4C
/* B6E90 001B6D90 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* B6E94 001B6D94 00000000 */   nop
/* B6E98 001B6D98 28864070 */  paddub     $16, $2, $0
/* B6E9C 001B6D9C 09000016 */  bnez       $16, .L001B6DC4
/* B6EA0 001B6DA0 00000000 */   nop
/* B6EA4 001B6DA4 2A00023C */  lui        $2, %hi(_879_2)
/* B6EA8 001B6DA8 90BB4424 */  addiu      $4, $2, %lo(_879_2)
/* B6EAC 001B6DAC 282E4072 */  paddub     $5, $18, $0
/* B6EB0 001B6DB0 A611040C */  jal        printf
/* B6EB4 001B6DB4 00000000 */   nop
/* B6EB8 001B6DB8 FFFF0424 */  addiu      $4, $0, -0x1
/* B6EBC 001B6DBC DC05040C */  jal        exit_2
/* B6EC0 001B6DC0 00000000 */   nop
.L001B6DC4:
/* B6EC4 001B6DC4 28260072 */  paddub     $4, $16, $0
/* B6EC8 001B6DC8 282E2072 */  paddub     $5, $17, $0
/* B6ECC 001B6DCC 28360070 */  paddub     $6, $0, $0
/* B6ED0 001B6DD0 283E0070 */  paddub     $7, $0, $0
/* B6ED4 001B6DD4 28460070 */  paddub     $8, $0, $0
/* B6ED8 001B6DD8 AC98040C */  jal        LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* B6EDC 001B6DDC 00000000 */   nop
/* B6EE0 001B6DE0 3000BF7B */  lq         $31, 0x30($sp)
/* B6EE4 001B6DE4 2000B27B */  lq         $18, 0x20($sp)
/* B6EE8 001B6DE8 1000B17B */  lq         $17, 0x10($sp)
/* B6EEC 001B6DEC 0000B07B */  lq         $16, 0x0($sp)
/* B6EF0 001B6DF0 5000BD27 */  addiu      $sp, $sp, 0x50
/* B6EF4 001B6DF4 0800E003 */  jr         $31
/* B6EF8 001B6DF8 00000000 */   nop
/* B6EFC 001B6DFC 00000000 */  nop
