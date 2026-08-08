.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel sceVu0ClipAll
/* 0222D8 001221D8 0000E8D8 */  lqc2        $vf8, 0x0($7)
/* 0222DC 001221DC 0000C4D8 */  lqc2        $vf4, 0x0($6)
/* 0222E0 001221E0 1000C5D8 */  lqc2        $vf5, 0x10($6)
/* 0222E4 001221E4 2000C6D8 */  lqc2        $vf6, 0x20($6)
/* 0222E8 001221E8 3000C7D8 */  lqc2        $vf7, 0x30($6)
/* 0222EC 001221EC 000089D8 */  lqc2        $vf9, 0x0($4)
/* 0222F0 001221F0 0000AAD8 */  lqc2        $vf10, 0x0($5)
/* 0222F4 001221F4 00008BD8 */  lqc2        $vf11, 0x0($4)
/* 0222F8 001221F8 0000ACD8 */  lqc2        $vf12, 0x0($5)
.Lloop_clip_all:
/* 0222FC 001221FC BC21E84B */  vmulax.xyzw $ACC, $vf4, $vf8x
/* 022300 00122200 BD28E84B */  vmadday.xyzw $ACC, $vf5, $vf8y
/* 022304 00122204 BE30E84B */  vmaddaz.xyzw $ACC, $vf6, $vf8z
/* 022308 00122208 0B3AE84B */  vmaddw.xyzw $vf8, $vf7, $vf8w
/* 02230C 0012220C DB4AC84B */  vmulw.xyz   $vf11, $vf9, $vf8w
/* 022310 00122210 1B53C84B */  vmulw.xyz   $vf12, $vf10, $vf8w
/* 022314 00122214 FF02004A */  vnop
/* 022318 00122218 FF02004A */  vnop
/* 02231C 0012221C 0080C048 */  ctc2.ni     $0, $vi16
/* 022320 00122220 EC42AB4B */  vsub.xyw    $vf11, $vf8, $vf11
/* 022324 00122224 2C63A84B */  vsub.xyw    $vf12, $vf12, $vf8
/* 022328 00122228 3C4B2B4A */  vmove.w     $vf11, $vf9
/* 02232C 0012222C 3C532C4A */  vmove.w     $vf12, $vf10
/* 022330 00122230 FF02004A */  vnop
/* 022334 00122234 1000E720 */  addi        $7, $7, 0x10 /* handwritten instruction */
/* 022338 00122238 0000E8D8 */  lqc2        $vf8, 0x0($7)
/* 02233C 0012223C FFFF0821 */  addi        $8, $8, -0x1 /* handwritten instruction */
/* 022340 00122240 00804248 */  cfc2.ni     $2, $vi16
/* 022344 00122244 C0004230 */  andi        $2, $2, 0xC0
/* 022348 00122248 04004010 */  beqz        $2, .Lend_clip_all
/* 02234C 0012224C 00000000 */   nop
/* 022350 00122250 EAFF0814 */  bne         $0, $8, .Lloop_clip_all
/* 022354 00122254 00000000 */   nop
/* 022358 00122258 01000220 */  addi        $2, $0, 0x1 /* handwritten instruction */
.Lend_clip_all:
/* 02235C 0012225C 0800E003 */  jr          $31
/* 022360 00122260 00000000 */   nop
/* 022364 00122264 00000000 */  nop
