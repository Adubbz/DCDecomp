.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LookAt__FP9CFrameVu1P9CFrameVu116_FRAMECONSTRAINT
/* 49CD0 00149BD0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 49CD4 00149BD4 2000BF7F */  sq         $31, 0x20($sp)
/* 49CD8 00149BD8 1000B17F */  sq         $17, 0x10($sp)
/* 49CDC 00149BDC 0000B07F */  sq         $16, 0x0($sp)
/* 49CE0 00149BE0 288E8070 */  paddub     $17, $4, $0
/* 49CE4 00149BE4 2886C070 */  paddub     $16, $6, $0
/* 49CE8 00149BE8 2826A070 */  paddub     $4, $5, $0
/* 49CEC 00149BEC 3000A527 */  addiu      $5, $sp, 0x30
/* 49CF0 00149BF0 6CA0040C */  jal        GetLWMatrix__6CFrameFPA4_f
/* 49CF4 00149BF4 00000000 */   nop
/* 49CF8 00149BF8 28262072 */  paddub     $4, $17, $0
/* 49CFC 00149BFC 6000A527 */  addiu      $5, $sp, 0x60
/* 49D00 00149C00 28360072 */  paddub     $6, $16, $0
/* 49D04 00149C04 4426050C */  jal        LookAt__FP9CFrameVu1Pf16_FRAMECONSTRAINT
/* 49D08 00149C08 00000000 */   nop
/* 49D0C 00149C0C 2000BF7B */  lq         $31, 0x20($sp)
/* 49D10 00149C10 1000B17B */  lq         $17, 0x10($sp)
/* 49D14 00149C14 0000B07B */  lq         $16, 0x0($sp)
/* 49D18 00149C18 7000BD27 */  addiu      $sp, $sp, 0x70
/* 49D1C 00149C1C 0800E003 */  jr         $31
/* 49D20 00149C20 00000000 */   nop
/* 49D24 00149C24 00000000 */  nop
/* 49D28 00149C28 00000000 */  nop
/* 49D2C 00149C2C 00000000 */  nop
