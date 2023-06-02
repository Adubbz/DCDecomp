.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVif1PkCall
/* 20E70 00120D70 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 20E74 00120D74 1000B1FF */  sd         $17, 0x10($sp)
/* 20E78 00120D78 2D888000 */  daddu      $17, $4, $0
/* 20E7C 00120D7C 2000B2FF */  sd         $18, 0x20($sp)
/* 20E80 00120D80 0000B0FF */  sd         $16, 0x0($sp)
/* 20E84 00120D84 2D90A000 */  daddu      $18, $5, $0
/* 20E88 00120D88 3000BFFF */  sd         $31, 0x30($sp)
/* 20E8C 00120D8C 0A83040C */  jal        sceVif1PkTerminate
/* 20E90 00120D90 2D80C000 */   daddu     $16, $6, $0
/* 20E94 00120D94 0000258E */  lw         $5, 0x0($17)
/* 20E98 00120D98 0050033C */  lui        $3, (0x50000000 >> 16)
/* 20E9C 00120D9C 25800302 */  or         $16, $16, $3
/* 20EA0 00120DA0 FF9F043C */  lui        $4, (0x9FFFFFFF >> 16)
/* 20EA4 00120DA4 0000B0AC */  sw         $16, 0x0($5)
/* 20EA8 00120DA8 FFFF8434 */  ori        $4, $4, (0x9FFFFFFF & 0xFFFF)
/* 20EAC 00120DAC 0400A524 */  addiu      $5, $5, 0x4
/* 20EB0 00120DB0 24904402 */  and        $18, $18, $4
/* 20EB4 00120DB4 0400A324 */  addiu      $3, $5, 0x4
/* 20EB8 00120DB8 080022AE */  sw         $2, 0x8($17)
/* 20EBC 00120DBC 0000B2AC */  sw         $18, 0x0($5)
/* 20EC0 00120DC0 000023AE */  sw         $3, 0x0($17)
/* 20EC4 00120DC4 0C0020AE */  sw         $0, 0xC($17)
/* 20EC8 00120DC8 3000BFDF */  ld         $31, 0x30($sp)
/* 20ECC 00120DCC 2000B2DF */  ld         $18, 0x20($sp)
/* 20ED0 00120DD0 1000B1DF */  ld         $17, 0x10($sp)
/* 20ED4 00120DD4 0000B0DF */  ld         $16, 0x0($sp)
/* 20ED8 00120DD8 0800E003 */  jr         $31
/* 20EDC 00120DDC 4000BD27 */   addiu     $sp, $sp, 0x40
