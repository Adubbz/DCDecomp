.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__18CDataAlloc_1_6000_Fv
/* 43950 00143850 0100013C */  lui        $at, (0x17700 >> 16)
/* 43954 00143854 21088100 */  addu       $at, $4, $at
/* 43958 00143858 007720AC */  sw         $0, (0x17700 & 0xFFFF)($at)
/* 4395C 0014385C 28168070 */  paddub     $2, $4, $0
/* 43960 00143860 0800E003 */  jr         $31
/* 43964 00143864 00000000 */   nop
/* 43968 00143868 00000000 */  nop
/* 4396C 0014386C 00000000 */  nop
