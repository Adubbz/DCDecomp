.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishRecordViewDraw__Fv
/* F3D40 001F3C40 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* F3D44 001F3C44 1000BF7F */  sq         $31, 0x10($sp)
/* F3D48 001F3C48 0000B07F */  sq         $16, 0x0($sp)
/* F3D4C 001F3C4C 28260070 */  paddub     $4, $0, $0
/* F3D50 001F3C50 046F050C */  jal        setbilinear__Fi
/* F3D54 001F3C54 00000000 */   nop
/* F3D58 001F3C58 40000424 */  addiu      $4, $0, 0x40
/* F3D5C 001F3C5C 80001024 */  addiu      $16, $0, 0x80
/* F3D60 001F3C60 D901013C */  lui        $at, (0x1D903CC >> 16)
/* F3D64 001F3C64 CC03238C */  lw         $3, (0x1D903CC & 0xFFFF)($at)
/* F3D68 001F3C68 01000224 */  addiu      $2, $0, 0x1
/* F3D6C 001F3C6C 0C006210 */  beq        $3, $2, .L001F3CA0
/* F3D70 001F3C70 00000000 */   nop
/* F3D74 001F3C74 03006010 */  beqz       $3, .L001F3C84
/* F3D78 001F3C78 00000000 */   nop
/* F3D7C 001F3C7C 0E000010 */  b          .L001F3CB8
/* F3D80 001F3C80 00000000 */   nop
.L001F3C84:
/* F3D84 001F3C84 D901013C */  lui        $at, (0x1D903D0 >> 16)
/* F3D88 001F3C88 D003238C */  lw         $3, (0x1D903D0 & 0xFFFF)($at)
/* F3D8C 001F3C8C 40100300 */  sll        $2, $3, 1
/* F3D90 001F3C90 23200202 */  subu       $4, $16, $2
/* F3D94 001F3C94 80800300 */  sll        $16, $3, 2
/* F3D98 001F3C98 07000010 */  b          .L001F3CB8
/* F3D9C 001F3C9C 00000000 */   nop
.L001F3CA0:
/* F3DA0 001F3CA0 D901013C */  lui        $at, (0x1D903D0 >> 16)
/* F3DA4 001F3CA4 D003238C */  lw         $3, (0x1D903D0 & 0xFFFF)($at)
/* F3DA8 001F3CA8 40100300 */  sll        $2, $3, 1
/* F3DAC 001F3CAC 40004424 */  addiu      $4, $2, 0x40
/* F3DB0 001F3CB0 80100300 */  sll        $2, $3, 2
/* F3DB4 001F3CB4 23800202 */  subu       $16, $16, $2
.L001F3CB8:
/* F3DB8 001F3CB8 81008128 */  slti       $at, $4, 0x81
/* F3DBC 001F3CBC 02002014 */  bnez       $at, .L001F3CC8
/* F3DC0 001F3CC0 00000000 */   nop
/* F3DC4 001F3CC4 80000424 */  addiu      $4, $0, 0x80
.L001F3CC8:
/* F3DC8 001F3CC8 40008128 */  slti       $at, $4, 0x40
/* F3DCC 001F3CCC 02002010 */  beqz       $at, .L001F3CD8
/* F3DD0 001F3CD0 00000000 */   nop
/* F3DD4 001F3CD4 40000424 */  addiu      $4, $0, 0x40
.L001F3CD8:
/* F3DD8 001F3CD8 8100012A */  slti       $at, $16, 0x81
/* F3DDC 001F3CDC 02002014 */  bnez       $at, .L001F3CE8
/* F3DE0 001F3CE0 00000000 */   nop
/* F3DE4 001F3CE4 80001024 */  addiu      $16, $0, 0x80
.L001F3CE8:
/* F3DE8 001F3CE8 02000106 */  bgez       $16, .L001F3CF4
/* F3DEC 001F3CEC 00000000 */   nop
/* F3DF0 001F3CF0 28860070 */  paddub     $16, $0, $0
.L001F3CF4:
/* F3DF4 001F3CF4 80000524 */  addiu      $5, $0, 0x80
/* F3DF8 001F3CF8 ACB4080C */  jal        FrameImageDraw__Fii
/* F3DFC 001F3CFC 00000000 */   nop
/* F3E00 001F3D00 D901013C */  lui        $at, (0x1D903D8 >> 16)
/* F3E04 001F3D04 D803238C */  lw         $3, (0x1D903D8 & 0xFFFF)($at)
/* F3E08 001F3D08 0F006010 */  beqz       $3, .L001F3D48
/* F3E0C 001F3D0C 00000000 */   nop
/* F3E10 001F3D10 50000424 */  addiu      $4, $0, 0x50
/* F3E14 001F3D14 32000524 */  addiu      $5, $0, 0x32
/* F3E18 001F3D18 0C010624 */  addiu      $6, $0, 0x10C
/* F3E1C 001F3D1C 283E0072 */  paddub     $7, $16, $0
/* F3E20 001F3D20 08C9070C */  jal        FishImageIconDraw__Fiiii
/* F3E24 001F3D24 00000000 */   nop
/* F3E28 001F3D28 9C000424 */  addiu      $4, $0, 0x9C
/* F3E2C 001F3D2C 6A000524 */  addiu      $5, $0, 0x6A
/* F3E30 001F3D30 28360072 */  paddub     $6, $16, $0
/* F3E34 001F3D34 7CCD070C */  jal        FishRecordViewBoard__Fiii
/* F3E38 001F3D38 00000000 */   nop
/* F3E3C 001F3D3C 01000424 */  addiu      $4, $0, 0x1
/* F3E40 001F3D40 046F050C */  jal        setbilinear__Fi
/* F3E44 001F3D44 00000000 */   nop
.L001F3D48:
/* F3E48 001F3D48 1000BF7B */  lq         $31, 0x10($sp)
/* F3E4C 001F3D4C 0000B07B */  lq         $16, 0x0($sp)
/* F3E50 001F3D50 2000BD27 */  addiu      $sp, $sp, 0x20
/* F3E54 001F3D54 0800E003 */  jr         $31
/* F3E58 001F3D58 00000000 */   nop
/* F3E5C 001F3D5C 00000000 */  nop
