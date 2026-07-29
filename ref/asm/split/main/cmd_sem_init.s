.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel cmd_sem_init
/* 009A38 00109938 B0FFBD27 */  addiu       $29, $29, -0x50
/* 009A3C 0010993C FFFF0324 */  addiu       $3, $0, -0x1
/* 009A40 00109940 3000B1FF */  sd          $17, 0x30($29)
/* 009A44 00109944 2500113C */  lui         $17, %hi(ncmd_semid)
/* 009A48 00109948 4000BFFF */  sd          $31, 0x40($29)
/* 009A4C 0010994C 8002228E */  lw          $2, %lo(ncmd_semid)($17)
/* 009A50 00109950 07004310 */  beq         $2, $3, .L00109970
/* 009A54 00109954 2000B0FF */   sd         $16, 0x20($29)
/* 009A58 00109958 2500103C */  lui         $16, %hi(scmd_semid)
/* 009A5C 0010995C 8402028E */  lw          $2, %lo(scmd_semid)($16)
/* 009A60 00109960 16004314 */  bne         $2, $3, .L001099BC
/* 009A64 00109964 4000BFDF */   ld         $31, 0x40($29)
/* 009A68 00109968 03000010 */  b           .L00109978
/* 009A6C 0010996C 01000224 */   addiu      $2, $0, 0x1
.L00109970:
/* 009A70 00109970 2500103C */  lui         $16, %hi(scmd_semid)
/* 009A74 00109974 01000224 */  addiu       $2, $0, 0x1
.L00109978:
/* 009A78 00109978 1400A0AF */  sw          $0, 0x14($29)
/* 009A7C 0010997C 0400A2AF */  sw          $2, 0x4($29)
/* 009A80 00109980 2D20A003 */  daddu       $4, $29, $0
/* 009A84 00109984 C850040C */  jal         CreateSema
/* 009A88 00109988 0800A2AF */   sw         $2, 0x8($29)
/* 009A8C 0010998C 2D20A003 */  daddu       $4, $29, $0
/* 009A90 00109990 C850040C */  jal         CreateSema
/* 009A94 00109994 800222AE */   sw         $2, %lo(ncmd_semid)($17)
/* 009A98 00109998 840202AE */  sw          $2, %lo(scmd_semid)($16)
/* 009A9C 0010999C 2D20A003 */  daddu       $4, $29, $0
/* 009AA0 001099A0 C850040C */  jal         CreateSema
/* 009AA4 001099A4 0800A0AF */   sw         $0, 0x8($29)
/* 009AA8 001099A8 2500033C */  lui         $3, %hi(cb_semid)
/* 009AAC 001099AC 880262AC */  sw          $2, %lo(cb_semid)($3)
/* 009AB0 001099B0 2500023C */  lui         $2, %hi(c_cb_sem)
/* 009AB4 001099B4 8C0240AC */  sw          $0, %lo(c_cb_sem)($2)
/* 009AB8 001099B8 4000BFDF */  ld          $31, 0x40($29)
.L001099BC:
/* 009ABC 001099BC 3000B1DF */  ld          $17, 0x30($29)
/* 009AC0 001099C0 2000B0DF */  ld          $16, 0x20($29)
/* 009AC4 001099C4 0800E003 */  jr          $31
/* 009AC8 001099C8 5000BD27 */   addiu      $29, $29, 0x50
/* 009ACC 001099CC 00000000 */  nop
