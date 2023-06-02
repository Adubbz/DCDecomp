.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_CAMERA_REF__FP12RS_STACKDATAi
/* 91D90 00191C90 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 91D94 00191C94 2000BF7F */  sq         $31, 0x20($sp)
/* 91D98 00191C98 1000B17F */  sq         $17, 0x10($sp)
/* 91D9C 00191C9C 0000B07F */  sq         $16, 0x0($sp)
/* 91DA0 00191CA0 288E8070 */  paddub     $17, $4, $0
/* 91DA4 00191CA4 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 91DA8 00191CA8 10D2308C */  lw         $16, -0x2DF0($at)
/* 91DAC 00191CAC 04000016 */  bnez       $16, .L00191CC0
/* 91DB0 00191CB0 00000000 */   nop
/* 91DB4 00191CB4 28160070 */  paddub     $2, $0, $0
/* 91DB8 00191CB8 11000010 */  b          .L00191D00
/* 91DBC 00191CBC 00000000 */   nop
.L00191CC0:
/* 91DC0 00191CC0 489280AF */  sw         $0, -0x6DB8($gp)
/* 91DC4 00191CC4 28260072 */  paddub     $4, $16, $0
/* 91DC8 00191CC8 C492040C */  jal        FollowOff__13CCameraFollowFv
/* 91DCC 00191CCC 00000000 */   nop
/* 91DD0 00191CD0 28262072 */  paddub     $4, $17, $0
/* 91DD4 00191CD4 3000A527 */  addiu      $5, $sp, 0x30
/* 91DD8 00191CD8 7C2D060C */  jal        GetPosition__FP12RS_STACKDATAPf
/* 91DDC 00191CDC 00000000 */   nop
/* 91DE0 00191CE0 28260072 */  paddub     $4, $16, $0
/* 91DE4 00191CE4 282E0070 */  paddub     $5, $0, $0
/* 91DE8 00191CE8 3000ACC7 */  lwc1       $f12, 0x30($sp)
/* 91DEC 00191CEC 3400ADC7 */  lwc1       $f13, 0x34($sp)
/* 91DF0 00191CF0 3800AEC7 */  lwc1       $f14, 0x38($sp)
/* 91DF4 00191CF4 E090040C */  jal        SetNextRef__7CCameraFP6CFramefff
/* 91DF8 00191CF8 00000000 */   nop
/* 91DFC 00191CFC 01000224 */  addiu      $2, $0, 0x1
.L00191D00:
/* 91E00 00191D00 2000BF7B */  lq         $31, 0x20($sp)
/* 91E04 00191D04 1000B17B */  lq         $17, 0x10($sp)
/* 91E08 00191D08 0000B07B */  lq         $16, 0x0($sp)
/* 91E0C 00191D0C 4000BD27 */  addiu      $sp, $sp, 0x40
/* 91E10 00191D10 0800E003 */  jr         $31
/* 91E14 00191D14 00000000 */   nop
/* 91E18 00191D18 00000000 */  nop
/* 91E1C 00191D1C 00000000 */  nop
