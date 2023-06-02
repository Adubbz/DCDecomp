.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetMotion__5CFishFii
/* 141040 00240F40 080D85AC */  sw         $5, 0xD08($4)
/* 141044 00240F44 040D86AC */  sw         $6, 0xD04($4)
/* 141048 00240F48 80BF033C */  lui        $3, (0xBF800000 >> 16)
/* 14104C 00240F4C 000D83AC */  sw         $3, 0xD00($4)
/* 141050 00240F50 B81E85AC */  sw         $5, 0x1EB8($4)
/* 141054 00240F54 B41E86AC */  sw         $6, 0x1EB4($4)
/* 141058 00240F58 B01E83AC */  sw         $3, 0x1EB0($4)
/* 14105C 00240F5C 0800E003 */  jr         $31
/* 141060 00240F60 00000000 */   nop
/* 141064 00240F64 00000000 */  nop
/* 141068 00240F68 00000000 */  nop
/* 14106C 00240F6C 00000000 */  nop
