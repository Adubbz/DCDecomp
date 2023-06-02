.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitAllHaveData__Fv
/* E70D0 001E6FD0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E70D4 001E6FD4 0000BF7F */  sq         $31, 0x0($sp)
/* E70D8 001E6FD8 B894848F */  lw         $4, -0x6B48($gp)
/* E70DC 001E6FDC 10B9080C */  jal        InitHaveData__FP9IHAVEITEM
/* E70E0 001E6FE0 00000000 */   nop
/* E70E4 001E6FE4 BC94848F */  lw         $4, -0x6B44($gp)
/* E70E8 001E6FE8 1CB9080C */  jal        InitHaveWep__FP11WEAPON_HAVE
/* E70EC 001E6FEC 00000000 */   nop
/* E70F0 001E6FF0 C094848F */  lw         $4, -0x6B40($gp)
/* E70F4 001E6FF4 2CB9080C */  jal        InitHaveAttach__FP11ATTACH_LIST
/* E70F8 001E6FF8 00000000 */   nop
/* E70FC 001E6FFC B894838F */  lw         $3, -0x6B48($gp)
/* E7100 001E7000 000060AC */  sw         $0, 0x0($3)
/* E7104 001E7004 0000BF7B */  lq         $31, 0x0($sp)
/* E7108 001E7008 1000BD27 */  addiu      $sp, $sp, 0x10
/* E710C 001E700C 0800E003 */  jr         $31
/* E7110 001E7010 00000000 */   nop
/* E7114 001E7014 00000000 */  nop
/* E7118 001E7018 00000000 */  nop
/* E711C 001E701C 00000000 */  nop
