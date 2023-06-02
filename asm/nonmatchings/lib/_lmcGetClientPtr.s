.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _lmcGetClientPtr
/* 1E1D8 0011E0D8 2B00023C */  lui        $2, %hi(D_002A9C00)
/* 1E1DC 0011E0DC 2500033C */  lui        $3, %hi(mcRunCmdNo)
/* 1E1E0 0011E0E0 009C4224 */  addiu      $2, $2, %lo(D_002A9C00)
/* 1E1E4 0011E0E4 380A6324 */  addiu      $3, $3, %lo(mcRunCmdNo)
/* 1E1E8 0011E0E8 000082AC */  sw         $2, 0x0($4)
/* 1E1EC 0011E0EC 2B00023C */  lui        $2, %hi(D_002A8640)
/* 1E1F0 0011E0F0 0000A3AC */  sw         $3, 0x0($5)
/* 1E1F4 0011E0F4 0800E003 */  jr         $31
/* 1E1F8 0011E0F8 40864224 */   addiu     $2, $2, %lo(D_002A8640)
/* 1E1FC 0011E0FC 00000000 */  nop
