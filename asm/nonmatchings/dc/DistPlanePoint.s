.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DistPlanePoint__FPfPfPf
/* 23230 00123130 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 23234 00123134 1000BF7F */  sq         $31, 0x10($sp)
/* 23238 00123138 0000B07F */  sq         $16, 0x0($sp)
/* 2323C 0012313C 28868070 */  paddub     $16, $4, $0
/* 23240 00123140 2816A070 */  paddub     $2, $5, $0
/* 23244 00123144 2000A427 */  addiu      $4, $sp, 0x20
/* 23248 00123148 282EC070 */  paddub     $5, $6, $0
/* 2324C 0012314C 28364070 */  paddub     $6, $2, $0
/* 23250 00123150 EE85040C */  jal        sceVu0SubVector
/* 23254 00123154 00000000 */   nop
/* 23258 00123158 28260072 */  paddub     $4, $16, $0
/* 2325C 0012315C 2000A527 */  addiu      $5, $sp, 0x20
/* 23260 00123160 8885040C */  jal        sceVu0InnerProduct
/* 23264 00123164 00000000 */   nop
/* 23268 00123168 1000BF7B */  lq         $31, 0x10($sp)
/* 2326C 0012316C 0000B07B */  lq         $16, 0x0($sp)
/* 23270 00123170 3000BD27 */  addiu      $sp, $sp, 0x30
/* 23274 00123174 0800E003 */  jr         $31
/* 23278 00123178 00000000 */   nop
/* 2327C 0012317C 00000000 */  nop
