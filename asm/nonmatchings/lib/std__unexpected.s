.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel unexpected__3stdFv
/* 22980 00122880 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 22984 00122884 0000BF7F */  sq         $31, 0x0($sp)
/* 22988 00122888 2500013C */  lui        $at, (0x250B28 >> 16)
/* 2298C 0012288C 280B228C */  lw         $2, (0x250B28 & 0xFFFF)($at)
/* 22990 00122890 09F84000 */  jalr       $2
/* 22994 00122894 00000000 */   nop
/* 22998 00122898 0000BF7B */  lq         $31, 0x0($sp)
/* 2299C 0012289C 0800E003 */  jr         $31
/* 229A0 001228A0 1000BD27 */   addiu     $sp, $sp, 0x10
/* 229A4 001228A4 00000000 */  nop
/* 229A8 001228A8 00000000 */  nop
/* 229AC 001228AC 00000000 */  nop
