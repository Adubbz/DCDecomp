.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawWeaponStatusWaku__Fiiii
/* F9F40 001F9E40 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* F9F44 001F9E44 0000BF7F */  sq         $31, 0x0($sp)
/* F9F48 001F9E48 2900023C */  lui        $2, %hi(_1879)
/* F9F4C 001F9E4C 80304224 */  addiu      $2, $2, %lo(_1879)
/* F9F50 001F9E50 1000A327 */  addiu      $3, $sp, 0x10
/* F9F54 001F9E54 00004278 */  lq         $2, 0x0($2)
/* F9F58 001F9E58 0000627C */  sq         $2, 0x0($3)
/* F9F5C 001F9E5C FFFF8224 */  addiu      $2, $4, -0x1
/* F9F60 001F9E60 2000A2AF */  sw         $2, 0x20($sp)
/* F9F64 001F9E64 FFFFA224 */  addiu      $2, $5, -0x1
/* F9F68 001F9E68 2400A2AF */  sw         $2, 0x24($sp)
/* F9F6C 001F9E6C 0200C224 */  addiu      $2, $6, 0x2
/* F9F70 001F9E70 2800A2AF */  sw         $2, 0x28($sp)
/* F9F74 001F9E74 0A000224 */  addiu      $2, $0, 0xA
/* F9F78 001F9E78 2C00A2AF */  sw         $2, 0x2C($sp)
/* F9F7C 001F9E7C C0100700 */  sll        $2, $7, 3
/* F9F80 001F9E80 21105D00 */  addu       $2, $2, $sp
/* F9F84 001F9E84 10004524 */  addiu      $5, $2, 0x10
/* F9F88 001F9E88 2000A427 */  addiu      $4, $sp, 0x20
/* F9F8C 001F9E8C 0400A624 */  addiu      $6, $5, 0x4
/* F9F90 001F9E90 14B5080C */  jal        DrawMenuSideGradation__FR8CRect_i_P6spRGBAP6spRGBA
/* F9F94 001F9E94 00000000 */   nop
/* F9F98 001F9E98 0000BF7B */  lq         $31, 0x0($sp)
/* F9F9C 001F9E9C 3000BD27 */  addiu      $sp, $sp, 0x30
/* F9FA0 001F9EA0 0800E003 */  jr         $31
/* F9FA4 001F9EA4 00000000 */   nop
/* F9FA8 001F9EA8 00000000 */  nop
/* F9FAC 001F9EAC 00000000 */  nop
