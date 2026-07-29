.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel next_stack_level
/* 00DE60 0010DD60 D0FFBD27 */  addiu       $29, $29, -0x30
/* 00DE64 0010DD64 1000B1FF */  sd          $17, 0x10($29)
/* 00DE68 0010DD68 2D88A000 */  daddu       $17, $5, $0
/* 00DE6C 0010DD6C 0000B0FF */  sd          $16, 0x0($29)
/* 00DE70 0010DD70 2000BFFF */  sd          $31, 0x20($29)
/* 00DE74 0010DD74 D847040C */  jal         __frame_state_for
/* 00DE78 0010DD78 2D28C000 */   daddu      $5, $6, $0
/* 00DE7C 0010DD7C 2D804000 */  daddu       $16, $2, $0
/* 00DE80 0010DD80 03000056 */  bnel        $16, $0, .L0010DD90
/* 00DE84 0010DD84 98020496 */   lhu        $4, 0x298($16)
/* 00DE88 0010DD88 13000010 */  b           .L0010DDD8
/* 00DE8C 0010DD8C 2D100000 */   daddu      $2, $0, $0
.L0010DD90:
/* 00DE90 0010DD90 21102402 */  addu        $2, $17, $4
/* 00DE94 0010DD94 9C024380 */  lb          $3, 0x29C($2)
/* 00DE98 0010DD98 08006010 */  beqz        $3, .L0010DDBC
/* 00DE9C 0010DD9C 2D282002 */   daddu      $5, $17, $0
/* 00DEA0 0010DDA0 1637040C */  jal         get_reg_addr
/* 00DEA4 0010DDA4 2D300000 */   daddu      $6, $0, $0
/* 00DEA8 0010DDA8 000043DC */  ld          $3, 0x0($2)
/* 00DEAC 0010DDAC 3C180300 */  dsll32      $3, $3, 0
/* 00DEB0 0010DDB0 3F180300 */  dsra32      $3, $3, 0
/* 00DEB4 0010DDB4 03000010 */  b           .L0010DDC4
/* 00DEB8 0010DDB8 000003AE */   sw         $3, 0x0($16)
.L0010DDBC:
/* 00DEBC 0010DDBC 0000228E */  lw          $2, 0x0($17)
/* 00DEC0 0010DDC0 000002AE */  sw          $2, 0x0($16)
.L0010DDC4:
/* 00DEC4 0010DDC4 0000038E */  lw          $3, 0x0($16)
/* 00DEC8 0010DDC8 2D100002 */  daddu       $2, $16, $0
/* 00DECC 0010DDCC 0800048E */  lw          $4, 0x8($16)
/* 00DED0 0010DDD0 21186400 */  addu        $3, $3, $4
/* 00DED4 0010DDD4 000003AE */  sw          $3, 0x0($16)
.L0010DDD8:
/* 00DED8 0010DDD8 2000BFDF */  ld          $31, 0x20($29)
/* 00DEDC 0010DDDC 1000B1DF */  ld          $17, 0x10($29)
/* 00DEE0 0010DDE0 0000B0DF */  ld          $16, 0x0($29)
/* 00DEE4 0010DDE4 0800E003 */  jr          $31
/* 00DEE8 0010DDE8 3000BD27 */   addiu      $29, $29, 0x30
/* 00DEEC 0010DDEC 00000000 */  nop
