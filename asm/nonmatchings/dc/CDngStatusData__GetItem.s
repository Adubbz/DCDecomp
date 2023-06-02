.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetItem__14CDngStatusDataFii
/* BE160 001BE060 90FFBD27 */  addiu      $sp, $sp, -0x70
/* BE164 001BE064 6000BF7F */  sq         $31, 0x60($sp)
/* BE168 001BE068 5000B57F */  sq         $21, 0x50($sp)
/* BE16C 001BE06C 4000B47F */  sq         $20, 0x40($sp)
/* BE170 001BE070 3000B37F */  sq         $19, 0x30($sp)
/* BE174 001BE074 2000B27F */  sq         $18, 0x20($sp)
/* BE178 001BE078 1000B17F */  sq         $17, 0x10($sp)
/* BE17C 001BE07C 0000B07F */  sq         $16, 0x0($sp)
/* BE180 001BE080 288E8070 */  paddub     $17, $4, $0
/* BE184 001BE084 2886A070 */  paddub     $16, $5, $0
/* BE188 001BE088 28AEC070 */  paddub     $21, $6, $0
/* BE18C 001BE08C 2A00023C */  lui        $2, %hi(_540_2)
/* BE190 001BE090 A0BD4424 */  addiu      $4, $2, %lo(_540_2)
/* BE194 001BE094 A611040C */  jal        printf
/* BE198 001BE098 00000000 */   nop
/* BE19C 001BE09C 8400022A */  slti       $2, $16, 0x84
/* BE1A0 001BE0A0 66004014 */  bnez       $2, .L001BE23C
/* BE1A4 001BE0A4 00000000 */   nop
/* BE1A8 001BE0A8 0101012A */  slti       $at, $16, 0x101
/* BE1AC 001BE0AC 63002010 */  beqz       $at, .L001BE23C
/* BE1B0 001BE0B0 00000000 */   nop
/* BE1B4 001BE0B4 28960070 */  paddub     $18, $0, $0
/* BE1B8 001BE0B8 5D000010 */  b          .L001BE230
/* BE1BC 001BE0BC 00000000 */   nop
.L001BE0C0:
/* BE1C0 001BE0C0 40A01200 */  sll        $20, $18, 1
/* BE1C4 001BE0C4 21109102 */  addu       $2, $20, $17
/* BE1C8 001BE0C8 6E435324 */  addiu      $19, $2, 0x436E
/* BE1CC 001BE0CC 6E434284 */  lh         $2, 0x436E($2)
/* BE1D0 001BE0D0 84004128 */  slti       $at, $2, 0x84
/* BE1D4 001BE0D4 55002010 */  beqz       $at, .L001BE22C
/* BE1D8 001BE0D8 00000000 */   nop
/* BE1DC 001BE0DC EE000224 */  addiu      $2, $0, 0xEE
/* BE1E0 001BE0E0 06000216 */  bne        $16, $2, .L001BE0FC
/* BE1E4 001BE0E4 00000000 */   nop
/* BE1E8 001BE0E8 01000224 */  addiu      $2, $0, 0x1
/* BE1EC 001BE0EC 204322AE */  sw         $2, 0x4320($17)
/* BE1F0 001BE0F0 28160070 */  paddub     $2, $0, $0
/* BE1F4 001BE0F4 CE000010 */  b          .L001BE430
/* BE1F8 001BE0F8 00000000 */   nop
.L001BE0FC:
/* BE1FC 001BE0FC 282E0070 */  paddub     $5, $0, $0
/* BE200 001BE100 281E0070 */  paddub     $3, $0, $0
/* BE204 001BE104 09000010 */  b          .L001BE12C
/* BE208 001BE108 00000000 */   nop
.L001BE10C:
/* BE20C 001BE10C 40100300 */  sll        $2, $3, 1
/* BE210 001BE110 21105100 */  addu       $2, $2, $17
/* BE214 001BE114 6E434284 */  lh         $2, 0x436E($2)
/* BE218 001BE118 84004228 */  slti       $2, $2, 0x84
/* BE21C 001BE11C 02004014 */  bnez       $2, .L001BE128
/* BE220 001BE120 00000000 */   nop
/* BE224 001BE124 0100A524 */  addiu      $5, $5, 0x1
.L001BE128:
/* BE228 001BE128 01006324 */  addiu      $3, $3, 0x1
.L001BE12C:
/* BE22C 001BE12C 67006228 */  slti       $2, $3, 0x67
/* BE230 001BE130 F6FF4014 */  bnez       $2, .L001BE10C
/* BE234 001BE134 00000000 */   nop
/* BE238 001BE138 28360070 */  paddub     $6, $0, $0
/* BE23C 001BE13C 0A000010 */  b          .L001BE168
/* BE240 001BE140 00000000 */   nop
.L001BE144:
/* BE244 001BE144 40100600 */  sll        $2, $6, 1
/* BE248 001BE148 21205100 */  addu       $4, $2, $17
/* BE24C 001BE14C 62438384 */  lh         $3, 0x4362($4)
/* BE250 001BE150 FFFF0224 */  addiu      $2, $0, -0x1
/* BE254 001BE154 03006210 */  beq        $3, $2, .L001BE164
/* BE258 001BE158 00000000 */   nop
/* BE25C 001BE15C 68438284 */  lh         $2, 0x4368($4)
/* BE260 001BE160 2128A200 */  addu       $5, $5, $2
.L001BE164:
/* BE264 001BE164 0100C624 */  addiu      $6, $6, 0x1
.L001BE168:
/* BE268 001BE168 0300C228 */  slti       $2, $6, 0x3
/* BE26C 001BE16C F5FF4014 */  bnez       $2, .L001BE144
/* BE270 001BE170 00000000 */   nop
/* BE274 001BE174 0100A324 */  addiu      $3, $5, 0x1
/* BE278 001BE178 60432282 */  lb         $2, 0x4360($17)
/* BE27C 001BE17C 2A084300 */  slt        $at, $2, $3
/* BE280 001BE180 03002010 */  beqz       $at, .L001BE190
/* BE284 001BE184 00000000 */   nop
/* BE288 001BE188 01000224 */  addiu      $2, $0, 0x1
/* BE28C 001BE18C 1C4322AE */  sw         $2, 0x431C($17)
.L001BE190:
/* BE290 001BE190 28260072 */  paddub     $4, $16, $0
/* BE294 001BE194 B0C9080C */  jal        ItemDataToHaveCopy__Fi
/* BE298 001BE198 00000000 */   nop
/* BE29C 001BE19C 1C43238E */  lw         $3, 0x431C($17)
/* BE2A0 001BE1A0 1C006010 */  beqz       $3, .L001BE214
/* BE2A4 001BE1A4 00000000 */   nop
/* BE2A8 001BE1A8 282E0070 */  paddub     $5, $0, $0
/* BE2AC 001BE1AC 14000010 */  b          .L001BE200
/* BE2B0 001BE1B0 00000000 */   nop
.L001BE1B4:
/* BE2B4 001BE1B4 60432382 */  lb         $3, 0x4360($17)
/* BE2B8 001BE1B8 21186500 */  addu       $3, $3, $5
/* BE2BC 001BE1BC 40180300 */  sll        $3, $3, 1
/* BE2C0 001BE1C0 21187100 */  addu       $3, $3, $17
/* BE2C4 001BE1C4 6E436624 */  addiu      $6, $3, 0x436E
/* BE2C8 001BE1C8 6E436484 */  lh         $4, 0x436E($3)
/* BE2CC 001BE1CC FFFF0324 */  addiu      $3, $0, -0x1
/* BE2D0 001BE1D0 0A008314 */  bne        $4, $3, .L001BE1FC
/* BE2D4 001BE1D4 00000000 */   nop
/* BE2D8 001BE1D8 0000D0A4 */  sh         $16, 0x0($6)
/* BE2DC 001BE1DC 60432382 */  lb         $3, 0x4360($17)
/* BE2E0 001BE1E0 21186500 */  addu       $3, $3, $5
/* BE2E4 001BE1E4 40180300 */  sll        $3, $3, 1
/* BE2E8 001BE1E8 21187100 */  addu       $3, $3, $17
/* BE2EC 001BE1EC 3C4462A4 */  sh         $2, 0x443C($3)
/* BE2F0 001BE1F0 28164072 */  paddub     $2, $18, $0
/* BE2F4 001BE1F4 8E000010 */  b          .L001BE430
/* BE2F8 001BE1F8 00000000 */   nop
.L001BE1FC:
/* BE2FC 001BE1FC 0100A524 */  addiu      $5, $5, 0x1
.L001BE200:
/* BE300 001BE200 0300A328 */  slti       $3, $5, 0x3
/* BE304 001BE204 EBFF6014 */  bnez       $3, .L001BE1B4
/* BE308 001BE208 00000000 */   nop
/* BE30C 001BE20C 04000010 */  b          .L001BE220
/* BE310 001BE210 00000000 */   nop
.L001BE214:
/* BE314 001BE214 000070A6 */  sh         $16, 0x0($19)
/* BE318 001BE218 21189102 */  addu       $3, $20, $17
/* BE31C 001BE21C 3C4462A4 */  sh         $2, 0x443C($3)
.L001BE220:
/* BE320 001BE220 28164072 */  paddub     $2, $18, $0
/* BE324 001BE224 82000010 */  b          .L001BE430
/* BE328 001BE228 00000000 */   nop
.L001BE22C:
/* BE32C 001BE22C 01005226 */  addiu      $18, $18, 0x1
.L001BE230:
/* BE330 001BE230 6700422A */  slti       $2, $18, 0x67
/* BE334 001BE234 A2FF4014 */  bnez       $2, .L001BE0C0
/* BE338 001BE238 00000000 */   nop
.L001BE23C:
/* BE33C 001BE23C 5100022A */  slti       $2, $16, 0x51
/* BE340 001BE240 38004014 */  bnez       $2, .L001BE324
/* BE344 001BE244 00000000 */   nop
/* BE348 001BE248 8400012A */  slti       $at, $16, 0x84
/* BE34C 001BE24C 35002010 */  beqz       $at, .L001BE324
/* BE350 001BE250 00000000 */   nop
/* BE354 001BE254 28960070 */  paddub     $18, $0, $0
/* BE358 001BE258 2F000010 */  b          .L001BE318
/* BE35C 001BE25C 00000000 */   nop
.L001BE260:
/* BE360 001BE260 40111200 */  sll        $2, $18, 5
/* BE364 001BE264 21105100 */  addu       $2, $2, $17
/* BE368 001BE268 04054324 */  addiu      $3, $2, 0x504
/* BE36C 001BE26C F87F6324 */  addiu      $3, $3, 0x7FF8
/* BE370 001BE270 00006284 */  lh         $2, 0x0($3)
/* BE374 001BE274 51004128 */  slti       $at, $2, 0x51
/* BE378 001BE278 26002010 */  beqz       $at, .L001BE314
/* BE37C 001BE27C 00000000 */   nop
/* BE380 001BE280 000070A4 */  sh         $16, 0x0($3)
/* BE384 001BE284 3C341500 */  dsll32     $6, $21, 16
/* BE388 001BE288 3F340600 */  dsra32     $6, $6, 16
/* BE38C 001BE28C 28260072 */  paddub     $4, $16, $0
/* BE390 001BE290 282E4072 */  paddub     $5, $18, $0
/* BE394 001BE294 283E0070 */  paddub     $7, $0, $0
/* BE398 001BE298 D497080C */  jal        SetAttachMentValue__FiisP11ATTACH_LIST
/* BE39C 001BE29C 00000000 */   nop
/* BE3A0 001BE2A0 28260070 */  paddub     $4, $0, $0
/* BE3A4 001BE2A4 282E0070 */  paddub     $5, $0, $0
/* BE3A8 001BE2A8 0E000010 */  b          .L001BE2E4
/* BE3AC 001BE2AC 00000000 */   nop
.L001BE2B0:
/* BE3B0 001BE2B0 40110500 */  sll        $2, $5, 5
/* BE3B4 001BE2B4 21105100 */  addu       $2, $2, $17
/* BE3B8 001BE2B8 0100013C */  lui        $at, (0x10000 >> 16)
/* BE3BC 001BE2BC 21084100 */  addu       $at, $2, $at
/* BE3C0 001BE2C0 FC842384 */  lh         $3, -0x7B04($at)
/* BE3C4 001BE2C4 51006228 */  slti       $2, $3, 0x51
/* BE3C8 001BE2C8 05004014 */  bnez       $2, .L001BE2E0
/* BE3CC 001BE2CC 00000000 */   nop
/* BE3D0 001BE2D0 84006128 */  slti       $at, $3, 0x84
/* BE3D4 001BE2D4 02002010 */  beqz       $at, .L001BE2E0
/* BE3D8 001BE2D8 00000000 */   nop
/* BE3DC 001BE2DC 01008424 */  addiu      $4, $4, 0x1
.L001BE2E0:
/* BE3E0 001BE2E0 0100A524 */  addiu      $5, $5, 0x1
.L001BE2E4:
/* BE3E4 001BE2E4 2B00A228 */  slti       $2, $5, 0x2B
/* BE3E8 001BE2E8 F1FF4014 */  bnez       $2, .L001BE2B0
/* BE3EC 001BE2EC 00000000 */   nop
/* BE3F0 001BE2F0 29008128 */  slti       $at, $4, 0x29
/* BE3F4 001BE2F4 04002014 */  bnez       $at, .L001BE308
/* BE3F8 001BE2F8 00000000 */   nop
/* BE3FC 001BE2FC 1C43228E */  lw         $2, 0x431C($17)
/* BE400 001BE300 01004224 */  addiu      $2, $2, 0x1
/* BE404 001BE304 1C4322AE */  sw         $2, 0x431C($17)
.L001BE308:
/* BE408 001BE308 28164072 */  paddub     $2, $18, $0
/* BE40C 001BE30C 48000010 */  b          .L001BE430
/* BE410 001BE310 00000000 */   nop
.L001BE314:
/* BE414 001BE314 01005226 */  addiu      $18, $18, 0x1
.L001BE318:
/* BE418 001BE318 2B00422A */  slti       $2, $18, 0x2B
/* BE41C 001BE31C D0FF4014 */  bnez       $2, .L001BE260
/* BE420 001BE320 00000000 */   nop
.L001BE324:
/* BE424 001BE324 0101022A */  slti       $2, $16, 0x101
/* BE428 001BE328 40004014 */  bnez       $2, .L001BE42C
/* BE42C 001BE32C 00000000 */   nop
/* BE430 001BE330 2A00023C */  lui        $2, %hi(_541_2)
/* BE434 001BE334 C0BD4424 */  addiu      $4, $2, %lo(_541_2)
/* BE438 001BE338 282E0072 */  paddub     $5, $16, $0
/* BE43C 001BE33C A611040C */  jal        printf
/* BE440 001BE340 00000000 */   nop
/* BE444 001BE344 C0101000 */  sll        $2, $16, 3
/* BE448 001BE348 21105000 */  addu       $2, $2, $16
/* BE44C 001BE34C 40100200 */  sll        $2, $2, 1
/* BE450 001BE350 21105000 */  addu       $2, $2, $16
/* BE454 001BE354 80180200 */  sll        $3, $2, 2
/* BE458 001BE358 2700023C */  lui        $2, %hi(ItemPutListTbl12 + 0x2EE)
/* BE45C 001BE35C 7E5A4224 */  addiu      $2, $2, %lo(ItemPutListTbl12 + 0x2EE)
/* BE460 001BE360 21104300 */  addu       $2, $2, $3
/* BE464 001BE364 00004480 */  lb         $4, 0x0($2)
/* BE468 001BE368 28960070 */  paddub     $18, $0, $0
/* BE46C 001BE36C 2C000010 */  b          .L001BE420
/* BE470 001BE370 00000000 */   nop
.L001BE374:
/* BE474 001BE374 A80A0224 */  addiu      $2, $0, 0xAA8
/* BE478 001BE378 18108200 */  mult       $2, $4, $2
/* BE47C 001BE37C 21185100 */  addu       $3, $2, $17
/* BE480 001BE380 0C457324 */  addiu      $19, $3, 0x450C
/* BE484 001BE384 40111200 */  sll        $2, $18, 5
/* BE488 001BE388 23105200 */  subu       $2, $2, $18
/* BE48C 001BE38C C0280200 */  sll        $5, $2, 3
/* BE490 001BE390 21106502 */  addu       $2, $19, $5
/* BE494 001BE394 00004284 */  lh         $2, 0x0($2)
/* BE498 001BE398 01014128 */  slti       $at, $2, 0x101
/* BE49C 001BE39C 1F002010 */  beqz       $at, .L001BE41C
/* BE4A0 001BE3A0 00000000 */   nop
/* BE4A4 001BE3A4 21106500 */  addu       $2, $3, $5
/* BE4A8 001BE3A8 28260072 */  paddub     $4, $16, $0
/* BE4AC 001BE3AC 0C454524 */  addiu      $5, $2, 0x450C
/* BE4B0 001BE3B0 24C9080C */  jal        WepDataListToHaveCopy__FiP11WEAPON_HAVE
/* BE4B4 001BE3B4 00000000 */   nop
/* BE4B8 001BE3B8 281E0070 */  paddub     $3, $0, $0
/* BE4BC 001BE3BC 28260070 */  paddub     $4, $0, $0
/* BE4C0 001BE3C0 0B000010 */  b          .L001BE3F0
/* BE4C4 001BE3C4 00000000 */   nop
.L001BE3C8:
/* BE4C8 001BE3C8 40110400 */  sll        $2, $4, 5
/* BE4CC 001BE3CC 23104400 */  subu       $2, $2, $4
/* BE4D0 001BE3D0 C0100200 */  sll        $2, $2, 3
/* BE4D4 001BE3D4 21106202 */  addu       $2, $19, $2
/* BE4D8 001BE3D8 00004284 */  lh         $2, 0x0($2)
/* BE4DC 001BE3DC 01014228 */  slti       $2, $2, 0x101
/* BE4E0 001BE3E0 02004014 */  bnez       $2, .L001BE3EC
/* BE4E4 001BE3E4 00000000 */   nop
/* BE4E8 001BE3E8 01006324 */  addiu      $3, $3, 0x1
.L001BE3EC:
/* BE4EC 001BE3EC 01008424 */  addiu      $4, $4, 0x1
.L001BE3F0:
/* BE4F0 001BE3F0 0A008228 */  slti       $2, $4, 0xA
/* BE4F4 001BE3F4 F4FF4014 */  bnez       $2, .L001BE3C8
/* BE4F8 001BE3F8 00000000 */   nop
/* BE4FC 001BE3FC 0A006228 */  slti       $2, $3, 0xA
/* BE500 001BE400 03004014 */  bnez       $2, .L001BE410
/* BE504 001BE404 00000000 */   nop
/* BE508 001BE408 01000224 */  addiu      $2, $0, 0x1
/* BE50C 001BE40C 1C4322AE */  sw         $2, 0x431C($17)
.L001BE410:
/* BE510 001BE410 28164072 */  paddub     $2, $18, $0
/* BE514 001BE414 06000010 */  b          .L001BE430
/* BE518 001BE418 00000000 */   nop
.L001BE41C:
/* BE51C 001BE41C 01005226 */  addiu      $18, $18, 0x1
.L001BE420:
/* BE520 001BE420 0B00422A */  slti       $2, $18, 0xB
/* BE524 001BE424 D3FF4014 */  bnez       $2, .L001BE374
/* BE528 001BE428 00000000 */   nop
.L001BE42C:
/* BE52C 001BE42C FFFF0224 */  addiu      $2, $0, -0x1
.L001BE430:
/* BE530 001BE430 6000BF7B */  lq         $31, 0x60($sp)
/* BE534 001BE434 5000B57B */  lq         $21, 0x50($sp)
/* BE538 001BE438 4000B47B */  lq         $20, 0x40($sp)
/* BE53C 001BE43C 3000B37B */  lq         $19, 0x30($sp)
/* BE540 001BE440 2000B27B */  lq         $18, 0x20($sp)
/* BE544 001BE444 1000B17B */  lq         $17, 0x10($sp)
/* BE548 001BE448 0000B07B */  lq         $16, 0x0($sp)
/* BE54C 001BE44C 7000BD27 */  addiu      $sp, $sp, 0x70
/* BE550 001BE450 0800E003 */  jr         $31
/* BE554 001BE454 00000000 */   nop
/* BE558 001BE458 00000000 */  nop
/* BE55C 001BE45C 00000000 */  nop
