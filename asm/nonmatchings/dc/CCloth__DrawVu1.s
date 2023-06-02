.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawVu1__6CClothFPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
/* 3C570 0013C470 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 3C574 0013C474 7000BF7F */  sq         $31, 0x70($sp)
/* 3C578 0013C478 6000B67F */  sq         $22, 0x60($sp)
/* 3C57C 0013C47C 5000B57F */  sq         $21, 0x50($sp)
/* 3C580 0013C480 4000B47F */  sq         $20, 0x40($sp)
/* 3C584 0013C484 3000B37F */  sq         $19, 0x30($sp)
/* 3C588 0013C488 2000B27F */  sq         $18, 0x20($sp)
/* 3C58C 0013C48C 1000B17F */  sq         $17, 0x10($sp)
/* 3C590 0013C490 0000B07F */  sq         $16, 0x0($sp)
/* 3C594 0013C494 28B68070 */  paddub     $22, $4, $0
/* 3C598 0013C498 28AEA070 */  paddub     $21, $5, $0
/* 3C59C 0013C49C 28A6C070 */  paddub     $20, $6, $0
/* 3C5A0 0013C4A0 289EE070 */  paddub     $19, $7, $0
/* 3C5A4 0013C4A4 28960071 */  paddub     $18, $8, $0
/* 3C5A8 0013C4A8 288E2071 */  paddub     $17, $9, $0
/* 3C5AC 0013C4AC 28866071 */  paddub     $16, $11, $0
/* 3C5B0 0013C4B0 C08B828F */  lw         $2, -0x7440($gp)
/* 3C5B4 0013C4B4 80100200 */  sll        $2, $2, 2
/* 3C5B8 0013C4B8 21104400 */  addu       $2, $2, $4
/* 3C5BC 0013C4BC 2400458C */  lw         $5, 0x24($2)
/* 3C5C0 0013C4C0 7CF1040C */  jal        CreateVUData__6CClothFPUi
/* 3C5C4 0013C4C4 00000000 */   nop
/* 3C5C8 0013C4C8 C08B828F */  lw         $2, -0x7440($gp)
/* 3C5CC 0013C4CC 80100200 */  sll        $2, $2, 2
/* 3C5D0 0013C4D0 21105600 */  addu       $2, $2, $22
/* 3C5D4 0013C4D4 2400428C */  lw         $2, 0x24($2)
/* 3C5D8 0013C4D8 1800C2AE */  sw         $2, 0x18($22)
/* 3C5DC 0013C4DC 2826C072 */  paddub     $4, $22, $0
/* 3C5E0 0013C4E0 282EA072 */  paddub     $5, $21, $0
/* 3C5E4 0013C4E4 28368072 */  paddub     $6, $20, $0
/* 3C5E8 0013C4E8 283E6072 */  paddub     $7, $19, $0
/* 3C5EC 0013C4EC 28464072 */  paddub     $8, $18, $0
/* 3C5F0 0013C4F0 284E2072 */  paddub     $9, $17, $0
/* 3C5F4 0013C4F4 28560072 */  paddub     $10, $16, $0
/* 3C5F8 0013C4F8 285E0070 */  paddub     $11, $0, $0
/* 3C5FC 0013C4FC 00D4040C */  jal        DrawVu1__10CVisualVu1FPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
/* 3C600 0013C500 00000000 */   nop
/* 3C604 0013C504 7000BF7B */  lq         $31, 0x70($sp)
/* 3C608 0013C508 6000B67B */  lq         $22, 0x60($sp)
/* 3C60C 0013C50C 5000B57B */  lq         $21, 0x50($sp)
/* 3C610 0013C510 4000B47B */  lq         $20, 0x40($sp)
/* 3C614 0013C514 3000B37B */  lq         $19, 0x30($sp)
/* 3C618 0013C518 2000B27B */  lq         $18, 0x20($sp)
/* 3C61C 0013C51C 1000B17B */  lq         $17, 0x10($sp)
/* 3C620 0013C520 0000B07B */  lq         $16, 0x0($sp)
/* 3C624 0013C524 8000BD27 */  addiu      $sp, $sp, 0x80
/* 3C628 0013C528 0800E003 */  jr         $31
/* 3C62C 0013C52C 00000000 */   nop
