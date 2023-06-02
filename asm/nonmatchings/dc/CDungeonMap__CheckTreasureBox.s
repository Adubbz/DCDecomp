.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckTreasureBox__11CDungeonMapFPff
/* C7FE0 001C7EE0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* C7FE4 001C7EE4 4000BF7F */  sq         $31, 0x40($sp)
/* C7FE8 001C7EE8 3000B27F */  sq         $18, 0x30($sp)
/* C7FEC 001C7EEC 2000B17F */  sq         $17, 0x20($sp)
/* C7FF0 001C7EF0 1000B07F */  sq         $16, 0x10($sp)
/* C7FF4 001C7EF4 0000B4E7 */  swc1       $f20, 0x0($sp)
/* C7FF8 001C7EF8 28968070 */  paddub     $18, $4, $0
/* C7FFC 001C7EFC 288EA070 */  paddub     $17, $5, $0
/* C8000 001C7F00 06650046 */  mov.s      $f20, $f12
/* C8004 001C7F04 28860070 */  paddub     $16, $0, $0
/* C8008 001C7F08 15000010 */  b          .L001C7F60
/* C800C 001C7F0C 00000000 */   nop
.L001C7F10:
/* C8010 001C7F10 80111000 */  sll        $2, $16, 6
/* C8014 001C7F14 21185200 */  addu       $3, $2, $18
/* C8018 001C7F18 0100013C */  lui        $at, (0x10000 >> 16)
/* C801C 001C7F1C 21086100 */  addu       $at, $3, $at
/* C8020 001C7F20 60B6228C */  lw         $2, -0x49A0($at)
/* C8024 001C7F24 0D004010 */  beqz       $2, .L001C7F5C
/* C8028 001C7F28 00000000 */   nop
/* C802C 001C7F2C 78366424 */  addiu      $4, $3, 0x3678
/* C8030 001C7F30 F87F8424 */  addiu      $4, $4, 0x7FF8
/* C8034 001C7F34 282E2072 */  paddub     $5, $17, $0
/* C8038 001C7F38 648D040C */  jal        DistVector__FPfPf
/* C803C 001C7F3C 00000000 */   nop
/* C8040 001C7F40 34001446 */  c.lt.s     $f0, $f20
/* C8044 001C7F44 00000000 */  nop
/* C8048 001C7F48 04000045 */  bc1f       .L001C7F5C
/* C804C 001C7F4C 00000000 */   nop
/* C8050 001C7F50 28160070 */  paddub     $2, $0, $0
/* C8054 001C7F54 09000010 */  b          .L001C7F7C
/* C8058 001C7F58 00000000 */   nop
.L001C7F5C:
/* C805C 001C7F5C 01001026 */  addiu      $16, $16, 0x1
.L001C7F60:
/* C8060 001C7F60 0100013C */  lui        $at, (0x10000 >> 16)
/* C8064 001C7F64 21084102 */  addu       $at, $18, $at
/* C8068 001C7F68 60BC228C */  lw         $2, -0x43A0($at)
/* C806C 001C7F6C 2A100202 */  slt        $2, $16, $2
/* C8070 001C7F70 E7FF4014 */  bnez       $2, .L001C7F10
/* C8074 001C7F74 00000000 */   nop
/* C8078 001C7F78 01000224 */  addiu      $2, $0, 0x1
.L001C7F7C:
/* C807C 001C7F7C 4000BF7B */  lq         $31, 0x40($sp)
/* C8080 001C7F80 3000B27B */  lq         $18, 0x30($sp)
/* C8084 001C7F84 2000B17B */  lq         $17, 0x20($sp)
/* C8088 001C7F88 1000B07B */  lq         $16, 0x10($sp)
/* C808C 001C7F8C 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* C8090 001C7F90 5000BD27 */  addiu      $sp, $sp, 0x50
/* C8094 001C7F94 0800E003 */  jr         $31
/* C8098 001C7F98 00000000 */   nop
/* C809C 001C7F9C 00000000 */  nop
