.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Load__7CScriptFPCc
/* 000080 01DABD80 E0FFBD27 */  addiu       $29, $29, -0x20
/* 000084 01DABD84 1000BF7F */  sq          $31, 0x10($29)
/* 000088 01DABD88 0000B07F */  sq          $16, 0x0($29)
/* 00008C 01DABD8C 28868070 */  paddub      $16, $4, $0
/* 000090 01DABD90 00060226 */  addiu       $2, $16, 0x600
/* 000094 01DABD94 0100013C */  lui         $1, (0x10000 >> 16)
/* 000098 01DABD98 21088100 */  addu        $1, $4, $1
/* 00009C 01DABD9C C0E022AC */  sw          $2, -0x1F40($1)
/* 0000A0 01DABDA0 2826A070 */  paddub      $4, $5, $0
/* 0000A4 01DABDA4 0100013C */  lui         $1, (0x10000 >> 16)
/* 0000A8 01DABDA8 21080102 */  addu        $1, $16, $1
/* 0000AC 01DABDAC C0E0258C */  lw          $5, -0x1F40($1)
/* 0000B0 01DABDB0 E8050626 */  addiu       $6, $16, 0x5E8
/* 0000B4 01DABDB4 D8FC040C */  jal         LoadFile__FPcPvPi
/* 0000B8 01DABDB8 00000000 */   nop
/* 0000BC 01DABDBC 41004010 */  beqz        $2, .L01DABEC4_2B16C4
/* 0000C0 01DABDC0 00000000 */   nop
/* 0000C4 01DABDC4 280000AE */  sw          $0, 0x28($16)
/* 0000C8 01DABDC8 EC0400AE */  sw          $0, 0x4EC($16)
/* 0000CC 01DABDCC 28000324 */  addiu       $3, $0, 0x28
/* 0000D0 01DABDD0 080503AE */  sw          $3, 0x508($16)
/* 0000D4 01DABDD4 0100013C */  lui         $1, (0x10000 >> 16)
/* 0000D8 01DABDD8 21080102 */  addu        $1, $16, $1
/* 0000DC 01DABDDC C4E020AC */  sw          $0, -0x1F3C($1)
/* 0000E0 01DABDE0 FFFF0324 */  addiu       $3, $0, -0x1
/* 0000E4 01DABDE4 000003AE */  sw          $3, 0x0($16)
/* 0000E8 01DABDE8 040003AE */  sw          $3, 0x4($16)
/* 0000EC 01DABDEC 080000AE */  sw          $0, 0x8($16)
/* 0000F0 01DABDF0 140000AE */  sw          $0, 0x14($16)
/* 0000F4 01DABDF4 100000A2 */  sb          $0, 0x10($16)
/* 0000F8 01DABDF8 180000AE */  sw          $0, 0x18($16)
/* 0000FC 01DABDFC 1C0003AE */  sw          $3, 0x1C($16)
/* 000100 01DABE00 240000AE */  sw          $0, 0x24($16)
/* 000104 01DABE04 100500AE */  sw          $0, 0x510($16)
/* 000108 01DABE08 600500AE */  sw          $0, 0x560($16)
/* 00010C 01DABE0C 2C0000A2 */  sb          $0, 0x2C($16)
/* 000110 01DABE10 D40500AE */  sw          $0, 0x5D4($16)
/* 000114 01DABE14 D80500AE */  sw          $0, 0x5D8($16)
/* 000118 01DABE18 E00500AE */  sw          $0, 0x5E0($16)
/* 00011C 01DABE1C E40500AE */  sw          $0, 0x5E4($16)
/* 000120 01DABE20 28360070 */  paddub      $6, $0, $0
/* 000124 01DABE24 07000010 */  b           .L01DABE44_2B1644
/* 000128 01DABE28 00000000 */   nop
.L01DABE2C_2B162C:
/* 00012C 01DABE2C 80180600 */  sll         $3, $6, 2
/* 000130 01DABE30 21187000 */  addu        $3, $3, $16
/* 000134 01DABE34 0100013C */  lui         $1, (0x10000 >> 16)
/* 000138 01DABE38 21086100 */  addu        $1, $3, $1
/* 00013C 01DABE3C C8E020AC */  sw          $0, -0x1F38($1)
/* 000140 01DABE40 0100C624 */  addiu       $6, $6, 0x1
.L01DABE44_2B1644:
/* 000144 01DABE44 8000C328 */  slti        $3, $6, 0x80
/* 000148 01DABE48 F8FF6014 */  bnez        $3, .L01DABE2C_2B162C
/* 00014C 01DABE4C 00000000 */   nop
/* 000150 01DABE50 28360070 */  paddub      $6, $0, $0
/* 000154 01DABE54 18000010 */  b           .L01DABEB8_2B16B8
/* 000158 01DABE58 00000000 */   nop
.L01DABE5C_2B165C:
/* 00015C 01DABE5C 01000524 */  addiu       $5, $0, 0x1
/* 000160 01DABE60 40180600 */  sll         $3, $6, 1
/* 000164 01DABE64 21186600 */  addu        $3, $3, $6
/* 000168 01DABE68 80180300 */  sll         $3, $3, 2
/* 00016C 01DABE6C 21186600 */  addu        $3, $3, $6
/* 000170 01DABE70 80180300 */  sll         $3, $3, 2
/* 000174 01DABE74 21207000 */  addu        $4, $3, $16
/* 000178 01DABE78 300085A0 */  sb          $5, 0x30($4)
/* 00017C 01DABE7C 340080AC */  sw          $0, 0x34($4)
/* 000180 01DABE80 FFFF0324 */  addiu       $3, $0, -0x1
/* 000184 01DABE84 380083AC */  sw          $3, 0x38($4)
/* 000188 01DABE88 3C0080AC */  sw          $0, 0x3C($4)
/* 00018C 01DABE8C 400080A0 */  sb          $0, 0x40($4)
/* 000190 01DABE90 440080AC */  sw          $0, 0x44($4)
/* 000194 01DABE94 480080AC */  sw          $0, 0x48($4)
/* 000198 01DABE98 4C0080AC */  sw          $0, 0x4C($4)
/* 00019C 01DABE9C 500080AC */  sw          $0, 0x50($4)
/* 0001A0 01DABEA0 540080A0 */  sb          $0, 0x54($4)
/* 0001A4 01DABEA4 580083AC */  sw          $3, 0x58($4)
/* 0001A8 01DABEA8 5C0083AC */  sw          $3, 0x5C($4)
/* 0001AC 01DABEAC 008180C7 */  lwc1        $f0, -0x7F00($28)
/* 0001B0 01DABEB0 600080E4 */  swc1        $f0, 0x60($4)
/* 0001B4 01DABEB4 0100C624 */  addiu       $6, $6, 0x1
.L01DABEB8_2B16B8:
/* 0001B8 01DABEB8 1700C328 */  slti        $3, $6, 0x17
/* 0001BC 01DABEBC E7FF6014 */  bnez        $3, .L01DABE5C_2B165C
/* 0001C0 01DABEC0 00000000 */   nop
.L01DABEC4_2B16C4:
/* 0001C4 01DABEC4 1000BF7B */  lq          $31, 0x10($29)
/* 0001C8 01DABEC8 0000B07B */  lq          $16, 0x0($29)
/* 0001CC 01DABECC 2000BD27 */  addiu       $29, $29, 0x20
/* 0001D0 01DABED0 0800E003 */  jr          $31
/* 0001D4 01DABED4 00000000 */   nop
/* 0001D8 01DABED8 00000000 */  nop
/* 0001DC 01DABEDC 00000000 */  nop
