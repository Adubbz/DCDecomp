.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel sbrk
/* 014A78 00114978 C0FFBD27 */  addiu       $29, $29, -0x40
/* 014A7C 0011497C 3000BFFF */  sd          $31, 0x30($29)
/* 014A80 00114980 2000B2FF */  sd          $18, 0x20($29)
/* 014A84 00114984 1000B1FF */  sd          $17, 0x10($29)
/* 014A88 00114988 0000B0FF */  sd          $16, 0x0($29)
/* 014A8C 0011498C 00601140 */  mfc0        $17, $12 /* handwritten instruction */
/* 014A90 00114990 0100023C */  lui         $2, (0x10000 >> 16)
/* 014A94 00114994 24882202 */  and         $17, $17, $2
/* 014A98 00114998 0A002012 */  beqz        $17, .L001149C4
/* 014A9C 0011499C 2500123C */   lui        $18, %hi(heap_ptr.30)
.L001149A0:
/* 014AA0 001149A0 39000042 */  di /* handwritten instruction */
/* 014AA4 001149A4 0F040000 */  sync.p
/* 014AA8 001149A8 00600240 */  mfc0        $2, $12 /* handwritten instruction */
/* 014AAC 001149AC 0100033C */  lui         $3, (0x10000 >> 16)
/* 014AB0 001149B0 24104300 */  and         $2, $2, $3
/* 014AB4 001149B4 FAFF4014 */  bnez        $2, .L001149A0
/* 014AB8 001149B8 00000000 */   nop
/* 014ABC 001149BC 02000010 */  b           .L001149C8
/* 014AC0 001149C0 E409428E */   lw         $2, %lo(heap_ptr.30)($18)
.L001149C4:
/* 014AC4 001149C4 E409428E */  lw          $2, %lo(heap_ptr.30)($18)
.L001149C8:
/* 014AC8 001149C8 C050040C */  jal         EndOfHeap
/* 014ACC 001149CC 21804400 */   addu       $16, $2, $4
/* 014AD0 001149D0 2B105000 */  sltu        $2, $2, $16
/* 014AD4 001149D4 09004050 */  beql        $2, $0, .L001149FC
/* 014AD8 001149D8 E409428E */   lw         $2, %lo(heap_ptr.30)($18)
/* 014ADC 001149DC D805040C */  jal         __errno
/* 014AE0 001149E0 00000000 */   nop
/* 014AE4 001149E4 0C000324 */  addiu       $3, $0, 0xC
/* 014AE8 001149E8 000043AC */  sw          $3, 0x0($2)
/* 014AEC 001149EC 38000042 */  ei /* handwritten instruction */
/* 014AF0 001149F0 FFFF023C */  lui         $2, (0xFFFFFFFF >> 16)
/* 014AF4 001149F4 04000010 */  b           .L00114A08
/* 014AF8 001149F8 FFFF4234 */   ori        $2, $2, (0xFFFFFFFF & 0xFFFF)
.L001149FC:
/* 014AFC 001149FC 02002012 */  beqz        $17, .L00114A08
/* 014B00 00114A00 E40950AE */   sw         $16, %lo(heap_ptr.30)($18)
/* 014B04 00114A04 38000042 */  ei /* handwritten instruction */
.L00114A08:
/* 014B08 00114A08 3000BFDF */  ld          $31, 0x30($29)
/* 014B0C 00114A0C 2000B2DF */  ld          $18, 0x20($29)
/* 014B10 00114A10 1000B1DF */  ld          $17, 0x10($29)
/* 014B14 00114A14 0000B0DF */  ld          $16, 0x0($29)
/* 014B18 00114A18 0800E003 */  jr          $31
/* 014B1C 00114A1C 4000BD27 */   addiu      $29, $29, 0x40
