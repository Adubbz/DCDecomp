.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__9C3DSpriteFv
/* 63F90 00163E90 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 63F94 00163E94 180080AC */  sw         $0, 0x18($4)
/* 63F98 00163E98 0000A0AF */  sw         $0, 0x0($sp)
/* 63F9C 00163E9C 0400A0AF */  sw         $0, 0x4($sp)
/* 63FA0 00163EA0 0800A0AF */  sw         $0, 0x8($sp)
/* 63FA4 00163EA4 0C00A0AF */  sw         $0, 0xC($sp)
/* 63FA8 00163EA8 0000A327 */  addiu      $3, $sp, 0x0
/* 63FAC 00163EAC 00006378 */  lq         $3, 0x0($3)
/* 63FB0 00163EB0 2000837C */  sq         $3, 0x20($4)
/* 63FB4 00163EB4 80000324 */  addiu      $3, $0, 0x80
/* 63FB8 00163EB8 330083A0 */  sb         $3, 0x33($4)
/* 63FBC 00163EBC 310083A0 */  sb         $3, 0x31($4)
/* 63FC0 00163EC0 320083A0 */  sb         $3, 0x32($4)
/* 63FC4 00163EC4 300083A0 */  sb         $3, 0x30($4)
/* 63FC8 00163EC8 340080AC */  sw         $0, 0x34($4)
/* 63FCC 00163ECC 380080AC */  sw         $0, 0x38($4)
/* 63FD0 00163ED0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 63FD4 00163ED4 0800E003 */  jr         $31
/* 63FD8 00163ED8 00000000 */   nop
/* 63FDC 00163EDC 00000000 */  nop
