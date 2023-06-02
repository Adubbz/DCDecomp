.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawVu1__6CClothFP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
/* 3C630 0013C530 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 3C634 0013C534 7000BF7F */  sq         $31, 0x70($sp)
/* 3C638 0013C538 6000B67F */  sq         $22, 0x60($sp)
/* 3C63C 0013C53C 5000B57F */  sq         $21, 0x50($sp)
/* 3C640 0013C540 4000B47F */  sq         $20, 0x40($sp)
/* 3C644 0013C544 3000B37F */  sq         $19, 0x30($sp)
/* 3C648 0013C548 2000B27F */  sq         $18, 0x20($sp)
/* 3C64C 0013C54C 1000B17F */  sq         $17, 0x10($sp)
/* 3C650 0013C550 0000B07F */  sq         $16, 0x0($sp)
/* 3C654 0013C554 28B68070 */  paddub     $22, $4, $0
/* 3C658 0013C558 28AEA070 */  paddub     $21, $5, $0
/* 3C65C 0013C55C 28A6C070 */  paddub     $20, $6, $0
/* 3C660 0013C560 289EE070 */  paddub     $19, $7, $0
/* 3C664 0013C564 28960071 */  paddub     $18, $8, $0
/* 3C668 0013C568 288E2071 */  paddub     $17, $9, $0
/* 3C66C 0013C56C 28866071 */  paddub     $16, $11, $0
/* 3C670 0013C570 C08B828F */  lw         $2, -0x7440($gp)
/* 3C674 0013C574 80100200 */  sll        $2, $2, 2
/* 3C678 0013C578 21104400 */  addu       $2, $2, $4
/* 3C67C 0013C57C 2400458C */  lw         $5, 0x24($2)
/* 3C680 0013C580 7CF1040C */  jal        CreateVUData__6CClothFPUi
/* 3C684 0013C584 00000000 */   nop
/* 3C688 0013C588 C08B828F */  lw         $2, -0x7440($gp)
/* 3C68C 0013C58C 80100200 */  sll        $2, $2, 2
/* 3C690 0013C590 21105600 */  addu       $2, $2, $22
/* 3C694 0013C594 2400428C */  lw         $2, 0x24($2)
/* 3C698 0013C598 1800C2AE */  sw         $2, 0x18($22)
/* 3C69C 0013C59C 2826C072 */  paddub     $4, $22, $0
/* 3C6A0 0013C5A0 282EA072 */  paddub     $5, $21, $0
/* 3C6A4 0013C5A4 28368072 */  paddub     $6, $20, $0
/* 3C6A8 0013C5A8 283E6072 */  paddub     $7, $19, $0
/* 3C6AC 0013C5AC 28464072 */  paddub     $8, $18, $0
/* 3C6B0 0013C5B0 284E2072 */  paddub     $9, $17, $0
/* 3C6B4 0013C5B4 28560072 */  paddub     $10, $16, $0
/* 3C6B8 0013C5B8 285E0070 */  paddub     $11, $0, $0
/* 3C6BC 0013C5BC F0D2040C */  jal        DrawVu1__10CVisualVu1FP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
/* 3C6C0 0013C5C0 00000000 */   nop
/* 3C6C4 0013C5C4 7000BF7B */  lq         $31, 0x70($sp)
/* 3C6C8 0013C5C8 6000B67B */  lq         $22, 0x60($sp)
/* 3C6CC 0013C5CC 5000B57B */  lq         $21, 0x50($sp)
/* 3C6D0 0013C5D0 4000B47B */  lq         $20, 0x40($sp)
/* 3C6D4 0013C5D4 3000B37B */  lq         $19, 0x30($sp)
/* 3C6D8 0013C5D8 2000B27B */  lq         $18, 0x20($sp)
/* 3C6DC 0013C5DC 1000B17B */  lq         $17, 0x10($sp)
/* 3C6E0 0013C5E0 0000B07B */  lq         $16, 0x0($sp)
/* 3C6E4 0013C5E4 8000BD27 */  addiu      $sp, $sp, 0x80
/* 3C6E8 0013C5E8 0800E003 */  jr         $31
/* 3C6EC 0013C5EC 00000000 */   nop
