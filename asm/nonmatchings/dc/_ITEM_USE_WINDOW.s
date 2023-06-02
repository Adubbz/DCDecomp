.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _ITEM_USE_WINDOW__FP12RS_STACKDATAi
/* BBBD0 001BBAD0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* BBBD4 001BBAD4 3000BF7F */  sq         $31, 0x30($sp)
/* BBBD8 001BBAD8 2000B27F */  sq         $18, 0x20($sp)
/* BBBDC 001BBADC 1000B17F */  sq         $17, 0x10($sp)
/* BBBE0 001BBAE0 0000B07F */  sq         $16, 0x0($sp)
/* BBBE4 001BBAE4 28968070 */  paddub     $18, $4, $0
/* BBBE8 001BBAE8 288EA070 */  paddub     $17, $5, $0
/* BBBEC 001BBAEC 0000838C */  lw         $3, 0x0($4)
/* BBBF0 001BBAF0 03000224 */  addiu      $2, $0, 0x3
/* BBBF4 001BBAF4 04006210 */  beq        $3, $2, .L001BBB08
/* BBBF8 001BBAF8 00000000 */   nop
/* BBBFC 001BBAFC 28160070 */  paddub     $2, $0, $0
/* BBC00 001BBB00 27000010 */  b          .L001BBBA0
/* BBC04 001BBB04 00000000 */   nop
.L001BBB08:
/* BBC08 001BBB08 0400428E */  lw         $2, 0x4($18)
/* BBC0C 001BBB0C D501013C */  lui        $at, (0x1D567C0 >> 16)
/* BBC10 001BBB10 C06722AC */  sw         $2, (0x1D567C0 & 0xFFFF)($at)
/* BBC14 001BBB14 08005226 */  addiu      $18, $18, 0x8
/* BBC18 001BBB18 28860070 */  paddub     $16, $0, $0
/* BBC1C 001BBB1C 0B000010 */  b          .L001BBB4C
/* BBC20 001BBB20 00000000 */   nop
.L001BBB24:
/* BBC24 001BBB24 28264072 */  paddub     $4, $18, $0
/* BBC28 001BBB28 08009224 */  addiu      $18, $4, 0x8
/* BBC2C 001BBB2C 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BBC30 001BBB30 00000000 */   nop
/* BBC34 001BBB34 80201000 */  sll        $4, $16, 2
/* BBC38 001BBB38 D501033C */  lui        $3, %hi(D_1D5677C)
/* BBC3C 001BBB3C 7C676324 */  addiu      $3, $3, %lo(D_1D5677C)
/* BBC40 001BBB40 21186400 */  addu       $3, $3, $4
/* BBC44 001BBB44 000062AC */  sw         $2, 0x0($3)
/* BBC48 001BBB48 01001026 */  addiu      $16, $16, 0x1
.L001BBB4C:
/* BBC4C 001BBB4C FFFF2226 */  addiu      $2, $17, -0x1
/* BBC50 001BBB50 2A100202 */  slt        $2, $16, $2
/* BBC54 001BBB54 F3FF4014 */  bnez       $2, .L001BBB24
/* BBC58 001BBB58 00000000 */   nop
/* BBC5C 001BBB5C D501013C */  lui        $at, (0x1D567BC >> 16)
/* BBC60 001BBB60 BC6720AC */  sw         $0, (0x1D567BC & 0xFFFF)($at)
/* BBC64 001BBB64 0200212A */  slti       $at, $17, 0x2
/* BBC68 001BBB68 04002014 */  bnez       $at, .L001BBB7C
/* BBC6C 001BBB6C 00000000 */   nop
/* BBC70 001BBB70 01000224 */  addiu      $2, $0, 0x1
/* BBC74 001BBB74 D501013C */  lui        $at, (0x1D567BC >> 16)
/* BBC78 001BBB78 BC6722AC */  sw         $2, (0x1D567BC & 0xFFFF)($at)
.L001BBB7C:
/* BBC7C 001BBB7C FFFF0424 */  addiu      $4, $0, -0x1
/* BBC80 001BBB80 80181000 */  sll        $3, $16, 2
/* BBC84 001BBB84 D501023C */  lui        $2, %hi(D_1D5677C)
/* BBC88 001BBB88 7C674224 */  addiu      $2, $2, %lo(D_1D5677C)
/* BBC8C 001BBB8C 21104300 */  addu       $2, $2, $3
/* BBC90 001BBB90 000044AC */  sw         $4, 0x0($2)
/* BBC94 001BBB94 01000224 */  addiu      $2, $0, 0x1
/* BBC98 001BBB98 D501013C */  lui        $at, (0x1D567D8 >> 16)
/* BBC9C 001BBB9C D86722AC */  sw         $2, (0x1D567D8 & 0xFFFF)($at)
.L001BBBA0:
/* BBCA0 001BBBA0 3000BF7B */  lq         $31, 0x30($sp)
/* BBCA4 001BBBA4 2000B27B */  lq         $18, 0x20($sp)
/* BBCA8 001BBBA8 1000B17B */  lq         $17, 0x10($sp)
/* BBCAC 001BBBAC 0000B07B */  lq         $16, 0x0($sp)
/* BBCB0 001BBBB0 4000BD27 */  addiu      $sp, $sp, 0x40
/* BBCB4 001BBBB4 0800E003 */  jr         $31
/* BBCB8 001BBBB8 00000000 */   nop
/* BBCBC 001BBBBC 00000000 */  nop
