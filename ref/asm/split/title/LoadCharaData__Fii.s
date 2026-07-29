.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadCharaData__Fii
/* 00D200 01DB8F00 60FFBD27 */  addiu       $29, $29, -0xA0
/* 00D204 01DB8F04 6000BF7F */  sq          $31, 0x60($29)
/* 00D208 01DB8F08 5000B57F */  sq          $21, 0x50($29)
/* 00D20C 01DB8F0C 4000B47F */  sq          $20, 0x40($29)
/* 00D210 01DB8F10 3000B37F */  sq          $19, 0x30($29)
/* 00D214 01DB8F14 2000B27F */  sq          $18, 0x20($29)
/* 00D218 01DB8F18 1000B17F */  sq          $17, 0x10($29)
/* 00D21C 01DB8F1C 0000B07F */  sq          $16, 0x0($29)
/* 00D220 01DB8F20 28AE8070 */  paddub      $21, $4, $0
/* 00D224 01DB8F24 28A6A070 */  paddub      $20, $5, $0
/* 00D228 01DB8F28 DD01033C */  lui         $3, %hi(LIT_1206__2)
/* 00D22C 01DB8F2C 50696624 */  addiu       $6, $3, %lo(LIT_1206__2)
/* 00D230 01DB8F30 7000A527 */  addiu       $5, $29, 0x70
/* 00D234 01DB8F34 03000424 */  addiu       $4, $0, 0x3
.L01DB8F38_2BE738:
/* 00D238 01DB8F38 0000C378 */  lq          $3, 0x0($6)
/* 00D23C 01DB8F3C 1000C624 */  addiu       $6, $6, 0x10
/* 00D240 01DB8F40 FFFF8424 */  addiu       $4, $4, -0x1
/* 00D244 01DB8F44 0000A37C */  sq          $3, 0x0($5)
/* 00D248 01DB8F48 1000A524 */  addiu       $5, $5, 0x10
/* 00D24C 01DB8F4C FAFF801C */  bgtz        $4, .L01DB8F38_2BE738
/* 00D250 01DB8F50 00000000 */   nop
/* 00D254 01DB8F54 40181400 */  sll         $3, $20, 1
/* 00D258 01DB8F58 21187400 */  addu        $3, $3, $20
/* 00D25C 01DB8F5C 80180300 */  sll         $3, $3, 2
/* 00D260 01DB8F60 21187400 */  addu        $3, $3, $20
/* 00D264 01DB8F64 80980300 */  sll         $19, $3, 2
/* 00D268 01DB8F68 DE01033C */  lui         $3, %hi(CScript__2 + 0x5C)
/* 00D26C 01DB8F6C 5C1B6324 */  addiu       $3, $3, %lo(CScript__2 + 0x5C)
/* 00D270 01DB8F70 21807300 */  addu        $16, $3, $19
/* 00D274 01DB8F74 0000048E */  lw          $4, 0x0($16)
/* 00D278 01DB8F78 02000324 */  addiu       $3, $0, 0x2
/* 00D27C 01DB8F7C 1B008310 */  beq         $4, $3, .L01DB8FEC_2BE7EC
/* 00D280 01DB8F80 00000000 */   nop
/* 00D284 01DB8F84 01000324 */  addiu       $3, $0, 0x1
/* 00D288 01DB8F88 10008310 */  beq         $4, $3, .L01DB8FCC_2BE7CC
/* 00D28C 01DB8F8C 00000000 */   nop
/* 00D290 01DB8F90 03008010 */  beqz        $4, .L01DB8FA0_2BE7A0
/* 00D294 01DB8F94 00000000 */   nop
/* 00D298 01DB8F98 44000010 */  b           .L01DB90AC_2BE8AC
/* 00D29C 01DB8F9C 00000000 */   nop
.L01DB8FA0_2BE7A0:
/* 00D2A0 01DB8FA0 C0101400 */  sll         $2, $20, 3
/* 00D2A4 01DB8FA4 21105D00 */  addu        $2, $2, $29
/* 00D2A8 01DB8FA8 948B858F */  lw          $5, -0x746C($28)
/* 00D2AC 01DB8FAC 7000448C */  lw          $4, 0x70($2)
/* 00D2B0 01DB8FB0 28360070 */  paddub      $6, $0, $0
/* 00D2B4 01DB8FB4 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 00D2B8 01DB8FB8 00000000 */   nop
/* 00D2BC 01DB8FBC 01000324 */  addiu       $3, $0, 0x1
/* 00D2C0 01DB8FC0 000003AE */  sw          $3, 0x0($16)
/* 00D2C4 01DB8FC4 39000010 */  b           .L01DB90AC_2BE8AC
/* 00D2C8 01DB8FC8 00000000 */   nop
.L01DB8FCC_2BE7CC:
/* 00D2CC 01DB8FCC 8CFB040C */  jal         ReadBGSync__Fv
/* 00D2D0 01DB8FD0 00000000 */   nop
/* 00D2D4 01DB8FD4 35004014 */  bnez        $2, .L01DB90AC_2BE8AC
/* 00D2D8 01DB8FD8 00000000 */   nop
/* 00D2DC 01DB8FDC 02000324 */  addiu       $3, $0, 0x2
/* 00D2E0 01DB8FE0 000003AE */  sw          $3, 0x0($16)
/* 00D2E4 01DB8FE4 31000010 */  b           .L01DB90AC_2BE8AC
/* 00D2E8 01DB8FE8 00000000 */   nop
.L01DB8FEC_2BE7EC:
/* 00D2EC 01DB8FEC B0110224 */  addiu       $2, $0, 0x11B0
/* 00D2F0 01DB8FF0 18908202 */  mult        $18, $20, $2
/* 00D2F4 01DB8FF4 DF01023C */  lui         $2, %hi(Chara__3)
/* 00D2F8 01DB8FF8 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 00D2FC 01DB8FFC 21885200 */  addu        $17, $2, $18
/* 00D300 01DB9000 28262072 */  paddub      $4, $17, $0
/* 00D304 01DB9004 74E6040C */  jal         Initialize__10CCharacterFv
/* 00D308 01DB9008 00000000 */   nop
/* 00D30C 01DB900C 00211500 */  sll         $4, $21, 4
/* 00D310 01DB9010 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x8)
/* 00D314 01DB9014 08FE4224 */  addiu       $2, $2, %lo(CharaDataBuffer__2 + 0x8)
/* 00D318 01DB9018 21104400 */  addu        $2, $2, $4
/* 00D31C 01DB901C 000040AC */  sw          $0, 0x0($2)
/* 00D320 01DB9020 C0101400 */  sll         $2, $20, 3
/* 00D324 01DB9024 21185D00 */  addu        $3, $2, $29
/* 00D328 01DB9028 DF01023C */  lui         $2, %hi(CharaDataBuffer__2)
/* 00D32C 01DB902C 00FE4224 */  addiu       $2, $2, %lo(CharaDataBuffer__2)
/* 00D330 01DB9030 21384400 */  addu        $7, $2, $4
/* 00D334 01DB9034 28262072 */  paddub      $4, $17, $0
/* 00D338 01DB9038 948B858F */  lw          $5, -0x746C($28)
/* 00D33C 01DB903C 7400668C */  lw          $6, 0x74($3)
/* 00D340 01DB9040 28460070 */  paddub      $8, $0, $0
/* 00D344 01DB9044 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 00D348 01DB9048 00000000 */   nop
/* 00D34C 01DB904C 2041043C */  lui         $4, (0x41200000 >> 16)
/* 00D350 01DB9050 DF01033C */  lui         $3, %hi(Chara__3 + 0x2F0)
/* 00D354 01DB9054 D0016324 */  addiu       $3, $3, %lo(Chara__3 + 0x2F0)
/* 00D358 01DB9058 21187200 */  addu        $3, $3, $18
/* 00D35C 01DB905C 000064AC */  sw          $4, 0x0($3)
/* 00D360 01DB9060 948280C7 */  lwc1        $f0, -0x7D6C($28)
/* 00D364 01DB9064 DF01033C */  lui         $3, %hi(Chara__3 + 0x2F8)
/* 00D368 01DB9068 D8016324 */  addiu       $3, $3, %lo(Chara__3 + 0x2F8)
/* 00D36C 01DB906C 21187200 */  addu        $3, $3, $18
/* 00D370 01DB9070 000060E4 */  swc1        $f0, 0x0($3)
/* 00D374 01DB9074 DF01033C */  lui         $3, %hi(Chara__3 + 0x304)
/* 00D378 01DB9078 E4016324 */  addiu       $3, $3, %lo(Chara__3 + 0x304)
/* 00D37C 01DB907C 21187200 */  addu        $3, $3, $18
/* 00D380 01DB9080 000060AC */  sw          $0, 0x0($3)
/* 00D384 01DB9084 DF01033C */  lui         $3, %hi(Chara__3 + 0x308)
/* 00D388 01DB9088 E8016324 */  addiu       $3, $3, %lo(Chara__3 + 0x308)
/* 00D38C 01DB908C 21187200 */  addu        $3, $3, $18
/* 00D390 01DB9090 000060AC */  sw          $0, 0x0($3)
/* 00D394 01DB9094 FFFF0424 */  addiu       $4, $0, -0x1
/* 00D398 01DB9098 DE01033C */  lui         $3, %hi(CScript__2 + 0x58)
/* 00D39C 01DB909C 581B6324 */  addiu       $3, $3, %lo(CScript__2 + 0x58)
/* 00D3A0 01DB90A0 21187300 */  addu        $3, $3, $19
/* 00D3A4 01DB90A4 000064AC */  sw          $4, 0x0($3)
/* 00D3A8 01DB90A8 000004AE */  sw          $4, 0x0($16)
.L01DB90AC_2BE8AC:
/* 00D3AC 01DB90AC 6000BF7B */  lq          $31, 0x60($29)
/* 00D3B0 01DB90B0 5000B57B */  lq          $21, 0x50($29)
/* 00D3B4 01DB90B4 4000B47B */  lq          $20, 0x40($29)
/* 00D3B8 01DB90B8 3000B37B */  lq          $19, 0x30($29)
/* 00D3BC 01DB90BC 2000B27B */  lq          $18, 0x20($29)
/* 00D3C0 01DB90C0 1000B17B */  lq          $17, 0x10($29)
/* 00D3C4 01DB90C4 0000B07B */  lq          $16, 0x0($29)
/* 00D3C8 01DB90C8 A000BD27 */  addiu       $29, $29, 0xA0
/* 00D3CC 01DB90CC 0800E003 */  jr          $31
/* 00D3D0 01DB90D0 00000000 */   nop
/* 00D3D4 01DB90D4 00000000 */  nop
/* 00D3D8 01DB90D8 00000000 */  nop
/* 00D3DC 01DB90DC 00000000 */  nop
