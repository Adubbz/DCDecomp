.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitThread
/* 15288 00115188 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 1528C 0011518C 5000B0FF */  sd         $16, 0x50($sp)
/* 15290 00115190 2500103C */  lui        $16, (0x2509E8 >> 16)
/* 15294 00115194 7000BFFF */  sd         $31, 0x70($sp)
/* 15298 00115198 E809028E */  lw         $2, (0x2509E8 & 0xFFFF)($16)
/* 1529C 0011519C 1B00401C */  bgtz       $2, .L0011520C
/* 152A0 001151A0 6000B1FF */   sd        $17, 0x60($sp)
/* 152A4 001151A4 FF000224 */  addiu      $2, $0, 0xFF
/* 152A8 001151A8 3800A0AF */  sw         $0, 0x38($sp)
/* 152AC 001151AC 3400A2AF */  sw         $2, 0x34($sp)
/* 152B0 001151B0 C850040C */  jal        CreateSema
/* 152B4 001151B4 3000A427 */   addiu     $4, $sp, 0x30
/* 152B8 001151B8 2A00113C */  lui        $17, (0x2A53A8 >> 16)
/* 152BC 001151BC 13004004 */  bltz       $2, .L0011520C
/* 152C0 001151C0 A85322AE */   sw        $2, (0x2A53A8 & 0xFFFF)($17)
/* 152C4 001151C4 1100023C */  lui        $2, %hi(topThread)
/* 152C8 001151C8 2A00033C */  lui        $3, %hi(D_002A4FA0)
/* 152CC 001151CC 2B00053C */  lui        $5, %hi(D_002A97F0)
/* 152D0 001151D0 D8504224 */  addiu      $2, $2, %lo(topThread)
/* 152D4 001151D4 A04F6324 */  addiu      $3, $3, %lo(D_002A4FA0)
/* 152D8 001151D8 F097A524 */  addiu      $5, $5, %lo(D_002A97F0)
/* 152DC 001151DC 00040624 */  addiu      $6, $0, 0x400
/* 152E0 001151E0 0400A2AF */  sw         $2, 0x4($sp)
/* 152E4 001151E4 0800A3AF */  sw         $3, 0x8($sp)
/* 152E8 001151E8 2D20A003 */  daddu      $4, $sp, $0
/* 152EC 001151EC 0C00A6AF */  sw         $6, 0xC($sp)
/* 152F0 001151F0 1000A5AF */  sw         $5, 0x10($sp)
/* 152F4 001151F4 4850040C */  jal        CreateThread
/* 152F8 001151F8 1400A0AF */   sw        $0, 0x14($sp)
/* 152FC 001151FC 05004104 */  bgez       $2, .L00115214
/* 15300 00115200 E80902AE */   sw        $2, (0x2509E8 & 0xFFFF)($16)
/* 15304 00115204 CC50040C */  jal        DeleteSema
/* 15308 00115208 A853248E */   lw        $4, (0x2A53A8 & 0xFFFF)($17)
.L0011520C:
/* 1530C 0011520C 0B000010 */  b          .L0011523C
/* 15310 00115210 FFFF0224 */   addiu     $2, $0, -0x1
.L00115214:
/* 15314 00115214 2A00053C */  lui        $5, %hi(D_002A53A0)
/* 15318 00115218 2D204000 */  daddu      $4, $2, $0
/* 1531C 0011521C 5050040C */  jal        StartThread
/* 15320 00115220 A053A524 */   addiu     $5, $5, %lo(D_002A53A0)
/* 15324 00115224 8450040C */  jal        GetThreadId
/* 15328 00115228 00000000 */   nop
/* 1532C 0011522C 2D204000 */  daddu      $4, $2, $0
/* 15330 00115230 6C50040C */  jal        ChangeThreadPriority
/* 15334 00115234 01000524 */   addiu     $5, $0, 0x1
/* 15338 00115238 E809028E */  lw         $2, (0x2509E8 & 0xFFFF)($16)
.L0011523C:
/* 1533C 0011523C 7000BFDF */  ld         $31, 0x70($sp)
/* 15340 00115240 6000B1DF */  ld         $17, 0x60($sp)
/* 15344 00115244 5000B0DF */  ld         $16, 0x50($sp)
/* 15348 00115248 0800E003 */  jr         $31
/* 1534C 0011524C 8000BD27 */   addiu     $sp, $sp, 0x80