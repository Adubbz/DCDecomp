.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__12CNPCharacterFv
/* 56AE0 001569E0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 56AE4 001569E4 1000BF7F */  sq         $31, 0x10($sp)
/* 56AE8 001569E8 0000B07F */  sq         $16, 0x0($sp)
/* 56AEC 001569EC 28868070 */  paddub     $16, $4, $0
/* 56AF0 001569F0 74E6040C */  jal        Initialize__10CCharacterFv
/* 56AF4 001569F4 00000000 */   nop
/* 56AF8 001569F8 6C1400AE */  sw         $0, 0x146C($16)
/* 56AFC 001569FC 741400AE */  sw         $0, 0x1474($16)
/* 56B00 00156A00 E00C00AE */  sw         $0, 0xCE0($16)
/* 56B04 00156A04 E40C00AE */  sw         $0, 0xCE4($16)
/* 56B08 00156A08 E80C00AE */  sw         $0, 0xCE8($16)
/* 56B0C 00156A0C EC0C00AE */  sw         $0, 0xCEC($16)
/* 56B10 00156A10 841400AE */  sw         $0, 0x1484($16)
/* 56B14 00156A14 FFFF0224 */  addiu      $2, $0, -0x1
/* 56B18 00156A18 881402AE */  sw         $2, 0x1488($16)
/* 56B1C 00156A1C E040023C */  lui        $2, (0x40E00000 >> 16)
/* 56B20 00156A20 B00002AE */  sw         $2, 0xB0($16)
/* 56B24 00156A24 8C1400AE */  sw         $0, 0x148C($16)
/* 56B28 00156A28 681400AE */  sw         $0, 0x1468($16)
/* 56B2C 00156A2C 7C1400AE */  sw         $0, 0x147C($16)
/* 56B30 00156A30 701400AE */  sw         $0, 0x1470($16)
/* 56B34 00156A34 481400A2 */  sb         $0, 0x1448($16)
/* 56B38 00156A38 28260072 */  paddub     $4, $16, $0
/* 56B3C 00156A3C D458050C */  jal        ClearSeq__12CNPCharacterFv
/* 56B40 00156A40 00000000 */   nop
/* 56B44 00156A44 401400AE */  sw         $0, 0x1440($16)
/* 56B48 00156A48 801400AE */  sw         $0, 0x1480($16)
/* 56B4C 00156A4C 781400AE */  sw         $0, 0x1478($16)
/* 56B50 00156A50 FFFF0324 */  addiu      $3, $0, -0x1
/* 56B54 00156A54 901403AE */  sw         $3, 0x1490($16)
/* 56B58 00156A58 1000BF7B */  lq         $31, 0x10($sp)
/* 56B5C 00156A5C 0000B07B */  lq         $16, 0x0($sp)
/* 56B60 00156A60 2000BD27 */  addiu      $sp, $sp, 0x20
/* 56B64 00156A64 0800E003 */  jr         $31
/* 56B68 00156A68 00000000 */   nop
/* 56B6C 00156A6C 00000000 */  nop
