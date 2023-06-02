.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __register_global_object
/* 22A30 00122930 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 22A34 00122934 00A0238C */  lw         $3, -0x6000($at)
/* 22A38 00122938 28168070 */  paddub     $2, $4, $0
/* 22A3C 0012293C 0000C3AC */  sw         $3, 0x0($6)
/* 22A40 00122940 0400C5AC */  sw         $5, 0x4($6)
/* 22A44 00122944 0800C4AC */  sw         $4, 0x8($6)
/* 22A48 00122948 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 22A4C 0012294C 0800E003 */  jr         $31
/* 22A50 00122950 00A026AC */   sw        $6, -0x6000($at)
/* 22A54 00122954 00000000 */  nop
/* 22A58 00122958 00000000 */  nop
/* 22A5C 0012295C 00000000 */  nop
