.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MapSymbolDraw__11CRandomItemFv
/* D6EA0 001D6DA0 80FFBD27 */  addiu      $sp, $sp, -0x80
/* D6EA4 001D6DA4 5000BF7F */  sq         $31, 0x50($sp)
/* D6EA8 001D6DA8 4000B47F */  sq         $20, 0x40($sp)
/* D6EAC 001D6DAC 3000B37F */  sq         $19, 0x30($sp)
/* D6EB0 001D6DB0 2000B27F */  sq         $18, 0x20($sp)
/* D6EB4 001D6DB4 1000B17F */  sq         $17, 0x10($sp)
/* D6EB8 001D6DB8 0000B07F */  sq         $16, 0x0($sp)
/* D6EBC 001D6DBC 28A68070 */  paddub     $20, $4, $0
/* D6EC0 001D6DC0 C701023C */  lui        $2, %hi(TexManager)
/* D6EC4 001D6DC4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* D6EC8 001D6DC8 2A00023C */  lui        $2, %hi(_1383)
/* D6ECC 001D6DCC F0CE4524 */  addiu      $5, $2, %lo(_1383)
/* D6ED0 001D6DD0 FFFF0624 */  addiu      $6, $0, -0x1
/* D6ED4 001D6DD4 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* D6ED8 001D6DD8 00000000 */   nop
/* D6EDC 001D6DDC 28864070 */  paddub     $16, $2, $0
/* D6EE0 001D6DE0 288E0070 */  paddub     $17, $0, $0
/* D6EE4 001D6DE4 34000010 */  b          .L001D6EB8
/* D6EE8 001D6DE8 00000000 */   nop
.L001D6DEC:
/* D6EEC 001D6DEC 80181100 */  sll        $3, $17, 2
/* D6EF0 001D6DF0 21387400 */  addu       $7, $3, $20
/* D6EF4 001D6DF4 9002E38C */  lw         $3, 0x290($7)
/* D6EF8 001D6DF8 FFFF0624 */  addiu      $6, $0, -0x1
/* D6EFC 001D6DFC 2D006610 */  beq        $3, $6, .L001D6EB4
/* D6F00 001D6E00 00000000 */   nop
/* D6F04 001D6E04 1003E38C */  lw         $3, 0x310($7)
/* D6F08 001D6E08 2A006614 */  bne        $3, $6, .L001D6EB4
/* D6F0C 001D6E0C 00000000 */   nop
/* D6F10 001D6E10 00991100 */  sll        $19, $17, 4
/* D6F14 001D6E14 21107402 */  addu       $2, $19, $20
/* D6F18 001D6E18 100041C4 */  lwc1       $f1, 0x10($2)
/* D6F1C 001D6E1C A042023C */  lui        $2, (0x42A00000 >> 16)
/* D6F20 001D6E20 00008244 */  mtc1       $2, $f0
/* D6F24 001D6E24 00000000 */  nop
/* D6F28 001D6E28 41080046 */  sub.s      $f1, $f1, $f0
/* D6F2C 001D6E2C 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* D6F30 001D6E30 02030146 */  mul.s      $f12, $f0, $f1
/* D6F34 001D6E34 2C44040C */  jal        fptosi
/* D6F38 001D6E38 00000000 */   nop
/* D6F3C 001D6E3C 28964070 */  paddub     $18, $2, $0
/* D6F40 001D6E40 21107402 */  addu       $2, $19, $20
/* D6F44 001D6E44 180041C4 */  lwc1       $f1, 0x18($2)
/* D6F48 001D6E48 A042023C */  lui        $2, (0x42A00000 >> 16)
/* D6F4C 001D6E4C 00008244 */  mtc1       $2, $f0
/* D6F50 001D6E50 00000000 */  nop
/* D6F54 001D6E54 41080046 */  sub.s      $f1, $f1, $f0
/* D6F58 001D6E58 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* D6F5C 001D6E5C 02030146 */  mul.s      $f12, $f0, $f1
/* D6F60 001D6E60 2C44040C */  jal        fptosi
/* D6F64 001D6E64 00000000 */   nop
/* D6F68 001D6E68 50000324 */  addiu      $3, $0, 0x50
/* D6F6C 001D6E6C 7000A3AF */  sw         $3, 0x70($sp)
/* D6F70 001D6E70 68000324 */  addiu      $3, $0, 0x68
/* D6F74 001D6E74 7400A3AF */  sw         $3, 0x74($sp)
/* D6F78 001D6E78 08000424 */  addiu      $4, $0, 0x8
/* D6F7C 001D6E7C 7800A4AF */  sw         $4, 0x78($sp)
/* D6F80 001D6E80 7C00A4AF */  sw         $4, 0x7C($sp)
/* D6F84 001D6E84 84014326 */  addiu      $3, $18, 0x184
/* D6F88 001D6E88 6000A3AF */  sw         $3, 0x60($sp)
/* D6F8C 001D6E8C 48004224 */  addiu      $2, $2, 0x48
/* D6F90 001D6E90 6400A2AF */  sw         $2, 0x64($sp)
/* D6F94 001D6E94 6800A4AF */  sw         $4, 0x68($sp)
/* D6F98 001D6E98 6C00A4AF */  sw         $4, 0x6C($sp)
/* D6F9C 001D6E9C D48B848F */  lw         $4, -0x742C($gp)
/* D6FA0 001D6EA0 282E0072 */  paddub     $5, $16, $0
/* D6FA4 001D6EA4 6000A627 */  addiu      $6, $sp, 0x60
/* D6FA8 001D6EA8 7000A727 */  addiu      $7, $sp, 0x70
/* D6FAC 001D6EAC 0070050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_
/* D6FB0 001D6EB0 00000000 */   nop
.L001D6EB4:
/* D6FB4 001D6EB4 01003126 */  addiu      $17, $17, 0x1
.L001D6EB8:
/* D6FB8 001D6EB8 2000232A */  slti       $3, $17, 0x20
/* D6FBC 001D6EBC CBFF6014 */  bnez       $3, .L001D6DEC
/* D6FC0 001D6EC0 00000000 */   nop
/* D6FC4 001D6EC4 5000BF7B */  lq         $31, 0x50($sp)
/* D6FC8 001D6EC8 4000B47B */  lq         $20, 0x40($sp)
/* D6FCC 001D6ECC 3000B37B */  lq         $19, 0x30($sp)
/* D6FD0 001D6ED0 2000B27B */  lq         $18, 0x20($sp)
/* D6FD4 001D6ED4 1000B17B */  lq         $17, 0x10($sp)
/* D6FD8 001D6ED8 0000B07B */  lq         $16, 0x0($sp)
/* D6FDC 001D6EDC 8000BD27 */  addiu      $sp, $sp, 0x80
/* D6FE0 001D6EE0 0800E003 */  jr         $31
/* D6FE4 001D6EE4 00000000 */   nop
/* D6FE8 001D6EE8 00000000 */  nop
/* D6FEC 001D6EEC 00000000 */  nop
