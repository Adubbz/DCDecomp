.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel _sceSDC
/* 14C30 00114B30 FFFF073C */  lui        $7, (0xFFFFF000 >> 16)
/* 14C34 00114B34 2D300000 */  daddu      $6, $0, $0
/* 14C38 00114B38 00F0E734 */  ori        $7, $7, (0xFFFFF000 & 0xFFFF)
/* 14C3C 00114B3C 00000000 */  nop
.L00114B40:
/* 14C40 00114B40 0F000000 */  sync
/* 14C44 00114B44 0000D0BC */  cache      0x10, 0x0($6) # handwritten instruction
/* 14C48 00114B48 0F000000 */  sync
/* 14C4C 00114B4C 00E00240 */  mfc0       $2, $28 # handwritten instruction
/* 14C50 00114B50 24104700 */  and        $2, $2, $7
/* 14C54 00114B54 21104600 */  addu       $2, $2, $6
/* 14C58 00114B58 2B18A200 */  sltu       $3, $5, $2
/* 14C5C 00114B5C 2B104400 */  sltu       $2, $2, $4
/* 14C60 00114B60 06004014 */  bnez       $2, .L00114B7C
/* 14C64 00114B64 00000000 */   nop
/* 14C68 00114B68 04006014 */  bnez       $3, .L00114B7C
/* 14C6C 00114B6C 00000000 */   nop
/* 14C70 00114B70 0F000000 */  sync
/* 14C74 00114B74 0000D4BC */  cache      0x14, 0x0($6) # handwritten instruction
/* 14C78 00114B78 0F000000 */  sync
.L00114B7C:
/* 14C7C 00114B7C 0F000000 */  sync
/* 14C80 00114B80 0100D0BC */  cache      0x10, 0x1($6) # handwritten instruction
/* 14C84 00114B84 0F000000 */  sync
/* 14C88 00114B88 00E00240 */  mfc0       $2, $28 # handwritten instruction
/* 14C8C 00114B8C 24104700 */  and        $2, $2, $7
/* 14C90 00114B90 21104600 */  addu       $2, $2, $6
/* 14C94 00114B94 2B18A200 */  sltu       $3, $5, $2
/* 14C98 00114B98 2B104400 */  sltu       $2, $2, $4
/* 14C9C 00114B9C 06004014 */  bnez       $2, .L00114BB8
/* 14CA0 00114BA0 00000000 */   nop
/* 14CA4 00114BA4 04006014 */  bnez       $3, .L00114BB8
/* 14CA8 00114BA8 00000000 */   nop
/* 14CAC 00114BAC 0F000000 */  sync
/* 14CB0 00114BB0 0100D4BC */  cache      0x14, 0x1($6) # handwritten instruction
/* 14CB4 00114BB4 0F000000 */  sync
.L00114BB8:
/* 14CB8 00114BB8 0F000000 */  sync
/* 14CBC 00114BBC 4000C624 */  addiu      $6, $6, 0x40
/* 14CC0 00114BC0 0010C228 */  slti       $2, $6, 0x1000
/* 14CC4 00114BC4 DEFF4014 */  bnez       $2, .L00114B40
/* 14CC8 00114BC8 00000000 */   nop
/* 14CCC 00114BCC 0800E003 */  jr         $31
/* 14CD0 00114BD0 00000000 */   nop
/* 14CD4 00114BD4 00000000 */  nop
