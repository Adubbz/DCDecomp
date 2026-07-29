.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SyncChara__10CActionSeqFP10CCharacter
/* 054D70 00154C70 B0FFBD27 */  addiu       $29, $29, -0x50
/* 054D74 00154C74 2000BF7F */  sq          $31, 0x20($29)
/* 054D78 00154C78 1000B17F */  sq          $17, 0x10($29)
/* 054D7C 00154C7C 0000B07F */  sq          $16, 0x0($29)
/* 054D80 00154C80 288E8070 */  paddub      $17, $4, $0
/* 054D84 00154C84 2886A070 */  paddub      $16, $5, $0
/* 054D88 00154C88 CC0090AC */  sw          $16, 0xCC($4)
/* 054D8C 00154C8C 15000012 */  beqz        $16, .L00154CE4
/* 054D90 00154C90 00000000 */   nop
/* 054D94 00154C94 28260072 */  paddub      $4, $16, $0
/* 054D98 00154C98 3000A527 */  addiu       $5, $29, 0x30
/* 054D9C 00154C9C A000198E */  lw          $25, 0xA0($16)
/* 054DA0 00154CA0 A000398F */  lw          $25, 0xA0($25)
/* 054DA4 00154CA4 09F82003 */  jalr        $25
/* 054DA8 00154CA8 00000000 */   nop
/* 054DAC 00154CAC 28260072 */  paddub      $4, $16, $0
/* 054DB0 00154CB0 4000A527 */  addiu       $5, $29, 0x40
/* 054DB4 00154CB4 A000198E */  lw          $25, 0xA0($16)
/* 054DB8 00154CB8 5800398F */  lw          $25, 0x58($25)
/* 054DBC 00154CBC 09F82003 */  jalr        $25
/* 054DC0 00154CC0 00000000 */   nop
/* 054DC4 00154CC4 28262072 */  paddub      $4, $17, $0
/* 054DC8 00154CC8 3000A527 */  addiu       $5, $29, 0x30
/* 054DCC 00154CCC F053050C */  jal         SetPos__10CActionSeqFPf
/* 054DD0 00154CD0 00000000 */   nop
/* 054DD4 00154CD4 28262072 */  paddub      $4, $17, $0
/* 054DD8 00154CD8 4000A527 */  addiu       $5, $29, 0x40
/* 054DDC 00154CDC 7854050C */  jal         SetRot__10CActionSeqFPf
/* 054DE0 00154CE0 00000000 */   nop
.L00154CE4:
/* 054DE4 00154CE4 2000BF7B */  lq          $31, 0x20($29)
/* 054DE8 00154CE8 1000B17B */  lq          $17, 0x10($29)
/* 054DEC 00154CEC 0000B07B */  lq          $16, 0x0($29)
/* 054DF0 00154CF0 5000BD27 */  addiu       $29, $29, 0x50
/* 054DF4 00154CF4 0800E003 */  jr          $31
/* 054DF8 00154CF8 00000000 */   nop
/* 054DFC 00154CFC 00000000 */  nop
