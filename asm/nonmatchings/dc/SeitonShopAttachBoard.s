.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SeitonShopAttachBoard__FP11ATTACH_LIST
/* EC180 001EC080 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* EC184 001EC084 2000BF7F */  sq         $31, 0x20($sp)
/* EC188 001EC088 1000B17F */  sq         $17, 0x10($sp)
/* EC18C 001EC08C 0000B07F */  sq         $16, 0x0($sp)
/* EC190 001EC090 288E8070 */  paddub     $17, $4, $0
/* EC194 001EC094 04002016 */  bnez       $17, .L001EC0A8
/* EC198 001EC098 00000000 */   nop
/* EC19C 001EC09C 28160070 */  paddub     $2, $0, $0
/* EC1A0 001EC0A0 16000010 */  b          .L001EC0FC
/* EC1A4 001EC0A4 00000000 */   nop
.L001EC0A8:
/* EC1A8 001EC0A8 28860070 */  paddub     $16, $0, $0
/* EC1AC 001EC0AC 0F000010 */  b          .L001EC0EC
/* EC1B0 001EC0B0 00000000 */   nop
.L001EC0B4:
/* EC1B4 001EC0B4 28262072 */  paddub     $4, $17, $0
/* EC1B8 001EC0B8 D0AF070C */  jal        SeitonShopAttachBoardSub__FP11ATTACH_LIST
/* EC1BC 001EC0BC 00000000 */   nop
/* EC1C0 001EC0C0 0D004014 */  bnez       $2, .L001EC0F8
/* EC1C4 001EC0C4 00000000 */   nop
/* EC1C8 001EC0C8 1488828F */  lw         $2, -0x77EC($gp)
/* EC1CC 001EC0CC 01004224 */  addiu      $2, $2, 0x1
/* EC1D0 001EC0D0 148882AF */  sw         $2, -0x77EC($gp)
/* EC1D4 001EC0D4 1488828F */  lw         $2, -0x77EC($gp)
/* EC1D8 001EC0D8 05004228 */  slti       $2, $2, 0x5
/* EC1DC 001EC0DC 02004014 */  bnez       $2, .L001EC0E8
/* EC1E0 001EC0E0 00000000 */   nop
/* EC1E4 001EC0E4 148880AF */  sw         $0, -0x77EC($gp)
.L001EC0E8:
/* EC1E8 001EC0E8 01001026 */  addiu      $16, $16, 0x1
.L001EC0EC:
/* EC1EC 001EC0EC 0500022A */  slti       $2, $16, 0x5
/* EC1F0 001EC0F0 F0FF4014 */  bnez       $2, .L001EC0B4
/* EC1F4 001EC0F4 00000000 */   nop
.L001EC0F8:
/* EC1F8 001EC0F8 01000224 */  addiu      $2, $0, 0x1
.L001EC0FC:
/* EC1FC 001EC0FC 2000BF7B */  lq         $31, 0x20($sp)
/* EC200 001EC100 1000B17B */  lq         $17, 0x10($sp)
/* EC204 001EC104 0000B07B */  lq         $16, 0x0($sp)
/* EC208 001EC108 3000BD27 */  addiu      $sp, $sp, 0x30
/* EC20C 001EC10C 0800E003 */  jr         $31
/* EC210 001EC110 00000000 */   nop
/* EC214 001EC114 00000000 */  nop
/* EC218 001EC118 00000000 */  nop
/* EC21C 001EC11C 00000000 */  nop
