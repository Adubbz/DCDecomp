.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel strcat
/* 53F0 001052F0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 53F4 001052F4 0000B07F */  sq         $16, 0x0($sp)
/* 53F8 001052F8 2D808000 */  daddu      $16, $4, $0
/* 53FC 001052FC 07000232 */  andi       $2, $16, 0x7
/* 5400 00105300 38004014 */  bnez       $2, .L001053E4
/* 5404 00105304 1000BF7F */   sq        $31, 0x10($sp)
/* 5408 00105308 0F000232 */  andi       $2, $16, 0xF
/* 540C 0010530C 0101033C */  lui        $3, (0x1010101 >> 16)
/* 5410 00105310 01016334 */  ori        $3, $3, (0x1010101 & 0xFFFF)
/* 5414 00105314 381C0300 */  dsll       $3, $3, 16
/* 5418 00105318 01016334 */  ori        $3, $3, 0x101
/* 541C 0010531C 381C0300 */  dsll       $3, $3, 16
/* 5420 00105320 01016334 */  ori        $3, $3, 0x101
/* 5424 00105324 8080043C */  lui        $4, (0x80808080 >> 16)
/* 5428 00105328 80808434 */  ori        $4, $4, (0x80808080 & 0xFFFF)
/* 542C 0010532C 38240400 */  dsll       $4, $4, 16
/* 5430 00105330 80808434 */  ori        $4, $4, 0x8080
/* 5434 00105334 38240400 */  dsll       $4, $4, 16
/* 5438 00105338 80808434 */  ori        $4, $4, 0x8080
/* 543C 0010533C 18004014 */  bnez       $2, .L001053A0
/* 5440 00105340 000006DE */   ld        $6, 0x0($16)
/* 5444 00105344 0000027A */  lq         $2, 0x0($16)
/* 5448 00105348 893B6370 */  pcpyld     $7, $3, $3
/* 544C 0010534C 89438470 */  pcpyld     $8, $4, $4
/* 5450 00105350 481A4770 */  psubb      $3, $2, $7
/* 5454 00105354 E9140270 */  pnor       $2, $0, $2
/* 5458 00105358 891C6270 */  pand       $3, $3, $2
/* 545C 0010535C 891C6870 */  pand       $3, $3, $8
/* 5460 00105360 A9136370 */  pcpyud     $2, $3, $3
/* 5464 00105364 25184300 */  or         $3, $2, $3
/* 5468 00105368 1E006014 */  bnez       $3, .L001053E4
/* 546C 0010536C 2D200002 */   daddu     $4, $16, $0
/* 5470 00105370 10008624 */  addiu      $6, $4, 0x10
.L00105374:
/* 5474 00105374 0000C278 */  lq         $2, 0x0($6)
/* 5478 00105378 E91C0270 */  pnor       $3, $0, $2
/* 547C 0010537C 48124770 */  psubb      $2, $2, $7
/* 5480 00105380 89144370 */  pand       $2, $2, $3
/* 5484 00105384 89144870 */  pand       $2, $2, $8
/* 5488 00105388 A91B4270 */  pcpyud     $3, $2, $2
/* 548C 0010538C 25104300 */  or         $2, $2, $3
/* 5490 00105390 F8FF4050 */  beql       $2, $0, .L00105374
/* 5494 00105394 1000C624 */   addiu     $6, $6, 0x10
/* 5498 00105398 12000010 */  b          .L001053E4
/* 549C 0010539C 2D20C000 */   daddu     $4, $6, $0
.L001053A0:
/* 54A0 001053A0 2D386000 */  daddu      $7, $3, $0
/* 54A4 001053A4 2D408000 */  daddu      $8, $4, $0
/* 54A8 001053A8 2F18C300 */  dsubu      $3, $6, $3
/* 54AC 001053AC 27100600 */  nor        $2, $0, $6
/* 54B0 001053B0 24186200 */  and        $3, $3, $2
/* 54B4 001053B4 24186400 */  and        $3, $3, $4
/* 54B8 001053B8 0A006014 */  bnez       $3, .L001053E4
/* 54BC 001053BC 2D200002 */   daddu     $4, $16, $0
/* 54C0 001053C0 08000626 */  addiu      $6, $16, 0x8
.L001053C4:
/* 54C4 001053C4 0000C2DC */  ld         $2, 0x0($6)
/* 54C8 001053C8 27180200 */  nor        $3, $0, $2
/* 54CC 001053CC 2F104700 */  dsubu      $2, $2, $7
/* 54D0 001053D0 24104300 */  and        $2, $2, $3
/* 54D4 001053D4 24104800 */  and        $2, $2, $8
/* 54D8 001053D8 FAFF4050 */  beql       $2, $0, .L001053C4
/* 54DC 001053DC 0800C624 */   addiu     $6, $6, 0x8
/* 54E0 001053E0 2D20C000 */  daddu      $4, $6, $0
.L001053E4:
/* 54E4 001053E4 00008280 */  lb         $2, 0x0($4)
/* 54E8 001053E8 00000000 */  nop
/* 54EC 001053EC 00000000 */  nop
/* 54F0 001053F0 00000000 */  nop
/* 54F4 001053F4 00000000 */  nop
/* 54F8 001053F8 FAFF4054 */  bnel       $2, $0, .L001053E4
/* 54FC 001053FC 01008424 */   addiu     $4, $4, 0x1
/* 5500 00105400 5A15040C */  jal        strcpy
/* 5504 00105404 00000000 */   nop
/* 5508 00105408 2D100002 */  daddu      $2, $16, $0
/* 550C 0010540C 1000BF7B */  lq         $31, 0x10($sp)
/* 5510 00105410 0000B07B */  lq         $16, 0x0($sp)
/* 5514 00105414 0800E003 */  jr         $31
/* 5518 00105418 2000BD27 */   addiu     $sp, $sp, 0x20
/* 551C 0010541C 00000000 */  nop