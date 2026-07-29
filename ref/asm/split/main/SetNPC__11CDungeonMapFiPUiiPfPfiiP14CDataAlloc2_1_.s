.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetNPC__11CDungeonMapFiPUiiPfPfiiP14CDataAlloc2_1_
/* 0C1D00 001C1C00 D0FEBD27 */  addiu       $29, $29, -0x130
/* 0C1D04 001C1C04 9000BF7F */  sq          $31, 0x90($29)
/* 0C1D08 001C1C08 8000BE7F */  sq          $30, 0x80($29)
/* 0C1D0C 001C1C0C 7000B77F */  sq          $23, 0x70($29)
/* 0C1D10 001C1C10 6000B67F */  sq          $22, 0x60($29)
/* 0C1D14 001C1C14 5000B57F */  sq          $21, 0x50($29)
/* 0C1D18 001C1C18 4000B47F */  sq          $20, 0x40($29)
/* 0C1D1C 001C1C1C 3000B37F */  sq          $19, 0x30($29)
/* 0C1D20 001C1C20 2000B27F */  sq          $18, 0x20($29)
/* 0C1D24 001C1C24 1000B17F */  sq          $17, 0x10($29)
/* 0C1D28 001C1C28 0000B07F */  sq          $16, 0x0($29)
/* 0C1D2C 001C1C2C 28B68070 */  paddub      $22, $4, $0
/* 0C1D30 001C1C30 28AEA070 */  paddub      $21, $5, $0
/* 0C1D34 001C1C34 28BEC070 */  paddub      $23, $6, $0
/* 0C1D38 001C1C38 28F6E070 */  paddub      $30, $7, $0
/* 0C1D3C 001C1C3C C000A8AF */  sw          $8, 0xC0($29)
/* 0C1D40 001C1C40 B000A9AF */  sw          $9, 0xB0($29)
/* 0C1D44 001C1C44 AC00AAAF */  sw          $10, 0xAC($29)
/* 0C1D48 001C1C48 28A66071 */  paddub      $20, $11, $0
/* 0C1D4C 001C1C4C 30130324 */  addiu       $3, $0, 0x1330
/* 0C1D50 001C1C50 1880A302 */  mult        $16, $21, $3
/* 0C1D54 001C1C54 21180402 */  addu        $3, $16, $4
/* 0C1D58 001C1C58 CC4F7324 */  addiu       $19, $3, 0x4FCC
/* 0C1D5C 001C1C5C F87F7326 */  addiu       $19, $19, 0x7FF8
/* 0C1D60 001C1C60 0000638E */  lw          $3, 0x0($19)
/* 0C1D64 001C1C64 74006014 */  bnez        $3, .L001C1E38
/* 0C1D68 001C1C68 00000000 */   nop
/* 0C1D6C 001C1C6C 0400A12A */  slti        $1, $21, 0x4
/* 0C1D70 001C1C70 03002010 */  beqz        $1, .L001C1C80
/* 0C1D74 001C1C74 00000000 */   nop
/* 0C1D78 001C1C78 0300A106 */  bgez        $21, .L001C1C88
/* 0C1D7C 001C1C7C 00000000 */   nop
.L001C1C80:
/* 0C1D80 001C1C80 6D000010 */  b           .L001C1E38
/* 0C1D84 001C1C84 00000000 */   nop
.L001C1C88:
/* 0C1D88 001C1C88 D000A427 */  addiu       $4, $29, 0xD0
/* 0C1D8C 001C1C8C 509F040C */  jal         __ct__10CFrameAttrFv
/* 0C1D90 001C1C90 00000000 */   nop
/* 0C1D94 001C1C94 01000224 */  addiu       $2, $0, 0x1
/* 0C1D98 001C1C98 DC00A2A3 */  sb          $2, 0xDC($29)
/* 0C1D9C 001C1C9C 288E0070 */  paddub      $17, $0, $0
/* 0C1DA0 001C1CA0 12000010 */  b           .L001C1CEC
/* 0C1DA4 001C1CA4 00000000 */   nop
.L001C1CA8:
/* 0C1DA8 001C1CA8 80101500 */  sll         $2, $21, 2
/* 0C1DAC 001C1CAC 21105500 */  addu        $2, $2, $21
/* 0C1DB0 001C1CB0 40100200 */  sll         $2, $2, 1
/* 0C1DB4 001C1CB4 21105500 */  addu        $2, $2, $21
/* 0C1DB8 001C1CB8 001A0200 */  sll         $3, $2, 8
/* 0C1DBC 001C1CBC F001023C */  lui         $2, %hi(BtNPCTexAnimeData)
/* 0C1DC0 001C1CC0 40244224 */  addiu       $2, $2, %lo(BtNPCTexAnimeData)
/* 0C1DC4 001C1CC4 21184300 */  addu        $3, $2, $3
/* 0C1DC8 001C1CC8 80101100 */  sll         $2, $17, 2
/* 0C1DCC 001C1CCC 21105100 */  addu        $2, $2, $17
/* 0C1DD0 001C1CD0 40100200 */  sll         $2, $2, 1
/* 0C1DD4 001C1CD4 21105100 */  addu        $2, $2, $17
/* 0C1DD8 001C1CD8 C0100200 */  sll         $2, $2, 3
/* 0C1DDC 001C1CDC 21204300 */  addu        $4, $2, $3
/* 0C1DE0 001C1CE0 349C050C */  jal         Initialize__13CTexAnimeDataFv
/* 0C1DE4 001C1CE4 00000000 */   nop
/* 0C1DE8 001C1CE8 01003126 */  addiu       $17, $17, 0x1
.L001C1CEC:
/* 0C1DEC 001C1CEC 2000222A */  slti        $2, $17, 0x20
/* 0C1DF0 001C1CF0 EDFF4014 */  bnez        $2, .L001C1CA8
/* 0C1DF4 001C1CF4 00000000 */   nop
/* 0C1DF8 001C1CF8 2190D002 */  addu        $18, $22, $16
/* 0C1DFC 001C1CFC F83D5126 */  addiu       $17, $18, 0x3DF8
/* 0C1E00 001C1D00 F87F3126 */  addiu       $17, $17, 0x7FF8
/* 0C1E04 001C1D04 80101500 */  sll         $2, $21, 2
/* 0C1E08 001C1D08 21105500 */  addu        $2, $2, $21
/* 0C1E0C 001C1D0C 40100200 */  sll         $2, $2, 1
/* 0C1E10 001C1D10 21105500 */  addu        $2, $2, $21
/* 0C1E14 001C1D14 001A0200 */  sll         $3, $2, 8
/* 0C1E18 001C1D18 F001023C */  lui         $2, %hi(BtNPCTexAnimeData)
/* 0C1E1C 001C1D1C 40244224 */  addiu       $2, $2, %lo(BtNPCTexAnimeData)
/* 0C1E20 001C1D20 21284300 */  addu        $5, $2, $3
/* 0C1E24 001C1D24 28262072 */  paddub      $4, $17, $0
/* 0C1E28 001C1D28 20000624 */  addiu       $6, $0, 0x20
/* 0C1E2C 001C1D2C FCDF040C */  jal         InitializeTexAnime__10CCharacterFP13CTexAnimeDatai
/* 0C1E30 001C1D30 00000000 */   nop
/* 0C1E34 001C1D34 4000A826 */  addiu       $8, $21, 0x40
/* 0C1E38 001C1D38 28262072 */  paddub      $4, $17, $0
/* 0C1E3C 001C1D3C 282EE072 */  paddub      $5, $23, $0
/* 0C1E40 001C1D40 2A00023C */  lui         $2, %hi(LIT_1007__2)
/* 0C1E44 001C1D44 F8BD4624 */  addiu       $6, $2, %lo(LIT_1007__2)
/* 0C1E48 001C1D48 3001A78F */  lw          $7, 0x130($29)
/* 0C1E4C 001C1D4C 284EE070 */  paddub      $9, $7, $0
/* 0C1E50 001C1D50 28560070 */  paddub      $10, $0, $0
/* 0C1E54 001C1D54 A000398E */  lw          $25, 0xA0($17)
/* 0C1E58 001C1D58 BC00398F */  lw          $25, 0xBC($25)
/* 0C1E5C 001C1D5C 09F82003 */  jalr        $25
/* 0C1E60 001C1D60 00000000 */   nop
/* 0C1E64 001C1D64 28164072 */  paddub      $2, $18, $0
/* 0C1E68 001C1D68 B43E5124 */  addiu       $17, $2, 0x3EB4
/* 0C1E6C 001C1D6C F87F3126 */  addiu       $17, $17, 0x7FF8
/* 0C1E70 001C1D70 0000228E */  lw          $2, 0x0($17)
/* 0C1E74 001C1D74 05004014 */  bnez        $2, .L001C1D8C
/* 0C1E78 001C1D78 00000000 */   nop
/* 0C1E7C 001C1D7C 2A00023C */  lui         $2, %hi(LIT_1008)
/* 0C1E80 001C1D80 10BE4424 */  addiu       $4, $2, %lo(LIT_1008)
/* 0C1E84 001C1D84 A611040C */  jal         printf
/* 0C1E88 001C1D88 00000000 */   nop
.L001C1D8C:
/* 0C1E8C 001C1D8C 0000248E */  lw          $4, 0x0($17)
/* 0C1E90 001C1D90 D000A527 */  addiu       $5, $29, 0xD0
/* 0C1E94 001C1D94 01000624 */  addiu       $6, $0, 0x1
/* 0C1E98 001C1D98 40000724 */  addiu       $7, $0, 0x40
/* 0C1E9C 001C1D9C D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0C1EA0 001C1DA0 00000000 */   nop
/* 0C1EA4 001C1DA4 0000248E */  lw          $4, 0x0($17)
/* 0C1EA8 001C1DA8 01000524 */  addiu       $5, $0, 0x1
/* 0C1EAC 001C1DAC BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 0C1EB0 001C1DB0 00000000 */   nop
/* 0C1EB4 001C1DB4 A84F4426 */  addiu       $4, $18, 0x4FA8
/* 0C1EB8 001C1DB8 F87F8424 */  addiu       $4, $4, 0x7FF8
/* 0C1EBC 001C1DBC C000A58F */  lw          $5, 0xC0($29)
/* 0C1EC0 001C1DC0 0C86040C */  jal         sceVu0CopyVector
/* 0C1EC4 001C1DC4 00000000 */   nop
/* 0C1EC8 001C1DC8 B84F4426 */  addiu       $4, $18, 0x4FB8
/* 0C1ECC 001C1DCC F87F8424 */  addiu       $4, $4, 0x7FF8
/* 0C1ED0 001C1DD0 B000A58F */  lw          $5, 0xB0($29)
/* 0C1ED4 001C1DD4 0C86040C */  jal         sceVu0CopyVector
/* 0C1ED8 001C1DD8 00000000 */   nop
/* 0C1EDC 001C1DDC 21201602 */  addu        $4, $16, $22
/* 0C1EE0 001C1DE0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0C1EE4 001C1DE4 21088100 */  addu        $1, $4, $1
/* 0C1EE8 001C1DE8 C0CF3EAC */  sw          $30, -0x3040($1)
/* 0C1EEC 001C1DEC AC00A38F */  lw          $3, 0xAC($29)
/* 0C1EF0 001C1DF0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0C1EF4 001C1DF4 21088100 */  addu        $1, $4, $1
/* 0C1EF8 001C1DF8 C8CF23AC */  sw          $3, -0x3038($1)
/* 0C1EFC 001C1DFC 01000324 */  addiu       $3, $0, 0x1
/* 0C1F00 001C1E00 000063AE */  sw          $3, 0x0($19)
/* 0C1F04 001C1E04 0100013C */  lui         $1, (0x10000 >> 16)
/* 0C1F08 001C1E08 21088100 */  addu        $1, $4, $1
/* 0C1F0C 001C1E0C CCCF34AC */  sw          $20, -0x3034($1)
/* 0C1F10 001C1E10 0100013C */  lui         $1, (0x10000 >> 16)
/* 0C1F14 001C1E14 21088100 */  addu        $1, $4, $1
/* 0C1F18 001C1E18 58CA34AC */  sw          $20, -0x35A8($1)
/* 0C1F1C 001C1E1C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0C1F20 001C1E20 21088100 */  addu        $1, $4, $1
/* 0C1F24 001C1E24 54CA20AC */  sw          $0, -0x35AC($1)
/* 0C1F28 001C1E28 80BF033C */  lui         $3, (0xBF800000 >> 16)
/* 0C1F2C 001C1E2C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0C1F30 001C1E30 21088100 */  addu        $1, $4, $1
/* 0C1F34 001C1E34 50CA23AC */  sw          $3, -0x35B0($1)
.L001C1E38:
/* 0C1F38 001C1E38 9000BF7B */  lq          $31, 0x90($29)
/* 0C1F3C 001C1E3C 8000BE7B */  lq          $30, 0x80($29)
/* 0C1F40 001C1E40 7000B77B */  lq          $23, 0x70($29)
/* 0C1F44 001C1E44 6000B67B */  lq          $22, 0x60($29)
/* 0C1F48 001C1E48 5000B57B */  lq          $21, 0x50($29)
/* 0C1F4C 001C1E4C 4000B47B */  lq          $20, 0x40($29)
/* 0C1F50 001C1E50 3000B37B */  lq          $19, 0x30($29)
/* 0C1F54 001C1E54 2000B27B */  lq          $18, 0x20($29)
/* 0C1F58 001C1E58 1000B17B */  lq          $17, 0x10($29)
/* 0C1F5C 001C1E5C 0000B07B */  lq          $16, 0x0($29)
/* 0C1F60 001C1E60 3001BD27 */  addiu       $29, $29, 0x130
/* 0C1F64 001C1E64 0800E003 */  jr          $31
/* 0C1F68 001C1E68 00000000 */   nop
/* 0C1F6C 001C1E6C 00000000 */  nop
