.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _ACTIVE_FILE_BUFFER__FP12RS_STACKDATAi
/* 08C3F0 0018C2F0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 08C3F4 0018C2F4 1000BF7F */  sq          $31, 0x10($29)
/* 08C3F8 0018C2F8 0000B07F */  sq          $16, 0x0($29)
/* 08C3FC 0018C2FC 08009024 */  addiu       $16, $4, 0x8
/* 08C400 0018C300 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08C404 0018C304 00000000 */   nop
/* 08C408 0018C308 5C9282AF */  sw          $2, -0x6DA4($28)
/* 08C40C 0018C30C 28260072 */  paddub      $4, $16, $0
/* 08C410 0018C310 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08C414 0018C314 00000000 */   nop
/* 08C418 0018C318 609282AF */  sw          $2, -0x6DA0($28)
/* 08C41C 0018C31C 5C92828F */  lw          $2, -0x6DA4($28)
/* 08C420 0018C320 04004004 */  bltz        $2, .L0018C334
/* 08C424 0018C324 00000000 */   nop
/* 08C428 0018C328 10004228 */  slti        $2, $2, 0x10
/* 08C42C 0018C32C 02004014 */  bnez        $2, .L0018C338
/* 08C430 0018C330 00000000 */   nop
.L0018C334:
/* 08C434 0018C334 5C9280AF */  sw          $0, -0x6DA4($28)
.L0018C338:
/* 08C438 0018C338 01000224 */  addiu       $2, $0, 0x1
/* 08C43C 0018C33C 1000BF7B */  lq          $31, 0x10($29)
/* 08C440 0018C340 0000B07B */  lq          $16, 0x0($29)
/* 08C444 0018C344 2000BD27 */  addiu       $29, $29, 0x20
/* 08C448 0018C348 0800E003 */  jr          $31
/* 08C44C 0018C34C 00000000 */   nop
