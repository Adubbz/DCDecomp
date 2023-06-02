.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetObjHandle__FiP6CFrame
/* 8A880 0018A780 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8A884 0018A784 2000BF7F */  sq         $31, 0x20($sp)
/* 8A888 0018A788 1000B17F */  sq         $17, 0x10($sp)
/* 8A88C 0018A78C 0000B07F */  sq         $16, 0x0($sp)
/* 8A890 0018A790 288EA070 */  paddub     $17, $5, $0
/* 8A894 0018A794 0C29060C */  jal        GetObjHandle__Fi
/* 8A898 0018A798 00000000 */   nop
/* 8A89C 0018A79C 28864070 */  paddub     $16, $2, $0
/* 8A8A0 0018A7A0 04002016 */  bnez       $17, .L0018A7B4
/* 8A8A4 0018A7A4 00000000 */   nop
/* 8A8A8 0018A7A8 28160070 */  paddub     $2, $0, $0
/* 8A8AC 0018A7AC 08000010 */  b          .L0018A7D0
/* 8A8B0 0018A7B0 00000000 */   nop
.L0018A7B4:
/* 8A8B4 0018A7B4 28260072 */  paddub     $4, $16, $0
/* 8A8B8 0018A7B8 282E0070 */  paddub     $5, $0, $0
/* 8A8BC 0018A7BC 38000624 */  addiu      $6, $0, 0x38
/* 8A8C0 0018A7C0 5A0D040C */  jal        memset
/* 8A8C4 0018A7C4 00000000 */   nop
/* 8A8C8 0018A7C8 080011AE */  sw         $17, 0x8($16)
/* 8A8CC 0018A7CC 01000224 */  addiu      $2, $0, 0x1
.L0018A7D0:
/* 8A8D0 0018A7D0 2000BF7B */  lq         $31, 0x20($sp)
/* 8A8D4 0018A7D4 1000B17B */  lq         $17, 0x10($sp)
/* 8A8D8 0018A7D8 0000B07B */  lq         $16, 0x0($sp)
/* 8A8DC 0018A7DC 3000BD27 */  addiu      $sp, $sp, 0x30
/* 8A8E0 0018A7E0 0800E003 */  jr         $31
/* 8A8E4 0018A7E4 00000000 */   nop
/* 8A8E8 0018A7E8 00000000 */  nop
/* 8A8EC 0018A7EC 00000000 */  nop
