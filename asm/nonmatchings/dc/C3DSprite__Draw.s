.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw__9C3DSpriteFv
/* 63E20 00163D20 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 63E24 00163D24 1000BF7F */  sq         $31, 0x10($sp)
/* 63E28 00163D28 0000B07F */  sq         $16, 0x0($sp)
/* 63E2C 00163D2C 28868070 */  paddub     $16, $4, $0
/* 63E30 00163D30 1800838C */  lw         $3, 0x18($4)
/* 63E34 00163D34 51006010 */  beqz       $3, .L00163E7C
/* 63E38 00163D38 00000000 */   nop
/* 63E3C 00163D3C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 63E40 00163D40 0C0002AE */  sw         $2, 0xC($16)
/* 63E44 00163D44 2000A427 */  addiu      $4, $sp, 0x20
/* 63E48 00163D48 3000A527 */  addiu      $5, $sp, 0x30
/* 63E4C 00163D4C 28360072 */  paddub     $6, $16, $0
/* 63E50 00163D50 10000CC6 */  lwc1       $f12, 0x10($16)
/* 63E54 00163D54 14000DC6 */  lwc1       $f13, 0x14($16)
/* 63E58 00163D58 283E0070 */  paddub     $7, $0, $0
/* 63E5C 00163D5C D0B9040C */  jal        MGRotTransPers3DSprite__FPiPiPfffi
/* 63E60 00163D60 00000000 */   nop
/* 63E64 00163D64 45004010 */  beqz       $2, .L00163E7C
/* 63E68 00163D68 00000000 */   nop
/* 63E6C 00163D6C 4000A427 */  addiu      $4, $sp, 0x40
/* 63E70 00163D70 F88B82DF */  ld         $2, -0x7408($gp)
/* 63E74 00163D74 000082FC */  sd         $2, 0x0($4)
/* 63E78 00163D78 3400028E */  lw         $2, 0x34($16)
/* 63E7C 00163D7C 1B004018 */  blez       $2, .L00163DEC
/* 63E80 00163D80 00000000 */   nop
/* 63E84 00163D84 4000A393 */  lbu        $3, 0x40($sp)
/* 63E88 00163D88 03000630 */  andi       $6, $0, 0x3
/* 63E8C 00163D8C FCFF0224 */  addiu      $2, $0, -0x4
/* 63E90 00163D90 24106200 */  and        $2, $3, $2
/* 63E94 00163D94 25104600 */  or         $2, $2, $6
/* 63E98 00163D98 4000A2A3 */  sb         $2, 0x40($sp)
/* 63E9C 00163D9C 4000A593 */  lbu        $5, 0x40($sp)
/* 63EA0 00163DA0 08000364 */  daddiu     $3, $0, 0x8
/* 63EA4 00163DA4 F3FF0224 */  addiu      $2, $0, -0xD
/* 63EA8 00163DA8 2410A200 */  and        $2, $5, $2
/* 63EAC 00163DAC 25104300 */  or         $2, $2, $3
/* 63EB0 00163DB0 4000A2A3 */  sb         $2, 0x40($sp)
/* 63EB4 00163DB4 4000A593 */  lbu        $5, 0x40($sp)
/* 63EB8 00163DB8 00190600 */  sll        $3, $6, 4
/* 63EBC 00163DBC CFFF0224 */  addiu      $2, $0, -0x31
/* 63EC0 00163DC0 2410A200 */  and        $2, $5, $2
/* 63EC4 00163DC4 25104300 */  or         $2, $2, $3
/* 63EC8 00163DC8 4000A2A3 */  sb         $2, 0x40($sp)
/* 63ECC 00163DCC 4000A593 */  lbu        $5, 0x40($sp)
/* 63ED0 00163DD0 40000364 */  daddiu     $3, $0, 0x40
/* 63ED4 00163DD4 3FFF0224 */  addiu      $2, $0, -0xC1
/* 63ED8 00163DD8 2410A200 */  and        $2, $5, $2
/* 63EDC 00163DDC 25104300 */  or         $2, $2, $3
/* 63EE0 00163DE0 4000A2A3 */  sb         $2, 0x40($sp)
/* 63EE4 00163DE4 E4BB040C */  jal        MGSetGsALPHA__FP10sceGsAlpha
/* 63EE8 00163DE8 00000000 */   nop
.L00163DEC:
/* 63EEC 00163DEC 3800028E */  lw         $2, 0x38($16)
/* 63EF0 00163DF0 0C004010 */  beqz       $2, .L00163E24
/* 63EF4 00163DF4 00000000 */   nop
/* 63EF8 00163DF8 4800A427 */  addiu      $4, $sp, 0x48
/* 63EFC 00163DFC F08B82DF */  ld         $2, -0x7410($gp)
/* 63F00 00163E00 000082FC */  sd         $2, 0x0($4)
/* 63F04 00163E04 4C00A593 */  lbu        $5, 0x4C($sp)
/* 63F08 00163E08 01000364 */  daddiu     $3, $0, 0x1
/* 63F0C 00163E0C FEFF0224 */  addiu      $2, $0, -0x2
/* 63F10 00163E10 2410A200 */  and        $2, $5, $2
/* 63F14 00163E14 25104300 */  or         $2, $2, $3
/* 63F18 00163E18 4C00A2A3 */  sb         $2, 0x4C($sp)
/* 63F1C 00163E1C B0BB040C */  jal        MGSetGsZBUF__FP9sceGsZbuf
/* 63F20 00163E20 00000000 */   nop
.L00163E24:
/* 63F24 00163E24 A0B8040C */  jal        GetVif1Packet__Fv
/* 63F28 00163E28 00000000 */   nop
/* 63F2C 00163E2C 28264070 */  paddub     $4, $2, $0
/* 63F30 00163E30 1800058E */  lw         $5, 0x18($16)
/* 63F34 00163E34 20000626 */  addiu      $6, $16, 0x20
/* 63F38 00163E38 2000A727 */  addiu      $7, $sp, 0x20
/* 63F3C 00163E3C 3000A827 */  addiu      $8, $sp, 0x30
/* 63F40 00163E40 30000926 */  addiu      $9, $16, 0x30
/* 63F44 00163E44 E475050C */  jal        set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiP6spRGBA
/* 63F48 00163E48 00000000 */   nop
/* 63F4C 00163E4C 3400038E */  lw         $3, 0x34($16)
/* 63F50 00163E50 04006010 */  beqz       $3, .L00163E64
/* 63F54 00163E54 00000000 */   nop
/* 63F58 00163E58 F88B8427 */  addiu      $4, $gp, -0x7408
/* 63F5C 00163E5C E4BB040C */  jal        MGSetGsALPHA__FP10sceGsAlpha
/* 63F60 00163E60 00000000 */   nop
.L00163E64:
/* 63F64 00163E64 3800038E */  lw         $3, 0x38($16)
/* 63F68 00163E68 04006010 */  beqz       $3, .L00163E7C
/* 63F6C 00163E6C 00000000 */   nop
/* 63F70 00163E70 F08B8427 */  addiu      $4, $gp, -0x7410
/* 63F74 00163E74 B0BB040C */  jal        MGSetGsZBUF__FP9sceGsZbuf
/* 63F78 00163E78 00000000 */   nop
.L00163E7C:
/* 63F7C 00163E7C 1000BF7B */  lq         $31, 0x10($sp)
/* 63F80 00163E80 0000B07B */  lq         $16, 0x0($sp)
/* 63F84 00163E84 5000BD27 */  addiu      $sp, $sp, 0x50
/* 63F88 00163E88 0800E003 */  jr         $31
/* 63F8C 00163E8C 00000000 */   nop
