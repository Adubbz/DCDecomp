.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetNowEquipWeaponDataForMsg__Fii
/* 0F3F50 001F3E50 DA01013C */  lui         $1, %hi(ItemMenuMode + 0x184)
/* 0F3F54 001F3E54 74ED24A4 */  sh          $4, %lo(ItemMenuMode + 0x184)($1)
/* 0F3F58 001F3E58 DA01013C */  lui         $1, %hi(ItemMenuMode + 0x186)
/* 0F3F5C 001F3E5C 76ED25A4 */  sh          $5, %lo(ItemMenuMode + 0x186)($1)
/* 0F3F60 001F3E60 0800E003 */  jr          $31
/* 0F3F64 001F3E64 00000000 */   nop
/* 0F3F68 001F3E68 00000000 */  nop
/* 0F3F6C 001F3E6C 00000000 */  nop
