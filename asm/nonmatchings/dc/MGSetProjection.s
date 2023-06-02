.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGSetProjection__Ff
/* 2DA60 0012D960 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2DA64 0012D964 0000BF7F */  sq         $31, 0x0($sp)
/* 2DA68 0012D968 C701013C */  lui        $at, (0x1C756E8 >> 16)
/* 2DA6C 0012D96C E8562DC4 */  lwc1       $f13, (0x1C756E8 & 0xFFFF)($at)
/* 2DA70 0012D970 C701013C */  lui        $at, (0x1C756F8 >> 16)
/* 2DA74 0012D974 F8562EC4 */  lwc1       $f14, (0x1C756F8 & 0xFFFF)($at)
/* 2DA78 0012D978 B8B5040C */  jal        MGSetRenderInfo__Ffff
/* 2DA7C 0012D97C 00000000 */   nop
/* 2DA80 0012D980 0000BF7B */  lq         $31, 0x0($sp)
/* 2DA84 0012D984 1000BD27 */  addiu      $sp, $sp, 0x10
/* 2DA88 0012D988 0800E003 */  jr         $31
/* 2DA8C 0012D98C 00000000 */   nop
