.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceGsResetPath
/* 124D0 001123D0 0010023C */  lui        $2, (0x10003C10 >> 16)
/* 124D4 001123D4 01000724 */  addiu      $7, $0, 0x1
/* 124D8 001123D8 103C4234 */  ori        $2, $2, (0x10003C10 & 0xFFFF)
/* 124DC 001123DC 0010033C */  lui        $3, (0x10003C20 >> 16)
/* 124E0 001123E0 000047AC */  sw         $7, 0x0($2)
/* 124E4 001123E4 203C6334 */  ori        $3, $3, (0x10003C20 & 0xFFFF)
/* 124E8 001123E8 02000224 */  addiu      $2, $0, 0x2
/* 124EC 001123EC 2D200000 */  daddu      $4, $0, $0
/* 124F0 001123F0 000062AC */  sw         $2, 0x0($3)
/* 124F4 001123F4 0F000000 */  sync
/* 124F8 001123F8 00E04448 */  cfc2       $4, $vi28
/* 124FC 001123FC 00028434 */  ori        $4, $4, 0x200
/* 12500 00112400 00E0C448 */  ctc2       $4, $vi28
/* 12504 00112404 0F040000 */  sync.p
/* 12508 00112408 2500053C */  lui        $5, %hi(init_vif_regs.3)
/* 1250C 0011240C 0010063C */  lui        $6, (0x10005000 >> 16)
/* 12510 00112410 A009A524 */  addiu      $5, $5, %lo(init_vif_regs.3)
/* 12514 00112414 0050C634 */  ori        $6, $6, (0x10005000 & 0xFFFF)
/* 12518 00112418 0000A478 */  lq         $4, 0x0($5)
/* 1251C 0011241C 0010033C */  lui        $3, (0x10003000 >> 16)
/* 12520 00112420 00306334 */  ori        $3, $3, (0x10003000 & 0xFFFF)
/* 12524 00112424 0000C47C */  sq         $4, 0x0($6)
/* 12528 00112428 1000A278 */  lq         $2, 0x10($5)
/* 1252C 0011242C 0000C27C */  sq         $2, 0x0($6)
/* 12530 00112430 0800E003 */  jr         $31
/* 12534 00112434 000067AC */   sw        $7, 0x0($3)
