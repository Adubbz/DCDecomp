.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EquipDefaultWeapon__Fi
/* 10C0B0 0020BFB0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 10C0B4 0020BFB4 3000BF7F */  sq         $31, 0x30($sp)
/* 10C0B8 0020BFB8 2000B27F */  sq         $18, 0x20($sp)
/* 10C0BC 0020BFBC 1000B17F */  sq         $17, 0x10($sp)
/* 10C0C0 0020BFC0 0000B07F */  sq         $16, 0x0($sp)
/* 10C0C4 0020BFC4 28968070 */  paddub     $18, $4, $0
/* 10C0C8 0020BFC8 1C8D848F */  lw         $4, -0x72E4($gp)
/* 10C0CC 0020BFCC 7860050C */  jal        GetDngStatus__9CSaveDataFv
/* 10C0D0 0020BFD0 00000000 */   nop
/* 10C0D4 0020BFD4 28864070 */  paddub     $16, $2, $0
/* 10C0D8 0020BFD8 A80A0324 */  addiu      $3, $0, 0xAA8
/* 10C0DC 0020BFDC 18184302 */  mult       $3, $18, $3
/* 10C0E0 0020BFE0 21104300 */  addu       $2, $2, $3
/* 10C0E4 0020BFE4 0C455124 */  addiu      $17, $2, 0x450C
/* 10C0E8 0020BFE8 28264072 */  paddub     $4, $18, $0
/* 10C0EC 0020BFEC 68CF070C */  jal        GetDefaultWeaponNo__Fi
/* 10C0F0 0020BFF0 00000000 */   nop
/* 10C0F4 0020BFF4 282E0070 */  paddub     $5, $0, $0
/* 10C0F8 0020BFF8 10000010 */  b          .L0020C03C
/* 10C0FC 0020BFFC 00000000 */   nop
.L0020C000:
/* 10C100 0020C000 40190500 */  sll        $3, $5, 5
/* 10C104 0020C004 23186500 */  subu       $3, $3, $5
/* 10C108 0020C008 C0180300 */  sll        $3, $3, 3
/* 10C10C 0020C00C 21182302 */  addu       $3, $17, $3
/* 10C110 0020C010 00006484 */  lh         $4, 0x0($3)
/* 10C114 0020C014 04004410 */  beq        $2, $4, .L0020C028
/* 10C118 0020C018 00000000 */   nop
/* 10C11C 0020C01C 01004324 */  addiu      $3, $2, 0x1
/* 10C120 0020C020 05006414 */  bne        $3, $4, .L0020C038
/* 10C124 0020C024 00000000 */   nop
.L0020C028:
/* 10C128 0020C028 21185002 */  addu       $3, $18, $16
/* 10C12C 0020C02C 404365A0 */  sb         $5, 0x4340($3)
/* 10C130 0020C030 05000010 */  b          .L0020C048
/* 10C134 0020C034 00000000 */   nop
.L0020C038:
/* 10C138 0020C038 0100A524 */  addiu      $5, $5, 0x1
.L0020C03C:
/* 10C13C 0020C03C 0A00A328 */  slti       $3, $5, 0xA
/* 10C140 0020C040 EFFF6014 */  bnez       $3, .L0020C000
/* 10C144 0020C044 00000000 */   nop
.L0020C048:
/* 10C148 0020C048 3000BF7B */  lq         $31, 0x30($sp)
/* 10C14C 0020C04C 2000B27B */  lq         $18, 0x20($sp)
/* 10C150 0020C050 1000B17B */  lq         $17, 0x10($sp)
/* 10C154 0020C054 0000B07B */  lq         $16, 0x0($sp)
/* 10C158 0020C058 4000BD27 */  addiu      $sp, $sp, 0x40
/* 10C15C 0020C05C 0800E003 */  jr         $31
/* 10C160 0020C060 00000000 */   nop
/* 10C164 0020C064 00000000 */  nop
/* 10C168 0020C068 00000000 */  nop
/* 10C16C 0020C06C 00000000 */  nop
