.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_CAMERA_POS__FP12RS_STACKDATAi
/* 091C80 00191B80 C0FFBD27 */  addiu       $29, $29, -0x40
/* 091C84 00191B84 2000BF7F */  sq          $31, 0x20($29)
/* 091C88 00191B88 1000B17F */  sq          $17, 0x10($29)
/* 091C8C 00191B8C 0000B07F */  sq          $16, 0x0($29)
/* 091C90 00191B90 288E8070 */  paddub      $17, $4, $0
/* 091C94 00191B94 D401013C */  lui         $1, %hi(EdEventInfo + 0x40)
/* 091C98 00191B98 10D2308C */  lw          $16, %lo(EdEventInfo + 0x40)($1)
/* 091C9C 00191B9C 04000016 */  bnez        $16, .L00191BB0
/* 091CA0 00191BA0 00000000 */   nop
/* 091CA4 00191BA4 28160070 */  paddub      $2, $0, $0
/* 091CA8 00191BA8 11000010 */  b           .L00191BF0
/* 091CAC 00191BAC 00000000 */   nop
.L00191BB0:
/* 091CB0 00191BB0 489280AF */  sw          $0, -0x6DB8($28)
/* 091CB4 00191BB4 28260072 */  paddub      $4, $16, $0
/* 091CB8 00191BB8 C492040C */  jal         FollowOff__13CCameraFollowFv
/* 091CBC 00191BBC 00000000 */   nop
/* 091CC0 00191BC0 28262072 */  paddub      $4, $17, $0
/* 091CC4 00191BC4 3000A527 */  addiu       $5, $29, 0x30
/* 091CC8 00191BC8 7C2D060C */  jal         GetPosition__FP12RS_STACKDATAPf
/* 091CCC 00191BCC 00000000 */   nop
/* 091CD0 00191BD0 28260072 */  paddub      $4, $16, $0
/* 091CD4 00191BD4 282E0070 */  paddub      $5, $0, $0
/* 091CD8 00191BD8 3000ACC7 */  lwc1        $f12, 0x30($29)
/* 091CDC 00191BDC 3400ADC7 */  lwc1        $f13, 0x34($29)
/* 091CE0 00191BE0 3800AEC7 */  lwc1        $f14, 0x38($29)
/* 091CE4 00191BE4 B490040C */  jal         SetNextPos__7CCameraFP6CFramefff
/* 091CE8 00191BE8 00000000 */   nop
/* 091CEC 00191BEC 01000224 */  addiu       $2, $0, 0x1
.L00191BF0:
/* 091CF0 00191BF0 2000BF7B */  lq          $31, 0x20($29)
/* 091CF4 00191BF4 1000B17B */  lq          $17, 0x10($29)
/* 091CF8 00191BF8 0000B07B */  lq          $16, 0x0($29)
/* 091CFC 00191BFC 4000BD27 */  addiu       $29, $29, 0x40
/* 091D00 00191C00 0800E003 */  jr          $31
/* 091D04 00191C04 00000000 */   nop
/* 091D08 00191C08 00000000 */  nop
/* 091D0C 00191C0C 00000000 */  nop
