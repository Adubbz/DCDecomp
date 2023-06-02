.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckAtra__11CDungeonMapFPff
/* C80A0 001C7FA0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* C80A4 001C7FA4 4000BF7F */  sq         $31, 0x40($sp)
/* C80A8 001C7FA8 3000B27F */  sq         $18, 0x30($sp)
/* C80AC 001C7FAC 2000B17F */  sq         $17, 0x20($sp)
/* C80B0 001C7FB0 1000B07F */  sq         $16, 0x10($sp)
/* C80B4 001C7FB4 0000B4E7 */  swc1       $f20, 0x0($sp)
/* C80B8 001C7FB8 288E8070 */  paddub     $17, $4, $0
/* C80BC 001C7FBC 2886A070 */  paddub     $16, $5, $0
/* C80C0 001C7FC0 06650046 */  mov.s      $f20, $f12
/* C80C4 001C7FC4 A49D828F */  lw         $2, -0x625C($gp)
/* C80C8 001C7FC8 06004228 */  slti       $2, $2, 0x6
/* C80CC 001C7FCC 04004014 */  bnez       $2, .L001C7FE0
/* C80D0 001C7FD0 00000000 */   nop
/* C80D4 001C7FD4 01000224 */  addiu      $2, $0, 0x1
/* C80D8 001C7FD8 1F000010 */  b          .L001C8058
/* C80DC 001C7FDC 00000000 */   nop
.L001C7FE0:
/* C80E0 001C7FE0 28960070 */  paddub     $18, $0, $0
/* C80E4 001C7FE4 15000010 */  b          .L001C803C
/* C80E8 001C7FE8 00000000 */   nop
.L001C7FEC:
/* C80EC 001C7FEC 40111200 */  sll        $2, $18, 5
/* C80F0 001C7FF0 21185100 */  addu       $3, $2, $17
/* C80F4 001C7FF4 0100013C */  lui        $at, (0x10000 >> 16)
/* C80F8 001C7FF8 21086100 */  addu       $at, $3, $at
/* C80FC 001C7FFC 94BC228C */  lw         $2, -0x436C($at)
/* C8100 001C8000 0D004010 */  beqz       $2, .L001C8038
/* C8104 001C8004 00000000 */   nop
/* C8108 001C8008 883C6424 */  addiu      $4, $3, 0x3C88
/* C810C 001C800C F87F8424 */  addiu      $4, $4, 0x7FF8
/* C8110 001C8010 282E0072 */  paddub     $5, $16, $0
/* C8114 001C8014 648D040C */  jal        DistVector__FPfPf
/* C8118 001C8018 00000000 */   nop
/* C811C 001C801C 34001446 */  c.lt.s     $f0, $f20
/* C8120 001C8020 00000000 */  nop
/* C8124 001C8024 04000045 */  bc1f       .L001C8038
/* C8128 001C8028 00000000 */   nop
/* C812C 001C802C 28160070 */  paddub     $2, $0, $0
/* C8130 001C8030 09000010 */  b          .L001C8058
/* C8134 001C8034 00000000 */   nop
.L001C8038:
/* C8138 001C8038 01005226 */  addiu      $18, $18, 0x1
.L001C803C:
/* C813C 001C803C 0100013C */  lui        $at, (0x10000 >> 16)
/* C8140 001C8040 21082102 */  addu       $at, $17, $at
/* C8144 001C8044 80BD228C */  lw         $2, -0x4280($at)
/* C8148 001C8048 2A104202 */  slt        $2, $18, $2
/* C814C 001C804C E7FF4014 */  bnez       $2, .L001C7FEC
/* C8150 001C8050 00000000 */   nop
/* C8154 001C8054 01000224 */  addiu      $2, $0, 0x1
.L001C8058:
/* C8158 001C8058 4000BF7B */  lq         $31, 0x40($sp)
/* C815C 001C805C 3000B27B */  lq         $18, 0x30($sp)
/* C8160 001C8060 2000B17B */  lq         $17, 0x20($sp)
/* C8164 001C8064 1000B07B */  lq         $16, 0x10($sp)
/* C8168 001C8068 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* C816C 001C806C 5000BD27 */  addiu      $sp, $sp, 0x50
/* C8170 001C8070 0800E003 */  jr         $31
/* C8174 001C8074 00000000 */   nop
/* C8178 001C8078 00000000 */  nop
/* C817C 001C807C 00000000 */  nop
