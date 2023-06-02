.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _ACTIVE_FILE_BUFFER__FP12RS_STACKDATAi
/* 8C3F0 0018C2F0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8C3F4 0018C2F4 1000BF7F */  sq         $31, 0x10($sp)
/* 8C3F8 0018C2F8 0000B07F */  sq         $16, 0x0($sp)
/* 8C3FC 0018C2FC 08009024 */  addiu      $16, $4, 0x8
/* 8C400 0018C300 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8C404 0018C304 00000000 */   nop
/* 8C408 0018C308 5C9282AF */  sw         $2, -0x6DA4($gp)
/* 8C40C 0018C30C 28260072 */  paddub     $4, $16, $0
/* 8C410 0018C310 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8C414 0018C314 00000000 */   nop
/* 8C418 0018C318 609282AF */  sw         $2, -0x6DA0($gp)
/* 8C41C 0018C31C 5C92828F */  lw         $2, -0x6DA4($gp)
/* 8C420 0018C320 04004004 */  bltz       $2, .L0018C334
/* 8C424 0018C324 00000000 */   nop
/* 8C428 0018C328 10004228 */  slti       $2, $2, 0x10
/* 8C42C 0018C32C 02004014 */  bnez       $2, .L0018C338
/* 8C430 0018C330 00000000 */   nop
.L0018C334:
/* 8C434 0018C334 5C9280AF */  sw         $0, -0x6DA4($gp)
.L0018C338:
/* 8C438 0018C338 01000224 */  addiu      $2, $0, 0x1
/* 8C43C 0018C33C 1000BF7B */  lq         $31, 0x10($sp)
/* 8C440 0018C340 0000B07B */  lq         $16, 0x0($sp)
/* 8C444 0018C344 2000BD27 */  addiu      $sp, $sp, 0x20
/* 8C448 0018C348 0800E003 */  jr         $31
/* 8C44C 0018C34C 00000000 */   nop
