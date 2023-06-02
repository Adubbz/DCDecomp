.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishingSetCPoly__FP6CCPolyi
/* A92E0 001A91E0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* A92E4 001A91E4 3000BF7F */  sq         $31, 0x30($sp)
/* A92E8 001A91E8 2000B27F */  sq         $18, 0x20($sp)
/* A92EC 001A91EC 1000B17F */  sq         $17, 0x10($sp)
/* A92F0 001A91F0 0000B07F */  sq         $16, 0x0($sp)
/* A92F4 001A91F4 288E8070 */  paddub     $17, $4, $0
/* A92F8 001A91F8 2886A070 */  paddub     $16, $5, $0
/* A92FC 001A91FC 28960070 */  paddub     $18, $0, $0
/* A9300 001A9200 0B000010 */  b          .L001A9230
/* A9304 001A9204 00000000 */   nop
.L001A9208:
/* A9308 001A9208 80101200 */  sll        $2, $18, 2
/* A930C 001A920C 21105200 */  addu       $2, $2, $18
/* A9310 001A9210 00190200 */  sll        $3, $2, 4
/* A9314 001A9214 7893828F */  lw         $2, -0x6C88($gp)
/* A9318 001A9218 21204300 */  addu       $4, $2, $3
/* A931C 001A921C 21282302 */  addu       $5, $17, $3
/* A9320 001A9220 50000624 */  addiu      $6, $0, 0x50
/* A9324 001A9224 EC0C040C */  jal        memcpy
/* A9328 001A9228 00000000 */   nop
/* A932C 001A922C 01005226 */  addiu      $18, $18, 0x1
.L001A9230:
/* A9330 001A9230 2A185002 */  slt        $3, $18, $16
/* A9334 001A9234 F4FF6014 */  bnez       $3, .L001A9208
/* A9338 001A9238 00000000 */   nop
/* A933C 001A923C 7C9390AF */  sw         $16, -0x6C84($gp)
/* A9340 001A9240 3000BF7B */  lq         $31, 0x30($sp)
/* A9344 001A9244 2000B27B */  lq         $18, 0x20($sp)
/* A9348 001A9248 1000B17B */  lq         $17, 0x10($sp)
/* A934C 001A924C 0000B07B */  lq         $16, 0x0($sp)
/* A9350 001A9250 4000BD27 */  addiu      $sp, $sp, 0x40
/* A9354 001A9254 0800E003 */  jr         $31
/* A9358 001A9258 00000000 */   nop
/* A935C 001A925C 00000000 */  nop
