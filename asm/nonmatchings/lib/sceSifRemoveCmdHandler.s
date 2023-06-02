.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifRemoveCmdHandler
/* 16998 00116898 04008104 */  bgez       $4, .L001168AC
/* 1699C 0011689C C0180400 */   sll       $3, $4, 3
/* 169A0 001168A0 2A00023C */  lui        $2, (0x2A5924 >> 16)
/* 169A4 001168A4 03000010 */  b          .L001168B4
/* 169A8 001168A8 2459448C */   lw        $4, (0x2A5924 & 0xFFFF)($2)
.L001168AC:
/* 169AC 001168AC 2A00023C */  lui        $2, (0x2A592C >> 16)
/* 169B0 001168B0 2C59448C */  lw         $4, (0x2A592C & 0xFFFF)($2)
.L001168B4:
/* 169B4 001168B4 21186400 */  addu       $3, $3, $4
/* 169B8 001168B8 0800E003 */  jr         $31
/* 169BC 001168BC 000060AC */   sw        $0, 0x0($3)
