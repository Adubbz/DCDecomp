.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _LOAD_ITEM_FILE__FP12RS_STACKDATAi
/* 8DB50 0018DA50 D0FEBD27 */  addiu      $sp, $sp, -0x130
/* 8DB54 0018DA54 1000BF7F */  sq         $31, 0x10($sp)
/* 8DB58 0018DA58 0000B07F */  sq         $16, 0x0($sp)
/* 8DB5C 0018DA5C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8DB60 0018DA60 00000000 */   nop
/* 8DB64 0018DA64 28264070 */  paddub     $4, $2, $0
/* 8DB68 0018DA68 2000A527 */  addiu      $5, $sp, 0x20
/* 8DB6C 0018DA6C A000A627 */  addiu      $6, $sp, 0xA0
/* 8DB70 0018DA70 D4CC050C */  jal        EdGetItemFile__FiPcPc
/* 8DB74 0018DA74 00000000 */   nop
/* 8DB78 0018DA78 2000A283 */  lb         $2, 0x20($sp)
/* 8DB7C 0018DA7C 04004010 */  beqz       $2, .L0018DA90
/* 8DB80 0018DA80 00000000 */   nop
/* 8DB84 0018DA84 A000A283 */  lb         $2, 0xA0($sp)
/* 8DB88 0018DA88 04004014 */  bnez       $2, .L0018DA9C
/* 8DB8C 0018DA8C 00000000 */   nop
.L0018DA90:
/* 8DB90 0018DA90 28160070 */  paddub     $2, $0, $0
/* 8DB94 0018DA94 16000010 */  b          .L0018DAF0
/* 8DB98 0018DA98 00000000 */   nop
.L0018DA9C:
/* 8DB9C 0018DA9C 30FB040C */  jal        StartReadBG__Fv
/* 8DBA0 0018DAA0 00000000 */   nop
/* 8DBA4 0018DAA4 948B908F */  lw         $16, -0x746C($gp)
/* 8DBA8 0018DAA8 A000A427 */  addiu      $4, $sp, 0xA0
/* 8DBAC 0018DAAC 282E0072 */  paddub     $5, $16, $0
/* 8DBB0 0018DAB0 2C01A627 */  addiu      $6, $sp, 0x12C
/* 8DBB4 0018DAB4 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 8DBB8 0018DAB8 00000000 */   nop
/* 8DBBC 0018DABC 2C01A28F */  lw         $2, 0x12C($sp)
/* 8DBC0 0018DAC0 83110200 */  sra        $2, $2, 6
/* 8DBC4 0018DAC4 01004224 */  addiu      $2, $2, 0x1
/* 8DBC8 0018DAC8 80110200 */  sll        $2, $2, 6
/* 8DBCC 0018DACC 03110200 */  sra        $2, $2, 4
/* 8DBD0 0018DAD0 00110200 */  sll        $2, $2, 4
/* 8DBD4 0018DAD4 21800202 */  addu       $16, $16, $2
/* 8DBD8 0018DAD8 2000A427 */  addiu      $4, $sp, 0x20
/* 8DBDC 0018DADC 282E0072 */  paddub     $5, $16, $0
/* 8DBE0 0018DAE0 2C01A627 */  addiu      $6, $sp, 0x12C
/* 8DBE4 0018DAE4 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 8DBE8 0018DAE8 00000000 */   nop
/* 8DBEC 0018DAEC 01000224 */  addiu      $2, $0, 0x1
.L0018DAF0:
/* 8DBF0 0018DAF0 1000BF7B */  lq         $31, 0x10($sp)
/* 8DBF4 0018DAF4 0000B07B */  lq         $16, 0x0($sp)
/* 8DBF8 0018DAF8 3001BD27 */  addiu      $sp, $sp, 0x130
/* 8DBFC 0018DAFC 0800E003 */  jr         $31
/* 8DC00 0018DB00 00000000 */   nop
/* 8DC04 0018DB04 00000000 */  nop
/* 8DC08 0018DB08 00000000 */  nop
/* 8DC0C 0018DB0C 00000000 */  nop
