.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __throw_type_match
/* 00D6B8 0010D5B8 E0FFBD27 */  addiu       $29, $29, -0x20
/* 00D6BC 0010D5BC 0000B0FF */  sd          $16, 0x0($29)
/* 00D6C0 0010D5C0 1000BFFF */  sd          $31, 0x10($29)
/* 00D6C4 0010D5C4 0815040C */  jal         strcmp
/* 00D6C8 0010D5C8 2D80C000 */   daddu      $16, $6, $0
/* 00D6CC 0010D5CC 0B800200 */  movn        $16, $0, $2
/* 00D6D0 0010D5D0 1000BFDF */  ld          $31, 0x10($29)
/* 00D6D4 0010D5D4 2D100002 */  daddu       $2, $16, $0
/* 00D6D8 0010D5D8 0000B0DF */  ld          $16, 0x0($29)
/* 00D6DC 0010D5DC 0800E003 */  jr          $31
/* 00D6E0 0010D5E0 2000BD27 */   addiu      $29, $29, 0x20
/* 00D6E4 0010D5E4 00000000 */  nop
