.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetAlt_i__9CEditAreaFfff
/* 6DF40 0016DE40 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 6DF44 0016DE44 1000BF7F */  sq         $31, 0x10($sp)
/* 6DF48 0016DE48 0000B07F */  sq         $16, 0x0($sp)
/* 6DF4C 0016DE4C 28868070 */  paddub     $16, $4, $0
/* 6DF50 0016DE50 2000A527 */  addiu      $5, $sp, 0x20
/* 6DF54 0016DE54 20B6050C */  jal        GetPos__9CEditAreaFP11CVector3_i_fff
/* 6DF58 0016DE58 00000000 */   nop
/* 6DF5C 0016DE5C 28260072 */  paddub     $4, $16, $0
/* 6DF60 0016DE60 2000A58F */  lw         $5, 0x20($sp)
/* 6DF64 0016DE64 2800A68F */  lw         $6, 0x28($sp)
/* 6DF68 0016DE68 38B7050C */  jal        GetAlt_i__9CEditAreaFii
/* 6DF6C 0016DE6C 00000000 */   nop
/* 6DF70 0016DE70 1000BF7B */  lq         $31, 0x10($sp)
/* 6DF74 0016DE74 0000B07B */  lq         $16, 0x0($sp)
/* 6DF78 0016DE78 3000BD27 */  addiu      $sp, $sp, 0x30
/* 6DF7C 0016DE7C 0800E003 */  jr         $31
/* 6DF80 0016DE80 00000000 */   nop
/* 6DF84 0016DE84 00000000 */  nop
/* 6DF88 0016DE88 00000000 */  nop
/* 6DF8C 0016DE8C 00000000 */  nop
