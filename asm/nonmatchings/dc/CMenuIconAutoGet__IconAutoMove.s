.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel IconAutoMove__16CMenuIconAutoGetFv
/* 1382D0 002381D0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 1382D4 002381D4 5000BF7F */  sq         $31, 0x50($sp)
/* 1382D8 002381D8 4000B47F */  sq         $20, 0x40($sp)
/* 1382DC 002381DC 3000B37F */  sq         $19, 0x30($sp)
/* 1382E0 002381E0 2000B27F */  sq         $18, 0x20($sp)
/* 1382E4 002381E4 1000B17F */  sq         $17, 0x10($sp)
/* 1382E8 002381E8 0000B07F */  sq         $16, 0x0($sp)
/* 1382EC 002381EC 28A68070 */  paddub     $20, $4, $0
/* 1382F0 002381F0 28860070 */  paddub     $16, $0, $0
/* 1382F4 002381F4 1C8D848F */  lw         $4, -0x72E4($gp)
/* 1382F8 002381F8 7860050C */  jal        GetDngStatus__9CSaveDataFv
/* 1382FC 002381FC 00000000 */   nop
/* 138300 00238200 288E4070 */  paddub     $17, $2, $0
/* 138304 00238204 60433326 */  addiu      $19, $17, 0x4360
/* 138308 00238208 2900023C */  lui        $2, %hi(_1515_3)
/* 13830C 0023820C A0594424 */  addiu      $4, $2, %lo(_1515_3)
/* 138310 00238210 6000A327 */  addiu      $3, $sp, 0x60
/* 138314 00238214 000082DC */  ld         $2, 0x0($4)
/* 138318 00238218 080080C4 */  lwc1       $f0, 0x8($4)
/* 13831C 0023821C 000062FC */  sd         $2, 0x0($3)
/* 138320 00238220 080060E4 */  swc1       $f0, 0x8($3)
/* 138324 00238224 28960070 */  paddub     $18, $0, $0
/* 138328 00238228 3F000010 */  b          .L00238328
/* 13832C 0023822C 00000000 */   nop
.L00238230:
/* 138330 00238230 00111200 */  sll        $2, $18, 4
/* 138334 00238234 21205400 */  addu       $4, $2, $20
/* 138338 00238238 08008624 */  addiu      $6, $4, 0x8
/* 13833C 0023823C 08008284 */  lh         $2, 0x8($4)
/* 138340 00238240 38004018 */  blez       $2, .L00238324
/* 138344 00238244 00000000 */   nop
/* 138348 00238248 01001024 */  addiu      $16, $0, 0x1
/* 13834C 0023824C 0A008284 */  lh         $2, 0xA($4)
/* 138350 00238250 80100200 */  sll        $2, $2, 2
/* 138354 00238254 21105D00 */  addu       $2, $2, $sp
/* 138358 00238258 600040C4 */  lwc1       $f0, 0x60($2)
/* 13835C 0023825C 20008046 */  cvt.s.w    $f0, $f0
/* 138360 00238260 000081C4 */  lwc1       $f1, 0x0($4)
/* 138364 00238264 01000146 */  sub.s      $f0, $f0, $f1
/* 138368 00238268 8040023C */  lui        $2, (0x40800000 >> 16)
/* 13836C 0023826C 00108244 */  mtc1       $2, $f2
/* 138370 00238270 00000000 */  nop
/* 138374 00238274 03000246 */  div.s      $f0, $f0, $f2
/* 138378 00238278 00080046 */  add.s      $f0, $f1, $f0
/* 13837C 0023827C 000080E4 */  swc1       $f0, 0x0($4)
/* 138380 00238280 D242023C */  lui        $2, (0x42D20000 >> 16)
/* 138384 00238284 00008244 */  mtc1       $2, $f0
/* 138388 00238288 040081C4 */  lwc1       $f1, 0x4($4)
/* 13838C 0023828C 01000146 */  sub.s      $f0, $f0, $f1
/* 138390 00238290 03000246 */  div.s      $f0, $f0, $f2
/* 138394 00238294 00080046 */  add.s      $f0, $f1, $f0
/* 138398 00238298 040080E4 */  swc1       $f0, 0x4($4)
/* 13839C 0023829C 0A008384 */  lh         $3, 0xA($4)
/* 1383A0 002382A0 80280300 */  sll        $5, $3, 2
/* 1383A4 002382A4 2110BD00 */  addu       $2, $5, $sp
/* 1383A8 002382A8 600040C4 */  lwc1       $f0, 0x60($2)
/* 1383AC 002382AC 60008046 */  cvt.s.w    $f1, $f0
/* 1383B0 002382B0 000080C4 */  lwc1       $f0, 0x0($4)
/* 1383B4 002382B4 01000146 */  sub.s      $f0, $f0, $f1
/* 1383B8 002382B8 34000246 */  c.lt.s     $f0, $f2
/* 1383BC 002382BC 00000000 */  nop
/* 1383C0 002382C0 18000045 */  bc1f       .L00238324
/* 1383C4 002382C4 00000000 */   nop
/* 1383C8 002382C8 40100300 */  sll        $2, $3, 1
/* 1383CC 002382CC 21185300 */  addu       $3, $2, $19
/* 1383D0 002382D0 02006724 */  addiu      $7, $3, 0x2
/* 1383D4 002382D4 02006284 */  lh         $2, 0x2($3)
/* 1383D8 002382D8 0B00401C */  bgtz       $2, .L00238308
/* 1383DC 002382DC 00000000 */   nop
/* 1383E0 002382E0 0000C284 */  lh         $2, 0x0($6)
/* 1383E4 002382E4 0000E2A4 */  sh         $2, 0x0($7)
/* 1383E8 002382E8 080070A4 */  sh         $16, 0x8($3)
/* 1383EC 002382EC 0C008384 */  lh         $3, 0xC($4)
/* 1383F0 002382F0 2110B100 */  addu       $2, $5, $17
/* 1383F4 002382F4 0100013C */  lui        $at, (0x10000 >> 16)
/* 1383F8 002382F8 21084100 */  addu       $at, $2, $at
/* 1383FC 002382FC 148B23AC */  sw         $3, -0x74EC($at)
/* 138400 00238300 04000010 */  b          .L00238314
/* 138404 00238304 00000000 */   nop
.L00238308:
/* 138408 00238308 08006284 */  lh         $2, 0x8($3)
/* 13840C 0023830C 01004224 */  addiu      $2, $2, 0x1
/* 138410 00238310 080062A4 */  sh         $2, 0x8($3)
.L00238314:
/* 138414 00238314 FFFF0524 */  addiu      $5, $0, -0x1
/* 138418 00238318 10000624 */  addiu      $6, $0, 0x10
/* 13841C 0023831C 5A0D040C */  jal        memset
/* 138420 00238320 00000000 */   nop
.L00238324:
/* 138424 00238324 01005226 */  addiu      $18, $18, 0x1
.L00238328:
/* 138428 00238328 0300422A */  slti       $2, $18, 0x3
/* 13842C 0023832C C0FF4014 */  bnez       $2, .L00238230
/* 138430 00238330 00000000 */   nop
/* 138434 00238334 28160072 */  paddub     $2, $16, $0
/* 138438 00238338 5000BF7B */  lq         $31, 0x50($sp)
/* 13843C 0023833C 4000B47B */  lq         $20, 0x40($sp)
/* 138440 00238340 3000B37B */  lq         $19, 0x30($sp)
/* 138444 00238344 2000B27B */  lq         $18, 0x20($sp)
/* 138448 00238348 1000B17B */  lq         $17, 0x10($sp)
/* 13844C 0023834C 0000B07B */  lq         $16, 0x0($sp)
/* 138450 00238350 7000BD27 */  addiu      $sp, $sp, 0x70
/* 138454 00238354 0800E003 */  jr         $31
/* 138458 00238358 00000000 */   nop
/* 13845C 0023835C 00000000 */  nop