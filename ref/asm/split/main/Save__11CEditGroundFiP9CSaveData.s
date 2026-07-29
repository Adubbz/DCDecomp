.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Save__11CEditGroundFiP9CSaveData
/* 0A4D90 001A4C90 80FFBD27 */  addiu       $29, $29, -0x80
/* 0A4D94 001A4C94 5000BF7F */  sq          $31, 0x50($29)
/* 0A4D98 001A4C98 4000B47F */  sq          $20, 0x40($29)
/* 0A4D9C 001A4C9C 3000B37F */  sq          $19, 0x30($29)
/* 0A4DA0 001A4CA0 2000B27F */  sq          $18, 0x20($29)
/* 0A4DA4 001A4CA4 1000B17F */  sq          $17, 0x10($29)
/* 0A4DA8 001A4CA8 0000B07F */  sq          $16, 0x0($29)
/* 0A4DAC 001A4CAC 28A68070 */  paddub      $20, $4, $0
/* 0A4DB0 001A4CB0 2826C070 */  paddub      $4, $6, $0
/* 0A4DB4 001A4CB4 7C00A627 */  addiu       $6, $29, 0x7C
/* 0A4DB8 001A4CB8 1860050C */  jal         GetParts__9CSaveDataFiPi
/* 0A4DBC 001A4CBC 00000000 */   nop
/* 0A4DC0 001A4CC0 288E4070 */  paddub      $17, $2, $0
/* 0A4DC4 001A4CC4 48002012 */  beqz        $17, .L001A4DE8
/* 0A4DC8 001A4CC8 00000000 */   nop
/* 0A4DCC 001A4CCC 28860070 */  paddub      $16, $0, $0
/* 0A4DD0 001A4CD0 3C000010 */  b           .L001A4DC4
/* 0A4DD4 001A4CD4 00000000 */   nop
.L001A4CD8:
/* 0A4DD8 001A4CD8 C0181000 */  sll         $3, $16, 3
/* 0A4DDC 001A4CDC 23207000 */  subu        $4, $3, $16
/* 0A4DE0 001A4CE0 80180400 */  sll         $3, $4, 2
/* 0A4DE4 001A4CE4 23186400 */  subu        $3, $3, $4
/* 0A4DE8 001A4CE8 40190300 */  sll         $3, $3, 5
/* 0A4DEC 001A4CEC 21188302 */  addu        $3, $20, $3
/* 0A4DF0 001A4CF0 30007224 */  addiu       $18, $3, 0x30
/* 0A4DF4 001A4CF4 1801738C */  lw          $19, 0x118($3)
/* 0A4DF8 001A4CF8 31006006 */  bltz        $19, .L001A4DC0
/* 0A4DFC 001A4CFC 00000000 */   nop
/* 0A4E00 001A4D00 1801458E */  lw          $5, 0x118($18)
/* 0A4E04 001A4D04 03000224 */  addiu       $2, $0, 0x3
/* 0A4E08 001A4D08 0900A210 */  beq         $5, $2, .L001A4D30
/* 0A4E0C 001A4D0C 00000000 */   nop
/* 0A4E10 001A4D10 02000224 */  addiu       $2, $0, 0x2
/* 0A4E14 001A4D14 0600A210 */  beq         $5, $2, .L001A4D30
/* 0A4E18 001A4D18 00000000 */   nop
/* 0A4E1C 001A4D1C 01000224 */  addiu       $2, $0, 0x1
/* 0A4E20 001A4D20 0300A210 */  beq         $5, $2, .L001A4D30
/* 0A4E24 001A4D24 00000000 */   nop
/* 0A4E28 001A4D28 17000010 */  b           .L001A4D88
/* 0A4E2C 001A4D2C 00000000 */   nop
.L001A4D30:
/* 0A4E30 001A4D30 28260070 */  paddub      $4, $0, $0
/* 0A4E34 001A4D34 11000010 */  b           .L001A4D7C
/* 0A4E38 001A4D38 00000000 */   nop
.L001A4D3C:
/* 0A4E3C 001A4D3C 0100013C */  lui         $1, (0x15F30 >> 16)
/* 0A4E40 001A4D40 21088102 */  addu        $1, $20, $1
/* 0A4E44 001A4D44 305F268C */  lw          $6, (0x15F30 & 0xFFFF)($1)
/* 0A4E48 001A4D48 C0100400 */  sll         $2, $4, 3
/* 0A4E4C 001A4D4C 23184400 */  subu        $3, $2, $4
/* 0A4E50 001A4D50 80100300 */  sll         $2, $3, 2
/* 0A4E54 001A4D54 23104300 */  subu        $2, $2, $3
/* 0A4E58 001A4D58 40110200 */  sll         $2, $2, 5
/* 0A4E5C 001A4D5C 21184600 */  addu        $3, $2, $6
/* 0A4E60 001A4D60 1801628C */  lw          $2, 0x118($3)
/* 0A4E64 001A4D64 0400A214 */  bne         $5, $2, .L001A4D78
/* 0A4E68 001A4D68 00000000 */   nop
/* 0A4E6C 001A4D6C E800738C */  lw          $19, 0xE8($3)
/* 0A4E70 001A4D70 05000010 */  b           .L001A4D88
/* 0A4E74 001A4D74 00000000 */   nop
.L001A4D78:
/* 0A4E78 001A4D78 01008424 */  addiu       $4, $4, 0x1
.L001A4D7C:
/* 0A4E7C 001A4D7C 18008228 */  slti        $2, $4, 0x18
/* 0A4E80 001A4D80 EEFF4014 */  bnez        $2, .L001A4D3C
/* 0A4E84 001A4D84 00000000 */   nop
.L001A4D88:
/* 0A4E88 001A4D88 28264072 */  paddub      $4, $18, $0
/* 0A4E8C 001A4D8C 6000A527 */  addiu       $5, $29, 0x60
/* 0A4E90 001A4D90 EC69060C */  jal         GetPosition__9CMapPartsFPf
/* 0A4E94 001A4D94 00000000 */   nop
/* 0A4E98 001A4D98 000033A6 */  sh          $19, 0x0($17)
/* 0A4E9C 001A4D9C F8004386 */  lh          $3, 0xF8($18)
/* 0A4EA0 001A4DA0 020023A6 */  sh          $3, 0x2($17)
/* 0A4EA4 001A4DA4 6000A0C7 */  lwc1        $f0, 0x60($29)
/* 0A4EA8 001A4DA8 040020E6 */  swc1        $f0, 0x4($17)
/* 0A4EAC 001A4DAC 6400A0C7 */  lwc1        $f0, 0x64($29)
/* 0A4EB0 001A4DB0 080020E6 */  swc1        $f0, 0x8($17)
/* 0A4EB4 001A4DB4 6800A0C7 */  lwc1        $f0, 0x68($29)
/* 0A4EB8 001A4DB8 0C0020E6 */  swc1        $f0, 0xC($17)
/* 0A4EBC 001A4DBC 10003126 */  addiu       $17, $17, 0x10
.L001A4DC0:
/* 0A4EC0 001A4DC0 01001026 */  addiu       $16, $16, 0x1
.L001A4DC4:
/* 0A4EC4 001A4DC4 8000032A */  slti        $3, $16, 0x80
/* 0A4EC8 001A4DC8 C3FF6014 */  bnez        $3, .L001A4CD8
/* 0A4ECC 001A4DCC 00000000 */   nop
/* 0A4ED0 001A4DD0 FFFF0324 */  addiu       $3, $0, -0x1
/* 0A4ED4 001A4DD4 000023A6 */  sh          $3, 0x0($17)
/* 0A4ED8 001A4DD8 020023A6 */  sh          $3, 0x2($17)
/* 0A4EDC 001A4DDC 040020AE */  sw          $0, 0x4($17)
/* 0A4EE0 001A4DE0 080020AE */  sw          $0, 0x8($17)
/* 0A4EE4 001A4DE4 0C0020AE */  sw          $0, 0xC($17)
.L001A4DE8:
/* 0A4EE8 001A4DE8 5000BF7B */  lq          $31, 0x50($29)
/* 0A4EEC 001A4DEC 4000B47B */  lq          $20, 0x40($29)
/* 0A4EF0 001A4DF0 3000B37B */  lq          $19, 0x30($29)
/* 0A4EF4 001A4DF4 2000B27B */  lq          $18, 0x20($29)
/* 0A4EF8 001A4DF8 1000B17B */  lq          $17, 0x10($29)
/* 0A4EFC 001A4DFC 0000B07B */  lq          $16, 0x0($29)
/* 0A4F00 001A4E00 8000BD27 */  addiu       $29, $29, 0x80
/* 0A4F04 001A4E04 0800E003 */  jr          $31
/* 0A4F08 001A4E08 00000000 */   nop
/* 0A4F0C 001A4E0C 00000000 */  nop
