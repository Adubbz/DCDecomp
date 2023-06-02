.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel topThread
/* 151D8 001150D8 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 151DC 001150DC 4000B4FF */  sd         $20, 0x40($sp)
/* 151E0 001150E0 3000B3FF */  sd         $19, 0x30($sp)
/* 151E4 001150E4 2A00143C */  lui        $20, (0x2A53A8 >> 16)
/* 151E8 001150E8 2000B2FF */  sd         $18, 0x20($sp)
/* 151EC 001150EC 2900133C */  lui        $19, %hi(D_00297E70)
/* 151F0 001150F0 1000B1FF */  sd         $17, 0x10($sp)
/* 151F4 001150F4 01001224 */  addiu      $18, $0, 0x1
/* 151F8 001150F8 0000B0FF */  sd         $16, 0x0($sp)
/* 151FC 001150FC 02001124 */  addiu      $17, $0, 0x2
/* 15200 00115100 5000BFFF */  sd         $31, 0x50($sp)
/* 15204 00115104 2D808000 */  daddu      $16, $4, $0
.L00115108:
/* 15208 00115108 D850040C */  jal        WaitSema
/* 1520C 0011510C A853848E */   lw        $4, (0x2A53A8 & 0xFFFF)($20)
/* 15210 00115110 0000028E */  lw         $2, 0x0($16)
/* 15214 00115114 0F005210 */  beq        $2, $18, .L00115154
/* 15218 00115118 02004328 */   slti      $3, $2, 0x2
/* 1521C 0011511C 05006010 */  beqz       $3, .L00115134
/* 15220 00115120 707E6426 */   addiu     $4, $19, %lo(D_00297E70)
/* 15224 00115124 07004010 */  beqz       $2, .L00115144
/* 15228 00115128 00000000 */   nop
/* 1522C 0011512C 11000010 */  b          .L00115174
/* 15230 00115130 00000000 */   nop
.L00115134:
/* 15234 00115134 0B005110 */  beq        $2, $17, .L00115164
/* 15238 00115138 00000000 */   nop
/* 1523C 0011513C 0D000010 */  b          .L00115174
/* 15240 00115140 00000000 */   nop
.L00115144:
/* 15244 00115144 9450040C */  jal        WakeupThread
/* 15248 00115148 0400048E */   lw        $4, 0x4($16)
/* 1524C 0011514C EEFF0010 */  b          .L00115108
/* 15250 00115150 00000000 */   nop
.L00115154:
/* 15254 00115154 7450040C */  jal        RotateThreadReadyQueue
/* 15258 00115158 0400048E */   lw        $4, 0x4($16)
/* 1525C 0011515C EAFF0010 */  b          .L00115108
/* 15260 00115160 00000000 */   nop
.L00115164:
/* 15264 00115164 A450040C */  jal        SuspendThread
/* 15268 00115168 0400048E */   lw        $4, 0x4($16)
/* 1526C 0011516C E6FF0010 */  b          .L00115108
/* 15270 00115170 00000000 */   nop
.L00115174:
/* 15274 00115174 1459040C */  jal        kprintf
/* 15278 00115178 00000000 */   nop
/* 1527C 0011517C E2FF0010 */  b          .L00115108
/* 15280 00115180 00000000 */   nop
/* 15284 00115184 00000000 */  nop
