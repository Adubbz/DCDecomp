.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Initialize__9C3DSpriteFv
/* 063F90 00163E90 F0FFBD27 */  addiu       $29, $29, -0x10
/* 063F94 00163E94 180080AC */  sw          $0, 0x18($4)
/* 063F98 00163E98 0000A0AF */  sw          $0, 0x0($29)
/* 063F9C 00163E9C 0400A0AF */  sw          $0, 0x4($29)
/* 063FA0 00163EA0 0800A0AF */  sw          $0, 0x8($29)
/* 063FA4 00163EA4 0C00A0AF */  sw          $0, 0xC($29)
/* 063FA8 00163EA8 0000A327 */  addiu       $3, $29, 0x0
/* 063FAC 00163EAC 00006378 */  lq          $3, 0x0($3)
/* 063FB0 00163EB0 2000837C */  sq          $3, 0x20($4)
/* 063FB4 00163EB4 80000324 */  addiu       $3, $0, 0x80
/* 063FB8 00163EB8 330083A0 */  sb          $3, 0x33($4)
/* 063FBC 00163EBC 310083A0 */  sb          $3, 0x31($4)
/* 063FC0 00163EC0 320083A0 */  sb          $3, 0x32($4)
/* 063FC4 00163EC4 300083A0 */  sb          $3, 0x30($4)
/* 063FC8 00163EC8 340080AC */  sw          $0, 0x34($4)
/* 063FCC 00163ECC 380080AC */  sw          $0, 0x38($4)
/* 063FD0 00163ED0 1000BD27 */  addiu       $29, $29, 0x10
/* 063FD4 00163ED4 0800E003 */  jr          $31
/* 063FD8 00163ED8 00000000 */   nop
/* 063FDC 00163EDC 00000000 */  nop
