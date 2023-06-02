.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __as__10CVisualVu1FRC10CVisualVu1
/* 43490 00143390 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 43494 00143394 2000BF7F */  sq         $31, 0x20($sp)
/* 43498 00143398 1000B17F */  sq         $17, 0x10($sp)
/* 4349C 0014339C 0000B07F */  sq         $16, 0x0($sp)
/* 434A0 001433A0 288E8070 */  paddub     $17, $4, $0
/* 434A4 001433A4 2886A070 */  paddub     $16, $5, $0
/* 434A8 001433A8 FC0C050C */  jal        __as__7CVisualFRC7CVisual
/* 434AC 001433AC 00000000 */   nop
/* 434B0 001433B0 1000028E */  lw         $2, 0x10($16)
/* 434B4 001433B4 100022AE */  sw         $2, 0x10($17)
/* 434B8 001433B8 1400028E */  lw         $2, 0x14($16)
/* 434BC 001433BC 140022AE */  sw         $2, 0x14($17)
/* 434C0 001433C0 1800028E */  lw         $2, 0x18($16)
/* 434C4 001433C4 180022AE */  sw         $2, 0x18($17)
/* 434C8 001433C8 1C00028E */  lw         $2, 0x1C($16)
/* 434CC 001433CC 1C0022AE */  sw         $2, 0x1C($17)
/* 434D0 001433D0 28162072 */  paddub     $2, $17, $0
/* 434D4 001433D4 2000BF7B */  lq         $31, 0x20($sp)
/* 434D8 001433D8 1000B17B */  lq         $17, 0x10($sp)
/* 434DC 001433DC 0000B07B */  lq         $16, 0x0($sp)
/* 434E0 001433E0 3000BD27 */  addiu      $sp, $sp, 0x30
/* 434E4 001433E4 0800E003 */  jr         $31
/* 434E8 001433E8 00000000 */   nop
/* 434EC 001433EC 00000000 */  nop
