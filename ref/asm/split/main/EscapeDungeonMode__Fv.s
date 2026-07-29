.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EscapeDungeonMode__Fv
/* 0F4040 001F3F40 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0F4044 001F3F44 1000BF7F */  sq          $31, 0x10($29)
/* 0F4048 001F3F48 0000B07F */  sq          $16, 0x0($29)
/* 0F404C 001F3F4C 28860070 */  paddub      $16, $0, $0
/* 0F4050 001F3F50 D494848F */  lw          $4, -0x6B2C($28)
/* 0F4054 001F3F54 AF000524 */  addiu       $5, $0, 0xAF
/* 0F4058 001F3F58 50F6060C */  jal         SearchItemIndexNo__14CDngStatusDataFi
/* 0F405C 001F3F5C 00000000 */   nop
/* 0F4060 001F3F60 02004004 */  bltz        $2, .L001F3F6C
/* 0F4064 001F3F64 00000000 */   nop
/* 0F4068 001F3F68 01001024 */  addiu       $16, $0, 0x1
.L001F3F6C:
/* 0F406C 001F3F6C E09C848F */  lw          $4, -0x6320($28)
/* 0F4070 001F3F70 905E070C */  jal         GetMonstorNum__12CMonstorUnitFv
/* 0F4074 001F3F74 00000000 */   nop
/* 0F4078 001F3F78 0200401C */  bgtz        $2, .L001F3F84
/* 0F407C 001F3F7C 00000000 */   nop
/* 0F4080 001F3F80 02001024 */  addiu       $16, $0, 0x2
.L001F3F84:
/* 0F4084 001F3F84 28160072 */  paddub      $2, $16, $0
/* 0F4088 001F3F88 1000BF7B */  lq          $31, 0x10($29)
/* 0F408C 001F3F8C 0000B07B */  lq          $16, 0x0($29)
/* 0F4090 001F3F90 2000BD27 */  addiu       $29, $29, 0x20
/* 0F4094 001F3F94 0800E003 */  jr          $31
/* 0F4098 001F3F98 00000000 */   nop
/* 0F409C 001F3F9C 00000000 */  nop
