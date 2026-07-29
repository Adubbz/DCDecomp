.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel _sceSDC
/* 014C30 00114B30 FFFF073C */  lui         $7, (0xFFFFF000 >> 16)
/* 014C34 00114B34 2D300000 */  daddu       $6, $0, $0
/* 014C38 00114B38 00F0E734 */  ori         $7, $7, (0xFFFFF000 & 0xFFFF)
/* 014C3C 00114B3C 00000000 */  nop
.L00114B40:
/* 014C40 00114B40 0F000000 */  sync
/* 014C44 00114B44 0000D0BC */  cache       0x10, 0x0($6) /* handwritten instruction */
/* 014C48 00114B48 0F000000 */  sync
/* 014C4C 00114B4C 00E00240 */  mfc0        $2, $28 /* handwritten instruction */
/* 014C50 00114B50 24104700 */  and         $2, $2, $7
/* 014C54 00114B54 21104600 */  addu        $2, $2, $6
/* 014C58 00114B58 2B18A200 */  sltu        $3, $5, $2
/* 014C5C 00114B5C 2B104400 */  sltu        $2, $2, $4
/* 014C60 00114B60 06004014 */  bnez        $2, .L00114B7C
/* 014C64 00114B64 00000000 */   nop
/* 014C68 00114B68 04006014 */  bnez        $3, .L00114B7C
/* 014C6C 00114B6C 00000000 */   nop
/* 014C70 00114B70 0F000000 */  sync
/* 014C74 00114B74 0000D4BC */  cache       0x14, 0x0($6) /* handwritten instruction */
/* 014C78 00114B78 0F000000 */  sync
.L00114B7C:
/* 014C7C 00114B7C 0F000000 */  sync
/* 014C80 00114B80 0100D0BC */  cache       0x10, 0x1($6) /* handwritten instruction */
/* 014C84 00114B84 0F000000 */  sync
/* 014C88 00114B88 00E00240 */  mfc0        $2, $28 /* handwritten instruction */
/* 014C8C 00114B8C 24104700 */  and         $2, $2, $7
/* 014C90 00114B90 21104600 */  addu        $2, $2, $6
/* 014C94 00114B94 2B18A200 */  sltu        $3, $5, $2
/* 014C98 00114B98 2B104400 */  sltu        $2, $2, $4
/* 014C9C 00114B9C 06004014 */  bnez        $2, .L00114BB8
/* 014CA0 00114BA0 00000000 */   nop
/* 014CA4 00114BA4 04006014 */  bnez        $3, .L00114BB8
/* 014CA8 00114BA8 00000000 */   nop
/* 014CAC 00114BAC 0F000000 */  sync
/* 014CB0 00114BB0 0100D4BC */  cache       0x14, 0x1($6) /* handwritten instruction */
/* 014CB4 00114BB4 0F000000 */  sync
.L00114BB8:
/* 014CB8 00114BB8 0F000000 */  sync
/* 014CBC 00114BBC 4000C624 */  addiu       $6, $6, 0x40
/* 014CC0 00114BC0 0010C228 */  slti        $2, $6, 0x1000
/* 014CC4 00114BC4 DEFF4014 */  bnez        $2, .L00114B40
/* 014CC8 00114BC8 00000000 */   nop
/* 014CCC 00114BCC 0800E003 */  jr          $31
/* 014CD0 00114BD0 00000000 */   nop
/* 014CD4 00114BD4 00000000 */  nop
