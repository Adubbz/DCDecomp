.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawBaseGround__11CEditGroundFv
/* A2FA0 001A2EA0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* A2FA4 001A2EA4 2000BF7F */  sq         $31, 0x20($sp)
/* A2FA8 001A2EA8 1000B17F */  sq         $17, 0x10($sp)
/* A2FAC 001A2EAC 0000B07F */  sq         $16, 0x0($sp)
/* A2FB0 001A2EB0 288E8070 */  paddub     $17, $4, $0
/* A2FB4 001A2EB4 28860070 */  paddub     $16, $0, $0
/* A2FB8 001A2EB8 09000010 */  b          .L001A2EE0
/* A2FBC 001A2EBC 00000000 */   nop
.L001A2EC0:
/* A2FC0 001A2EC0 80181000 */  sll        $3, $16, 2
/* A2FC4 001A2EC4 21187100 */  addu       $3, $3, $17
/* A2FC8 001A2EC8 0400648C */  lw         $4, 0x4($3)
/* A2FCC 001A2ECC 07008010 */  beqz       $4, .L001A2EEC
/* A2FD0 001A2ED0 00000000 */   nop
/* A2FD4 001A2ED4 BCBF050C */  jal        DrawGrid__9CEditAreaFv
/* A2FD8 001A2ED8 00000000 */   nop
/* A2FDC 001A2EDC 01001026 */  addiu      $16, $16, 0x1
.L001A2EE0:
/* A2FE0 001A2EE0 0400032A */  slti       $3, $16, 0x4
/* A2FE4 001A2EE4 F6FF6014 */  bnez       $3, .L001A2EC0
/* A2FE8 001A2EE8 00000000 */   nop
.L001A2EEC:
/* A2FEC 001A2EEC 2000BF7B */  lq         $31, 0x20($sp)
/* A2FF0 001A2EF0 1000B17B */  lq         $17, 0x10($sp)
/* A2FF4 001A2EF4 0000B07B */  lq         $16, 0x0($sp)
/* A2FF8 001A2EF8 3000BD27 */  addiu      $sp, $sp, 0x30
/* A2FFC 001A2EFC 0800E003 */  jr         $31
/* A3000 001A2F00 00000000 */   nop
/* A3004 001A2F04 00000000 */  nop
/* A3008 001A2F08 00000000 */  nop
/* A300C 001A2F0C 00000000 */  nop
