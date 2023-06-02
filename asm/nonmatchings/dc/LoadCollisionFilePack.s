.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadCollisionFilePack__FPUiPcP14CDataAlloc2_1_
/* B6F00 001B6E00 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* B6F04 001B6E04 3000BF7F */  sq         $31, 0x30($sp)
/* B6F08 001B6E08 2000B27F */  sq         $18, 0x20($sp)
/* B6F0C 001B6E0C 1000B17F */  sq         $17, 0x10($sp)
/* B6F10 001B6E10 0000B07F */  sq         $16, 0x0($sp)
/* B6F14 001B6E14 2896A070 */  paddub     $18, $5, $0
/* B6F18 001B6E18 288EC070 */  paddub     $17, $6, $0
/* B6F1C 001B6E1C 4C00A627 */  addiu      $6, $sp, 0x4C
/* B6F20 001B6E20 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* B6F24 001B6E24 00000000 */   nop
/* B6F28 001B6E28 28864070 */  paddub     $16, $2, $0
/* B6F2C 001B6E2C 09000016 */  bnez       $16, .L001B6E54
/* B6F30 001B6E30 00000000 */   nop
/* B6F34 001B6E34 2A00023C */  lui        $2, %hi(_879_2)
/* B6F38 001B6E38 90BB4424 */  addiu      $4, $2, %lo(_879_2)
/* B6F3C 001B6E3C 282E4072 */  paddub     $5, $18, $0
/* B6F40 001B6E40 A611040C */  jal        printf
/* B6F44 001B6E44 00000000 */   nop
/* B6F48 001B6E48 FFFF0424 */  addiu      $4, $0, -0x1
/* B6F4C 001B6E4C DC05040C */  jal        exit_2
/* B6F50 001B6E50 00000000 */   nop
.L001B6E54:
/* B6F54 001B6E54 28260072 */  paddub     $4, $16, $0
/* B6F58 001B6E58 282E2072 */  paddub     $5, $17, $0
/* B6F5C 001B6E5C DC9B040C */  jal        LoadCollisionFile__FPUiP14CDataAlloc2_1_
/* B6F60 001B6E60 00000000 */   nop
/* B6F64 001B6E64 3000BF7B */  lq         $31, 0x30($sp)
/* B6F68 001B6E68 2000B27B */  lq         $18, 0x20($sp)
/* B6F6C 001B6E6C 1000B17B */  lq         $17, 0x10($sp)
/* B6F70 001B6E70 0000B07B */  lq         $16, 0x0($sp)
/* B6F74 001B6E74 5000BD27 */  addiu      $sp, $sp, 0x50
/* B6F78 001B6E78 0800E003 */  jr         $31
/* B6F7C 001B6E7C 00000000 */   nop
