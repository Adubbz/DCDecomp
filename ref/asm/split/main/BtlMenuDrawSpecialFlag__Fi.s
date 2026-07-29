.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtlMenuDrawSpecialFlag__Fi
/* 0F6250 001F6150 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0F6254 001F6154 1000BF7F */  sq          $31, 0x10($29)
/* 0F6258 001F6158 0000B07F */  sq          $16, 0x0($29)
/* 0F625C 001F615C 28868070 */  paddub      $16, $4, $0
/* 0F6260 001F6160 2088838F */  lw          $3, -0x77E0($28)
/* 0F6264 001F6164 0C000224 */  addiu       $2, $0, 0xC
/* 0F6268 001F6168 07006210 */  beq         $3, $2, .L001F6188
/* 0F626C 001F616C 00000000 */   nop
/* 0F6270 001F6170 04000224 */  addiu       $2, $0, 0x4
/* 0F6274 001F6174 04006210 */  beq         $3, $2, .L001F6188
/* 0F6278 001F6178 00000000 */   nop
/* 0F627C 001F617C 14000224 */  addiu       $2, $0, 0x14
/* 0F6280 001F6180 06006214 */  bne         $3, $2, .L001F619C
/* 0F6284 001F6184 00000000 */   nop
.L001F6188:
/* 0F6288 001F6188 2468080C */  jal         GetMenuAtraEventFlag__Fv
/* 0F628C 001F618C 00000000 */   nop
/* 0F6290 001F6190 02004010 */  beqz        $2, .L001F619C
/* 0F6294 001F6194 00000000 */   nop
/* 0F6298 001F6198 28860070 */  paddub      $16, $0, $0
.L001F619C:
/* 0F629C 001F619C D901013C */  lui         $1, %hi(MenuChara + 0x3)
/* 0F62A0 001F61A0 73042380 */  lb          $3, %lo(MenuChara + 0x3)($1)
/* 0F62A4 001F61A4 04000224 */  addiu       $2, $0, 0x4
/* 0F62A8 001F61A8 04006210 */  beq         $3, $2, .L001F61BC
/* 0F62AC 001F61AC 00000000 */   nop
/* 0F62B0 001F61B0 05000224 */  addiu       $2, $0, 0x5
/* 0F62B4 001F61B4 02006214 */  bne         $3, $2, .L001F61C0
/* 0F62B8 001F61B8 00000000 */   nop
.L001F61BC:
/* 0F62BC 001F61BC 28860070 */  paddub      $16, $0, $0
.L001F61C0:
/* 0F62C0 001F61C0 28160072 */  paddub      $2, $16, $0
/* 0F62C4 001F61C4 1000BF7B */  lq          $31, 0x10($29)
/* 0F62C8 001F61C8 0000B07B */  lq          $16, 0x0($29)
/* 0F62CC 001F61CC 2000BD27 */  addiu       $29, $29, 0x20
/* 0F62D0 001F61D0 0800E003 */  jr          $31
/* 0F62D4 001F61D4 00000000 */   nop
/* 0F62D8 001F61D8 00000000 */  nop
/* 0F62DC 001F61DC 00000000 */  nop
