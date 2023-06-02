.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckAreaRect__9CEditAreaFfffii
/* 6F240 0016F140 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 6F244 0016F144 3000BF7F */  sq         $31, 0x30($sp)
/* 6F248 0016F148 2000B27F */  sq         $18, 0x20($sp)
/* 6F24C 0016F14C 1000B17F */  sq         $17, 0x10($sp)
/* 6F250 0016F150 0000B07F */  sq         $16, 0x0($sp)
/* 6F254 0016F154 288E8070 */  paddub     $17, $4, $0
/* 6F258 0016F158 2896A070 */  paddub     $18, $5, $0
/* 6F25C 0016F15C 2886C070 */  paddub     $16, $6, $0
/* 6F260 0016F160 4000A527 */  addiu      $5, $sp, 0x40
/* 6F264 0016F164 20B6050C */  jal        GetPos__9CEditAreaFP11CVector3_i_fff
/* 6F268 0016F168 00000000 */   nop
/* 6F26C 0016F16C 43181200 */  sra        $3, $18, 1
/* 6F270 0016F170 4000A28F */  lw         $2, 0x40($sp)
/* 6F274 0016F174 23284300 */  subu       $5, $2, $3
/* 6F278 0016F178 21104502 */  addu       $2, $18, $5
/* 6F27C 0016F17C FFFF4424 */  addiu      $4, $2, -0x1
/* 6F280 0016F180 43181000 */  sra        $3, $16, 1
/* 6F284 0016F184 4800A28F */  lw         $2, 0x48($sp)
/* 6F288 0016F188 23304300 */  subu       $6, $2, $3
/* 6F28C 0016F18C 21100602 */  addu       $2, $16, $6
/* 6F290 0016F190 FFFF4324 */  addiu      $3, $2, -0x1
/* 6F294 0016F194 0300A004 */  bltz       $5, .L0016F1A4
/* 6F298 0016F198 00000000 */   nop
/* 6F29C 0016F19C 0400C104 */  bgez       $6, .L0016F1B0
/* 6F2A0 0016F1A0 00000000 */   nop
.L0016F1A4:
/* 6F2A4 0016F1A4 28160070 */  paddub     $2, $0, $0
/* 6F2A8 0016F1A8 0D000010 */  b          .L0016F1E0
/* 6F2AC 0016F1AC 00000000 */   nop
.L0016F1B0:
/* 6F2B0 0016F1B0 0800228E */  lw         $2, 0x8($17)
/* 6F2B4 0016F1B4 2A088200 */  slt        $at, $4, $2
/* 6F2B8 0016F1B8 05002010 */  beqz       $at, .L0016F1D0
/* 6F2BC 0016F1BC 00000000 */   nop
/* 6F2C0 0016F1C0 0C00228E */  lw         $2, 0xC($17)
/* 6F2C4 0016F1C4 2A106200 */  slt        $2, $3, $2
/* 6F2C8 0016F1C8 04004014 */  bnez       $2, .L0016F1DC
/* 6F2CC 0016F1CC 00000000 */   nop
.L0016F1D0:
/* 6F2D0 0016F1D0 28160070 */  paddub     $2, $0, $0
/* 6F2D4 0016F1D4 02000010 */  b          .L0016F1E0
/* 6F2D8 0016F1D8 00000000 */   nop
.L0016F1DC:
/* 6F2DC 0016F1DC 01000224 */  addiu      $2, $0, 0x1
.L0016F1E0:
/* 6F2E0 0016F1E0 3000BF7B */  lq         $31, 0x30($sp)
/* 6F2E4 0016F1E4 2000B27B */  lq         $18, 0x20($sp)
/* 6F2E8 0016F1E8 1000B17B */  lq         $17, 0x10($sp)
/* 6F2EC 0016F1EC 0000B07B */  lq         $16, 0x0($sp)
/* 6F2F0 0016F1F0 5000BD27 */  addiu      $sp, $sp, 0x50
/* 6F2F4 0016F1F4 0800E003 */  jr         $31
/* 6F2F8 0016F1F8 00000000 */   nop
/* 6F2FC 0016F1FC 00000000 */  nop
