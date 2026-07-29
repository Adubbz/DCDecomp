.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_MOTION_OBJHDL__FP12RS_STACKDATAi
/* 0BCD00 001BCC00 90FFBD27 */  addiu       $29, $29, -0x70
/* 0BCD04 001BCC04 6000BF7F */  sq          $31, 0x60($29)
/* 0BCD08 001BCC08 5000B57F */  sq          $21, 0x50($29)
/* 0BCD0C 001BCC0C 4000B47F */  sq          $20, 0x40($29)
/* 0BCD10 001BCC10 3000B37F */  sq          $19, 0x30($29)
/* 0BCD14 001BCC14 2000B27F */  sq          $18, 0x20($29)
/* 0BCD18 001BCC18 1000B17F */  sq          $17, 0x10($29)
/* 0BCD1C 001BCC1C 0000B07F */  sq          $16, 0x0($29)
/* 0BCD20 001BCC20 28A6A070 */  paddub      $20, $5, $0
/* 0BCD24 001BCC24 08009524 */  addiu       $21, $4, 0x8
/* 0BCD28 001BCC28 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BCD2C 001BCC2C 00000000 */   nop
/* 0BCD30 001BCC30 28864070 */  paddub      $16, $2, $0
/* 0BCD34 001BCC34 2826A072 */  paddub      $4, $21, $0
/* 0BCD38 001BCC38 08009524 */  addiu       $21, $4, 0x8
/* 0BCD3C 001BCC3C 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BCD40 001BCC40 00000000 */   nop
/* 0BCD44 001BCC44 288E4070 */  paddub      $17, $2, $0
/* 0BCD48 001BCC48 FFFF1224 */  addiu       $18, $0, -0x1
/* 0BCD4C 001BCC4C 289E0070 */  paddub      $19, $0, $0
/* 0BCD50 001BCC50 0300812A */  slti        $1, $20, 0x3
/* 0BCD54 001BCC54 09002014 */  bnez        $1, .L001BCC7C
/* 0BCD58 001BCC58 00000000 */   nop
/* 0BCD5C 001BCC5C 2826A072 */  paddub      $4, $21, $0
/* 0BCD60 001BCC60 08009524 */  addiu       $21, $4, 0x8
/* 0BCD64 001BCC64 60EE060C */  jal         GetStackFloat__FP12RS_STACKDATA__2
/* 0BCD68 001BCC68 00000000 */   nop
/* 0BCD6C 001BCC6C 06030046 */  mov.s       $f12, $f0
/* 0BCD70 001BCC70 2C44040C */  jal         fptosi
/* 0BCD74 001BCC74 00000000 */   nop
/* 0BCD78 001BCC78 28964070 */  paddub      $18, $2, $0
.L001BCC7C:
/* 0BCD7C 001BCC7C 0400812A */  slti        $1, $20, 0x4
/* 0BCD80 001BCC80 05002014 */  bnez        $1, .L001BCC98
/* 0BCD84 001BCC84 00000000 */   nop
/* 0BCD88 001BCC88 2826A072 */  paddub      $4, $21, $0
/* 0BCD8C 001BCC8C 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BCD90 001BCC90 00000000 */   nop
/* 0BCD94 001BCC94 289E4070 */  paddub      $19, $2, $0
.L001BCC98:
/* 0BCD98 001BCC98 C89C848F */  lw          $4, -0x6338($28)
/* 0BCD9C 001BCC9C 30130224 */  addiu       $2, $0, 0x1330
/* 0BCDA0 001BCCA0 18100202 */  mult        $2, $16, $2
/* 0BCDA4 001BCCA4 21104400 */  addu        $2, $2, $4
/* 0BCDA8 001BCCA8 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BCDAC 001BCCAC 21084100 */  addu        $1, $2, $1
/* 0BCDB0 001BCCB0 ACBE228C */  lw          $2, -0x4154($1)
/* 0BCDB4 001BCCB4 04004014 */  bnez        $2, .L001BCCC8
/* 0BCDB8 001BCCB8 00000000 */   nop
/* 0BCDBC 001BCCBC 01000224 */  addiu       $2, $0, 0x1
/* 0BCDC0 001BCCC0 13000010 */  b           .L001BCD10
/* 0BCDC4 001BCCC4 00000000 */   nop
.L001BCCC8:
/* 0BCDC8 001BCCC8 0300812A */  slti        $1, $20, 0x3
/* 0BCDCC 001BCCCC 07002010 */  beqz        $1, .L001BCCEC
/* 0BCDD0 001BCCD0 00000000 */   nop
/* 0BCDD4 001BCCD4 282E0072 */  paddub      $5, $16, $0
/* 0BCDD8 001BCCD8 28362072 */  paddub      $6, $17, $0
/* 0BCDDC 001BCCDC AC08070C */  jal         NPCSetMotion__11CDungeonMapFii
/* 0BCDE0 001BCCE0 00000000 */   nop
/* 0BCDE4 001BCCE4 09000010 */  b           .L001BCD0C
/* 0BCDE8 001BCCE8 00000000 */   nop
.L001BCCEC:
/* 0BCDEC 001BCCEC 00009244 */  mtc1        $18, $f0
/* 0BCDF0 001BCCF0 00000000 */  nop
/* 0BCDF4 001BCCF4 20038046 */  cvt.s.w     $f12, $f0
/* 0BCDF8 001BCCF8 282E0072 */  paddub      $5, $16, $0
/* 0BCDFC 001BCCFC 28362072 */  paddub      $6, $17, $0
/* 0BCE00 001BCD00 283E6072 */  paddub      $7, $19, $0
/* 0BCE04 001BCD04 BC08070C */  jal         NPCSetMotion__11CDungeonMapFiifi
/* 0BCE08 001BCD08 00000000 */   nop
.L001BCD0C:
/* 0BCE0C 001BCD0C 01000224 */  addiu       $2, $0, 0x1
.L001BCD10:
/* 0BCE10 001BCD10 6000BF7B */  lq          $31, 0x60($29)
/* 0BCE14 001BCD14 5000B57B */  lq          $21, 0x50($29)
/* 0BCE18 001BCD18 4000B47B */  lq          $20, 0x40($29)
/* 0BCE1C 001BCD1C 3000B37B */  lq          $19, 0x30($29)
/* 0BCE20 001BCD20 2000B27B */  lq          $18, 0x20($29)
/* 0BCE24 001BCD24 1000B17B */  lq          $17, 0x10($29)
/* 0BCE28 001BCD28 0000B07B */  lq          $16, 0x0($29)
/* 0BCE2C 001BCD2C 7000BD27 */  addiu       $29, $29, 0x70
/* 0BCE30 001BCD30 0800E003 */  jr          $31
/* 0BCE34 001BCD34 00000000 */   nop
/* 0BCE38 001BCD38 00000000 */  nop
/* 0BCE3C 001BCD3C 00000000 */  nop
