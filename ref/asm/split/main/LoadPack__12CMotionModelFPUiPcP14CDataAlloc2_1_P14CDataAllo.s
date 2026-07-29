.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadPack__12CMotionModelFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P11MOTION_INFOi
/* 0B6B30 001B6A30 20FEBD27 */  addiu       $29, $29, -0x1E0
/* 0B6B34 001B6A34 9000BF7F */  sq          $31, 0x90($29)
/* 0B6B38 001B6A38 8000BE7F */  sq          $30, 0x80($29)
/* 0B6B3C 001B6A3C 7000B77F */  sq          $23, 0x70($29)
/* 0B6B40 001B6A40 6000B67F */  sq          $22, 0x60($29)
/* 0B6B44 001B6A44 5000B57F */  sq          $21, 0x50($29)
/* 0B6B48 001B6A48 4000B47F */  sq          $20, 0x40($29)
/* 0B6B4C 001B6A4C 3000B37F */  sq          $19, 0x30($29)
/* 0B6B50 001B6A50 2000B27F */  sq          $18, 0x20($29)
/* 0B6B54 001B6A54 1000B17F */  sq          $17, 0x10($29)
/* 0B6B58 001B6A58 0000B07F */  sq          $16, 0x0($29)
/* 0B6B5C 001B6A5C 28B68070 */  paddub      $22, $4, $0
/* 0B6B60 001B6A60 28AEA070 */  paddub      $21, $5, $0
/* 0B6B64 001B6A64 2886C070 */  paddub      $16, $6, $0
/* 0B6B68 001B6A68 28A6E070 */  paddub      $20, $7, $0
/* 0B6B6C 001B6A6C 28F60071 */  paddub      $30, $8, $0
/* 0B6B70 001B6A70 289E2071 */  paddub      $19, $9, $0
/* 0B6B74 001B6A74 28964071 */  paddub      $18, $10, $0
/* 0B6B78 001B6A78 D000A427 */  addiu       $4, $29, 0xD0
/* 0B6B7C 001B6A7C 282E0072 */  paddub      $5, $16, $0
/* 0B6B80 001B6A80 5A15040C */  jal         strcpy
/* 0B6B84 001B6A84 00000000 */   nop
/* 0B6B88 001B6A88 1001A427 */  addiu       $4, $29, 0x110
/* 0B6B8C 001B6A8C 282E0072 */  paddub      $5, $16, $0
/* 0B6B90 001B6A90 5A15040C */  jal         strcpy
/* 0B6B94 001B6A94 00000000 */   nop
/* 0B6B98 001B6A98 5001A427 */  addiu       $4, $29, 0x150
/* 0B6B9C 001B6A9C 282E0072 */  paddub      $5, $16, $0
/* 0B6BA0 001B6AA0 5A15040C */  jal         strcpy
/* 0B6BA4 001B6AA4 00000000 */   nop
/* 0B6BA8 001B6AA8 9001A427 */  addiu       $4, $29, 0x190
/* 0B6BAC 001B6AAC 282E0072 */  paddub      $5, $16, $0
/* 0B6BB0 001B6AB0 5A15040C */  jal         strcpy
/* 0B6BB4 001B6AB4 00000000 */   nop
/* 0B6BB8 001B6AB8 D000A427 */  addiu       $4, $29, 0xD0
/* 0B6BBC 001B6ABC 2A00023C */  lui         $2, %hi(LIT_863)
/* 0B6BC0 001B6AC0 38BB4524 */  addiu       $5, $2, %lo(LIT_863)
/* 0B6BC4 001B6AC4 BC14040C */  jal         strcat
/* 0B6BC8 001B6AC8 00000000 */   nop
/* 0B6BCC 001B6ACC 1001A427 */  addiu       $4, $29, 0x110
/* 0B6BD0 001B6AD0 2A00023C */  lui         $2, %hi(LIT_864)
/* 0B6BD4 001B6AD4 40BB4524 */  addiu       $5, $2, %lo(LIT_864)
/* 0B6BD8 001B6AD8 BC14040C */  jal         strcat
/* 0B6BDC 001B6ADC 00000000 */   nop
/* 0B6BE0 001B6AE0 5001A427 */  addiu       $4, $29, 0x150
/* 0B6BE4 001B6AE4 2A00023C */  lui         $2, %hi(LIT_865)
/* 0B6BE8 001B6AE8 48BB4524 */  addiu       $5, $2, %lo(LIT_865)
/* 0B6BEC 001B6AEC BC14040C */  jal         strcat
/* 0B6BF0 001B6AF0 00000000 */   nop
/* 0B6BF4 001B6AF4 9001A427 */  addiu       $4, $29, 0x190
/* 0B6BF8 001B6AF8 2A00023C */  lui         $2, %hi(LIT_866)
/* 0B6BFC 001B6AFC 50BB4524 */  addiu       $5, $2, %lo(LIT_866)
/* 0B6C00 001B6B00 BC14040C */  jal         strcat
/* 0B6C04 001B6B04 00000000 */   nop
/* 0B6C08 001B6B08 288E0070 */  paddub      $17, $0, $0
/* 0B6C0C 001B6B0C 02004012 */  beqz        $18, .L001B6B18
/* 0B6C10 001B6B10 00000000 */   nop
/* 0B6C14 001B6B14 06001124 */  addiu       $17, $0, 0x6
.L001B6B18:
/* 0B6C18 001B6B18 2826A072 */  paddub      $4, $21, $0
/* 0B6C1C 001B6B1C D000A527 */  addiu       $5, $29, 0xD0
/* 0B6C20 001B6B20 DC01A627 */  addiu       $6, $29, 0x1DC
/* 0B6C24 001B6B24 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0B6C28 001B6B28 00000000 */   nop
/* 0B6C2C 001B6B2C 28864070 */  paddub      $16, $2, $0
/* 0B6C30 001B6B30 09000016 */  bnez        $16, .L001B6B58
/* 0B6C34 001B6B34 00000000 */   nop
/* 0B6C38 001B6B38 2A00023C */  lui         $2, %hi(LIT_867)
/* 0B6C3C 001B6B3C 60BB4424 */  addiu       $4, $2, %lo(LIT_867)
/* 0B6C40 001B6B40 D000A527 */  addiu       $5, $29, 0xD0
/* 0B6C44 001B6B44 A611040C */  jal         printf
/* 0B6C48 001B6B48 00000000 */   nop
/* 0B6C4C 001B6B4C FFFF0424 */  addiu       $4, $0, -0x1
/* 0B6C50 001B6B50 DC05040C */  jal         exit__2
/* 0B6C54 001B6B54 00000000 */   nop
.L001B6B58:
/* 0B6C58 001B6B58 28260072 */  paddub      $4, $16, $0
/* 0B6C5C 001B6B5C 282E8072 */  paddub      $5, $20, $0
/* 0B6C60 001B6B60 28362072 */  paddub      $6, $17, $0
/* 0B6C64 001B6B64 283E0070 */  paddub      $7, $0, $0
/* 0B6C68 001B6B68 28460070 */  paddub      $8, $0, $0
/* 0B6C6C 001B6B6C AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 0B6C70 001B6B70 00000000 */   nop
/* 0B6C74 001B6B74 0000C2AE */  sw          $2, 0x0($22)
/* 0B6C78 001B6B78 2A00023C */  lui         $2, %hi(LIT_868)
/* 0B6C7C 001B6B7C 78BB4424 */  addiu       $4, $2, %lo(LIT_868)
/* 0B6C80 001B6B80 D000A527 */  addiu       $5, $29, 0xD0
/* 0B6C84 001B6B84 A611040C */  jal         printf
/* 0B6C88 001B6B88 00000000 */   nop
/* 0B6C8C 001B6B8C 5001A327 */  addiu       $3, $29, 0x150
/* 0B6C90 001B6B90 AC00A227 */  addiu       $2, $29, 0xAC
/* 0B6C94 001B6B94 000043AC */  sw          $3, 0x0($2)
/* 0B6C98 001B6B98 1001A527 */  addiu       $5, $29, 0x110
/* 0B6C9C 001B6B9C A000A5AF */  sw          $5, 0xA0($29)
/* 0B6CA0 001B6BA0 9001A327 */  addiu       $3, $29, 0x190
/* 0B6CA4 001B6BA4 B800A227 */  addiu       $2, $29, 0xB8
/* 0B6CA8 001B6BA8 000043AC */  sw          $3, 0x0($2)
/* 0B6CAC 001B6BAC A800B727 */  addiu       $23, $29, 0xA8
/* 0B6CB0 001B6BB0 0000E0AE */  sw          $0, 0x0($23)
/* 0B6CB4 001B6BB4 B400B027 */  addiu       $16, $29, 0xB4
/* 0B6CB8 001B6BB8 000000AE */  sw          $0, 0x0($16)
/* 0B6CBC 001B6BBC C000B127 */  addiu       $17, $29, 0xC0
/* 0B6CC0 001B6BC0 000020AE */  sw          $0, 0x0($17)
/* 0B6CC4 001B6BC4 2826A072 */  paddub      $4, $21, $0
/* 0B6CC8 001B6BC8 2836E072 */  paddub      $6, $23, $0
/* 0B6CCC 001B6BCC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0B6CD0 001B6BD0 00000000 */   nop
/* 0B6CD4 001B6BD4 A400A2AF */  sw          $2, 0xA4($29)
/* 0B6CD8 001B6BD8 2826A072 */  paddub      $4, $21, $0
/* 0B6CDC 001B6BDC 5001A527 */  addiu       $5, $29, 0x150
/* 0B6CE0 001B6BE0 28360072 */  paddub      $6, $16, $0
/* 0B6CE4 001B6BE4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0B6CE8 001B6BE8 00000000 */   nop
/* 0B6CEC 001B6BEC B000A2AF */  sw          $2, 0xB0($29)
/* 0B6CF0 001B6BF0 2826A072 */  paddub      $4, $21, $0
/* 0B6CF4 001B6BF4 9001A527 */  addiu       $5, $29, 0x190
/* 0B6CF8 001B6BF8 28362072 */  paddub      $6, $17, $0
/* 0B6CFC 001B6BFC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0B6D00 001B6C00 00000000 */   nop
/* 0B6D04 001B6C04 BC00A2AF */  sw          $2, 0xBC($29)
/* 0B6D08 001B6C08 0000E28E */  lw          $2, 0x0($23)
/* 0B6D0C 001B6C0C 02004014 */  bnez        $2, .L001B6C18
/* 0B6D10 001B6C10 00000000 */   nop
/* 0B6D14 001B6C14 A000A0AF */  sw          $0, 0xA0($29)
.L001B6C18:
/* 0B6D18 001B6C18 0000028E */  lw          $2, 0x0($16)
/* 0B6D1C 001B6C1C 03004014 */  bnez        $2, .L001B6C2C
/* 0B6D20 001B6C20 00000000 */   nop
/* 0B6D24 001B6C24 AC00A227 */  addiu       $2, $29, 0xAC
/* 0B6D28 001B6C28 000040AC */  sw          $0, 0x0($2)
.L001B6C2C:
/* 0B6D2C 001B6C2C 0000228E */  lw          $2, 0x0($17)
/* 0B6D30 001B6C30 03004014 */  bnez        $2, .L001B6C40
/* 0B6D34 001B6C34 00000000 */   nop
/* 0B6D38 001B6C38 B800A227 */  addiu       $2, $29, 0xB8
/* 0B6D3C 001B6C3C 000040AC */  sw          $0, 0x0($2)
.L001B6C40:
/* 0B6D40 001B6C40 1000C426 */  addiu       $4, $22, 0x10
/* 0B6D44 001B6C44 282EC073 */  paddub      $5, $30, $0
/* 0B6D48 001B6C48 A000A627 */  addiu       $6, $29, 0xA0
/* 0B6D4C 001B6C4C 2424050C */  jal         CreateAnimeDataEX__FP14tagMOTION_TYPEP14CDataAlloc2_1_P16MOTION_FILE_INFO
/* 0B6D50 001B6C50 00000000 */   nop
/* 0B6D54 001B6C54 07004012 */  beqz        $18, .L001B6C74
/* 0B6D58 001B6C58 00000000 */   nop
/* 0B6D5C 001B6C5C 0000C48E */  lw          $4, 0x0($22)
/* 0B6D60 001B6C60 1000C526 */  addiu       $5, $22, 0x10
/* 0B6D64 001B6C64 28368072 */  paddub      $6, $20, $0
/* 0B6D68 001B6C68 7000C726 */  addiu       $7, $22, 0x70
/* 0B6D6C 001B6C6C C024050C */  jal         AnimeDataInit__FP6CFrameP14tagMOTION_TYPEP14CDataAlloc2_1_PP12tagFRAME_INF
/* 0B6D70 001B6C70 00000000 */   nop
.L001B6C74:
/* 0B6D74 001B6C74 7400D3AE */  sw          $19, 0x74($22)
/* 0B6D78 001B6C78 000060C6 */  lwc1        $f0, 0x0($19)
/* 0B6D7C 001B6C7C 20008046 */  cvt.s.w     $f0, $f0
/* 0B6D80 001B6C80 2000C0E6 */  swc1        $f0, 0x20($22)
/* 0B6D84 001B6C84 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 0B6D88 001B6C88 2800C3AE */  sw          $3, 0x28($22)
/* 0B6D8C 001B6C8C 3400C0AE */  sw          $0, 0x34($22)
/* 0B6D90 001B6C90 3800C0AE */  sw          $0, 0x38($22)
/* 0B6D94 001B6C94 3C00C0AE */  sw          $0, 0x3C($22)
/* 0B6D98 001B6C98 9000C0AE */  sw          $0, 0x90($22)
/* 0B6D9C 001B6C9C 9000BF7B */  lq          $31, 0x90($29)
/* 0B6DA0 001B6CA0 8000BE7B */  lq          $30, 0x80($29)
/* 0B6DA4 001B6CA4 7000B77B */  lq          $23, 0x70($29)
/* 0B6DA8 001B6CA8 6000B67B */  lq          $22, 0x60($29)
/* 0B6DAC 001B6CAC 5000B57B */  lq          $21, 0x50($29)
/* 0B6DB0 001B6CB0 4000B47B */  lq          $20, 0x40($29)
/* 0B6DB4 001B6CB4 3000B37B */  lq          $19, 0x30($29)
/* 0B6DB8 001B6CB8 2000B27B */  lq          $18, 0x20($29)
/* 0B6DBC 001B6CBC 1000B17B */  lq          $17, 0x10($29)
/* 0B6DC0 001B6CC0 0000B07B */  lq          $16, 0x0($29)
/* 0B6DC4 001B6CC4 E001BD27 */  addiu       $29, $29, 0x1E0
/* 0B6DC8 001B6CC8 0800E003 */  jr          $31
/* 0B6DCC 001B6CCC 00000000 */   nop
