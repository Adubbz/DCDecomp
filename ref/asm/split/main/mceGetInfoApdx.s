.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel mceGetInfoApdx
/* 01E8E8 0011E7E8 2B00023C */  lui         $2, %hi(typeAddr)
/* 01E8EC 0011E7EC 0020033C */  lui         $3, (0x20000090 >> 16)
/* 01E8F0 0011E7F0 6886458C */  lw          $5, %lo(typeAddr)($2)
/* 01E8F4 0011E7F4 0300A010 */  beqz        $5, .L0011E804
/* 01E8F8 0011E7F8 25208300 */   or         $4, $4, $3
/* 01E8FC 0011E7FC 0000828C */  lw          $2, (0x20000000 & 0xFFFF)($4)
/* 01E900 0011E800 0000A2AC */  sw          $2, 0x0($5)
.L0011E804:
/* 01E904 0011E804 2B00023C */  lui         $2, %hi(freeAddr)
/* 01E908 0011E808 6C86438C */  lw          $3, %lo(freeAddr)($2)
/* 01E90C 0011E80C 04006010 */  beqz        $3, .L0011E820
/* 01E910 0011E810 2B00023C */   lui        $2, %hi(formAddr)
/* 01E914 0011E814 0400828C */  lw          $2, (0x20000004 & 0xFFFF)($4)
/* 01E918 0011E818 000062AC */  sw          $2, 0x0($3)
/* 01E91C 0011E81C 2B00023C */  lui         $2, %hi(formAddr)
.L0011E820:
/* 01E920 0011E820 7086438C */  lw          $3, %lo(formAddr)($2)
/* 01E924 0011E824 03006010 */  beqz        $3, .L0011E834
/* 01E928 0011E828 00000000 */   nop
/* 01E92C 0011E82C 9000828C */  lw          $2, (0x20000090 & 0xFFFF)($4)
/* 01E930 0011E830 000062AC */  sw          $2, 0x0($3)
.L0011E834:
/* 01E934 0011E834 0800E003 */  jr          $31
/* 01E938 0011E838 00000000 */   nop
/* 01E93C 0011E83C 00000000 */  nop
