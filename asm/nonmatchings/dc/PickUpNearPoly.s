.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PickUpNearPoly__FP6CCPoly7CBoxVu0P6CCPolyi
/* 49D30 00149C30 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* 49D34 00149C34 5000BF7F */  sq         $31, 0x50($sp)
/* 49D38 00149C38 4000B47F */  sq         $20, 0x40($sp)
/* 49D3C 00149C3C 3000B37F */  sq         $19, 0x30($sp)
/* 49D40 00149C40 2000B27F */  sq         $18, 0x20($sp)
/* 49D44 00149C44 1000B17F */  sq         $17, 0x10($sp)
/* 49D48 00149C48 0000B07F */  sq         $16, 0x0($sp)
/* 49D4C 00149C4C 2886E070 */  paddub     $16, $7, $0
/* 49D50 00149C50 6000A727 */  addiu      $7, $sp, 0x60
/* 49D54 00149C54 0000A378 */  lq         $3, 0x0($5)
/* 49D58 00149C58 1000A278 */  lq         $2, 0x10($5)
/* 49D5C 00149C5C 0000E37C */  sq         $3, 0x0($7)
/* 49D60 00149C60 1000E27C */  sq         $2, 0x10($7)
/* 49D64 00149C64 288E0070 */  paddub     $17, $0, $0
/* 49D68 00149C68 7000A227 */  addiu      $2, $sp, 0x70
/* 49D6C 00149C6C 0000EAD8 */  lqc2       $vf10, 0x0($7)
/* 49D70 00149C70 00004BD8 */  lqc2       $vf11, 0x0($2)
/* 49D74 00149C74 289EC070 */  paddub     $19, $6, $0
/* 49D78 00149C78 28A68070 */  paddub     $20, $4, $0
/* 49D7C 00149C7C 28960070 */  paddub     $18, $0, $0
/* 49D80 00149C80 24000010 */  b          .L00149D14
/* 49D84 00149C84 00000000 */   nop
.L00149C88:
/* 49D88 00149C88 8000A427 */  addiu      $4, $sp, 0x80
/* 49D8C 00149C8C 9000A527 */  addiu      $5, $sp, 0x90
/* 49D90 00149C90 28366072 */  paddub     $6, $19, $0
/* 49D94 00149C94 10006726 */  addiu      $7, $19, 0x10
/* 49D98 00149C98 20006826 */  addiu      $8, $19, 0x20
/* 49D9C 00149C9C 248C040C */  jal        VectorMaxMin__FPfPfPfPfPf
/* 49DA0 00149CA0 00000000 */   nop
/* 49DA4 00149CA4 8000A327 */  addiu      $3, $sp, 0x80
/* 49DA8 00149CA8 9000A227 */  addiu      $2, $sp, 0x90
/* 49DAC 00149CAC 00006CD8 */  lqc2       $vf12, 0x0($3)
/* 49DB0 00149CB0 00004DD8 */  lqc2       $vf13, 0x0($2)
/* 49DB4 00149CB4 FF02004A */  vnop
/* 49DB8 00149CB8 FF02004A */  vnop
/* 49DBC 00149CBC FF02004A */  vnop
/* 49DC0 00149CC0 0080C048 */  ctc2       $0, $vi16
/* 49DC4 00149CC4 6C56CD4B */  vsub.xyz   $vf25, $vf10, $vf13
/* 49DC8 00149CC8 6C66CB4B */  vsub.xyz   $vf25, $vf12, $vf11
/* 49DCC 00149CCC FF02004A */  vnop
/* 49DD0 00149CD0 FF02004A */  vnop
/* 49DD4 00149CD4 FF02004A */  vnop
/* 49DD8 00149CD8 FF02004A */  vnop
/* 49DDC 00149CDC FF02004A */  vnop
/* 49DE0 00149CE0 00804248 */  cfc2       $2, $vi16
/* 49DE4 00149CE4 C0004230 */  andi       $2, $2, 0xC0
/* 49DE8 00149CE8 08004014 */  bnez       $2, .L00149D0C
/* 49DEC 00149CEC 00000000 */   nop
/* 49DF0 00149CF0 28268072 */  paddub     $4, $20, $0
/* 49DF4 00149CF4 282E6072 */  paddub     $5, $19, $0
/* 49DF8 00149CF8 50000624 */  addiu      $6, $0, 0x50
/* 49DFC 00149CFC EC0C040C */  jal        memcpy
/* 49E00 00149D00 00000000 */   nop
/* 49E04 00149D04 50009426 */  addiu      $20, $20, 0x50
/* 49E08 00149D08 01003126 */  addiu      $17, $17, 0x1
.L00149D0C:
/* 49E0C 00149D0C 01005226 */  addiu      $18, $18, 0x1
/* 49E10 00149D10 50007326 */  addiu      $19, $19, 0x50
.L00149D14:
/* 49E14 00149D14 2A105002 */  slt        $2, $18, $16
/* 49E18 00149D18 DBFF4014 */  bnez       $2, .L00149C88
/* 49E1C 00149D1C 00000000 */   nop
/* 49E20 00149D20 28162072 */  paddub     $2, $17, $0
/* 49E24 00149D24 5000BF7B */  lq         $31, 0x50($sp)
/* 49E28 00149D28 4000B47B */  lq         $20, 0x40($sp)
/* 49E2C 00149D2C 3000B37B */  lq         $19, 0x30($sp)
/* 49E30 00149D30 2000B27B */  lq         $18, 0x20($sp)
/* 49E34 00149D34 1000B17B */  lq         $17, 0x10($sp)
/* 49E38 00149D38 0000B07B */  lq         $16, 0x0($sp)
/* 49E3C 00149D3C A000BD27 */  addiu      $sp, $sp, 0xA0
/* 49E40 00149D40 0800E003 */  jr         $31
/* 49E44 00149D44 00000000 */   nop
/* 49E48 00149D48 00000000 */  nop
/* 49E4C 00149D4C 00000000 */  nop
