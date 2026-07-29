.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndBgmSyncBG__Fv
/* 059BB0 00159AB0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 059BB4 00159AB4 0000BF7F */  sq          $31, 0x0($29)
/* 059BB8 00159AB8 388E828F */  lw          $2, -0x71C8($28)
/* 059BBC 00159ABC 04004004 */  bltz        $2, .L00159AD0
/* 059BC0 00159AC0 00000000 */   nop
/* 059BC4 00159AC4 3C8E828F */  lw          $2, -0x71C4($28)
/* 059BC8 00159AC8 04004014 */  bnez        $2, .L00159ADC
/* 059BCC 00159ACC 00000000 */   nop
.L00159AD0:
/* 059BD0 00159AD0 28160070 */  paddub      $2, $0, $0
/* 059BD4 00159AD4 12000010 */  b           .L00159B20
/* 059BD8 00159AD8 00000000 */   nop
.L00159ADC:
/* 059BDC 00159ADC 8CFB040C */  jal         ReadBGSync__Fv
/* 059BE0 00159AE0 00000000 */   nop
/* 059BE4 00159AE4 04004010 */  beqz        $2, .L00159AF8
/* 059BE8 00159AE8 00000000 */   nop
/* 059BEC 00159AEC 01000224 */  addiu       $2, $0, 0x1
/* 059BF0 00159AF0 0B000010 */  b           .L00159B20
/* 059BF4 00159AF4 00000000 */   nop
.L00159AF8:
/* 059BF8 00159AF8 388E848F */  lw          $4, -0x71C8($28)
/* 059BFC 00159AFC 3C8E858F */  lw          $5, -0x71C4($28)
/* 059C00 00159B00 D001023C */  lui         $2, %hi(bgm_cfg_file)
/* 059C04 00159B04 90B44624 */  addiu       $6, $2, %lo(bgm_cfg_file)
/* 059C08 00159B08 0466050C */  jal         SetBGMFile__FiPUiPc
/* 059C0C 00159B0C 00000000 */   nop
/* 059C10 00159B10 FFFF0224 */  addiu       $2, $0, -0x1
/* 059C14 00159B14 388E82AF */  sw          $2, -0x71C8($28)
/* 059C18 00159B18 3C8E80AF */  sw          $0, -0x71C4($28)
/* 059C1C 00159B1C 28160070 */  paddub      $2, $0, $0
.L00159B20:
/* 059C20 00159B20 0000BF7B */  lq          $31, 0x0($29)
/* 059C24 00159B24 1000BD27 */  addiu       $29, $29, 0x10
/* 059C28 00159B28 0800E003 */  jr          $31
/* 059C2C 00159B2C 00000000 */   nop
