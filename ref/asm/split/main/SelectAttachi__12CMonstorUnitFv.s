.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SelectAttachi__12CMonstorUnitFv
/* 0D9E60 001D9D60 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0D9E64 001D9D64 1000BF7F */  sq          $31, 0x10($29)
/* 0D9E68 001D9D68 0000B07F */  sq          $16, 0x0($29)
/* 0D9E6C 001D9D6C 28868070 */  paddub      $16, $4, $0
/* 0D9E70 001D9D70 BE11040C */  jal         rand
/* 0D9E74 001D9D74 00000000 */   nop
/* 0D9E78 001D9D78 00008244 */  mtc1        $2, $f0
/* 0D9E7C 001D9D7C 00000000 */  nop
/* 0D9E80 001D9D80 60008046 */  cvt.s.w     $f1, $f0
/* 0D9E84 001D9D84 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 0D9E88 001D9D88 00008244 */  mtc1        $2, $f0
/* 0D9E8C 001D9D8C 00000000 */  nop
/* 0D9E90 001D9D90 42000146 */  mul.s       $f1, $f0, $f1
/* 0D9E94 001D9D94 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0D9E98 001D9D98 00008244 */  mtc1        $2, $f0
/* 0D9E9C 001D9D9C 00000000 */  nop
/* 0D9EA0 001D9DA0 030B0046 */  div.s       $f12, $f1, $f0
/* 0D9EA4 001D9DA4 2C44040C */  jal         fptosi
/* 0D9EA8 001D9DA8 00000000 */   nop
/* 0D9EAC 001D9DAC 47004128 */  slti        $1, $2, 0x47
/* 0D9EB0 001D9DB0 04002014 */  bnez        $1, .L001D9DC4
/* 0D9EB4 001D9DB4 00000000 */   nop
/* 0D9EB8 001D9DB8 FFFF0224 */  addiu       $2, $0, -0x1
/* 0D9EBC 001D9DBC 4F000010 */  b           .L001D9EFC
/* 0D9EC0 001D9DC0 00000000 */   nop
.L001D9DC4:
/* 0D9EC4 001D9DC4 BE11040C */  jal         rand
/* 0D9EC8 001D9DC8 00000000 */   nop
/* 0D9ECC 001D9DCC 00008244 */  mtc1        $2, $f0
/* 0D9ED0 001D9DD0 00000000 */  nop
/* 0D9ED4 001D9DD4 60008046 */  cvt.s.w     $f1, $f0
/* 0D9ED8 001D9DD8 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 0D9EDC 001D9DDC 00008244 */  mtc1        $2, $f0
/* 0D9EE0 001D9DE0 00000000 */  nop
/* 0D9EE4 001D9DE4 42000146 */  mul.s       $f1, $f0, $f1
/* 0D9EE8 001D9DE8 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0D9EEC 001D9DEC 00008244 */  mtc1        $2, $f0
/* 0D9EF0 001D9DF0 00000000 */  nop
/* 0D9EF4 001D9DF4 030B0046 */  div.s       $f12, $f1, $f0
/* 0D9EF8 001D9DF8 2C44040C */  jal         fptosi
/* 0D9EFC 001D9DFC 00000000 */   nop
/* 0D9F00 001D9E00 282E0070 */  paddub      $5, $0, $0
/* 0D9F04 001D9E04 28360070 */  paddub      $6, $0, $0
/* 0D9F08 001D9E08 01000724 */  addiu       $7, $0, 0x1
/* 0D9F0C 001D9E0C 17000010 */  b           .L001D9E6C
/* 0D9F10 001D9E10 00000000 */   nop
.L001D9E14:
/* 0D9F14 001D9E14 9000048E */  lw          $4, 0x90($16)
/* 0D9F18 001D9E18 80180400 */  sll         $3, $4, 2
/* 0D9F1C 001D9E1C 21206400 */  addu        $4, $3, $4
/* 0D9F20 001D9E20 80180400 */  sll         $3, $4, 2
/* 0D9F24 001D9E24 21188300 */  addu        $3, $4, $3
/* 0D9F28 001D9E28 00190300 */  sll         $3, $3, 4
/* 0D9F2C 001D9E2C 21187000 */  addu        $3, $3, $16
/* 0D9F30 001D9E30 0100013C */  lui         $1, (0x1E3FA >> 16)
/* 0D9F34 001D9E34 FAE32134 */  ori         $1, $1, (0x1E3FA & 0xFFFF)
/* 0D9F38 001D9E38 21406100 */  addu        $8, $3, $1
/* 0D9F3C 001D9E3C 40180600 */  sll         $3, $6, 1
/* 0D9F40 001D9E40 21180301 */  addu        $3, $8, $3
/* 0D9F44 001D9E44 00006484 */  lh          $4, 0x0($3)
/* 0D9F48 001D9E48 40180700 */  sll         $3, $7, 1
/* 0D9F4C 001D9E4C 21180301 */  addu        $3, $8, $3
/* 0D9F50 001D9E50 00006384 */  lh          $3, 0x0($3)
/* 0D9F54 001D9E54 2A188300 */  slt         $3, $4, $3
/* 0D9F58 001D9E58 03006010 */  beqz        $3, .L001D9E68
/* 0D9F5C 001D9E5C 00000000 */   nop
/* 0D9F60 001D9E60 2836E070 */  paddub      $6, $7, $0
/* 0D9F64 001D9E64 01000524 */  addiu       $5, $0, 0x1
.L001D9E68:
/* 0D9F68 001D9E68 0100E724 */  addiu       $7, $7, 0x1
.L001D9E6C:
/* 0D9F6C 001D9E6C 0500E328 */  slti        $3, $7, 0x5
/* 0D9F70 001D9E70 E8FF6014 */  bnez        $3, .L001D9E14
/* 0D9F74 001D9E74 00000000 */   nop
/* 0D9F78 001D9E78 1E004128 */  slti        $1, $2, 0x1E
/* 0D9F7C 001D9E7C 0D002010 */  beqz        $1, .L001D9EB4
/* 0D9F80 001D9E80 00000000 */   nop
/* 0D9F84 001D9E84 0B00A010 */  beqz        $5, .L001D9EB4
/* 0D9F88 001D9E88 00000000 */   nop
/* 0D9F8C 001D9E8C 5100C224 */  addiu       $2, $6, 0x51
/* 0D9F90 001D9E90 51004328 */  slti        $3, $2, 0x51
/* 0D9F94 001D9E94 04006014 */  bnez        $3, .L001D9EA8
/* 0D9F98 001D9E98 00000000 */   nop
/* 0D9F9C 001D9E9C 56004328 */  slti        $3, $2, 0x56
/* 0D9FA0 001D9EA0 16006014 */  bnez        $3, .L001D9EFC
/* 0D9FA4 001D9EA4 00000000 */   nop
.L001D9EA8:
/* 0D9FA8 001D9EA8 FFFF0224 */  addiu       $2, $0, -0x1
/* 0D9FAC 001D9EAC 13000010 */  b           .L001D9EFC
/* 0D9FB0 001D9EB0 00000000 */   nop
.L001D9EB4:
/* 0D9FB4 001D9EB4 9000038E */  lw          $3, 0x90($16)
/* 0D9FB8 001D9EB8 80100300 */  sll         $2, $3, 2
/* 0D9FBC 001D9EBC 21184300 */  addu        $3, $2, $3
/* 0D9FC0 001D9EC0 80100300 */  sll         $2, $3, 2
/* 0D9FC4 001D9EC4 21106200 */  addu        $2, $3, $2
/* 0D9FC8 001D9EC8 00110200 */  sll         $2, $2, 4
/* 0D9FCC 001D9ECC 21105000 */  addu        $2, $2, $16
/* 0D9FD0 001D9ED0 0200013C */  lui         $1, (0x20000 >> 16)
/* 0D9FD4 001D9ED4 21084100 */  addu        $1, $2, $1
/* 0D9FD8 001D9ED8 F8E32284 */  lh          $2, -0x1C08($1)
/* 0D9FDC 001D9EDC 6F004224 */  addiu       $2, $2, 0x6F
/* 0D9FE0 001D9EE0 6F004328 */  slti        $3, $2, 0x6F
/* 0D9FE4 001D9EE4 04006014 */  bnez        $3, .L001D9EF8
/* 0D9FE8 001D9EE8 00000000 */   nop
/* 0D9FEC 001D9EEC 79004328 */  slti        $3, $2, 0x79
/* 0D9FF0 001D9EF0 02006014 */  bnez        $3, .L001D9EFC
/* 0D9FF4 001D9EF4 00000000 */   nop
.L001D9EF8:
/* 0D9FF8 001D9EF8 FFFF0224 */  addiu       $2, $0, -0x1
.L001D9EFC:
/* 0D9FFC 001D9EFC 1000BF7B */  lq          $31, 0x10($29)
/* 0DA000 001D9F00 0000B07B */  lq          $16, 0x0($29)
/* 0DA004 001D9F04 2000BD27 */  addiu       $29, $29, 0x20
/* 0DA008 001D9F08 0800E003 */  jr          $31
/* 0DA00C 001D9F0C 00000000 */   nop
