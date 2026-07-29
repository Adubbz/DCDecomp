.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel scmd_prechk
/* 00AFA0 0010AEA0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 00AFA4 0010AEA4 1000B1FF */  sd          $17, 0x10($29)
/* 00AFA8 0010AEA8 0000B0FF */  sd          $16, 0x0($29)
/* 00AFAC 0010AEAC 2D888000 */  daddu       $17, $4, $0
/* 00AFB0 0010AEB0 3000BFFF */  sd          $31, 0x30($29)
/* 00AFB4 0010AEB4 2500103C */  lui         $16, %hi(scmd_semid)
/* 00AFB8 0010AEB8 4E26040C */  jal         cmd_sem_init
/* 00AFBC 0010AEBC 2000B2FF */   sd         $18, 0x20($29)
/* 00AFC0 0010AEC0 8402048E */  lw          $4, %lo(scmd_semid)($16)
/* 00AFC4 0010AEC4 DC50040C */  jal         PollSema
/* 00AFC8 0010AEC8 00000000 */   nop
/* 00AFCC 0010AECC 8402038E */  lw          $3, %lo(scmd_semid)($16)
/* 00AFD0 0010AED0 0B006210 */  beq         $3, $2, .L0010AF00
/* 00AFD4 0010AED4 2500023C */   lui        $2, %hi(CD_debug)
/* 00AFD8 0010AED8 7002438C */  lw          $3, %lo(CD_debug)($2)
/* 00AFDC 0010AEDC 16006018 */  blez        $3, .L0010AF38
/* 00AFE0 0010AEE0 2500023C */   lui        $2, %hi(scmd_sema_keep_cmd)
/* 00AFE4 0010AEE4 2900043C */  lui         $4, %hi(RO_00297150)
/* 00AFE8 0010AEE8 7402468C */  lw          $6, %lo(scmd_sema_keep_cmd)($2)
/* 00AFEC 0010AEEC 50718424 */  addiu       $4, $4, %lo(RO_00297150)
/* 00AFF0 0010AEF0 A611040C */  jal         printf
/* 00AFF4 0010AEF4 2D282002 */   daddu      $5, $17, $0
/* 00AFF8 0010AEF8 3F000010 */  b           .L0010AFF8
/* 00AFFC 0010AEFC 2D100000 */   daddu      $2, $0, $0
.L0010AF00:
/* 00B000 0010AF00 2A00023C */  lui         $2, %hi(my_thid)
/* 00B004 0010AF04 2500033C */  lui         $3, %hi(scmd_sema_keep_cmd)
/* 00B008 0010AF08 0039448C */  lw          $4, %lo(my_thid)($2)
/* 00B00C 0010AF0C 2A00053C */  lui         $5, %hi(my_th_info)
/* 00B010 0010AF10 740271AC */  sw          $17, %lo(scmd_sema_keep_cmd)($3)
/* 00B014 0010AF14 8850040C */  jal         ReferThreadStatus
/* 00B018 0010AF18 0839A524 */   addiu      $5, $5, %lo(my_th_info)
/* 00B01C 0010AF1C 8E2B040C */  jal         sceCdSyncS
/* 00B020 0010AF20 01000424 */   addiu      $4, $0, 0x1
/* 00B024 0010AF24 06004010 */  beqz        $2, .L0010AF40
/* 00B028 0010AF28 2D200000 */   daddu      $4, $0, $0
/* 00B02C 0010AF2C 8402048E */  lw          $4, %lo(scmd_semid)($16)
/* 00B030 0010AF30 D050040C */  jal         SignalSema
/* 00B034 0010AF34 00000000 */   nop
.L0010AF38:
/* 00B038 0010AF38 2F000010 */  b           .L0010AFF8
/* 00B03C 0010AF3C 2D100000 */   daddu      $2, $0, $0
.L0010AF40:
/* 00B040 0010AF40 125B040C */  jal         sceSifInitRpc
/* 00B044 0010AF44 2500123C */   lui        $18, %hi(_scmd_bind)
/* 00B048 0010AF48 A402428E */  lw          $2, %lo(_scmd_bind)($18)
/* 00B04C 0010AF4C 2A004104 */  bgez        $2, .L0010AFF8
/* 00B050 0010AF50 01000224 */   addiu      $2, $0, 0x1
/* 00B054 0010AF54 0B000010 */  b           .L0010AF84
/* 00B058 0010AF58 2A00113C */   lui        $17, %hi(cdrc)
/* 00B05C 0010AF5C 00000000 */  nop
.L0010AF60:
/* 00B060 0010AF60 1000023C */  lui         $2, 0x10
/* 00B064 0010AF64 FFFF0324 */  addiu       $3, $0, -0x1
.L0010AF68:
/* 00B068 0010AF68 FFFF4224 */  addiu       $2, $2, -0x1
/* 00B06C 0010AF6C 00000000 */  nop
/* 00B070 0010AF70 00000000 */  nop
/* 00B074 0010AF74 00000000 */  nop
/* 00B078 0010AF78 00000000 */  nop
/* 00B07C 0010AF7C FAFF4314 */  bne         $2, $3, .L0010AF68
/* 00B080 0010AF80 00000000 */   nop
.L0010AF84:
/* 00B084 0010AF84 604D3026 */  addiu       $16, $17, %lo(cdrc)
.L0010AF88:
/* 00B088 0010AF88 0080053C */  lui         $5, (0x80000593 >> 16)
/* 00B08C 0010AF8C 2D200002 */  daddu       $4, $16, $0
/* 00B090 0010AF90 9305A534 */  ori         $5, $5, (0x80000593 & 0xFFFF)
/* 00B094 0010AF94 B65C040C */  jal         sceSifBindRpc
/* 00B098 0010AF98 2D300000 */   daddu      $6, $0, $0
/* 00B09C 0010AF9C 13004304 */  bgezl       $2, .L0010AFEC
/* 00B0A0 0010AFA0 2400028E */   lw         $2, 0x24($16)
/* 00B0A4 0010AFA4 2500023C */  lui         $2, %hi(CD_debug)
/* 00B0A8 0010AFA8 7002438C */  lw          $3, %lo(CD_debug)($2)
/* 00B0AC 0010AFAC 05006018 */  blez        $3, .L0010AFC4
/* 00B0B0 0010AFB0 1000023C */   lui        $2, 0x10
/* 00B0B4 0010AFB4 2900043C */  lui         $4, %hi(RO_00297178)
/* 00B0B8 0010AFB8 A611040C */  jal         printf
/* 00B0BC 0010AFBC 78718424 */   addiu      $4, $4, %lo(RO_00297178)
/* 00B0C0 0010AFC0 1000023C */  lui         $2, (0x100000 >> 16)
.L0010AFC4:
/* 00B0C4 0010AFC4 FFFF0324 */  addiu       $3, $0, -0x1
.L0010AFC8:
/* 00B0C8 0010AFC8 FFFF4224 */  addiu       $2, $2, -0x1
/* 00B0CC 0010AFCC 00000000 */  nop
/* 00B0D0 0010AFD0 00000000 */  nop
/* 00B0D4 0010AFD4 00000000 */  nop
/* 00B0D8 0010AFD8 00000000 */  nop
/* 00B0DC 0010AFDC FAFF4314 */  bne         $2, $3, .L0010AFC8
/* 00B0E0 0010AFE0 00000000 */   nop
/* 00B0E4 0010AFE4 E8FF0010 */  b           .L0010AF88
/* 00B0E8 0010AFE8 604D3026 */   addiu      $16, $17, %lo(cdrc)
.L0010AFEC:
/* 00B0EC 0010AFEC DCFF4010 */  beqz        $2, .L0010AF60
/* 00B0F0 0010AFF0 01000224 */   addiu      $2, $0, 0x1
/* 00B0F4 0010AFF4 A40240AE */  sw          $0, %lo(_scmd_bind)($18)
.L0010AFF8:
/* 00B0F8 0010AFF8 3000BFDF */  ld          $31, 0x30($29)
/* 00B0FC 0010AFFC 2000B2DF */  ld          $18, 0x20($29)
/* 00B100 0010B000 1000B1DF */  ld          $17, 0x10($29)
/* 00B104 0010B004 0000B0DF */  ld          $16, 0x0($29)
/* 00B108 0010B008 0800E003 */  jr          $31
/* 00B10C 0010B00C 4000BD27 */   addiu      $29, $29, 0x40
