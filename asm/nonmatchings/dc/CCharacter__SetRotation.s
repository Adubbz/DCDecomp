.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRotation__10CCharacterFfff
/* 39250 00139150 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 39254 00139154 2000BF7F */  sq         $31, 0x20($sp)
/* 39258 00139158 1000B07F */  sq         $16, 0x10($sp)
/* 3925C 0013915C 0800B6E7 */  swc1       $f22, 0x8($sp)
/* 39260 00139160 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 39264 00139164 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 39268 00139168 28868070 */  paddub     $16, $4, $0
/* 3926C 0013916C 86650046 */  mov.s      $f22, $f12
/* 39270 00139170 466D0046 */  mov.s      $f21, $f13
/* 39274 00139174 06750046 */  mov.s      $f20, $f14
/* 39278 00139178 785B050C */  jal        SetRotation__7CObjectFfff
/* 3927C 0013917C 00000000 */   nop
/* 39280 00139180 BC00048E */  lw         $4, 0xBC($16)
/* 39284 00139184 06008010 */  beqz       $4, .L001391A0
/* 39288 00139188 00000000 */   nop
/* 3928C 0013918C 06B30046 */  mov.s      $f12, $f22
/* 39290 00139190 46AB0046 */  mov.s      $f13, $f21
/* 39294 00139194 86A30046 */  mov.s      $f14, $f20
/* 39298 00139198 70A3040C */  jal        SetRotation__6CFrameFfff
/* 3929C 0013919C 00000000 */   nop
.L001391A0:
/* 392A0 001391A0 C000048E */  lw         $4, 0xC0($16)
/* 392A4 001391A4 06008010 */  beqz       $4, .L001391C0
/* 392A8 001391A8 00000000 */   nop
/* 392AC 001391AC 06B30046 */  mov.s      $f12, $f22
/* 392B0 001391B0 46AB0046 */  mov.s      $f13, $f21
/* 392B4 001391B4 86A30046 */  mov.s      $f14, $f20
/* 392B8 001391B8 70A3040C */  jal        SetRotation__6CFrameFfff
/* 392BC 001391BC 00000000 */   nop
.L001391C0:
/* 392C0 001391C0 2000BF7B */  lq         $31, 0x20($sp)
/* 392C4 001391C4 1000B07B */  lq         $16, 0x10($sp)
/* 392C8 001391C8 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* 392CC 001391CC 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 392D0 001391D0 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 392D4 001391D4 3000BD27 */  addiu      $sp, $sp, 0x30
/* 392D8 001391D8 0800E003 */  jr         $31
/* 392DC 001391DC 00000000 */   nop
