.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SEQUIP_DEFAULT_WEAPON__FP12RS_STACKDATAi
/* 095C60 00195B60 F0FFBD27 */  addiu       $29, $29, -0x10
/* 095C64 00195B64 0000BF7F */  sq          $31, 0x0($29)
/* 095C68 00195B68 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 095C6C 00195B6C 00000000 */   nop
/* 095C70 00195B70 28264070 */  paddub      $4, $2, $0
/* 095C74 00195B74 EC2F080C */  jal         EquipDefaultWeapon__Fi
/* 095C78 00195B78 00000000 */   nop
/* 095C7C 00195B7C 01000224 */  addiu       $2, $0, 0x1
/* 095C80 00195B80 0000BF7B */  lq          $31, 0x0($29)
/* 095C84 00195B84 1000BD27 */  addiu       $29, $29, 0x10
/* 095C88 00195B88 0800E003 */  jr          $31
/* 095C8C 00195B8C 00000000 */   nop
