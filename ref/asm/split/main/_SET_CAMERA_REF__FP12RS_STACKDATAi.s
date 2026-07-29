.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_CAMERA_REF__FP12RS_STACKDATAi
/* 091D90 00191C90 C0FFBD27 */  addiu       $29, $29, -0x40
/* 091D94 00191C94 2000BF7F */  sq          $31, 0x20($29)
/* 091D98 00191C98 1000B17F */  sq          $17, 0x10($29)
/* 091D9C 00191C9C 0000B07F */  sq          $16, 0x0($29)
/* 091DA0 00191CA0 288E8070 */  paddub      $17, $4, $0
/* 091DA4 00191CA4 D401013C */  lui         $1, %hi(EdEventInfo + 0x40)
/* 091DA8 00191CA8 10D2308C */  lw          $16, %lo(EdEventInfo + 0x40)($1)
/* 091DAC 00191CAC 04000016 */  bnez        $16, .L00191CC0
/* 091DB0 00191CB0 00000000 */   nop
/* 091DB4 00191CB4 28160070 */  paddub      $2, $0, $0
/* 091DB8 00191CB8 11000010 */  b           .L00191D00
/* 091DBC 00191CBC 00000000 */   nop
.L00191CC0:
/* 091DC0 00191CC0 489280AF */  sw          $0, -0x6DB8($28)
/* 091DC4 00191CC4 28260072 */  paddub      $4, $16, $0
/* 091DC8 00191CC8 C492040C */  jal         FollowOff__13CCameraFollowFv
/* 091DCC 00191CCC 00000000 */   nop
/* 091DD0 00191CD0 28262072 */  paddub      $4, $17, $0
/* 091DD4 00191CD4 3000A527 */  addiu       $5, $29, 0x30
/* 091DD8 00191CD8 7C2D060C */  jal         GetPosition__FP12RS_STACKDATAPf
/* 091DDC 00191CDC 00000000 */   nop
/* 091DE0 00191CE0 28260072 */  paddub      $4, $16, $0
/* 091DE4 00191CE4 282E0070 */  paddub      $5, $0, $0
/* 091DE8 00191CE8 3000ACC7 */  lwc1        $f12, 0x30($29)
/* 091DEC 00191CEC 3400ADC7 */  lwc1        $f13, 0x34($29)
/* 091DF0 00191CF0 3800AEC7 */  lwc1        $f14, 0x38($29)
/* 091DF4 00191CF4 E090040C */  jal         SetNextRef__7CCameraFP6CFramefff
/* 091DF8 00191CF8 00000000 */   nop
/* 091DFC 00191CFC 01000224 */  addiu       $2, $0, 0x1
.L00191D00:
/* 091E00 00191D00 2000BF7B */  lq          $31, 0x20($29)
/* 091E04 00191D04 1000B17B */  lq          $17, 0x10($29)
/* 091E08 00191D08 0000B07B */  lq          $16, 0x0($29)
/* 091E0C 00191D0C 4000BD27 */  addiu       $29, $29, 0x40
/* 091E10 00191D10 0800E003 */  jr          $31
/* 091E14 00191D14 00000000 */   nop
/* 091E18 00191D18 00000000 */  nop
/* 091E1C 00191D1C 00000000 */  nop
