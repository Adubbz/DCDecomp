.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdStPause
/* C220 0010C120 2500023C */  lui        $2, (0x250270 >> 16)
/* C224 0010C124 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* C228 0010C128 2500033C */  lui        $3, (0x2502B8 >> 16)
/* C22C 0010C12C 7002448C */  lw         $4, (0x250270 & 0xFFFF)($2)
/* C230 0010C130 0000BFFF */  sd         $31, 0x0($sp)
/* C234 0010C134 04008018 */  blez       $4, .L0010C148
/* C238 0010C138 B80260AC */   sw        $0, (0x2502B8 & 0xFFFF)($3)
/* C23C 0010C13C 2900043C */  lui        $4, %hi(D_00297338)
/* C240 0010C140 A611040C */  jal        printf
/* C244 0010C144 38738424 */   addiu     $4, $4, %lo(D_00297338)
.L0010C148:
/* C248 0010C148 2500083C */  lui        $8, %hi(dum_mode)
/* C24C 0010C14C 2D200000 */  daddu      $4, $0, $0
/* C250 0010C150 C8020825 */  addiu      $8, $8, %lo(dum_mode)
/* C254 0010C154 2D280000 */  daddu      $5, $0, $0
/* C258 0010C158 2D300000 */  daddu      $6, $0, $0
/* C25C 0010C15C 8430040C */  jal        sceCdStream
/* C260 0010C160 07000724 */   addiu     $7, $0, 0x7
/* C264 0010C164 0000BFDF */  ld         $31, 0x0($sp)
/* C268 0010C168 0800E003 */  jr         $31
/* C26C 0010C16C 1000BD27 */   addiu     $sp, $sp, 0x10
