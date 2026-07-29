.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetVibration__8CGamePadFiii
/* 02BA40 0012B940 6404838C */  lw          $3, 0x464($4)
/* 02BA44 0012B944 15006010 */  beqz        $3, .L0012B99C
/* 02BA48 0012B948 00000000 */   nop
/* 02BA4C 0012B94C 0900A004 */  bltz        $5, .L0012B974
/* 02BA50 0012B950 00000000 */   nop
/* 02BA54 0012B954 0200A128 */  slti        $1, $5, 0x2
/* 02BA58 0012B958 06002010 */  beqz        $1, .L0012B974
/* 02BA5C 0012B95C 00000000 */   nop
/* 02BA60 0012B960 0400E004 */  bltz        $7, .L0012B974
/* 02BA64 0012B964 00000000 */   nop
/* 02BA68 0012B968 B104E128 */  slti        $1, $7, 0x4B1
/* 02BA6C 0012B96C 03002014 */  bnez        $1, .L0012B97C
/* 02BA70 0012B970 00000000 */   nop
.L0012B974:
/* 02BA74 0012B974 09000010 */  b           .L0012B99C
/* 02BA78 0012B978 00000000 */   nop
.L0012B97C:
/* 02BA7C 0012B97C 80180500 */  sll         $3, $5, 2
/* 02BA80 0012B980 21186400 */  addu        $3, $3, $4
/* 02BA84 0012B984 380067AC */  sw          $7, 0x38($3)
/* 02BA88 0012B988 0200A014 */  bnez        $5, .L0012B994
/* 02BA8C 0012B98C 00000000 */   nop
/* 02BA90 0012B990 2B300600 */  sltu        $6, $0, $6
.L0012B994:
/* 02BA94 0012B994 2118A400 */  addu        $3, $5, $4
/* 02BA98 0012B998 2C0066A0 */  sb          $6, 0x2C($3)
.L0012B99C:
/* 02BA9C 0012B99C 0800E003 */  jr          $31
/* 02BAA0 0012B9A0 00000000 */   nop
/* 02BAA4 0012B9A4 00000000 */  nop
/* 02BAA8 0012B9A8 00000000 */  nop
/* 02BAAC 0012B9AC 00000000 */  nop
