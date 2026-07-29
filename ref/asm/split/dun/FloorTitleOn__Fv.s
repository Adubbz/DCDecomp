.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FloorTitleOn__Fv
/* 015590 01DC1290 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 015594 01DC1294 B83A20AC */  sw          $0, %lo(rogoAlphaA + 0x8)($1)
/* 015598 01DC1298 01000324 */  addiu       $3, $0, 0x1
/* 01559C 01DC129C 1C9D83AF */  sw          $3, -0x62E4($28)
/* 0155A0 01DC12A0 A0FF0324 */  addiu       $3, $0, -0x60
/* 0155A4 01DC12A4 249D83AF */  sw          $3, -0x62DC($28)
/* 0155A8 01DC12A8 FC8A80AF */  sw          $0, -0x7504($28)
/* 0155AC 01DC12AC 0800E003 */  jr          $31
/* 0155B0 01DC12B0 00000000 */   nop
/* 0155B4 01DC12B4 00000000 */  nop
/* 0155B8 01DC12B8 00000000 */  nop
/* 0155BC 01DC12BC 00000000 */  nop
