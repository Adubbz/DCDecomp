.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__14CDataAlloc2_1_Fi
/* 27C40 00127B40 0C0085AC */  sw         $5, 0xC($4)
/* 27C44 00127B44 080080AC */  sw         $0, 0x8($4)
/* 27C48 00127B48 040080AC */  sw         $0, 0x4($4)
/* 27C4C 00127B4C 0400A104 */  bgez       $5, .L00127B60
/* 27C50 00127B50 00000000 */   nop
/* 27C54 00127B54 28168070 */  paddub     $2, $4, $0
/* 27C58 00127B58 04000010 */  b          .L00127B6C
/* 27C5C 00127B5C 00000000 */   nop
.L00127B60:
/* 27C60 00127B60 0400828C */  lw         $2, 0x4($4)
/* 27C64 00127B64 000082AC */  sw         $2, 0x0($4)
/* 27C68 00127B68 28168070 */  paddub     $2, $4, $0
.L00127B6C:
/* 27C6C 00127B6C 0800E003 */  jr         $31
/* 27C70 00127B70 00000000 */   nop
/* 27C74 00127B74 00000000 */  nop
/* 27C78 00127B78 00000000 */  nop
/* 27C7C 00127B7C 00000000 */  nop
