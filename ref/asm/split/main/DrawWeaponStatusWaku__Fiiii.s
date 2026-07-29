.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawWeaponStatusWaku__Fiiii
/* 0F9F40 001F9E40 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0F9F44 001F9E44 0000BF7F */  sq          $31, 0x0($29)
/* 0F9F48 001F9E48 2900023C */  lui         $2, %hi(LIT_1879)
/* 0F9F4C 001F9E4C 80304224 */  addiu       $2, $2, %lo(LIT_1879)
/* 0F9F50 001F9E50 1000A327 */  addiu       $3, $29, 0x10
/* 0F9F54 001F9E54 00004278 */  lq          $2, 0x0($2)
/* 0F9F58 001F9E58 0000627C */  sq          $2, 0x0($3)
/* 0F9F5C 001F9E5C FFFF8224 */  addiu       $2, $4, -0x1
/* 0F9F60 001F9E60 2000A2AF */  sw          $2, 0x20($29)
/* 0F9F64 001F9E64 FFFFA224 */  addiu       $2, $5, -0x1
/* 0F9F68 001F9E68 2400A2AF */  sw          $2, 0x24($29)
/* 0F9F6C 001F9E6C 0200C224 */  addiu       $2, $6, 0x2
/* 0F9F70 001F9E70 2800A2AF */  sw          $2, 0x28($29)
/* 0F9F74 001F9E74 0A000224 */  addiu       $2, $0, 0xA
/* 0F9F78 001F9E78 2C00A2AF */  sw          $2, 0x2C($29)
/* 0F9F7C 001F9E7C C0100700 */  sll         $2, $7, 3
/* 0F9F80 001F9E80 21105D00 */  addu        $2, $2, $29
/* 0F9F84 001F9E84 10004524 */  addiu       $5, $2, 0x10
/* 0F9F88 001F9E88 2000A427 */  addiu       $4, $29, 0x20
/* 0F9F8C 001F9E8C 0400A624 */  addiu       $6, $5, 0x4
/* 0F9F90 001F9E90 14B5080C */  jal         DrawMenuSideGradation__FR8CRect_i_P6spRGBAP6spRGBA
/* 0F9F94 001F9E94 00000000 */   nop
/* 0F9F98 001F9E98 0000BF7B */  lq          $31, 0x0($29)
/* 0F9F9C 001F9E9C 3000BD27 */  addiu       $29, $29, 0x30
/* 0F9FA0 001F9EA0 0800E003 */  jr          $31
/* 0F9FA4 001F9EA4 00000000 */   nop
/* 0F9FA8 001F9EA8 00000000 */  nop
/* 0F9FAC 001F9EAC 00000000 */  nop
