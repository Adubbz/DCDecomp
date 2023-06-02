.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DeleteExtendMotion__10CCharacterFv
/* 39A90 00139990 01000624 */  addiu      $6, $0, 0x1
/* 39A94 00139994 09000010 */  b          .L001399BC
/* 39A98 00139998 00000000 */   nop
.L0013999C:
/* 39A9C 0013999C 80180600 */  sll        $3, $6, 2
/* 39AA0 001399A0 21286400 */  addu       $5, $3, $4
/* 39AA4 001399A4 200CA0AC */  sw         $0, 0xC20($5)
/* 39AA8 001399A8 400CA0AC */  sw         $0, 0xC40($5)
/* 39AAC 001399AC FFFF0324 */  addiu      $3, $0, -0x1
/* 39AB0 001399B0 E003A3AC */  sw         $3, 0x3E0($5)
/* 39AB4 001399B4 0004A3AC */  sw         $3, 0x400($5)
/* 39AB8 001399B8 0100C624 */  addiu      $6, $6, 0x1
.L001399BC:
/* 39ABC 001399BC 0800C328 */  slti       $3, $6, 0x8
/* 39AC0 001399C0 F6FF6014 */  bnez       $3, .L0013999C
/* 39AC4 001399C4 00000000 */   nop
/* 39AC8 001399C8 0800E003 */  jr         $31
/* 39ACC 001399CC 00000000 */   nop
