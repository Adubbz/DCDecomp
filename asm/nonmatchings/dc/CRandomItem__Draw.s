.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel Draw__11CRandomItemFv
/* D6CE0 001D6BE0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* D6CE4 001D6BE4 3000BF7F */  sq         $31, 0x30($sp)
/* D6CE8 001D6BE8 2000B27F */  sq         $18, 0x20($sp)
/* D6CEC 001D6BEC 1000B17F */  sq         $17, 0x10($sp)
/* D6CF0 001D6BF0 0000B07F */  sq         $16, 0x0($sp)
/* D6CF4 001D6BF4 28968070 */  paddub     $18, $4, $0
/* D6CF8 001D6BF8 28860070 */  paddub     $16, $0, $0
/* D6CFC 001D6BFC 5D000010 */  b          .L001D6D74
/* D6D00 001D6C00 00000000 */   nop
.L001D6C04:
/* D6D04 001D6C04 80881000 */  sll        $17, $16, 2
/* D6D08 001D6C08 21283202 */  addu       $5, $17, $18
/* D6D0C 001D6C0C 9002A48C */  lw         $4, 0x290($5)
/* D6D10 001D6C10 FFFF0324 */  addiu      $3, $0, -0x1
/* D6D14 001D6C14 56008310 */  beq        $4, $3, .L001D6D70
/* D6D18 001D6C18 00000000 */   nop
/* D6D1C 001D6C1C 1002A1C4 */  lwc1       $f1, 0x210($5)
/* D6D20 001D6C20 4843033C */  lui        $3, (0x43480000 >> 16)
/* D6D24 001D6C24 00008344 */  mtc1       $3, $f0
/* D6D28 001D6C28 00000000 */  nop
/* D6D2C 001D6C2C 36080046 */  c.le.s     $f1, $f0
/* D6D30 001D6C30 00000000 */  nop
/* D6D34 001D6C34 4E000045 */  bc1f       .L001D6D70
/* D6D38 001D6C38 00000000 */   nop
/* D6D3C 001D6C3C 00111000 */  sll        $2, $16, 4
/* D6D40 001D6C40 21104202 */  addu       $2, $18, $2
/* D6D44 001D6C44 4000A427 */  addiu      $4, $sp, 0x40
/* D6D48 001D6C48 10004524 */  addiu      $5, $2, 0x10
/* D6D4C 001D6C4C 0C86040C */  jal        sceVu0CopyVector
/* D6D50 001D6C50 00000000 */   nop
/* D6D54 001D6C54 21103202 */  addu       $2, $17, $18
/* D6D58 001D6C58 10044CC4 */  lwc1       $f12, 0x410($2)
/* D6D5C 001D6C5C 2876040C */  jal        sinf
/* D6D60 001D6C60 00000000 */   nop
/* D6D64 001D6C64 0041023C */  lui        $2, (0x41000000 >> 16)
/* D6D68 001D6C68 00088244 */  mtc1       $2, $f1
/* D6D6C 001D6C6C 00000000 */  nop
/* D6D70 001D6C70 42080046 */  mul.s      $f1, $f1, $f0
/* D6D74 001D6C74 4400A0C7 */  lwc1       $f0, 0x44($sp)
/* D6D78 001D6C78 00000146 */  add.s      $f0, $f0, $f1
/* D6D7C 001D6C7C 4400A0E7 */  swc1       $f0, 0x44($sp)
/* D6D80 001D6C80 21203202 */  addu       $4, $17, $18
/* D6D84 001D6C84 1003838C */  lw         $3, 0x310($4)
/* D6D88 001D6C88 FFFF0224 */  addiu      $2, $0, -0x1
/* D6D8C 001D6C8C 05006210 */  beq        $3, $2, .L001D6CA4
/* D6D90 001D6C90 00000000 */   nop
/* D6D94 001D6C94 40000624 */  addiu      $6, $0, 0x40
/* D6D98 001D6C98 283E0070 */  paddub     $7, $0, $0
/* D6D9C 001D6C9C 2B000010 */  b          .L001D6D4C
/* D6DA0 001D6CA0 00000000 */   nop
.L001D6CA4:
/* D6DA4 001D6CA4 9405858C */  lw         $5, 0x594($4)
/* D6DA8 001D6CA8 3DFFA420 */  addi       $4, $5, -0xC3 # handwritten instruction
/* D6DAC 001D6CAC 0C00812C */  sltiu      $at, $4, 0xC
/* D6DB0 001D6CB0 14002010 */  beqz       $at, .L001D6D04
/* D6DB4 001D6CB4 00000000 */   nop
/* D6DB8 001D6CB8 2A00023C */  lui        $2, %hi(_1366_2)
/* D6DBC 001D6CBC C0CE4324 */  addiu      $3, $2, %lo(_1366_2)
/* D6DC0 001D6CC0 80100400 */  sll        $2, $4, 2
/* D6DC4 001D6CC4 21104300 */  addu       $2, $2, $3
/* D6DC8 001D6CC8 0000428C */  lw         $2, 0x0($2)
/* D6DCC 001D6CCC 08004000 */  jr         $2
/* D6DD0 001D6CD0 00000000 */   nop
/* D6DD4 001D6CD4 28360070 */  paddub     $6, $0, $0
/* D6DD8 001D6CD8 283E0070 */  paddub     $7, $0, $0
/* D6DDC 001D6CDC 0B000010 */  b          .L001D6D0C
/* D6DE0 001D6CE0 00000000 */   nop
/* D6DE4 001D6CE4 40000624 */  addiu      $6, $0, 0x40
/* D6DE8 001D6CE8 283EC070 */  paddub     $7, $6, $0
/* D6DEC 001D6CEC 07000010 */  b          .L001D6D0C
/* D6DF0 001D6CF0 00000000 */   nop
/* D6DF4 001D6CF4 28360070 */  paddub     $6, $0, $0
/* D6DF8 001D6CF8 40000724 */  addiu      $7, $0, 0x40
/* D6DFC 001D6CFC 03000010 */  b          .L001D6D0C
/* D6E00 001D6D00 00000000 */   nop
.L001D6D04:
/* D6E04 001D6D04 40000624 */  addiu      $6, $0, 0x40
/* D6E08 001D6D08 C0000724 */  addiu      $7, $0, 0xC0
.L001D6D0C:
/* D6E0C 001D6D0C 5100A228 */  slti       $2, $5, 0x51
/* D6E10 001D6D10 06004014 */  bnez       $2, .L001D6D2C
/* D6E14 001D6D14 00000000 */   nop
/* D6E18 001D6D18 5600A128 */  slti       $at, $5, 0x56
/* D6E1C 001D6D1C 03002010 */  beqz       $at, .L001D6D2C
/* D6E20 001D6D20 00000000 */   nop
/* D6E24 001D6D24 28360070 */  paddub     $6, $0, $0
/* D6E28 001D6D28 80000724 */  addiu      $7, $0, 0x80
.L001D6D2C:
/* D6E2C 001D6D2C 6F00A228 */  slti       $2, $5, 0x6F
/* D6E30 001D6D30 06004014 */  bnez       $2, .L001D6D4C
/* D6E34 001D6D34 00000000 */   nop
/* D6E38 001D6D38 7900A128 */  slti       $at, $5, 0x79
/* D6E3C 001D6D3C 03002010 */  beqz       $at, .L001D6D4C
/* D6E40 001D6D40 00000000 */   nop
/* D6E44 001D6D44 40000624 */  addiu      $6, $0, 0x40
/* D6E48 001D6D48 80000724 */  addiu      $7, $0, 0x80
.L001D6D4C:
/* D6E4C 001D6D4C 6040023C */  lui        $2, (0x40600000 >> 16)
/* D6E50 001D6D50 00608244 */  mtc1       $2, $f12
/* D6E54 001D6D54 4000A427 */  addiu      $4, $sp, 0x40
/* D6E58 001D6D58 0000458E */  lw         $5, 0x0($18)
/* D6E5C 001D6D5C 40000824 */  addiu      $8, $0, 0x40
/* D6E60 001D6D60 284E0071 */  paddub     $9, $8, $0
/* D6E64 001D6D64 80000A24 */  addiu      $10, $0, 0x80
/* D6E68 001D6D68 FCC9060C */  jal        BtSet3DCellModel__FPfP8CTexturefiiiii
/* D6E6C 001D6D6C 00000000 */   nop
.L001D6D70:
/* D6E70 001D6D70 01001026 */  addiu      $16, $16, 0x1
.L001D6D74:
/* D6E74 001D6D74 2000032A */  slti       $3, $16, 0x20
/* D6E78 001D6D78 A2FF6014 */  bnez       $3, .L001D6C04
/* D6E7C 001D6D7C 00000000 */   nop
/* D6E80 001D6D80 3000BF7B */  lq         $31, 0x30($sp)
/* D6E84 001D6D84 2000B27B */  lq         $18, 0x20($sp)
/* D6E88 001D6D88 1000B17B */  lq         $17, 0x10($sp)
/* D6E8C 001D6D8C 0000B07B */  lq         $16, 0x0($sp)
/* D6E90 001D6D90 5000BD27 */  addiu      $sp, $sp, 0x50
/* D6E94 001D6D94 0800E003 */  jr         $31
/* D6E98 001D6D98 00000000 */   nop
/* D6E9C 001D6D9C 00000000 */  nop
