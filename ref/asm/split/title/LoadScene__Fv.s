.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadScene__Fv
/* 0039C0 01DAF6C0 A0FFBD27 */  addiu       $29, $29, -0x60
/* 0039C4 01DAF6C4 3000BF7F */  sq          $31, 0x30($29)
/* 0039C8 01DAF6C8 2000B27F */  sq          $18, 0x20($29)
/* 0039CC 01DAF6CC 1000B17F */  sq          $17, 0x10($29)
/* 0039D0 01DAF6D0 0000B07F */  sq          $16, 0x0($29)
/* 0039D4 01DAF6D4 DD01033C */  lui         $3, %hi(LIT_388__3)
/* 0039D8 01DAF6D8 00586324 */  addiu       $3, $3, %lo(LIT_388__3)
/* 0039DC 01DAF6DC 4000A527 */  addiu       $5, $29, 0x40
/* 0039E0 01DAF6E0 00006478 */  lq          $4, 0x0($3)
/* 0039E4 01DAF6E4 100063DC */  ld          $3, 0x10($3)
/* 0039E8 01DAF6E8 0000A47C */  sq          $4, 0x0($5)
/* 0039EC 01DAF6EC 1000A3FC */  sd          $3, 0x10($5)
/* 0039F0 01DAF6F0 28860070 */  paddub      $16, $0, $0
/* 0039F4 01DAF6F4 2F000010 */  b           .L01DAF7B4_2B4FB4
/* 0039F8 01DAF6F8 00000000 */   nop
.L01DAF6FC_2B4EFC:
/* 0039FC 01DAF6FC C0881000 */  sll         $17, $16, 3
/* 003A00 01DAF700 21103D02 */  addu        $2, $17, $29
/* 003A04 01DAF704 948B858F */  lw          $5, -0x746C($28)
/* 003A08 01DAF708 4000448C */  lw          $4, 0x40($2)
/* 003A0C 01DAF70C 28360070 */  paddub      $6, $0, $0
/* 003A10 01DAF710 D8FC040C */  jal         LoadFile__FPcPvPi
/* 003A14 01DAF714 00000000 */   nop
/* 003A18 01DAF718 B0110224 */  addiu       $2, $0, 0x11B0
/* 003A1C 01DAF71C 18900202 */  mult        $18, $16, $2
/* 003A20 01DAF720 E101023C */  lui         $2, %hi(Cam__2)
/* 003A24 01DAF724 D0984224 */  addiu       $2, $2, %lo(Cam__2)
/* 003A28 01DAF728 21205200 */  addu        $4, $2, $18
/* 003A2C 01DAF72C 21303D02 */  addu        $6, $17, $29
/* 003A30 01DAF730 00191000 */  sll         $3, $16, 4
/* 003A34 01DAF734 DF01023C */  lui         $2, %hi(PassDataBuffer)
/* 003A38 01DAF738 80FE4224 */  addiu       $2, $2, %lo(PassDataBuffer)
/* 003A3C 01DAF73C 21384300 */  addu        $7, $2, $3
/* 003A40 01DAF740 948B858F */  lw          $5, -0x746C($28)
/* 003A44 01DAF744 4400C68C */  lw          $6, 0x44($6)
/* 003A48 01DAF748 28460070 */  paddub      $8, $0, $0
/* 003A4C 01DAF74C FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 003A50 01DAF750 00000000 */   nop
/* 003A54 01DAF754 803F043C */  lui         $4, (0x3F800000 >> 16)
/* 003A58 01DAF758 E101033C */  lui         $3, %hi(Cam__2 + 0x2F0)
/* 003A5C 01DAF75C C09B6324 */  addiu       $3, $3, %lo(Cam__2 + 0x2F0)
/* 003A60 01DAF760 21187200 */  addu        $3, $3, $18
/* 003A64 01DAF764 000064AC */  sw          $4, 0x0($3)
/* 003A68 01DAF768 E101033C */  lui         $3, %hi(Cam__2 + 0x2F8)
/* 003A6C 01DAF76C C89B6324 */  addiu       $3, $3, %lo(Cam__2 + 0x2F8)
/* 003A70 01DAF770 21187200 */  addu        $3, $3, $18
/* 003A74 01DAF774 000064AC */  sw          $4, 0x0($3)
/* 003A78 01DAF778 E101033C */  lui         $3, %hi(Cam__2 + 0x304)
/* 003A7C 01DAF77C D49B6324 */  addiu       $3, $3, %lo(Cam__2 + 0x304)
/* 003A80 01DAF780 21187200 */  addu        $3, $3, $18
/* 003A84 01DAF784 000060AC */  sw          $0, 0x0($3)
/* 003A88 01DAF788 E101033C */  lui         $3, %hi(Cam__2 + 0x308)
/* 003A8C 01DAF78C D89B6324 */  addiu       $3, $3, %lo(Cam__2 + 0x308)
/* 003A90 01DAF790 21187200 */  addu        $3, $3, $18
/* 003A94 01DAF794 000060AC */  sw          $0, 0x0($3)
/* 003A98 01DAF798 E101033C */  lui         $3, %hi(OP_MainCamera)
/* 003A9C 01DAF79C E0956424 */  addiu       $4, $3, %lo(OP_MainCamera)
/* 003AA0 01DAF7A0 E101033C */  lui         $3, %hi(Cam__2 + 0x310)
/* 003AA4 01DAF7A4 E09B6324 */  addiu       $3, $3, %lo(Cam__2 + 0x310)
/* 003AA8 01DAF7A8 21187200 */  addu        $3, $3, $18
/* 003AAC 01DAF7AC 000064AC */  sw          $4, 0x0($3)
/* 003AB0 01DAF7B0 01001026 */  addiu       $16, $16, 0x1
.L01DAF7B4_2B4FB4:
/* 003AB4 01DAF7B4 0300032A */  slti        $3, $16, 0x3
/* 003AB8 01DAF7B8 D0FF6014 */  bnez        $3, .L01DAF6FC_2B4EFC
/* 003ABC 01DAF7BC 00000000 */   nop
/* 003AC0 01DAF7C0 3000BF7B */  lq          $31, 0x30($29)
/* 003AC4 01DAF7C4 2000B27B */  lq          $18, 0x20($29)
/* 003AC8 01DAF7C8 1000B17B */  lq          $17, 0x10($29)
/* 003ACC 01DAF7CC 0000B07B */  lq          $16, 0x0($29)
/* 003AD0 01DAF7D0 6000BD27 */  addiu       $29, $29, 0x60
/* 003AD4 01DAF7D4 0800E003 */  jr          $31
/* 003AD8 01DAF7D8 00000000 */   nop
/* 003ADC 01DAF7DC 00000000 */  nop
