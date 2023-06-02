.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel scmd_prechk
/* AFA0 0010AEA0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* AFA4 0010AEA4 1000B1FF */  sd         $17, 0x10($sp)
/* AFA8 0010AEA8 0000B0FF */  sd         $16, 0x0($sp)
/* AFAC 0010AEAC 2D888000 */  daddu      $17, $4, $0
/* AFB0 0010AEB0 3000BFFF */  sd         $31, 0x30($sp)
/* AFB4 0010AEB4 2500103C */  lui        $16, (0x250284 >> 16)
/* AFB8 0010AEB8 4E26040C */  jal        cmd_sem_init
/* AFBC 0010AEBC 2000B2FF */   sd        $18, 0x20($sp)
/* AFC0 0010AEC0 8402048E */  lw         $4, (0x250284 & 0xFFFF)($16)
/* AFC4 0010AEC4 DC50040C */  jal        PollSema
/* AFC8 0010AEC8 00000000 */   nop
/* AFCC 0010AECC 8402038E */  lw         $3, (0x250284 & 0xFFFF)($16)
/* AFD0 0010AED0 0B006210 */  beq        $3, $2, .L0010AF00
/* AFD4 0010AED4 2500023C */   lui       $2, (0x250270 >> 16)
/* AFD8 0010AED8 7002438C */  lw         $3, (0x250270 & 0xFFFF)($2)
/* AFDC 0010AEDC 16006018 */  blez       $3, .L0010AF38
/* AFE0 0010AEE0 2500023C */   lui       $2, (0x250274 >> 16)
/* AFE4 0010AEE4 2900043C */  lui        $4, %hi(D_00297150)
/* AFE8 0010AEE8 7402468C */  lw         $6, (0x250274 & 0xFFFF)($2)
/* AFEC 0010AEEC 50718424 */  addiu      $4, $4, %lo(D_00297150)
/* AFF0 0010AEF0 A611040C */  jal        printf
/* AFF4 0010AEF4 2D282002 */   daddu     $5, $17, $0
/* AFF8 0010AEF8 3F000010 */  b          .L0010AFF8
/* AFFC 0010AEFC 2D100000 */   daddu     $2, $0, $0
.L0010AF00:
/* B000 0010AF00 2A00023C */  lui        $2, (0x2A3900 >> 16)
/* B004 0010AF04 2500033C */  lui        $3, (0x250274 >> 16)
/* B008 0010AF08 0039448C */  lw         $4, (0x2A3900 & 0xFFFF)($2)
/* B00C 0010AF0C 2A00053C */  lui        $5, %hi(D_002A3908)
/* B010 0010AF10 740271AC */  sw         $17, (0x250274 & 0xFFFF)($3)
/* B014 0010AF14 8850040C */  jal        ReferThreadStatus
/* B018 0010AF18 0839A524 */   addiu     $5, $5, %lo(D_002A3908)
/* B01C 0010AF1C 8E2B040C */  jal        sceCdSyncS
/* B020 0010AF20 01000424 */   addiu     $4, $0, 0x1
/* B024 0010AF24 06004010 */  beqz       $2, .L0010AF40
/* B028 0010AF28 2D200000 */   daddu     $4, $0, $0
/* B02C 0010AF2C 8402048E */  lw         $4, (0x250284 & 0xFFFF)($16)
/* B030 0010AF30 D050040C */  jal        SignalSema
/* B034 0010AF34 00000000 */   nop
.L0010AF38:
/* B038 0010AF38 2F000010 */  b          .L0010AFF8
/* B03C 0010AF3C 2D100000 */   daddu     $2, $0, $0
.L0010AF40:
/* B040 0010AF40 125B040C */  jal        sceSifInitRpc
/* B044 0010AF44 2500123C */   lui       $18, (0x2502A4 >> 16)
/* B048 0010AF48 A402428E */  lw         $2, (0x2502A4 & 0xFFFF)($18)
/* B04C 0010AF4C 2A004104 */  bgez       $2, .L0010AFF8
/* B050 0010AF50 01000224 */   addiu     $2, $0, 0x1
/* B054 0010AF54 0B000010 */  b          .L0010AF84
/* B058 0010AF58 2A00113C */   lui       $17, %hi(D_002A4D60)
/* B05C 0010AF5C 00000000 */  nop
.L0010AF60:
/* B060 0010AF60 1000023C */  lui        $2, %hi(D_FFFFF)
/* B064 0010AF64 FFFF0324 */  addiu      $3, $0, -0x1
.L0010AF68:
/* B068 0010AF68 FFFF4224 */  addiu      $2, $2, %lo(D_FFFFF)
/* B06C 0010AF6C 00000000 */  nop
/* B070 0010AF70 00000000 */  nop
/* B074 0010AF74 00000000 */  nop
/* B078 0010AF78 00000000 */  nop
/* B07C 0010AF7C FAFF4314 */  bne        $2, $3, .L0010AF68
/* B080 0010AF80 00000000 */   nop
.L0010AF84:
/* B084 0010AF84 604D3026 */  addiu      $16, $17, %lo(D_002A4D60)
.L0010AF88:
/* B088 0010AF88 0080053C */  lui        $5, (0x80000593 >> 16)
/* B08C 0010AF8C 2D200002 */  daddu      $4, $16, $0
/* B090 0010AF90 9305A534 */  ori        $5, $5, (0x80000593 & 0xFFFF)
/* B094 0010AF94 B65C040C */  jal        sceSifBindRpc
/* B098 0010AF98 2D300000 */   daddu     $6, $0, $0
/* B09C 0010AF9C 13004304 */  bgezl      $2, .L0010AFEC
/* B0A0 0010AFA0 2400028E */   lw        $2, 0x24($16)
/* B0A4 0010AFA4 2500023C */  lui        $2, (0x250270 >> 16)
/* B0A8 0010AFA8 7002438C */  lw         $3, (0x250270 & 0xFFFF)($2)
/* B0AC 0010AFAC 05006018 */  blez       $3, .L0010AFC4
/* B0B0 0010AFB0 1000023C */   lui       $2, %hi(D_FFFFF)
/* B0B4 0010AFB4 2900043C */  lui        $4, %hi(D_00297178)
/* B0B8 0010AFB8 A611040C */  jal        printf
/* B0BC 0010AFBC 78718424 */   addiu     $4, $4, %lo(D_00297178)
/* B0C0 0010AFC0 1000023C */  lui        $2, %hi(D_FFFFF)
.L0010AFC4:
/* B0C4 0010AFC4 FFFF0324 */  addiu      $3, $0, -0x1
.L0010AFC8:
/* B0C8 0010AFC8 FFFF4224 */  addiu      $2, $2, %lo(D_FFFFF)
/* B0CC 0010AFCC 00000000 */  nop
/* B0D0 0010AFD0 00000000 */  nop
/* B0D4 0010AFD4 00000000 */  nop
/* B0D8 0010AFD8 00000000 */  nop
/* B0DC 0010AFDC FAFF4314 */  bne        $2, $3, .L0010AFC8
/* B0E0 0010AFE0 00000000 */   nop
/* B0E4 0010AFE4 E8FF0010 */  b          .L0010AF88
/* B0E8 0010AFE8 604D3026 */   addiu     $16, $17, %lo(D_002A4D60)
.L0010AFEC:
/* B0EC 0010AFEC DCFF4010 */  beqz       $2, .L0010AF60
/* B0F0 0010AFF0 01000224 */   addiu     $2, $0, 0x1
/* B0F4 0010AFF4 A40240AE */  sw         $0, (0x2502A4 & 0xFFFF)($18)
.L0010AFF8:
/* B0F8 0010AFF8 3000BFDF */  ld         $31, 0x30($sp)
/* B0FC 0010AFFC 2000B2DF */  ld         $18, 0x20($sp)
/* B100 0010B000 1000B1DF */  ld         $17, 0x10($sp)
/* B104 0010B004 0000B0DF */  ld         $16, 0x0($sp)
/* B108 0010B008 0800E003 */  jr         $31
/* B10C 0010B00C 4000BD27 */   addiu     $sp, $sp, 0x40
