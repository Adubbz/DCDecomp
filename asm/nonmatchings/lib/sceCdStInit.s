.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdStInit
/* BFB0 0010BEB0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BFB4 0010BEB4 2500023C */  lui        $2, (0x2502B8 >> 16)
/* BFB8 0010BEB8 2500083C */  lui        $8, %hi(dum_mode)
/* BFBC 0010BEBC 0000BFFF */  sd         $31, 0x0($sp)
/* BFC0 0010BEC0 B80240AC */  sw         $0, (0x2502B8 & 0xFFFF)($2)
/* BFC4 0010BEC4 C8020825 */  addiu      $8, $8, %lo(dum_mode)
/* BFC8 0010BEC8 8430040C */  jal        sceCdStream
/* BFCC 0010BECC 05000724 */   addiu     $7, $0, 0x5
/* BFD0 0010BED0 0000BFDF */  ld         $31, 0x0($sp)
/* BFD4 0010BED4 0800E003 */  jr         $31
/* BFD8 0010BED8 1000BD27 */   addiu     $sp, $sp, 0x10
/* BFDC 0010BEDC 00000000 */  nop
