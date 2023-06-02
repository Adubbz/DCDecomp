.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel duhandler__3stdFv
/* 229E0 001228E0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 229E4 001228E4 0000BF7F */  sq         $31, 0x0($sp)
/* 229E8 001228E8 2500013C */  lui        $at, (0x250B20 >> 16)
/* 229EC 001228EC 200B228C */  lw         $2, (0x250B20 & 0xFFFF)($at)
/* 229F0 001228F0 09F84000 */  jalr       $2
/* 229F4 001228F4 00000000 */   nop
/* 229F8 001228F8 0000BF7B */  lq         $31, 0x0($sp)
/* 229FC 001228FC 0800E003 */  jr         $31
/* 22A00 00122900 1000BD27 */   addiu     $sp, $sp, 0x10
/* 22A04 00122904 00000000 */  nop
/* 22A08 00122908 00000000 */  nop
/* 22A0C 0012290C 00000000 */  nop
