.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CheckEventFlag2__12CMonstorUnitFv
/* 0D8030 001D7F30 28360070 */  paddub      $6, $0, $0
/* 0D8034 001D7F34 1A000010 */  b           .L001D7FA0
/* 0D8038 001D7F38 00000000 */   nop
.L001D7F3C:
/* 0D803C 001D7F3C 80100600 */  sll         $2, $6, 2
/* 0D8040 001D7F40 21184600 */  addu        $3, $2, $6
/* 0D8044 001D7F44 80100300 */  sll         $2, $3, 2
/* 0D8048 001D7F48 21106200 */  addu        $2, $3, $2
/* 0D804C 001D7F4C 00110200 */  sll         $2, $2, 4
/* 0D8050 001D7F50 21284400 */  addu        $5, $2, $4
/* 0D8054 001D7F54 0200013C */  lui         $1, (0x20000 >> 16)
/* 0D8058 001D7F58 2108A100 */  addu        $1, $5, $1
/* 0D805C 001D7F5C D0E3238C */  lw          $3, -0x1C30($1)
/* 0D8060 001D7F60 02000224 */  addiu       $2, $0, 0x2
/* 0D8064 001D7F64 0D006214 */  bne         $3, $2, .L001D7F9C
/* 0D8068 001D7F68 00000000 */   nop
/* 0D806C 001D7F6C 0100013C */  lui         $1, (0x1E4C8 >> 16)
/* 0D8070 001D7F70 C8E42134 */  ori         $1, $1, (0x1E4C8 & 0xFFFF)
/* 0D8074 001D7F74 2118A100 */  addu        $3, $5, $1
/* 0D8078 001D7F78 00006284 */  lh          $2, 0x0($3)
/* 0D807C 001D7F7C 07004010 */  beqz        $2, .L001D7F9C
/* 0D8080 001D7F80 00000000 */   nop
/* 0D8084 001D7F84 000060A4 */  sh          $0, 0x0($3)
/* 0D8088 001D7F88 0200013C */  lui         $1, (0x20000 >> 16)
/* 0D808C 001D7F8C 2108A100 */  addu        $1, $5, $1
/* 0D8090 001D7F90 C6E42284 */  lh          $2, -0x1B3A($1)
/* 0D8094 001D7F94 06000010 */  b           .L001D7FB0
/* 0D8098 001D7F98 00000000 */   nop
.L001D7F9C:
/* 0D809C 001D7F9C 0100C624 */  addiu       $6, $6, 0x1
.L001D7FA0:
/* 0D80A0 001D7FA0 1000C228 */  slti        $2, $6, 0x10
/* 0D80A4 001D7FA4 E5FF4014 */  bnez        $2, .L001D7F3C
/* 0D80A8 001D7FA8 00000000 */   nop
/* 0D80AC 001D7FAC FFFF0224 */  addiu       $2, $0, -0x1
.L001D7FB0:
/* 0D80B0 001D7FB0 0800E003 */  jr          $31
/* 0D80B4 001D7FB4 00000000 */   nop
/* 0D80B8 001D7FB8 00000000 */  nop
/* 0D80BC 001D7FBC 00000000 */  nop
