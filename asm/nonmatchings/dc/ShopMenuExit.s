.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ShopMenuExit__Fv
/* E7CA0 001E7BA0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E7CA4 001E7BA4 0000BF7F */  sq         $31, 0x0($sp)
/* E7CA8 001E7BA8 8494828F */  lw         $2, -0x6B7C($gp)
/* E7CAC 001E7BAC 60434524 */  addiu      $5, $2, 0x4360
/* E7CB0 001E7BB0 614340A0 */  sb         $0, 0x4361($2)
/* E7CB4 001E7BB4 28260070 */  paddub     $4, $0, $0
/* E7CB8 001E7BB8 0C000010 */  b          .L001E7BEC
/* E7CBC 001E7BBC 00000000 */   nop
.L001E7BC0:
/* E7CC0 001E7BC0 40100400 */  sll        $2, $4, 1
/* E7CC4 001E7BC4 21184500 */  addu       $3, $2, $5
/* E7CC8 001E7BC8 02006284 */  lh         $2, 0x2($3)
/* E7CCC 001E7BCC 84004228 */  slti       $2, $2, 0x84
/* E7CD0 001E7BD0 05004014 */  bnez       $2, .L001E7BE8
/* E7CD4 001E7BD4 00000000 */   nop
/* E7CD8 001E7BD8 08006380 */  lb         $3, 0x8($3)
/* E7CDC 001E7BDC 0100A280 */  lb         $2, 0x1($5)
/* E7CE0 001E7BE0 21104300 */  addu       $2, $2, $3
/* E7CE4 001E7BE4 0100A2A0 */  sb         $2, 0x1($5)
.L001E7BE8:
/* E7CE8 001E7BE8 01008424 */  addiu      $4, $4, 0x1
.L001E7BEC:
/* E7CEC 001E7BEC 03008228 */  slti       $2, $4, 0x3
/* E7CF0 001E7BF0 F3FF4014 */  bnez       $2, .L001E7BC0
/* E7CF4 001E7BF4 00000000 */   nop
/* E7CF8 001E7BF8 281E0070 */  paddub     $3, $0, $0
/* E7CFC 001E7BFC 0B000010 */  b          .L001E7C2C
/* E7D00 001E7C00 00000000 */   nop
.L001E7C04:
/* E7D04 001E7C04 40100300 */  sll        $2, $3, 1
/* E7D08 001E7C08 21104500 */  addu       $2, $2, $5
/* E7D0C 001E7C0C 0E004284 */  lh         $2, 0xE($2)
/* E7D10 001E7C10 84004228 */  slti       $2, $2, 0x84
/* E7D14 001E7C14 04004014 */  bnez       $2, .L001E7C28
/* E7D18 001E7C18 00000000 */   nop
/* E7D1C 001E7C1C 0100A280 */  lb         $2, 0x1($5)
/* E7D20 001E7C20 01004224 */  addiu      $2, $2, 0x1
/* E7D24 001E7C24 0100A2A0 */  sb         $2, 0x1($5)
.L001E7C28:
/* E7D28 001E7C28 01006324 */  addiu      $3, $3, 0x1
.L001E7C2C:
/* E7D2C 001E7C2C 0000A280 */  lb         $2, 0x0($5)
/* E7D30 001E7C30 2A106200 */  slt        $2, $3, $2
/* E7D34 001E7C34 F3FF4014 */  bnez       $2, .L001E7C04
/* E7D38 001E7C38 00000000 */   nop
/* E7D3C 001E7C3C C4B9080C */  jal        DeleteMenuTrushMark__Fv
/* E7D40 001E7C40 00000000 */   nop
/* E7D44 001E7C44 FFFF0224 */  addiu      $2, $0, -0x1
/* E7D48 001E7C48 DA01013C */  lui        $at, (0x1DA3B64 >> 16)
/* E7D4C 001E7C4C 643B22AC */  sw         $2, (0x1DA3B64 & 0xFFFF)($at)
/* E7D50 001E7C50 04000224 */  addiu      $2, $0, 0x4
/* E7D54 001E7C54 DA01013C */  lui        $at, (0x1DA52E4 >> 16)
/* E7D58 001E7C58 E45222AC */  sw         $2, (0x1DA52E4 & 0xFFFF)($at)
/* E7D5C 001E7C5C D901013C */  lui        $at, (0x1D9025A >> 16)
/* E7D60 001E7C60 5A022584 */  lh         $5, (0x1D9025A & 0xFFFF)($at)
/* E7D64 001E7C64 C701023C */  lui        $2, %hi(TexManager)
/* E7D68 001E7C68 70584424 */  addiu      $4, $2, %lo(TexManager)
/* E7D6C 001E7C6C C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* E7D70 001E7C70 00000000 */   nop
/* E7D74 001E7C74 D901013C */  lui        $at, (0x1D90266 >> 16)
/* E7D78 001E7C78 66022584 */  lh         $5, (0x1D90266 & 0xFFFF)($at)
/* E7D7C 001E7C7C C701023C */  lui        $2, %hi(TexManager)
/* E7D80 001E7C80 70584424 */  addiu      $4, $2, %lo(TexManager)
/* E7D84 001E7C84 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* E7D88 001E7C88 00000000 */   nop
/* E7D8C 001E7C8C C701023C */  lui        $2, %hi(TexManager)
/* E7D90 001E7C90 70584424 */  addiu      $4, $2, %lo(TexManager)
/* E7D94 001E7C94 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* E7D98 001E7C98 00000000 */   nop
/* E7D9C 001E7C9C CC01023C */  lui        $2, %hi(GamePad)
/* E7DA0 001E7CA0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* E7DA4 001E7CA4 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* E7DA8 001E7CA8 00000000 */   nop
/* E7DAC 001E7CAC CC01023C */  lui        $2, %hi(GamePad)
/* E7DB0 001E7CB0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* E7DB4 001E7CB4 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* E7DB8 001E7CB8 00000000 */   nop
/* E7DBC 001E7CBC 0000BF7B */  lq         $31, 0x0($sp)
/* E7DC0 001E7CC0 1000BD27 */  addiu      $sp, $sp, 0x10
/* E7DC4 001E7CC4 0800E003 */  jr         $31
/* E7DC8 001E7CC8 00000000 */   nop
/* E7DCC 001E7CCC 00000000 */  nop
