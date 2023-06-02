.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PickUpEditAreaPoly__11CEditGroundFP6CCPolyfff
/* A5270 001A5170 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* A5274 001A5174 3000BF7F */  sq         $31, 0x30($sp)
/* A5278 001A5178 2000B17F */  sq         $17, 0x20($sp)
/* A527C 001A517C 1000B07F */  sq         $16, 0x10($sp)
/* A5280 001A5180 0800B6E7 */  swc1       $f22, 0x8($sp)
/* A5284 001A5184 0400B5E7 */  swc1       $f21, 0x4($sp)
/* A5288 001A5188 0000B4E7 */  swc1       $f20, 0x0($sp)
/* A528C 001A518C 288E8070 */  paddub     $17, $4, $0
/* A5290 001A5190 2886A070 */  paddub     $16, $5, $0
/* A5294 001A5194 86650046 */  mov.s      $f22, $f12
/* A5298 001A5198 466D0046 */  mov.s      $f21, $f13
/* A529C 001A519C 06750046 */  mov.s      $f20, $f14
/* A52A0 001A51A0 AC85060C */  jal        GetAreaCode__11CEditGroundFfff
/* A52A4 001A51A4 00000000 */   nop
/* A52A8 001A51A8 04004104 */  bgez       $2, .L001A51BC
/* A52AC 001A51AC 00000000 */   nop
/* A52B0 001A51B0 28160070 */  paddub     $2, $0, $0
/* A52B4 001A51B4 0A000010 */  b          .L001A51E0
/* A52B8 001A51B8 00000000 */   nop
.L001A51BC:
/* A52BC 001A51BC 80100200 */  sll        $2, $2, 2
/* A52C0 001A51C0 21105100 */  addu       $2, $2, $17
/* A52C4 001A51C4 0400448C */  lw         $4, 0x4($2)
/* A52C8 001A51C8 282E0072 */  paddub     $5, $16, $0
/* A52CC 001A51CC 06B30046 */  mov.s      $f12, $f22
/* A52D0 001A51D0 46AB0046 */  mov.s      $f13, $f21
/* A52D4 001A51D4 86A30046 */  mov.s      $f14, $f20
/* A52D8 001A51D8 98BD050C */  jal        PickUpPoly__9CEditAreaFP6CCPolyfff
/* A52DC 001A51DC 00000000 */   nop
.L001A51E0:
/* A52E0 001A51E0 3000BF7B */  lq         $31, 0x30($sp)
/* A52E4 001A51E4 2000B17B */  lq         $17, 0x20($sp)
/* A52E8 001A51E8 1000B07B */  lq         $16, 0x10($sp)
/* A52EC 001A51EC 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* A52F0 001A51F0 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* A52F4 001A51F4 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* A52F8 001A51F8 4000BD27 */  addiu      $sp, $sp, 0x40
/* A52FC 001A51FC 0800E003 */  jr         $31
/* A5300 001A5200 00000000 */   nop
/* A5304 001A5204 00000000 */  nop
/* A5308 001A5208 00000000 */  nop
/* A530C 001A520C 00000000 */  nop
