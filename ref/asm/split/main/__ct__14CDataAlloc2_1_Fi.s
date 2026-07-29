.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__14CDataAlloc2_1_Fi
/* 027C40 00127B40 0C0085AC */  sw          $5, 0xC($4)
/* 027C44 00127B44 080080AC */  sw          $0, 0x8($4)
/* 027C48 00127B48 040080AC */  sw          $0, 0x4($4)
/* 027C4C 00127B4C 0400A104 */  bgez        $5, .L00127B60
/* 027C50 00127B50 00000000 */   nop
/* 027C54 00127B54 28168070 */  paddub      $2, $4, $0
/* 027C58 00127B58 04000010 */  b           .L00127B6C
/* 027C5C 00127B5C 00000000 */   nop
.L00127B60:
/* 027C60 00127B60 0400828C */  lw          $2, 0x4($4)
/* 027C64 00127B64 000082AC */  sw          $2, 0x0($4)
/* 027C68 00127B68 28168070 */  paddub      $2, $4, $0
.L00127B6C:
/* 027C6C 00127B6C 0800E003 */  jr          $31
/* 027C70 00127B70 00000000 */   nop
/* 027C74 00127B74 00000000 */  nop
/* 027C78 00127B78 00000000 */  nop
/* 027C7C 00127B7C 00000000 */  nop
