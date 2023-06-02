.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishingExchangeDraw__Fv
/* F2D10 001F2C10 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* F2D14 001F2C14 1000BF7F */  sq         $31, 0x10($sp)
/* F2D18 001F2C18 0000B07F */  sq         $16, 0x0($sp)
/* F2D1C 001F2C1C 28260070 */  paddub     $4, $0, $0
/* F2D20 001F2C20 046F050C */  jal        setbilinear__Fi
/* F2D24 001F2C24 00000000 */   nop
/* F2D28 001F2C28 40000424 */  addiu      $4, $0, 0x40
/* F2D2C 001F2C2C 80001024 */  addiu      $16, $0, 0x80
/* F2D30 001F2C30 D901013C */  lui        $at, (0x1D903A6 >> 16)
/* F2D34 001F2C34 A6032384 */  lh         $3, (0x1D903A6 & 0xFFFF)($at)
/* F2D38 001F2C38 01000224 */  addiu      $2, $0, 0x1
/* F2D3C 001F2C3C 0C006210 */  beq        $3, $2, .L001F2C70
/* F2D40 001F2C40 00000000 */   nop
/* F2D44 001F2C44 03006010 */  beqz       $3, .L001F2C54
/* F2D48 001F2C48 00000000 */   nop
/* F2D4C 001F2C4C 0E000010 */  b          .L001F2C88
/* F2D50 001F2C50 00000000 */   nop
.L001F2C54:
/* F2D54 001F2C54 D901013C */  lui        $at, (0x1D903B0 >> 16)
/* F2D58 001F2C58 B003238C */  lw         $3, (0x1D903B0 & 0xFFFF)($at)
/* F2D5C 001F2C5C 40100300 */  sll        $2, $3, 1
/* F2D60 001F2C60 23200202 */  subu       $4, $16, $2
/* F2D64 001F2C64 80800300 */  sll        $16, $3, 2
/* F2D68 001F2C68 07000010 */  b          .L001F2C88
/* F2D6C 001F2C6C 00000000 */   nop
.L001F2C70:
/* F2D70 001F2C70 D901013C */  lui        $at, (0x1D903B0 >> 16)
/* F2D74 001F2C74 B003238C */  lw         $3, (0x1D903B0 & 0xFFFF)($at)
/* F2D78 001F2C78 40100300 */  sll        $2, $3, 1
/* F2D7C 001F2C7C 40004424 */  addiu      $4, $2, 0x40
/* F2D80 001F2C80 80100300 */  sll        $2, $3, 2
/* F2D84 001F2C84 23800202 */  subu       $16, $16, $2
.L001F2C88:
/* F2D88 001F2C88 81008128 */  slti       $at, $4, 0x81
/* F2D8C 001F2C8C 02002014 */  bnez       $at, .L001F2C98
/* F2D90 001F2C90 00000000 */   nop
/* F2D94 001F2C94 80000424 */  addiu      $4, $0, 0x80
.L001F2C98:
/* F2D98 001F2C98 40008128 */  slti       $at, $4, 0x40
/* F2D9C 001F2C9C 02002010 */  beqz       $at, .L001F2CA8
/* F2DA0 001F2CA0 00000000 */   nop
/* F2DA4 001F2CA4 40000424 */  addiu      $4, $0, 0x40
.L001F2CA8:
/* F2DA8 001F2CA8 8100012A */  slti       $at, $16, 0x81
/* F2DAC 001F2CAC 02002014 */  bnez       $at, .L001F2CB8
/* F2DB0 001F2CB0 00000000 */   nop
/* F2DB4 001F2CB4 80001024 */  addiu      $16, $0, 0x80
.L001F2CB8:
/* F2DB8 001F2CB8 02000106 */  bgez       $16, .L001F2CC4
/* F2DBC 001F2CBC 00000000 */   nop
/* F2DC0 001F2CC0 28860070 */  paddub     $16, $0, $0
.L001F2CC4:
/* F2DC4 001F2CC4 80000524 */  addiu      $5, $0, 0x80
/* F2DC8 001F2CC8 ACB4080C */  jal        FrameImageDraw__Fii
/* F2DCC 001F2CCC 00000000 */   nop
/* F2DD0 001F2CD0 D901013C */  lui        $at, (0x1D90394 >> 16)
/* F2DD4 001F2CD4 94032384 */  lh         $3, (0x1D90394 & 0xFFFF)($at)
/* F2DD8 001F2CD8 0F006010 */  beqz       $3, .L001F2D18
/* F2DDC 001F2CDC 00000000 */   nop
/* F2DE0 001F2CE0 50000424 */  addiu      $4, $0, 0x50
/* F2DE4 001F2CE4 32000524 */  addiu      $5, $0, 0x32
/* F2DE8 001F2CE8 F0000624 */  addiu      $6, $0, 0xF0
/* F2DEC 001F2CEC 283E0072 */  paddub     $7, $16, $0
/* F2DF0 001F2CF0 08C9070C */  jal        FishImageIconDraw__Fiiii
/* F2DF4 001F2CF4 00000000 */   nop
/* F2DF8 001F2CF8 9C000424 */  addiu      $4, $0, 0x9C
/* F2DFC 001F2CFC 6A000524 */  addiu      $5, $0, 0x6A
/* F2E00 001F2D00 28360072 */  paddub     $6, $16, $0
/* F2E04 001F2D04 20C9070C */  jal        FishExchangeItemDraw__Fiii
/* F2E08 001F2D08 00000000 */   nop
/* F2E0C 001F2D0C 01000424 */  addiu      $4, $0, 0x1
/* F2E10 001F2D10 046F050C */  jal        setbilinear__Fi
/* F2E14 001F2D14 00000000 */   nop
.L001F2D18:
/* F2E18 001F2D18 1000BF7B */  lq         $31, 0x10($sp)
/* F2E1C 001F2D1C 0000B07B */  lq         $16, 0x0($sp)
/* F2E20 001F2D20 2000BD27 */  addiu      $sp, $sp, 0x20
/* F2E24 001F2D24 0800E003 */  jr         $31
/* F2E28 001F2D28 00000000 */   nop
/* F2E2C 001F2D2C 00000000 */  nop
