.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndBgmFadeOutStop__Fv
/* 59D50 00159C50 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 59D54 00159C54 2000BF7F */  sq         $31, 0x20($sp)
/* 59D58 00159C58 1000B07F */  sq         $16, 0x10($sp)
/* 59D5C 00159C5C 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 59D60 00159C60 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 59D64 00159C64 7867050C */  jal        SndGetBgmVol__Fv
/* 59D68 00159C68 00000000 */   nop
/* 59D6C 00159C6C 00008244 */  mtc1       $2, $f0
/* 59D70 00159C70 00000000 */  nop
/* 59D74 00159C74 20058046 */  cvt.s.w    $f20, $f0
/* 59D78 00159C78 2041023C */  lui        $2, (0x41200000 >> 16)
/* 59D7C 00159C7C 00008244 */  mtc1       $2, $f0
/* 59D80 00159C80 00000000 */  nop
/* 59D84 00159C84 43A50046 */  div.s      $f21, $f20, $f0
/* 59D88 00159C88 28860070 */  paddub     $16, $0, $0
/* 59D8C 00159C8C 0E000010 */  b          .L00159CC8
/* 59D90 00159C90 00000000 */   nop
.L00159C94:
/* 59D94 00159C94 28260070 */  paddub     $4, $0, $0
/* 59D98 00159C98 C04B040C */  jal        sceGsSyncV
/* 59D9C 00159C9C 00000000 */   nop
/* 59DA0 00159CA0 01A51546 */  sub.s      $f20, $f20, $f21
/* 59DA4 00159CA4 06A30046 */  mov.s      $f12, $f20
/* 59DA8 00159CA8 2C44040C */  jal        fptosi
/* 59DAC 00159CAC 00000000 */   nop
/* 59DB0 00159CB0 28264070 */  paddub     $4, $2, $0
/* 59DB4 00159CB4 4867050C */  jal        SndSetBgmVol__Fi
/* 59DB8 00159CB8 00000000 */   nop
/* 59DBC 00159CBC D464050C */  jal        SndStep__Fv
/* 59DC0 00159CC0 00000000 */   nop
/* 59DC4 00159CC4 01001026 */  addiu      $16, $16, 0x1
.L00159CC8:
/* 59DC8 00159CC8 0A00022A */  slti       $2, $16, 0xA
/* 59DCC 00159CCC F1FF4014 */  bnez       $2, .L00159C94
/* 59DD0 00159CD0 00000000 */   nop
/* 59DD4 00159CD4 E866050C */  jal        SndBgmStop__Fv
/* 59DD8 00159CD8 00000000 */   nop
/* 59DDC 00159CDC 2000BF7B */  lq         $31, 0x20($sp)
/* 59DE0 00159CE0 1000B07B */  lq         $16, 0x10($sp)
/* 59DE4 00159CE4 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 59DE8 00159CE8 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 59DEC 00159CEC 3000BD27 */  addiu      $sp, $sp, 0x30
/* 59DF0 00159CF0 0800E003 */  jr         $31
/* 59DF4 00159CF4 00000000 */   nop
/* 59DF8 00159CF8 00000000 */  nop
/* 59DFC 00159CFC 00000000 */  nop
