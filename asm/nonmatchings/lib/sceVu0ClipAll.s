.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel sceVu0ClipAll
/* 222D8 001221D8 0000E8D8 */  lqc2       $vf8, 0x0($7)
/* 222DC 001221DC 0000C4D8 */  lqc2       $vf4, 0x0($6)
/* 222E0 001221E0 1000C5D8 */  lqc2       $vf5, 0x10($6)
/* 222E4 001221E4 2000C6D8 */  lqc2       $vf6, 0x20($6)
/* 222E8 001221E8 3000C7D8 */  lqc2       $vf7, 0x30($6)
/* 222EC 001221EC 000089D8 */  lqc2       $vf9, 0x0($4)
/* 222F0 001221F0 0000AAD8 */  lqc2       $vf10, 0x0($5)
/* 222F4 001221F4 00008BD8 */  lqc2       $vf11, 0x0($4)
/* 222F8 001221F8 0000ACD8 */  lqc2       $vf12, 0x0($5)
.L001221FC:
/* 222FC 001221FC BC21E84B */  vmulax.xyzw ACC, $vf4, $vf8x
/* 22300 00122200 BD28E84B */  vmadday.xyzw ACC, $vf5, $vf8y
/* 22304 00122204 BE30E84B */  vmaddaz.xyzw ACC, $vf6, $vf8z
/* 22308 00122208 0B3AE84B */  vmaddw.xyzw $vf8, $vf7, $vf8w
/* 2230C 0012220C DB4AC84B */  vmulw.xyz  $vf11, $vf9, $vf8w
/* 22310 00122210 1B53C84B */  vmulw.xyz  $vf12, $vf10, $vf8w
/* 22314 00122214 FF02004A */  vnop
/* 22318 00122218 FF02004A */  vnop
/* 2231C 0012221C 0080C048 */  ctc2       $0, $vi16
/* 22320 00122220 EC42AB4B */  vsub.xyw   $vf11, $vf8, $vf11
/* 22324 00122224 2C63A84B */  vsub.xyw   $vf12, $vf12, $vf8
/* 22328 00122228 3C4B2B4A */  vmove.w    $vf11, $vf9
/* 2232C 0012222C 3C532C4A */  vmove.w    $vf12, $vf10
/* 22330 00122230 FF02004A */  vnop
/* 22334 00122234 1000E720 */  addi       $7, $7, 0x10 # handwritten instruction
/* 22338 00122238 0000E8D8 */  lqc2       $vf8, 0x0($7)
/* 2233C 0012223C FFFF0821 */  addi       $8, $8, -0x1 # handwritten instruction
/* 22340 00122240 00804248 */  cfc2       $2, $vi16
/* 22344 00122244 C0004230 */  andi       $2, $2, 0xC0
/* 22348 00122248 04004010 */  beqz       $2, .L0012225C
/* 2234C 0012224C 00000000 */   nop
/* 22350 00122250 EAFF0814 */  bne        $0, $8, .L001221FC
/* 22354 00122254 00000000 */   nop
/* 22358 00122258 01000220 */  addi       $2, $0, 0x1 # handwritten instruction
.L0012225C:
/* 2235C 0012225C 0800E003 */  jr         $31
/* 22360 00122260 00000000 */   nop
/* 22364 00122264 00000000 */  nop
