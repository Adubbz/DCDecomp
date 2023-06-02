.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BattleMenuExit__Fv
/* F6B40 001F6A40 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* F6B44 001F6A44 1000BF7F */  sq         $31, 0x10($sp)
/* F6B48 001F6A48 0000B07F */  sq         $16, 0x0($sp)
/* F6B4C 001F6A4C 28860070 */  paddub     $16, $0, $0
/* F6B50 001F6A50 10000010 */  b          .L001F6A94
/* F6B54 001F6A54 00000000 */   nop
.L001F6A58:
/* F6B58 001F6A58 C0181000 */  sll        $3, $16, 3
/* F6B5C 001F6A5C D901023C */  lui        $2, %hi(NorMenuIcon)
/* F6B60 001F6A60 20044224 */  addiu      $2, $2, %lo(NorMenuIcon)
/* F6B64 001F6A64 21184300 */  addu       $3, $2, $3
/* F6B68 001F6A68 46C3023C */  lui        $2, (0xC3460000 >> 16)
/* F6B6C 001F6A6C 00008244 */  mtc1       $2, $f0
/* F6B70 001F6A70 000062C4 */  lwc1       $f2, 0x0($3)
/* F6B74 001F6A74 41000246 */  sub.s      $f1, $f0, $f2
/* F6B78 001F6A78 8040023C */  lui        $2, (0x40800000 >> 16)
/* F6B7C 001F6A7C 00008244 */  mtc1       $2, $f0
/* F6B80 001F6A80 00000000 */  nop
/* F6B84 001F6A84 03080046 */  div.s      $f0, $f1, $f0
/* F6B88 001F6A88 00100046 */  add.s      $f0, $f2, $f0
/* F6B8C 001F6A8C 000060E4 */  swc1       $f0, 0x0($3)
/* F6B90 001F6A90 01001026 */  addiu      $16, $16, 0x1
.L001F6A94:
/* F6B94 001F6A94 28D0070C */  jal        GetMenuModeMax__Fv
/* F6B98 001F6A98 00000000 */   nop
/* F6B9C 001F6A9C 2A100202 */  slt        $2, $16, $2
/* F6BA0 001F6AA0 EDFF4014 */  bnez       $2, .L001F6A58
/* F6BA4 001F6AA4 00000000 */   nop
/* F6BA8 001F6AA8 849581C7 */  lwc1       $f1, -0x6A7C($gp)
/* F6BAC 001F6AAC 803F023C */  lui        $2, (0x3F800000 >> 16)
/* F6BB0 001F6AB0 00008244 */  mtc1       $2, $f0
/* F6BB4 001F6AB4 00000000 */  nop
/* F6BB8 001F6AB8 40080046 */  add.s      $f1, $f1, $f0
/* F6BBC 001F6ABC 849581E7 */  swc1       $f1, -0x6A7C($gp)
/* F6BC0 001F6AC0 A041023C */  lui        $2, (0x41A00000 >> 16)
/* F6BC4 001F6AC4 00008244 */  mtc1       $2, $f0
/* F6BC8 001F6AC8 00000000 */  nop
/* F6BCC 001F6ACC 36080046 */  c.le.s     $f1, $f0
/* F6BD0 001F6AD0 00000000 */  nop
/* F6BD4 001F6AD4 0B000145 */  bc1t       .L001F6B04
/* F6BD8 001F6AD8 00000000 */   nop
/* F6BDC 001F6ADC 8CFB040C */  jal        ReadBGSync__Fv
/* F6BE0 001F6AE0 00000000 */   nop
/* F6BE4 001F6AE4 07004014 */  bnez       $2, .L001F6B04
/* F6BE8 001F6AE8 00000000 */   nop
/* F6BEC 001F6AEC 01000424 */  addiu      $4, $0, 0x1
/* F6BF0 001F6AF0 C0D6070C */  jal        ExitBattleMenu__Fi
/* F6BF4 001F6AF4 00000000 */   nop
/* F6BF8 001F6AF8 28160070 */  paddub     $2, $0, $0
/* F6BFC 001F6AFC 02000010 */  b          .L001F6B08
/* F6C00 001F6B00 00000000 */   nop
.L001F6B04:
/* F6C04 001F6B04 01000224 */  addiu      $2, $0, 0x1
.L001F6B08:
/* F6C08 001F6B08 1000BF7B */  lq         $31, 0x10($sp)
/* F6C0C 001F6B0C 0000B07B */  lq         $16, 0x0($sp)
/* F6C10 001F6B10 2000BD27 */  addiu      $sp, $sp, 0x20
/* F6C14 001F6B14 0800E003 */  jr         $31
/* F6C18 001F6B18 00000000 */   nop
/* F6C1C 001F6B1C 00000000 */  nop
