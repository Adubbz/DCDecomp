.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_NPC_OBJHDL__FP12RS_STACKDATAi
/* 0BCC30 001BCB30 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0BCC34 001BCB34 2000BF7F */  sq          $31, 0x20($29)
/* 0BCC38 001BCB38 1000B17F */  sq          $17, 0x10($29)
/* 0BCC3C 001BCB3C 0000B07F */  sq          $16, 0x0($29)
/* 0BCC40 001BCB40 08009124 */  addiu       $17, $4, 0x8
/* 0BCC44 001BCB44 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BCC48 001BCB48 00000000 */   nop
/* 0BCC4C 001BCB4C 28864070 */  paddub      $16, $2, $0
/* 0BCC50 001BCB50 28262072 */  paddub      $4, $17, $0
/* 0BCC54 001BCB54 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BCC58 001BCB58 00000000 */   nop
/* 0BCC5C 001BCB5C 288E4070 */  paddub      $17, $2, $0
/* 0BCC60 001BCB60 28260072 */  paddub      $4, $16, $0
/* 0BCC64 001BCB64 80EC060C */  jal         GetObjHDL__Fi
/* 0BCC68 001BCB68 00000000 */   nop
/* 0BCC6C 001BCB6C 04002006 */  bltz        $17, .L001BCB80
/* 0BCC70 001BCB70 00000000 */   nop
/* 0BCC74 001BCB74 0400212A */  slti        $1, $17, 0x4
/* 0BCC78 001BCB78 08002014 */  bnez        $1, .L001BCB9C
/* 0BCC7C 001BCB7C 00000000 */   nop
.L001BCB80:
/* 0BCC80 001BCB80 2A00023C */  lui         $2, %hi(LIT_833)
/* 0BCC84 001BCB84 48BD4424 */  addiu       $4, $2, %lo(LIT_833)
/* 0BCC88 001BCB88 A611040C */  jal         printf
/* 0BCC8C 001BCB8C 00000000 */   nop
/* 0BCC90 001BCB90 01000224 */  addiu       $2, $0, 0x1
/* 0BCC94 001BCB94 13000010 */  b           .L001BCBE4
/* 0BCC98 001BCB98 00000000 */   nop
.L001BCB9C:
/* 0BCC9C 001BCB9C 30130324 */  addiu       $3, $0, 0x1330
/* 0BCCA0 001BCBA0 18202302 */  mult        $4, $17, $3
/* 0BCCA4 001BCBA4 C89C838F */  lw          $3, -0x6338($28)
/* 0BCCA8 001BCBA8 21186400 */  addu        $3, $3, $4
/* 0BCCAC 001BCBAC F83D6424 */  addiu       $4, $3, 0x3DF8
/* 0BCCB0 001BCBB0 F87F8424 */  addiu       $4, $4, 0x7FF8
/* 0BCCB4 001BCBB4 BC00838C */  lw          $3, 0xBC($4)
/* 0BCCB8 001BCBB8 06006010 */  beqz        $3, .L001BCBD4
/* 0BCCBC 001BCBBC 00000000 */   nop
/* 0BCCC0 001BCBC0 040044AC */  sw          $4, 0x4($2)
/* 0BCCC4 001BCBC4 01000324 */  addiu       $3, $0, 0x1
/* 0BCCC8 001BCBC8 080043AC */  sw          $3, 0x8($2)
/* 0BCCCC 001BCBCC 04000010 */  b           .L001BCBE0
/* 0BCCD0 001BCBD0 00000000 */   nop
.L001BCBD4:
/* 0BCCD4 001BCBD4 040040AC */  sw          $0, 0x4($2)
/* 0BCCD8 001BCBD8 01000324 */  addiu       $3, $0, 0x1
/* 0BCCDC 001BCBDC 080043AC */  sw          $3, 0x8($2)
.L001BCBE0:
/* 0BCCE0 001BCBE0 01000224 */  addiu       $2, $0, 0x1
.L001BCBE4:
/* 0BCCE4 001BCBE4 2000BF7B */  lq          $31, 0x20($29)
/* 0BCCE8 001BCBE8 1000B17B */  lq          $17, 0x10($29)
/* 0BCCEC 001BCBEC 0000B07B */  lq          $16, 0x0($29)
/* 0BCCF0 001BCBF0 3000BD27 */  addiu       $29, $29, 0x30
/* 0BCCF4 001BCBF4 0800E003 */  jr          $31
/* 0BCCF8 001BCBF8 00000000 */   nop
/* 0BCCFC 001BCBFC 00000000 */  nop
