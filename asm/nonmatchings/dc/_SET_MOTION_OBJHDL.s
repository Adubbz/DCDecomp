.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_MOTION_OBJHDL__FP12RS_STACKDATAi
/* BCD00 001BCC00 90FFBD27 */  addiu      $sp, $sp, -0x70
/* BCD04 001BCC04 6000BF7F */  sq         $31, 0x60($sp)
/* BCD08 001BCC08 5000B57F */  sq         $21, 0x50($sp)
/* BCD0C 001BCC0C 4000B47F */  sq         $20, 0x40($sp)
/* BCD10 001BCC10 3000B37F */  sq         $19, 0x30($sp)
/* BCD14 001BCC14 2000B27F */  sq         $18, 0x20($sp)
/* BCD18 001BCC18 1000B17F */  sq         $17, 0x10($sp)
/* BCD1C 001BCC1C 0000B07F */  sq         $16, 0x0($sp)
/* BCD20 001BCC20 28A6A070 */  paddub     $20, $5, $0
/* BCD24 001BCC24 08009524 */  addiu      $21, $4, 0x8
/* BCD28 001BCC28 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BCD2C 001BCC2C 00000000 */   nop
/* BCD30 001BCC30 28864070 */  paddub     $16, $2, $0
/* BCD34 001BCC34 2826A072 */  paddub     $4, $21, $0
/* BCD38 001BCC38 08009524 */  addiu      $21, $4, 0x8
/* BCD3C 001BCC3C 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BCD40 001BCC40 00000000 */   nop
/* BCD44 001BCC44 288E4070 */  paddub     $17, $2, $0
/* BCD48 001BCC48 FFFF1224 */  addiu      $18, $0, -0x1
/* BCD4C 001BCC4C 289E0070 */  paddub     $19, $0, $0
/* BCD50 001BCC50 0300812A */  slti       $at, $20, 0x3
/* BCD54 001BCC54 09002014 */  bnez       $at, .L001BCC7C
/* BCD58 001BCC58 00000000 */   nop
/* BCD5C 001BCC5C 2826A072 */  paddub     $4, $21, $0
/* BCD60 001BCC60 08009524 */  addiu      $21, $4, 0x8
/* BCD64 001BCC64 60EE060C */  jal        GetStackFloat__FP12RS_STACKDATA_2
/* BCD68 001BCC68 00000000 */   nop
/* BCD6C 001BCC6C 06030046 */  mov.s      $f12, $f0
/* BCD70 001BCC70 2C44040C */  jal        fptosi
/* BCD74 001BCC74 00000000 */   nop
/* BCD78 001BCC78 28964070 */  paddub     $18, $2, $0
.L001BCC7C:
/* BCD7C 001BCC7C 0400812A */  slti       $at, $20, 0x4
/* BCD80 001BCC80 05002014 */  bnez       $at, .L001BCC98
/* BCD84 001BCC84 00000000 */   nop
/* BCD88 001BCC88 2826A072 */  paddub     $4, $21, $0
/* BCD8C 001BCC8C 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BCD90 001BCC90 00000000 */   nop
/* BCD94 001BCC94 289E4070 */  paddub     $19, $2, $0
.L001BCC98:
/* BCD98 001BCC98 C89C848F */  lw         $4, -0x6338($gp)
/* BCD9C 001BCC9C 30130224 */  addiu      $2, $0, 0x1330
/* BCDA0 001BCCA0 18100202 */  mult       $2, $16, $2
/* BCDA4 001BCCA4 21104400 */  addu       $2, $2, $4
/* BCDA8 001BCCA8 0100013C */  lui        $at, (0x10000 >> 16)
/* BCDAC 001BCCAC 21084100 */  addu       $at, $2, $at
/* BCDB0 001BCCB0 ACBE228C */  lw         $2, -0x4154($at)
/* BCDB4 001BCCB4 04004014 */  bnez       $2, .L001BCCC8
/* BCDB8 001BCCB8 00000000 */   nop
/* BCDBC 001BCCBC 01000224 */  addiu      $2, $0, 0x1
/* BCDC0 001BCCC0 13000010 */  b          .L001BCD10
/* BCDC4 001BCCC4 00000000 */   nop
.L001BCCC8:
/* BCDC8 001BCCC8 0300812A */  slti       $at, $20, 0x3
/* BCDCC 001BCCCC 07002010 */  beqz       $at, .L001BCCEC
/* BCDD0 001BCCD0 00000000 */   nop
/* BCDD4 001BCCD4 282E0072 */  paddub     $5, $16, $0
/* BCDD8 001BCCD8 28362072 */  paddub     $6, $17, $0
/* BCDDC 001BCCDC AC08070C */  jal        NPCSetMotion__11CDungeonMapFii
/* BCDE0 001BCCE0 00000000 */   nop
/* BCDE4 001BCCE4 09000010 */  b          .L001BCD0C
/* BCDE8 001BCCE8 00000000 */   nop
.L001BCCEC:
/* BCDEC 001BCCEC 00009244 */  mtc1       $18, $f0
/* BCDF0 001BCCF0 00000000 */  nop
/* BCDF4 001BCCF4 20038046 */  cvt.s.w    $f12, $f0
/* BCDF8 001BCCF8 282E0072 */  paddub     $5, $16, $0
/* BCDFC 001BCCFC 28362072 */  paddub     $6, $17, $0
/* BCE00 001BCD00 283E6072 */  paddub     $7, $19, $0
/* BCE04 001BCD04 BC08070C */  jal        NPCSetMotion__11CDungeonMapFiifi
/* BCE08 001BCD08 00000000 */   nop
.L001BCD0C:
/* BCE0C 001BCD0C 01000224 */  addiu      $2, $0, 0x1
.L001BCD10:
/* BCE10 001BCD10 6000BF7B */  lq         $31, 0x60($sp)
/* BCE14 001BCD14 5000B57B */  lq         $21, 0x50($sp)
/* BCE18 001BCD18 4000B47B */  lq         $20, 0x40($sp)
/* BCE1C 001BCD1C 3000B37B */  lq         $19, 0x30($sp)
/* BCE20 001BCD20 2000B27B */  lq         $18, 0x20($sp)
/* BCE24 001BCD24 1000B17B */  lq         $17, 0x10($sp)
/* BCE28 001BCD28 0000B07B */  lq         $16, 0x0($sp)
/* BCE2C 001BCD2C 7000BD27 */  addiu      $sp, $sp, 0x70
/* BCE30 001BCD30 0800E003 */  jr         $31
/* BCE34 001BCD34 00000000 */   nop
/* BCE38 001BCD38 00000000 */  nop
/* BCE3C 001BCD3C 00000000 */  nop
