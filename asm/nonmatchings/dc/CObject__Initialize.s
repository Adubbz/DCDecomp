.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__7CObjectFf
/* 57150 00157050 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 57154 00157054 00008CE4 */  swc1       $f12, 0x0($4)
/* 57158 00157058 803F033C */  lui        $3, (0x3F800000 >> 16)
/* 5715C 0015705C 580083AC */  sw         $3, 0x58($4)
/* 57160 00157060 540083AC */  sw         $3, 0x54($4)
/* 57164 00157064 500083AC */  sw         $3, 0x50($4)
/* 57168 00157068 980083AC */  sw         $3, 0x98($4)
/* 5716C 0015706C 940083AC */  sw         $3, 0x94($4)
/* 57170 00157070 900083AC */  sw         $3, 0x90($4)
/* 57174 00157074 180080AC */  sw         $0, 0x18($4)
/* 57178 00157078 140080AC */  sw         $0, 0x14($4)
/* 5717C 0015707C 100080AC */  sw         $0, 0x10($4)
/* 57180 00157080 0000A0AF */  sw         $0, 0x0($sp)
/* 57184 00157084 0400A0AF */  sw         $0, 0x4($sp)
/* 57188 00157088 0800A0AF */  sw         $0, 0x8($sp)
/* 5718C 0015708C 0000A327 */  addiu      $3, $sp, 0x0
/* 57190 00157090 00006378 */  lq         $3, 0x0($3)
/* 57194 00157094 4000837C */  sq         $3, 0x40($4)
/* 57198 00157098 3000837C */  sq         $3, 0x30($4)
/* 5719C 0015709C 2000837C */  sq         $3, 0x20($4)
/* 571A0 001570A0 8000837C */  sq         $3, 0x80($4)
/* 571A4 001570A4 7000837C */  sq         $3, 0x70($4)
/* 571A8 001570A8 6000837C */  sq         $3, 0x60($4)
/* 571AC 001570AC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 571B0 001570B0 0800E003 */  jr         $31
/* 571B4 001570B4 00000000 */   nop
/* 571B8 001570B8 00000000 */  nop
/* 571BC 001570BC 00000000 */  nop