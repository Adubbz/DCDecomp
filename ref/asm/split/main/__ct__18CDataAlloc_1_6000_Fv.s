.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__18CDataAlloc_1_6000_Fv
/* 043950 00143850 0100013C */  lui         $1, (0x17700 >> 16)
/* 043954 00143854 21088100 */  addu        $1, $4, $1
/* 043958 00143858 007720AC */  sw          $0, (0x17700 & 0xFFFF)($1)
/* 04395C 0014385C 28168070 */  paddub      $2, $4, $0
/* 043960 00143860 0800E003 */  jr          $31
/* 043964 00143864 00000000 */   nop
/* 043968 00143868 00000000 */  nop
/* 04396C 0014386C 00000000 */  nop
