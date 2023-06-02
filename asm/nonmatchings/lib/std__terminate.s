.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel terminate__3stdFv
/* 229B0 001228B0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 229B4 001228B4 0000BF7F */  sq         $31, 0x0($sp)
/* 229B8 001228B8 2500013C */  lui        $at, (0x250B20 >> 16)
/* 229BC 001228BC 200B228C */  lw         $2, (0x250B20 & 0xFFFF)($at)
/* 229C0 001228C0 09F84000 */  jalr       $2
/* 229C4 001228C4 00000000 */   nop
/* 229C8 001228C8 0000BF7B */  lq         $31, 0x0($sp)
/* 229CC 001228CC 0800E003 */  jr         $31
/* 229D0 001228D0 1000BD27 */   addiu     $sp, $sp, 0x10
/* 229D4 001228D4 00000000 */  nop
/* 229D8 001228D8 00000000 */  nop
/* 229DC 001228DC 00000000 */  nop
