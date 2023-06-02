.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel fprintf
/* 1CB8 00101BB8 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 1CBC 00101BBC 5000A6FF */  sd         $6, 0x50($sp)
/* 1CC0 00101BC0 0000BFFF */  sd         $31, 0x0($sp)
/* 1CC4 00101BC4 5000A627 */  addiu      $6, $sp, 0x50
/* 1CC8 00101BC8 5800A7FF */  sd         $7, 0x58($sp)
/* 1CCC 00101BCC 6000A8FF */  sd         $8, 0x60($sp)
/* 1CD0 00101BD0 6800A9FF */  sd         $9, 0x68($sp)
/* 1CD4 00101BD4 7000AAFF */  sd         $10, 0x70($sp)
/* 1CD8 00101BD8 021F040C */  jal        vfprintf
/* 1CDC 00101BDC 7800ABFF */   sd        $11, 0x78($sp)
/* 1CE0 00101BE0 0000BFDF */  ld         $31, 0x0($sp)
/* 1CE4 00101BE4 0800E003 */  jr         $31
/* 1CE8 00101BE8 8000BD27 */   addiu     $sp, $sp, 0x80
/* 1CEC 00101BEC 00000000 */  nop
