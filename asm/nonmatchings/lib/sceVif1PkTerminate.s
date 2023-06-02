.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVif1PkTerminate
/* 20D28 00120C28 0000858C */  lw         $5, 0x0($4)
/* 20D2C 00120C2C 0C00A230 */  andi       $2, $5, 0xC
/* 20D30 00120C30 08004010 */  beqz       $2, .L00120C54
/* 20D34 00120C34 0800868C */   lw        $6, 0x8($4)
.L00120C38:
/* 20D38 00120C38 0000A0AC */  sw         $0, 0x0($5)
/* 20D3C 00120C3C 0400A524 */  addiu      $5, $5, 0x4
/* 20D40 00120C40 0C00A230 */  andi       $2, $5, 0xC
/* 20D44 00120C44 00000000 */  nop
/* 20D48 00120C48 00000000 */  nop
/* 20D4C 00120C4C FAFF4014 */  bnez       $2, .L00120C38
/* 20D50 00120C50 00000000 */   nop
.L00120C54:
/* 20D54 00120C54 0600C010 */  beqz       $6, .L00120C70
/* 20D58 00120C58 2310A600 */   subu      $2, $5, $6
/* 20D5C 00120C5C 0000C38C */  lw         $3, 0x0($6)
/* 20D60 00120C60 03110200 */  sra        $2, $2, 4
/* 20D64 00120C64 FFFF4224 */  addiu      $2, $2, -0x1
/* 20D68 00120C68 21186200 */  addu       $3, $3, $2
/* 20D6C 00120C6C 0000C3AC */  sw         $3, 0x0($6)
.L00120C70:
/* 20D70 00120C70 080080AC */  sw         $0, 0x8($4)
/* 20D74 00120C74 2D10A000 */  daddu      $2, $5, $0
/* 20D78 00120C78 0800E003 */  jr         $31
/* 20D7C 00120C7C 000085AC */   sw        $5, 0x0($4)
