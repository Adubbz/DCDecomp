.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetActiveIvent__11CDungeonMapFP9CFrameVu1
/* C8FD0 001C8ED0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* C8FD4 001C8ED4 3000BF7F */  sq         $31, 0x30($sp)
/* C8FD8 001C8ED8 2000B27F */  sq         $18, 0x20($sp)
/* C8FDC 001C8EDC 1000B17F */  sq         $17, 0x10($sp)
/* C8FE0 001C8EE0 0000B07F */  sq         $16, 0x0($sp)
/* C8FE4 001C8EE4 288E8070 */  paddub     $17, $4, $0
/* C8FE8 001C8EE8 4000A427 */  addiu      $4, $sp, 0x40
/* C8FEC 001C8EEC 2002A524 */  addiu      $5, $5, 0x220
/* C8FF0 001C8EF0 0C86040C */  jal        sceVu0CopyVector
/* C8FF4 001C8EF4 00000000 */   nop
/* C8FF8 001C8EF8 A042023C */  lui        $2, (0x42A00000 >> 16)
/* C8FFC 001C8EFC 00088244 */  mtc1       $2, $f1
/* C9000 001C8F00 4000A0C7 */  lwc1       $f0, 0x40($sp)
/* C9004 001C8F04 000B0046 */  add.s      $f12, $f1, $f0
/* C9008 001C8F08 2C44040C */  jal        fptosi
/* C900C 001C8F0C 00000000 */   nop
/* C9010 001C8F10 00008244 */  mtc1       $2, $f0
/* C9014 001C8F14 00000000 */  nop
/* C9018 001C8F18 60008046 */  cvt.s.w    $f1, $f0
/* C901C 001C8F1C 2043023C */  lui        $2, (0x43200000 >> 16)
/* C9020 001C8F20 00008244 */  mtc1       $2, $f0
/* C9024 001C8F24 00000000 */  nop
/* C9028 001C8F28 030B0046 */  div.s      $f12, $f1, $f0
/* C902C 001C8F2C 2C44040C */  jal        fptosi
/* C9030 001C8F30 00000000 */   nop
/* C9034 001C8F34 A042023C */  lui        $2, (0x42A00000 >> 16)
/* C9038 001C8F38 00088244 */  mtc1       $2, $f1
/* C903C 001C8F3C 4800A0C7 */  lwc1       $f0, 0x48($sp)
/* C9040 001C8F40 000B0046 */  add.s      $f12, $f1, $f0
/* C9044 001C8F44 2C44040C */  jal        fptosi
/* C9048 001C8F48 00000000 */   nop
/* C904C 001C8F4C 00008244 */  mtc1       $2, $f0
/* C9050 001C8F50 00000000 */  nop
/* C9054 001C8F54 60008046 */  cvt.s.w    $f1, $f0
/* C9058 001C8F58 2043023C */  lui        $2, (0x43200000 >> 16)
/* C905C 001C8F5C 00008244 */  mtc1       $2, $f0
/* C9060 001C8F60 00000000 */  nop
/* C9064 001C8F64 030B0046 */  div.s      $f12, $f1, $f0
/* C9068 001C8F68 2C44040C */  jal        fptosi
/* C906C 001C8F6C 00000000 */   nop
/* C9070 001C8F70 28860070 */  paddub     $16, $0, $0
/* C9074 001C8F74 1C000010 */  b          .L001C8FE8
/* C9078 001C8F78 00000000 */   nop
.L001C8F7C:
/* C907C 001C8F7C 80101000 */  sll        $2, $16, 2
/* C9080 001C8F80 21105000 */  addu       $2, $2, $16
/* C9084 001C8F84 00910200 */  sll        $18, $2, 4
/* C9088 001C8F88 21205102 */  addu       $4, $18, $17
/* C908C 001C8F8C 0100013C */  lui        $at, (0x10000 >> 16)
/* C9090 001C8F90 21088100 */  addu       $at, $4, $at
/* C9094 001C8F94 588D238C */  lw         $3, -0x72A8($at)
/* C9098 001C8F98 FFFF0224 */  addiu      $2, $0, -0x1
/* C909C 001C8F9C 11006210 */  beq        $3, $2, .L001C8FE4
/* C90A0 001C8FA0 00000000 */   nop
/* C90A4 001C8FA4 680D8424 */  addiu      $4, $4, 0xD68
/* C90A8 001C8FA8 F87F8424 */  addiu      $4, $4, 0x7FF8
/* C90AC 001C8FAC 4000A527 */  addiu      $5, $sp, 0x40
/* C90B0 001C8FB0 648D040C */  jal        DistVector__FPfPf
/* C90B4 001C8FB4 00000000 */   nop
/* C90B8 001C8FB8 21105102 */  addu       $2, $18, $17
/* C90BC 001C8FBC 0100013C */  lui        $at, (0x10000 >> 16)
/* C90C0 001C8FC0 21084100 */  addu       $at, $2, $at
/* C90C4 001C8FC4 748D21C4 */  lwc1       $f1, -0x728C($at)
/* C90C8 001C8FC8 36000146 */  c.le.s     $f0, $f1
/* C90CC 001C8FCC 00000000 */  nop
/* C90D0 001C8FD0 04000045 */  bc1f       .L001C8FE4
/* C90D4 001C8FD4 00000000 */   nop
/* C90D8 001C8FD8 28160072 */  paddub     $2, $16, $0
/* C90DC 001C8FDC 06000010 */  b          .L001C8FF8
/* C90E0 001C8FE0 00000000 */   nop
.L001C8FE4:
/* C90E4 001C8FE4 01001026 */  addiu      $16, $16, 0x1
.L001C8FE8:
/* C90E8 001C8FE8 3000022A */  slti       $2, $16, 0x30
/* C90EC 001C8FEC E3FF4014 */  bnez       $2, .L001C8F7C
/* C90F0 001C8FF0 00000000 */   nop
/* C90F4 001C8FF4 FFFF0224 */  addiu      $2, $0, -0x1
.L001C8FF8:
/* C90F8 001C8FF8 3000BF7B */  lq         $31, 0x30($sp)
/* C90FC 001C8FFC 2000B27B */  lq         $18, 0x20($sp)
/* C9100 001C9000 1000B17B */  lq         $17, 0x10($sp)
/* C9104 001C9004 0000B07B */  lq         $16, 0x0($sp)
/* C9108 001C9008 5000BD27 */  addiu      $sp, $sp, 0x50
/* C910C 001C900C 0800E003 */  jr         $31
/* C9110 001C9010 00000000 */   nop
/* C9114 001C9014 00000000 */  nop
/* C9118 001C9018 00000000 */  nop
/* C911C 001C901C 00000000 */  nop
