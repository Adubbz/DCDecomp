.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _STATUS_SET_LIFE__FP12RS_STACKDATAi
/* 0E5B90 001E5A90 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0E5B94 001E5A94 2000BF7F */  sq          $31, 0x20($29)
/* 0E5B98 001E5A98 1000B17F */  sq          $17, 0x10($29)
/* 0E5B9C 001E5A9C 0000B07F */  sq          $16, 0x0($29)
/* 0E5BA0 001E5AA0 E09C828F */  lw          $2, -0x6320($28)
/* 0E5BA4 001E5AA4 9000438C */  lw          $3, 0x90($2)
/* 0E5BA8 001E5AA8 A485070C */  jal         GetStackFloat__FP12RS_STACKDATA__3
/* 0E5BAC 001E5AAC 00000000 */   nop
/* 0E5BB0 001E5AB0 80100300 */  sll         $2, $3, 2
/* 0E5BB4 001E5AB4 21184300 */  addu        $3, $2, $3
/* 0E5BB8 001E5AB8 80100300 */  sll         $2, $3, 2
/* 0E5BBC 001E5ABC 21106200 */  addu        $2, $3, $2
/* 0E5BC0 001E5AC0 00810200 */  sll         $16, $2, 4
/* 0E5BC4 001E5AC4 E09C918F */  lw          $17, -0x6320($28)
/* 0E5BC8 001E5AC8 21101102 */  addu        $2, $16, $17
/* 0E5BCC 001E5ACC 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E5BD0 001E5AD0 21084100 */  addu        $1, $2, $1
/* 0E5BD4 001E5AD4 F0E321C4 */  lwc1        $f1, -0x1C10($1)
/* 0E5BD8 001E5AD8 60088046 */  cvt.s.w     $f1, $f1
/* 0E5BDC 001E5ADC 020B0046 */  mul.s       $f12, $f1, $f0
/* 0E5BE0 001E5AE0 2C44040C */  jal         fptosi
/* 0E5BE4 001E5AE4 00000000 */   nop
/* 0E5BE8 001E5AE8 21181102 */  addu        $3, $16, $17
/* 0E5BEC 001E5AEC 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E5BF0 001E5AF0 21086100 */  addu        $1, $3, $1
/* 0E5BF4 001E5AF4 F4E322AC */  sw          $2, -0x1C0C($1)
/* 0E5BF8 001E5AF8 01000224 */  addiu       $2, $0, 0x1
/* 0E5BFC 001E5AFC 2000BF7B */  lq          $31, 0x20($29)
/* 0E5C00 001E5B00 1000B17B */  lq          $17, 0x10($29)
/* 0E5C04 001E5B04 0000B07B */  lq          $16, 0x0($29)
/* 0E5C08 001E5B08 3000BD27 */  addiu       $29, $29, 0x30
/* 0E5C0C 001E5B0C 0800E003 */  jr          $31
/* 0E5C10 001E5B10 00000000 */   nop
/* 0E5C14 001E5B14 00000000 */  nop
/* 0E5C18 001E5B18 00000000 */  nop
/* 0E5C1C 001E5B1C 00000000 */  nop
