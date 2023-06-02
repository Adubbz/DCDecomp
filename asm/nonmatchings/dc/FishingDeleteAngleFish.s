.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishingDeleteAngleFish__Fv
/* A9A20 001A9920 6C93848F */  lw         $4, -0x6C94($gp)
/* A9A24 001A9924 03008010 */  beqz       $4, .L001A9934
/* A9A28 001A9928 00000000 */   nop
/* A9A2C 001A992C FFFF0324 */  addiu      $3, $0, -0x1
/* A9A30 001A9930 000083AC */  sw         $3, 0x0($4)
.L001A9934:
/* A9A34 001A9934 0800E003 */  jr         $31
/* A9A38 001A9938 00000000 */   nop
/* A9A3C 001A993C 00000000 */  nop
