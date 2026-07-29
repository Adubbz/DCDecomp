.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitSystemMes__Fv
/* 060050 0015FF50 90FFBD27 */  addiu       $29, $29, -0x70
/* 060054 0015FF54 1000BF7F */  sq          $31, 0x10($29)
/* 060058 0015FF58 0000B07F */  sq          $16, 0x0($29)
/* 06005C 0015FF5C D001023C */  lui         $2, %hi(mes_data)
/* 060060 0015FF60 00CE5024 */  addiu       $16, $2, %lo(mes_data)
/* 060064 0015FF64 2600023C */  lui         $2, %hi(LIT_325__2)
/* 060068 0015FF68 10684524 */  addiu       $5, $2, %lo(LIT_325__2)
/* 06006C 0015FF6C 2000A427 */  addiu       $4, $29, 0x20
/* 060070 0015FF70 04000324 */  addiu       $3, $0, 0x4
.L0015FF74:
/* 060074 0015FF74 0000A278 */  lq          $2, 0x0($5)
/* 060078 0015FF78 1000A524 */  addiu       $5, $5, 0x10
/* 06007C 0015FF7C FFFF6324 */  addiu       $3, $3, -0x1
/* 060080 0015FF80 0000827C */  sq          $2, 0x0($4)
/* 060084 0015FF84 10008424 */  addiu       $4, $4, 0x10
/* 060088 0015FF88 FAFF601C */  bgtz        $3, .L0015FF74
/* 06008C 0015FF8C 00000000 */   nop
/* 060090 0015FF90 9886868F */  lw          $6, -0x7968($28)
/* 060094 0015FF94 0600C018 */  blez        $6, .L0015FFB0
/* 060098 0015FF98 00000000 */   nop
/* 06009C 0015FF9C 2000A427 */  addiu       $4, $29, 0x20
/* 0600A0 0015FFA0 2A00023C */  lui         $2, %hi(LIT_332__3)
/* 0600A4 0015FFA4 60A04524 */  addiu       $5, $2, %lo(LIT_332__3)
/* 0600A8 0015FFA8 1614040C */  jal         sprintf
/* 0600AC 0015FFAC 00000000 */   nop
.L0015FFB0:
/* 0600B0 0015FFB0 2000A427 */  addiu       $4, $29, 0x20
/* 0600B4 0015FFB4 2A00023C */  lui         $2, %hi(LIT_333__3)
/* 0600B8 0015FFB8 78A04524 */  addiu       $5, $2, %lo(LIT_333__3)
/* 0600BC 0015FFBC BC14040C */  jal         strcat
/* 0600C0 0015FFC0 00000000 */   nop
/* 0600C4 0015FFC4 2000A427 */  addiu       $4, $29, 0x20
/* 0600C8 0015FFC8 282E0072 */  paddub      $5, $16, $0
/* 0600CC 0015FFCC 6C00A627 */  addiu       $6, $29, 0x6C
/* 0600D0 0015FFD0 283E0070 */  paddub      $7, $0, $0
/* 0600D4 0015FFD4 F4FC040C */  jal         LoadFile2__FPcPvPii
/* 0600D8 0015FFD8 00000000 */   nop
/* 0600DC 0015FFDC 07004014 */  bnez        $2, .L0015FFFC
/* 0600E0 0015FFE0 00000000 */   nop
/* 0600E4 0015FFE4 2A00023C */  lui         $2, %hi(LIT_334__3)
/* 0600E8 0015FFE8 80A04424 */  addiu       $4, $2, %lo(LIT_334__3)
/* 0600EC 0015FFEC 282E0072 */  paddub      $5, $16, $0
/* 0600F0 0015FFF0 6C00A627 */  addiu       $6, $29, 0x6C
/* 0600F4 0015FFF4 D8FC040C */  jal         LoadFile__FPcPvPi
/* 0600F8 0015FFF8 00000000 */   nop
.L0015FFFC:
/* 0600FC 0015FFFC D001023C */  lui         $2, %hi(SystemMessage)
/* 060100 00160000 30B64424 */  addiu       $4, $2, %lo(SystemMessage)
/* 060104 00160004 01000524 */  addiu       $5, $0, 0x1
/* 060108 00160008 9836050C */  jal         Preset__6ClsMesFi
/* 06010C 0016000C 00000000 */   nop
/* 060110 00160010 D001013C */  lui         $1, %hi(SystemMessage + 0x34)
/* 060114 00160014 64B620AC */  sw          $0, %lo(SystemMessage + 0x34)($1)
/* 060118 00160018 01000424 */  addiu       $4, $0, 0x1
/* 06011C 0016001C D001013C */  lui         $1, %hi(SystemMessage + 0x98)
/* 060120 00160020 C8B624AC */  sw          $4, %lo(SystemMessage + 0x98)($1)
/* 060124 00160024 D001013C */  lui         $1, %hi(SystemMessage + 0xA4)
/* 060128 00160028 D4B620AC */  sw          $0, %lo(SystemMessage + 0xA4)($1)
/* 06012C 0016002C D001013C */  lui         $1, %hi(SystemMessage + 0xA8)
/* 060130 00160030 D8B620AC */  sw          $0, %lo(SystemMessage + 0xA8)($1)
/* 060134 00160034 D001013C */  lui         $1, %hi(SystemMessage + 0x16C0)
/* 060138 00160038 F0CC20AC */  sw          $0, %lo(SystemMessage + 0x16C0)($1)
/* 06013C 0016003C D001013C */  lui         $1, %hi(SystemMessage + 0x16C4)
/* 060140 00160040 F4CC20AC */  sw          $0, %lo(SystemMessage + 0x16C4)($1)
/* 060144 00160044 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 060148 00160048 D001013C */  lui         $1, %hi(SystemMessage + 0x8C)
/* 06014C 0016004C BCB622AC */  sw          $2, %lo(SystemMessage + 0x8C)($1)
/* 060150 00160050 1A000324 */  addiu       $3, $0, 0x1A
/* 060154 00160054 D001013C */  lui         $1, %hi(SystemMessage + 0x10)
/* 060158 00160058 40B623AC */  sw          $3, %lo(SystemMessage + 0x10)($1)
/* 06015C 0016005C D001013C */  lui         $1, %hi(SystemMessage + 0x14)
/* 060160 00160060 44B624AC */  sw          $4, %lo(SystemMessage + 0x14)($1)
/* 060164 00160064 D001013C */  lui         $1, %hi(SystemMessage + 0x16CC)
/* 060168 00160068 FCCC20AC */  sw          $0, %lo(SystemMessage + 0x16CC)($1)
/* 06016C 0016006C 02000224 */  addiu       $2, $0, 0x2
/* 060170 00160070 D001013C */  lui         $1, %hi(SystemMessage + 0x16C0)
/* 060174 00160074 F0CC22AC */  sw          $2, %lo(SystemMessage + 0x16C0)($1)
/* 060178 00160078 D101023C */  lui         $2, %hi(mes_buff)
/* 06017C 0016007C 80894224 */  addiu       $2, $2, %lo(mes_buff)
/* 060180 00160080 D001013C */  lui         $1, %hi(SystemMessage + 0x17B0)
/* 060184 00160084 E0CD22AC */  sw          $2, %lo(SystemMessage + 0x17B0)($1)
/* 060188 00160088 D001013C */  lui         $1, %hi(SystemMessage + 0x174C)
/* 06018C 0016008C 7CCD23AC */  sw          $3, %lo(SystemMessage + 0x174C)($1)
/* 060190 00160090 D001023C */  lui         $2, %hi(SystemMessage)
/* 060194 00160094 30B64424 */  addiu       $4, $2, %lo(SystemMessage)
/* 060198 00160098 282E0072 */  paddub      $5, $16, $0
/* 06019C 0016009C 8036050C */  jal         SetBuff__6ClsMesFPs
/* 0601A0 001600A0 00000000 */   nop
/* 0601A4 001600A4 D001023C */  lui         $2, %hi(SystemMessage)
/* 0601A8 001600A8 30B64424 */  addiu       $4, $2, %lo(SystemMessage)
/* 0601AC 001600AC 388D858F */  lw          $5, -0x72C8($28)
/* 0601B0 001600B0 8C36050C */  jal         SetBuff_system__6ClsMesFPs
/* 0601B4 001600B4 00000000 */   nop
/* 0601B8 001600B8 1000BF7B */  lq          $31, 0x10($29)
/* 0601BC 001600BC 0000B07B */  lq          $16, 0x0($29)
/* 0601C0 001600C0 7000BD27 */  addiu       $29, $29, 0x70
/* 0601C4 001600C4 0800E003 */  jr          $31
/* 0601C8 001600C8 00000000 */   nop
/* 0601CC 001600CC 00000000 */  nop
