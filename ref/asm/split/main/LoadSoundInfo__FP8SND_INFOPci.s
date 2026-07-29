.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadSoundInfo__FP8SND_INFOPci
/* 05BBB0 0015BAB0 20F7BD27 */  addiu       $29, $29, -0x8E0
/* 05BBB4 0015BAB4 4000BF7F */  sq          $31, 0x40($29)
/* 05BBB8 0015BAB8 3000B37F */  sq          $19, 0x30($29)
/* 05BBBC 0015BABC 2000B27F */  sq          $18, 0x20($29)
/* 05BBC0 0015BAC0 1000B17F */  sq          $17, 0x10($29)
/* 05BBC4 0015BAC4 0000B07F */  sq          $16, 0x0($29)
/* 05BBC8 0015BAC8 289E8070 */  paddub      $19, $4, $0
/* 05BBCC 0015BACC 2896C070 */  paddub      $18, $6, $0
/* 05BBD0 0015BAD0 288EA070 */  paddub      $17, $5, $0
/* 05BBD4 0015BAD4 28866072 */  paddub      $16, $19, $0
/* 05BBD8 0015BAD8 282E0070 */  paddub      $5, $0, $0
/* 05BBDC 0015BADC 10000624 */  addiu       $6, $0, 0x10
/* 05BBE0 0015BAE0 5A0D040C */  jal         memset
/* 05BBE4 0015BAE4 00000000 */   nop
/* 05BBE8 0015BAE8 281E0070 */  paddub      $3, $0, $0
/* 05BBEC 0015BAEC 04000010 */  b           .L0015BB00
/* 05BBF0 0015BAF0 00000000 */   nop
.L0015BAF4:
/* 05BBF4 0015BAF4 000000A2 */  sb          $0, 0x0($16)
/* 05BBF8 0015BAF8 01001026 */  addiu       $16, $16, 0x1
/* 05BBFC 0015BAFC 01006324 */  addiu       $3, $3, 0x1
.L0015BB00:
/* 05BC00 0015BB00 1000622C */  sltiu       $2, $3, 0x10
/* 05BC04 0015BB04 FBFF4014 */  bnez        $2, .L0015BAF4
/* 05BC08 0015BB08 00000000 */   nop
/* 05BC0C 0015BB0C 648E80AF */  sw          $0, -0x719C($28)
/* 05BC10 0015BB10 688E93AF */  sw          $19, -0x7198($28)
/* 05BC14 0015BB14 5000A427 */  addiu       $4, $29, 0x50
/* 05BC18 0015BB18 AC7C050C */  jal         __ct__18CScriptInterpreterFv
/* 05BC1C 0015BB1C 00000000 */   nop
/* 05BC20 0015BB20 5000A427 */  addiu       $4, $29, 0x50
/* 05BC24 0015BB24 282E2072 */  paddub      $5, $17, $0
/* 05BC28 0015BB28 28364072 */  paddub      $6, $18, $0
/* 05BC2C 0015BB2C 9C7C050C */  jal         SetScript__18CScriptInterpreterFPci
/* 05BC30 0015BB30 00000000 */   nop
/* 05BC34 0015BB34 2600023C */  lui         $2, %hi(Command__3)
/* 05BC38 0015BB38 40674524 */  addiu       $5, $2, %lo(Command__3)
/* 05BC3C 0015BB3C 5000A427 */  addiu       $4, $29, 0x50
/* 05BC40 0015BB40 02000624 */  addiu       $6, $0, 0x2
/* 05BC44 0015BB44 947C050C */  jal         SetTAG__18CScriptInterpreterFP9TAG_PARAMi
/* 05BC48 0015BB48 00000000 */   nop
.L0015BB4C:
/* 05BC4C 0015BB4C 5000A427 */  addiu       $4, $29, 0x50
/* 05BC50 0015BB50 407C050C */  jal         GetNextTAG__18CScriptInterpreterFv
/* 05BC54 0015BB54 00000000 */   nop
/* 05BC58 0015BB58 0A004004 */  bltz        $2, .L0015BB84
/* 05BC5C 0015BB5C 00000000 */   nop
/* 05BC60 0015BB60 7404A427 */  addiu       $4, $29, 0x474
/* 05BC64 0015BB64 80180200 */  sll         $3, $2, 2
/* 05BC68 0015BB68 F0868227 */  addiu       $2, $28, -0x7910
/* 05BC6C 0015BB6C 21104300 */  addu        $2, $2, $3
/* 05BC70 0015BB70 0000428C */  lw          $2, 0x0($2)
/* 05BC74 0015BB74 09F84000 */  jalr        $2
/* 05BC78 0015BB78 00000000 */   nop
/* 05BC7C 0015BB7C F3FF0010 */  b           .L0015BB4C
/* 05BC80 0015BB80 00000000 */   nop
.L0015BB84:
/* 05BC84 0015BB84 4000BF7B */  lq          $31, 0x40($29)
/* 05BC88 0015BB88 3000B37B */  lq          $19, 0x30($29)
/* 05BC8C 0015BB8C 2000B27B */  lq          $18, 0x20($29)
/* 05BC90 0015BB90 1000B17B */  lq          $17, 0x10($29)
/* 05BC94 0015BB94 0000B07B */  lq          $16, 0x0($29)
/* 05BC98 0015BB98 E008BD27 */  addiu       $29, $29, 0x8E0
/* 05BC9C 0015BB9C 0800E003 */  jr          $31
/* 05BCA0 0015BBA0 00000000 */   nop
/* 05BCA4 0015BBA4 00000000 */  nop
/* 05BCA8 0015BBA8 00000000 */  nop
/* 05BCAC 0015BBAC 00000000 */  nop
