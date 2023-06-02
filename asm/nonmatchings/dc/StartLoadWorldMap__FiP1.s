.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StartLoadWorldMap__FiP1
/* 10A080 00209F80 70FFBD27 */  addiu      $sp, $sp, -0x90
/* 10A084 00209F84 2000BF7F */  sq         $31, 0x20($sp)
/* 10A088 00209F88 1000B17F */  sq         $17, 0x10($sp)
/* 10A08C 00209F8C 0000B07F */  sq         $16, 0x0($sp)
/* 10A090 00209F90 288E8070 */  paddub     $17, $4, $0
/* 10A094 00209F94 2886A070 */  paddub     $16, $5, $0
/* 10A098 00209F98 04002006 */  bltz       $17, .L00209FAC
/* 10A09C 00209F9C 00000000 */   nop
/* 10A0A0 00209FA0 0600212A */  slti       $at, $17, 0x6
/* 10A0A4 00209FA4 03002014 */  bnez       $at, .L00209FB4
/* 10A0A8 00209FA8 00000000 */   nop
.L00209FAC:
/* 10A0AC 00209FAC 1D000010 */  b          .L0020A024
/* 10A0B0 00209FB0 00000000 */   nop
.L00209FB4:
/* 10A0B4 00209FB4 3000A427 */  addiu      $4, $sp, 0x30
/* 10A0B8 00209FB8 94AE080C */  jal        GetPathReadDifferntLang__FPc
/* 10A0BC 00209FBC 00000000 */   nop
/* 10A0C0 00209FC0 3000A427 */  addiu      $4, $sp, 0x30
/* 10A0C4 00209FC4 2A00023C */  lui        $2, %hi(_6229)
/* 10A0C8 00209FC8 00DD4524 */  addiu      $5, $2, %lo(_6229)
/* 10A0CC 00209FCC BC14040C */  jal        strcat
/* 10A0D0 00209FD0 00000000 */   nop
/* 10A0D4 00209FD4 2900023C */  lui        $2, %hi(_6227)
/* 10A0D8 00209FD8 C0374224 */  addiu      $2, $2, %lo(_6227)
/* 10A0DC 00209FDC 7000A427 */  addiu      $4, $sp, 0x70
/* 10A0E0 00209FE0 00004378 */  lq         $3, 0x0($2)
/* 10A0E4 00209FE4 100042DC */  ld         $2, 0x10($2)
/* 10A0E8 00209FE8 0000837C */  sq         $3, 0x0($4)
/* 10A0EC 00209FEC 100082FC */  sd         $2, 0x10($4)
/* 10A0F0 00209FF0 80101100 */  sll        $2, $17, 2
/* 10A0F4 00209FF4 21105D00 */  addu       $2, $2, $sp
/* 10A0F8 00209FF8 3000A427 */  addiu      $4, $sp, 0x30
/* 10A0FC 00209FFC 7000458C */  lw         $5, 0x70($2)
/* 10A100 0020A000 BC14040C */  jal        strcat
/* 10A104 0020A004 00000000 */   nop
/* 10A108 0020A008 30FB040C */  jal        StartReadBG__Fv
/* 10A10C 0020A00C 00000000 */   nop
/* 10A110 0020A010 3000A427 */  addiu      $4, $sp, 0x30
/* 10A114 0020A014 282E0072 */  paddub     $5, $16, $0
/* 10A118 0020A018 8C00A627 */  addiu      $6, $sp, 0x8C
/* 10A11C 0020A01C ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 10A120 0020A020 00000000 */   nop
.L0020A024:
/* 10A124 0020A024 2000BF7B */  lq         $31, 0x20($sp)
/* 10A128 0020A028 1000B17B */  lq         $17, 0x10($sp)
/* 10A12C 0020A02C 0000B07B */  lq         $16, 0x0($sp)
/* 10A130 0020A030 9000BD27 */  addiu      $sp, $sp, 0x90
/* 10A134 0020A034 0800E003 */  jr         $31
/* 10A138 0020A038 00000000 */   nop
/* 10A13C 0020A03C 00000000 */  nop
