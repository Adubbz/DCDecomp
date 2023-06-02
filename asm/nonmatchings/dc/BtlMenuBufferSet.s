.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtlMenuBufferSet__Fi
/* 12BCB0 0022BBB0 01000324 */  addiu      $3, $0, 0x1
/* 12BCB4 0022BBB4 08008310 */  beq        $4, $3, .L0022BBD8
/* 12BCB8 0022BBB8 00000000 */   nop
/* 12BCBC 0022BBBC 03008010 */  beqz       $4, .L0022BBCC
/* 12BCC0 0022BBC0 00000000 */   nop
/* 12BCC4 0022BBC4 0A000010 */  b          .L0022BBF0
/* 12BCC8 0022BBC8 00000000 */   nop
.L0022BBCC:
/* 12BCCC 0022BBCC 948B828F */  lw         $2, -0x746C($gp)
/* 12BCD0 0022BBD0 07000010 */  b          .L0022BBF0
/* 12BCD4 0022BBD4 00000000 */   nop
.L0022BBD8:
/* 12BCD8 0022BBD8 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 12BCDC 0022BBDC D8B3228C */  lw         $2, -0x4C28($at)
/* 12BCE0 0022BBE0 00190200 */  sll        $3, $2, 4
/* 12BCE4 0022BBE4 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 12BCE8 0022BBE8 D0B3228C */  lw         $2, -0x4C30($at)
/* 12BCEC 0022BBEC 21104300 */  addu       $2, $2, $3
.L0022BBF0:
/* 12BCF0 0022BBF0 0800E003 */  jr         $31
/* 12BCF4 0022BBF4 00000000 */   nop
/* 12BCF8 0022BBF8 00000000 */  nop
/* 12BCFC 0022BBFC 00000000 */  nop
