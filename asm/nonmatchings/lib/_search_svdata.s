.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _search_svdata
/* 172D8 001171D8 2800A58C */  lw         $5, 0x28($5)
/* 172DC 001171DC 0F00A010 */  beqz       $5, .L0011721C
/* 172E0 001171E0 00000000 */   nop
/* 172E4 001171E4 0800A38C */  lw         $3, 0x8($5)
.L001171E8:
/* 172E8 001171E8 0A006050 */  beql       $3, $0, .L00117214
/* 172EC 001171EC 1400A58C */   lw        $5, 0x14($5)
/* 172F0 001171F0 0000628C */  lw         $2, 0x0($3)
/* 172F4 001171F4 00000000 */  nop
.L001171F8:
/* 172F8 001171F8 03004454 */  bnel       $2, $4, .L00117208
/* 172FC 001171FC 3800638C */   lw        $3, 0x38($3)
/* 17300 00117200 0800E003 */  jr         $31
/* 17304 00117204 2D106000 */   daddu     $2, $3, $0
.L00117208:
/* 17308 00117208 FBFF6054 */  bnel       $3, $0, .L001171F8
/* 1730C 0011720C 0000628C */   lw        $2, 0x0($3)
/* 17310 00117210 1400A58C */  lw         $5, 0x14($5)
.L00117214:
/* 17314 00117214 F4FFA054 */  bnel       $5, $0, .L001171E8
/* 17318 00117218 0800A38C */   lw        $3, 0x8($5)
.L0011721C:
/* 1731C 0011721C 0800E003 */  jr         $31
/* 17320 00117220 2D100000 */   daddu     $2, $0, $0
/* 17324 00117224 00000000 */  nop
