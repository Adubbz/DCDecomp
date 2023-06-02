.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SyncChara__10CActionSeqFP10CCharacter
/* 54D70 00154C70 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 54D74 00154C74 2000BF7F */  sq         $31, 0x20($sp)
/* 54D78 00154C78 1000B17F */  sq         $17, 0x10($sp)
/* 54D7C 00154C7C 0000B07F */  sq         $16, 0x0($sp)
/* 54D80 00154C80 288E8070 */  paddub     $17, $4, $0
/* 54D84 00154C84 2886A070 */  paddub     $16, $5, $0
/* 54D88 00154C88 CC0090AC */  sw         $16, 0xCC($4)
/* 54D8C 00154C8C 15000012 */  beqz       $16, .L00154CE4
/* 54D90 00154C90 00000000 */   nop
/* 54D94 00154C94 28260072 */  paddub     $4, $16, $0
/* 54D98 00154C98 3000A527 */  addiu      $5, $sp, 0x30
/* 54D9C 00154C9C A000198E */  lw         $25, 0xA0($16)
/* 54DA0 00154CA0 A000398F */  lw         $25, 0xA0($25)
/* 54DA4 00154CA4 09F82003 */  jalr       $25
/* 54DA8 00154CA8 00000000 */   nop
/* 54DAC 00154CAC 28260072 */  paddub     $4, $16, $0
/* 54DB0 00154CB0 4000A527 */  addiu      $5, $sp, 0x40
/* 54DB4 00154CB4 A000198E */  lw         $25, 0xA0($16)
/* 54DB8 00154CB8 5800398F */  lw         $25, 0x58($25)
/* 54DBC 00154CBC 09F82003 */  jalr       $25
/* 54DC0 00154CC0 00000000 */   nop
/* 54DC4 00154CC4 28262072 */  paddub     $4, $17, $0
/* 54DC8 00154CC8 3000A527 */  addiu      $5, $sp, 0x30
/* 54DCC 00154CCC F053050C */  jal        SetPos__10CActionSeqFPf
/* 54DD0 00154CD0 00000000 */   nop
/* 54DD4 00154CD4 28262072 */  paddub     $4, $17, $0
/* 54DD8 00154CD8 4000A527 */  addiu      $5, $sp, 0x40
/* 54DDC 00154CDC 7854050C */  jal        SetRot__10CActionSeqFPf
/* 54DE0 00154CE0 00000000 */   nop
.L00154CE4:
/* 54DE4 00154CE4 2000BF7B */  lq         $31, 0x20($sp)
/* 54DE8 00154CE8 1000B17B */  lq         $17, 0x10($sp)
/* 54DEC 00154CEC 0000B07B */  lq         $16, 0x0($sp)
/* 54DF0 00154CF0 5000BD27 */  addiu      $sp, $sp, 0x50
/* 54DF4 00154CF4 0800E003 */  jr         $31
/* 54DF8 00154CF8 00000000 */   nop
/* 54DFC 00154CFC 00000000 */  nop
