.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel new_eh_context
/* 00D6F0 0010D5F0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 00D6F4 0010D5F4 0000B0FF */  sd          $16, 0x0($29)
/* 00D6F8 0010D5F8 1000BFFF */  sd          $31, 0x10($29)
/* 00D6FC 0010D5FC FC09040C */  jal         malloc
/* 00D700 0010D600 18000424 */   addiu      $4, $0, 0x18
/* 00D704 0010D604 2D804000 */  daddu       $16, $2, $0
/* 00D708 0010D608 04000016 */  bnez        $16, .L0010D61C
/* 00D70C 0010D60C 2D200002 */   daddu      $4, $16, $0
/* 00D710 0010D610 6435040C */  jal         __terminate
/* 00D714 0010D614 00000000 */   nop
/* 00D718 0010D618 2D200002 */  daddu       $4, $16, $0
.L0010D61C:
/* 00D71C 0010D61C 2D280000 */  daddu       $5, $0, $0
/* 00D720 0010D620 5A0D040C */  jal         memset
/* 00D724 0010D624 18000624 */   addiu      $6, $0, 0x18
/* 00D728 0010D628 10000326 */  addiu       $3, $16, 0x10
/* 00D72C 0010D62C 2D100002 */  daddu       $2, $16, $0
/* 00D730 0010D630 040003AE */  sw          $3, 0x4($16)
/* 00D734 0010D634 1000BFDF */  ld          $31, 0x10($29)
/* 00D738 0010D638 0000B0DF */  ld          $16, 0x0($29)
/* 00D73C 0010D63C 0800E003 */  jr          $31
/* 00D740 0010D640 2000BD27 */   addiu      $29, $29, 0x20
/* 00D744 0010D644 00000000 */  nop
