.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMonstorCursor__12CMonstorUnitFv
/* D9310 001D9210 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* D9314 001D9214 3000BF7F */  sq         $31, 0x30($sp)
/* D9318 001D9218 2000B27F */  sq         $18, 0x20($sp)
/* D931C 001D921C 1000B17F */  sq         $17, 0x10($sp)
/* D9320 001D9220 0000B07F */  sq         $16, 0x0($sp)
/* D9324 001D9224 288E8070 */  paddub     $17, $4, $0
/* D9328 001D9228 28860070 */  paddub     $16, $0, $0
/* D932C 001D922C 26000010 */  b          .L001D92C8
/* D9330 001D9230 00000000 */   nop
.L001D9234:
/* D9334 001D9234 80181000 */  sll        $3, $16, 2
/* D9338 001D9238 21207000 */  addu       $4, $3, $16
/* D933C 001D923C 80180400 */  sll        $3, $4, 2
/* D9340 001D9240 21188300 */  addu       $3, $4, $3
/* D9344 001D9244 00190300 */  sll        $3, $3, 4
/* D9348 001D9248 21187100 */  addu       $3, $3, $17
/* D934C 001D924C 0200013C */  lui        $at, (0x20000 >> 16)
/* D9350 001D9250 21086100 */  addu       $at, $3, $at
/* D9354 001D9254 B8E4238C */  lw         $3, -0x1B48($at)
/* D9358 001D9258 1A006010 */  beqz       $3, .L001D92C4
/* D935C 001D925C 00000000 */   nop
/* D9360 001D9260 10350224 */  addiu      $2, $0, 0x3510
/* D9364 001D9264 18900202 */  mult       $18, $16, $2
/* D9368 001D9268 21103202 */  addu       $2, $17, $18
/* D936C 001D926C 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* D9370 001D9270 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* D9374 001D9274 21204100 */  addu       $4, $2, $at
/* D9378 001D9278 4000A527 */  addiu      $5, $sp, 0x40
/* D937C 001D927C A000998C */  lw         $25, 0xA0($4)
/* D9380 001D9280 A000398F */  lw         $25, 0xA0($25)
/* D9384 001D9284 09F82003 */  jalr       $25
/* D9388 001D9288 00000000 */   nop
/* D938C 001D928C 21105102 */  addu       $2, $18, $17
/* D9390 001D9290 0200013C */  lui        $at, (0x20000 >> 16)
/* D9394 001D9294 21084100 */  addu       $at, $2, $at
/* D9398 001D9298 84FD21C4 */  lwc1       $f1, -0x27C($at)
/* D939C 001D929C 4400A0C7 */  lwc1       $f0, 0x44($sp)
/* D93A0 001D92A0 00000146 */  add.s      $f0, $f0, $f1
/* D93A4 001D92A4 4400A0E7 */  swc1       $f0, 0x44($sp)
/* D93A8 001D92A8 849D848F */  lw         $4, -0x627C($gp)
/* D93AC 001D92AC 4000A527 */  addiu      $5, $sp, 0x40
/* D93B0 001D92B0 B89F040C */  jal        SetPosition__6CFrameFPf
/* D93B4 001D92B4 00000000 */   nop
/* D93B8 001D92B8 849D848F */  lw         $4, -0x627C($gp)
/* D93BC 001D92BC 60BB040C */  jal        MGDraw__FP6CFrame
/* D93C0 001D92C0 00000000 */   nop
.L001D92C4:
/* D93C4 001D92C4 01001026 */  addiu      $16, $16, 0x1
.L001D92C8:
/* D93C8 001D92C8 1000032A */  slti       $3, $16, 0x10
/* D93CC 001D92CC D9FF6014 */  bnez       $3, .L001D9234
/* D93D0 001D92D0 00000000 */   nop
/* D93D4 001D92D4 3000BF7B */  lq         $31, 0x30($sp)
/* D93D8 001D92D8 2000B27B */  lq         $18, 0x20($sp)
/* D93DC 001D92DC 1000B17B */  lq         $17, 0x10($sp)
/* D93E0 001D92E0 0000B07B */  lq         $16, 0x0($sp)
/* D93E4 001D92E4 5000BD27 */  addiu      $sp, $sp, 0x50
/* D93E8 001D92E8 0800E003 */  jr         $31
/* D93EC 001D92EC 00000000 */   nop
