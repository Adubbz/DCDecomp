.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel _sceIDC
/* 14D68 00114C68 FFFF073C */  lui        $7, (0xFFFFF000 >> 16)
/* 14D6C 00114C6C 2D300000 */  daddu      $6, $0, $0
/* 14D70 00114C70 00F0E734 */  ori        $7, $7, (0xFFFFF000 & 0xFFFF)
/* 14D74 00114C74 00000000 */  nop
.L00114C78:
/* 14D78 00114C78 0F000000 */  sync
/* 14D7C 00114C7C 0000D0BC */  cache      0x10, 0x0($6) # handwritten instruction
/* 14D80 00114C80 0F000000 */  sync
/* 14D84 00114C84 00E00240 */  mfc0       $2, $28 # handwritten instruction
/* 14D88 00114C88 24104700 */  and        $2, $2, $7
/* 14D8C 00114C8C 21104600 */  addu       $2, $2, $6
/* 14D90 00114C90 2B18A200 */  sltu       $3, $5, $2
/* 14D94 00114C94 2B104400 */  sltu       $2, $2, $4
/* 14D98 00114C98 06004014 */  bnez       $2, .L00114CB4
/* 14D9C 00114C9C 00000000 */   nop
/* 14DA0 00114CA0 04006014 */  bnez       $3, .L00114CB4
/* 14DA4 00114CA4 00000000 */   nop
/* 14DA8 00114CA8 0F000000 */  sync
/* 14DAC 00114CAC 0000D6BC */  cache      0x16, 0x0($6) # handwritten instruction
/* 14DB0 00114CB0 0F000000 */  sync
.L00114CB4:
/* 14DB4 00114CB4 0F000000 */  sync
/* 14DB8 00114CB8 0100D0BC */  cache      0x10, 0x1($6) # handwritten instruction
/* 14DBC 00114CBC 0F000000 */  sync
/* 14DC0 00114CC0 00E00240 */  mfc0       $2, $28 # handwritten instruction
/* 14DC4 00114CC4 24104700 */  and        $2, $2, $7
/* 14DC8 00114CC8 21104600 */  addu       $2, $2, $6
/* 14DCC 00114CCC 2B18A200 */  sltu       $3, $5, $2
/* 14DD0 00114CD0 2B104400 */  sltu       $2, $2, $4
/* 14DD4 00114CD4 06004014 */  bnez       $2, .L00114CF0
/* 14DD8 00114CD8 00000000 */   nop
/* 14DDC 00114CDC 04006014 */  bnez       $3, .L00114CF0
/* 14DE0 00114CE0 00000000 */   nop
/* 14DE4 00114CE4 0F000000 */  sync
/* 14DE8 00114CE8 0100D6BC */  cache      0x16, 0x1($6) # handwritten instruction
/* 14DEC 00114CEC 0F000000 */  sync
.L00114CF0:
/* 14DF0 00114CF0 0F000000 */  sync
/* 14DF4 00114CF4 4000C624 */  addiu      $6, $6, 0x40
/* 14DF8 00114CF8 0010C228 */  slti       $2, $6, 0x1000
/* 14DFC 00114CFC DEFF4014 */  bnez       $2, .L00114C78
/* 14E00 00114D00 00000000 */   nop
/* 14E04 00114D04 0800E003 */  jr         $31
/* 14E08 00114D08 00000000 */   nop
/* 14E0C 00114D0C 00000000 */  nop
