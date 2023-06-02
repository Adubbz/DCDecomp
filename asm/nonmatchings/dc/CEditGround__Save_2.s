.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Save__11CEditGroundFiP9CSaveData
/* A4D90 001A4C90 80FFBD27 */  addiu      $sp, $sp, -0x80
/* A4D94 001A4C94 5000BF7F */  sq         $31, 0x50($sp)
/* A4D98 001A4C98 4000B47F */  sq         $20, 0x40($sp)
/* A4D9C 001A4C9C 3000B37F */  sq         $19, 0x30($sp)
/* A4DA0 001A4CA0 2000B27F */  sq         $18, 0x20($sp)
/* A4DA4 001A4CA4 1000B17F */  sq         $17, 0x10($sp)
/* A4DA8 001A4CA8 0000B07F */  sq         $16, 0x0($sp)
/* A4DAC 001A4CAC 28A68070 */  paddub     $20, $4, $0
/* A4DB0 001A4CB0 2826C070 */  paddub     $4, $6, $0
/* A4DB4 001A4CB4 7C00A627 */  addiu      $6, $sp, 0x7C
/* A4DB8 001A4CB8 1860050C */  jal        GetParts__9CSaveDataFiPi
/* A4DBC 001A4CBC 00000000 */   nop
/* A4DC0 001A4CC0 288E4070 */  paddub     $17, $2, $0
/* A4DC4 001A4CC4 48002012 */  beqz       $17, .L001A4DE8
/* A4DC8 001A4CC8 00000000 */   nop
/* A4DCC 001A4CCC 28860070 */  paddub     $16, $0, $0
/* A4DD0 001A4CD0 3C000010 */  b          .L001A4DC4
/* A4DD4 001A4CD4 00000000 */   nop
.L001A4CD8:
/* A4DD8 001A4CD8 C0181000 */  sll        $3, $16, 3
/* A4DDC 001A4CDC 23207000 */  subu       $4, $3, $16
/* A4DE0 001A4CE0 80180400 */  sll        $3, $4, 2
/* A4DE4 001A4CE4 23186400 */  subu       $3, $3, $4
/* A4DE8 001A4CE8 40190300 */  sll        $3, $3, 5
/* A4DEC 001A4CEC 21188302 */  addu       $3, $20, $3
/* A4DF0 001A4CF0 30007224 */  addiu      $18, $3, 0x30
/* A4DF4 001A4CF4 1801738C */  lw         $19, 0x118($3)
/* A4DF8 001A4CF8 31006006 */  bltz       $19, .L001A4DC0
/* A4DFC 001A4CFC 00000000 */   nop
/* A4E00 001A4D00 1801458E */  lw         $5, 0x118($18)
/* A4E04 001A4D04 03000224 */  addiu      $2, $0, 0x3
/* A4E08 001A4D08 0900A210 */  beq        $5, $2, .L001A4D30
/* A4E0C 001A4D0C 00000000 */   nop
/* A4E10 001A4D10 02000224 */  addiu      $2, $0, 0x2
/* A4E14 001A4D14 0600A210 */  beq        $5, $2, .L001A4D30
/* A4E18 001A4D18 00000000 */   nop
/* A4E1C 001A4D1C 01000224 */  addiu      $2, $0, 0x1
/* A4E20 001A4D20 0300A210 */  beq        $5, $2, .L001A4D30
/* A4E24 001A4D24 00000000 */   nop
/* A4E28 001A4D28 17000010 */  b          .L001A4D88
/* A4E2C 001A4D2C 00000000 */   nop
.L001A4D30:
/* A4E30 001A4D30 28260070 */  paddub     $4, $0, $0
/* A4E34 001A4D34 11000010 */  b          .L001A4D7C
/* A4E38 001A4D38 00000000 */   nop
.L001A4D3C:
/* A4E3C 001A4D3C 0100013C */  lui        $at, (0x15F30 >> 16)
/* A4E40 001A4D40 21088102 */  addu       $at, $20, $at
/* A4E44 001A4D44 305F268C */  lw         $6, (0x15F30 & 0xFFFF)($at)
/* A4E48 001A4D48 C0100400 */  sll        $2, $4, 3
/* A4E4C 001A4D4C 23184400 */  subu       $3, $2, $4
/* A4E50 001A4D50 80100300 */  sll        $2, $3, 2
/* A4E54 001A4D54 23104300 */  subu       $2, $2, $3
/* A4E58 001A4D58 40110200 */  sll        $2, $2, 5
/* A4E5C 001A4D5C 21184600 */  addu       $3, $2, $6
/* A4E60 001A4D60 1801628C */  lw         $2, 0x118($3)
/* A4E64 001A4D64 0400A214 */  bne        $5, $2, .L001A4D78
/* A4E68 001A4D68 00000000 */   nop
/* A4E6C 001A4D6C E800738C */  lw         $19, 0xE8($3)
/* A4E70 001A4D70 05000010 */  b          .L001A4D88
/* A4E74 001A4D74 00000000 */   nop
.L001A4D78:
/* A4E78 001A4D78 01008424 */  addiu      $4, $4, 0x1
.L001A4D7C:
/* A4E7C 001A4D7C 18008228 */  slti       $2, $4, 0x18
/* A4E80 001A4D80 EEFF4014 */  bnez       $2, .L001A4D3C
/* A4E84 001A4D84 00000000 */   nop
.L001A4D88:
/* A4E88 001A4D88 28264072 */  paddub     $4, $18, $0
/* A4E8C 001A4D8C 6000A527 */  addiu      $5, $sp, 0x60
/* A4E90 001A4D90 EC69060C */  jal        GetPosition__9CMapPartsFPf
/* A4E94 001A4D94 00000000 */   nop
/* A4E98 001A4D98 000033A6 */  sh         $19, 0x0($17)
/* A4E9C 001A4D9C F8004386 */  lh         $3, 0xF8($18)
/* A4EA0 001A4DA0 020023A6 */  sh         $3, 0x2($17)
/* A4EA4 001A4DA4 6000A0C7 */  lwc1       $f0, 0x60($sp)
/* A4EA8 001A4DA8 040020E6 */  swc1       $f0, 0x4($17)
/* A4EAC 001A4DAC 6400A0C7 */  lwc1       $f0, 0x64($sp)
/* A4EB0 001A4DB0 080020E6 */  swc1       $f0, 0x8($17)
/* A4EB4 001A4DB4 6800A0C7 */  lwc1       $f0, 0x68($sp)
/* A4EB8 001A4DB8 0C0020E6 */  swc1       $f0, 0xC($17)
/* A4EBC 001A4DBC 10003126 */  addiu      $17, $17, 0x10
.L001A4DC0:
/* A4EC0 001A4DC0 01001026 */  addiu      $16, $16, 0x1
.L001A4DC4:
/* A4EC4 001A4DC4 8000032A */  slti       $3, $16, 0x80
/* A4EC8 001A4DC8 C3FF6014 */  bnez       $3, .L001A4CD8
/* A4ECC 001A4DCC 00000000 */   nop
/* A4ED0 001A4DD0 FFFF0324 */  addiu      $3, $0, -0x1
/* A4ED4 001A4DD4 000023A6 */  sh         $3, 0x0($17)
/* A4ED8 001A4DD8 020023A6 */  sh         $3, 0x2($17)
/* A4EDC 001A4DDC 040020AE */  sw         $0, 0x4($17)
/* A4EE0 001A4DE0 080020AE */  sw         $0, 0x8($17)
/* A4EE4 001A4DE4 0C0020AE */  sw         $0, 0xC($17)
.L001A4DE8:
/* A4EE8 001A4DE8 5000BF7B */  lq         $31, 0x50($sp)
/* A4EEC 001A4DEC 4000B47B */  lq         $20, 0x40($sp)
/* A4EF0 001A4DF0 3000B37B */  lq         $19, 0x30($sp)
/* A4EF4 001A4DF4 2000B27B */  lq         $18, 0x20($sp)
/* A4EF8 001A4DF8 1000B17B */  lq         $17, 0x10($sp)
/* A4EFC 001A4DFC 0000B07B */  lq         $16, 0x0($sp)
/* A4F00 001A4E00 8000BD27 */  addiu      $sp, $sp, 0x80
/* A4F04 001A4E04 0800E003 */  jr         $31
/* A4F08 001A4E08 00000000 */   nop
/* A4F0C 001A4E0C 00000000 */  nop
