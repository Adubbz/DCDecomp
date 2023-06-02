.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _LOAD_CHR_FILE__FP12RS_STACKDATAi
/* 8C450 0018C350 20FFBD27 */  addiu      $sp, $sp, -0xE0
/* 8C454 0018C354 4000BF7F */  sq         $31, 0x40($sp)
/* 8C458 0018C358 3000B37F */  sq         $19, 0x30($sp)
/* 8C45C 0018C35C 2000B27F */  sq         $18, 0x20($sp)
/* 8C460 0018C360 1000B17F */  sq         $17, 0x10($sp)
/* 8C464 0018C364 0000B07F */  sq         $16, 0x0($sp)
/* 8C468 0018C368 289E8070 */  paddub     $19, $4, $0
/* 8C46C 0018C36C 2896A070 */  paddub     $18, $5, $0
/* 8C470 0018C370 30FB040C */  jal        StartReadBG__Fv
/* 8C474 0018C374 00000000 */   nop
/* 8C478 0018C378 948B908F */  lw         $16, -0x746C($gp)
/* 8C47C 0018C37C 288E0070 */  paddub     $17, $0, $0
/* 8C480 0018C380 07000010 */  b          .L0018C3A0
/* 8C484 0018C384 00000000 */   nop
.L0018C388:
/* 8C488 0018C388 80181100 */  sll        $3, $17, 2
/* 8C48C 0018C38C D501023C */  lui        $2, %hi(chr_file)
/* 8C490 0018C390 D0A44224 */  addiu      $2, $2, %lo(chr_file)
/* 8C494 0018C394 21104300 */  addu       $2, $2, $3
/* 8C498 0018C398 000040AC */  sw         $0, 0x0($2)
/* 8C49C 0018C39C 01003126 */  addiu      $17, $17, 0x1
.L0018C3A0:
/* 8C4A0 0018C3A0 1000222A */  slti       $2, $17, 0x10
/* 8C4A4 0018C3A4 F8FF4014 */  bnez       $2, .L0018C388
/* 8C4A8 0018C3A8 00000000 */   nop
/* 8C4AC 0018C3AC 288E0070 */  paddub     $17, $0, $0
/* 8C4B0 0018C3B0 22000010 */  b          .L0018C43C
/* 8C4B4 0018C3B4 00000000 */   nop
.L0018C3B8:
/* 8C4B8 0018C3B8 28266072 */  paddub     $4, $19, $0
/* 8C4BC 0018C3BC 08009324 */  addiu      $19, $4, 0x8
/* 8C4C0 0018C3C0 F428060C */  jal        GetStackString__FP12RS_STACKDATA
/* 8C4C4 0018C3C4 00000000 */   nop
/* 8C4C8 0018C3C8 1B004010 */  beqz       $2, .L0018C438
/* 8C4CC 0018C3CC 00000000 */   nop
/* 8C4D0 0018C3D0 5000A427 */  addiu      $4, $sp, 0x50
/* 8C4D4 0018C3D4 282E4070 */  paddub     $5, $2, $0
/* 8C4D8 0018C3D8 EC2D060C */  jal        GetFileName__FPcPc
/* 8C4DC 0018C3DC 00000000 */   nop
/* 8C4E0 0018C3E0 2A00023C */  lui        $2, %hi(_853)
/* 8C4E4 0018C3E4 F0B04424 */  addiu      $4, $2, %lo(_853)
/* 8C4E8 0018C3E8 5000A527 */  addiu      $5, $sp, 0x50
/* 8C4EC 0018C3EC A611040C */  jal        printf
/* 8C4F0 0018C3F0 00000000 */   nop
/* 8C4F4 0018C3F4 80181100 */  sll        $3, $17, 2
/* 8C4F8 0018C3F8 D501023C */  lui        $2, %hi(chr_file)
/* 8C4FC 0018C3FC D0A44224 */  addiu      $2, $2, %lo(chr_file)
/* 8C500 0018C400 21104300 */  addu       $2, $2, $3
/* 8C504 0018C404 000050AC */  sw         $16, 0x0($2)
/* 8C508 0018C408 0000458C */  lw         $5, 0x0($2)
/* 8C50C 0018C40C 5000A427 */  addiu      $4, $sp, 0x50
/* 8C510 0018C410 DC00A627 */  addiu      $6, $sp, 0xDC
/* 8C514 0018C414 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 8C518 0018C418 00000000 */   nop
/* 8C51C 0018C41C DC00A28F */  lw         $2, 0xDC($sp)
/* 8C520 0018C420 83110200 */  sra        $2, $2, 6
/* 8C524 0018C424 01004224 */  addiu      $2, $2, 0x1
/* 8C528 0018C428 80110200 */  sll        $2, $2, 6
/* 8C52C 0018C42C 03110200 */  sra        $2, $2, 4
/* 8C530 0018C430 00110200 */  sll        $2, $2, 4
/* 8C534 0018C434 21800202 */  addu       $16, $16, $2
.L0018C438:
/* 8C538 0018C438 01003126 */  addiu      $17, $17, 0x1
.L0018C43C:
/* 8C53C 0018C43C 2A103202 */  slt        $2, $17, $18
/* 8C540 0018C440 DDFF4014 */  bnez       $2, .L0018C3B8
/* 8C544 0018C444 00000000 */   nop
/* 8C548 0018C448 01000224 */  addiu      $2, $0, 0x1
/* 8C54C 0018C44C 209282AF */  sw         $2, -0x6DE0($gp)
/* 8C550 0018C450 4000BF7B */  lq         $31, 0x40($sp)
/* 8C554 0018C454 3000B37B */  lq         $19, 0x30($sp)
/* 8C558 0018C458 2000B27B */  lq         $18, 0x20($sp)
/* 8C55C 0018C45C 1000B17B */  lq         $17, 0x10($sp)
/* 8C560 0018C460 0000B07B */  lq         $16, 0x0($sp)
/* 8C564 0018C464 E000BD27 */  addiu      $sp, $sp, 0xE0
/* 8C568 0018C468 0800E003 */  jr         $31
/* 8C56C 0018C46C 00000000 */   nop
