.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ExitBattleMenu__Fi
/* 0F5C00 001F5B00 B0FFBD27 */  addiu       $29, $29, -0x50
/* 0F5C04 001F5B04 0000BF7F */  sq          $31, 0x0($29)
/* 0F5C08 001F5B08 28260070 */  paddub      $4, $0, $0
/* 0F5C0C 001F5B0C 6095828F */  lw          $2, -0x6AA0($28)
/* 0F5C10 001F5B10 0E004524 */  addiu       $5, $2, 0xE
/* 0F5C14 001F5B14 281E0070 */  paddub      $3, $0, $0
/* 0F5C18 001F5B18 0C000010 */  b           .L001F5B4C
/* 0F5C1C 001F5B1C 00000000 */   nop
.L001F5B20:
/* 0F5C20 001F5B20 0000A284 */  lh          $2, 0x0($5)
/* 0F5C24 001F5B24 84004228 */  slti        $2, $2, 0x84
/* 0F5C28 001F5B28 04004014 */  bnez        $2, .L001F5B3C
/* 0F5C2C 001F5B2C 00000000 */   nop
/* 0F5C30 001F5B30 01008424 */  addiu       $4, $4, 0x1
/* 0F5C34 001F5B34 03000010 */  b           .L001F5B44
/* 0F5C38 001F5B38 00000000 */   nop
.L001F5B3C:
/* 0F5C3C 001F5B3C FFFF0224 */  addiu       $2, $0, -0x1
/* 0F5C40 001F5B40 0000A2A4 */  sh          $2, 0x0($5)
.L001F5B44:
/* 0F5C44 001F5B44 01006324 */  addiu       $3, $3, 0x1
/* 0F5C48 001F5B48 0200A524 */  addiu       $5, $5, 0x2
.L001F5B4C:
/* 0F5C4C 001F5B4C 6095868F */  lw          $6, -0x6AA0($28)
/* 0F5C50 001F5B50 0000C280 */  lb          $2, 0x0($6)
/* 0F5C54 001F5B54 2A106200 */  slt         $2, $3, $2
/* 0F5C58 001F5B58 F1FF4014 */  bnez        $2, .L001F5B20
/* 0F5C5C 001F5B5C 00000000 */   nop
/* 0F5C60 001F5B60 0200C524 */  addiu       $5, $6, 0x2
/* 0F5C64 001F5B64 28360070 */  paddub      $6, $0, $0
/* 0F5C68 001F5B68 14000010 */  b           .L001F5BBC
/* 0F5C6C 001F5B6C 00000000 */   nop
.L001F5B70:
/* 0F5C70 001F5B70 0000A284 */  lh          $2, 0x0($5)
/* 0F5C74 001F5B74 84004228 */  slti        $2, $2, 0x84
/* 0F5C78 001F5B78 08004014 */  bnez        $2, .L001F5B9C
/* 0F5C7C 001F5B7C 00000000 */   nop
/* 0F5C80 001F5B80 6095838F */  lw          $3, -0x6AA0($28)
/* 0F5C84 001F5B84 40100600 */  sll         $2, $6, 1
/* 0F5C88 001F5B88 21104300 */  addu        $2, $2, $3
/* 0F5C8C 001F5B8C 08004284 */  lh          $2, 0x8($2)
/* 0F5C90 001F5B90 21208200 */  addu        $4, $4, $2
/* 0F5C94 001F5B94 07000010 */  b           .L001F5BB4
/* 0F5C98 001F5B98 00000000 */   nop
.L001F5B9C:
/* 0F5C9C 001F5B9C FFFF0224 */  addiu       $2, $0, -0x1
/* 0F5CA0 001F5BA0 0000A2A4 */  sh          $2, 0x0($5)
/* 0F5CA4 001F5BA4 6095838F */  lw          $3, -0x6AA0($28)
/* 0F5CA8 001F5BA8 40100600 */  sll         $2, $6, 1
/* 0F5CAC 001F5BAC 21104300 */  addu        $2, $2, $3
/* 0F5CB0 001F5BB0 080040A4 */  sh          $0, 0x8($2)
.L001F5BB4:
/* 0F5CB4 001F5BB4 0100C624 */  addiu       $6, $6, 0x1
/* 0F5CB8 001F5BB8 0200A524 */  addiu       $5, $5, 0x2
.L001F5BBC:
/* 0F5CBC 001F5BBC 0300C228 */  slti        $2, $6, 0x3
/* 0F5CC0 001F5BC0 EBFF4014 */  bnez        $2, .L001F5B70
/* 0F5CC4 001F5BC4 00000000 */   nop
/* 0F5CC8 001F5BC8 6095828F */  lw          $2, -0x6AA0($28)
/* 0F5CCC 001F5BCC 010044A0 */  sb          $4, 0x1($2)
/* 0F5CD0 001F5BD0 2900023C */  lui         $2, %hi(LIT_959)
/* 0F5CD4 001F5BD4 E02E4224 */  addiu       $2, $2, %lo(LIT_959)
/* 0F5CD8 001F5BD8 1000A427 */  addiu       $4, $29, 0x10
/* 0F5CDC 001F5BDC 00004378 */  lq          $3, 0x0($2)
/* 0F5CE0 001F5BE0 100042DC */  ld          $2, 0x10($2)
/* 0F5CE4 001F5BE4 0000837C */  sq          $3, 0x0($4)
/* 0F5CE8 001F5BE8 100082FC */  sd          $2, 0x10($4)
/* 0F5CEC 001F5BEC E094828F */  lw          $2, -0x6B20($28)
/* 0F5CF0 001F5BF0 1000A2AF */  sw          $2, 0x10($29)
/* 0F5CF4 001F5BF4 0095828F */  lw          $2, -0x6B00($28)
/* 0F5CF8 001F5BF8 1400A2AF */  sw          $2, 0x14($29)
/* 0F5CFC 001F5BFC F894828F */  lw          $2, -0x6B08($28)
/* 0F5D00 001F5C00 1800A2AF */  sw          $2, 0x18($29)
/* 0F5D04 001F5C04 1095828F */  lw          $2, -0x6AF0($28)
/* 0F5D08 001F5C08 1C00A2AF */  sw          $2, 0x1C($29)
/* 0F5D0C 001F5C0C F494828F */  lw          $2, -0x6B0C($28)
/* 0F5D10 001F5C10 2000A2AF */  sw          $2, 0x20($29)
/* 0F5D14 001F5C14 4CB4080C */  jal         MenuTextureDelete__FPi
/* 0F5D18 001F5C18 00000000 */   nop
/* 0F5D1C 001F5C1C C701023C */  lui         $2, %hi(TexManager)
/* 0F5D20 001F5C20 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F5D24 001F5C24 FCCD040C */  jal         CleanUpBuffer__15CTextureManagerFv
/* 0F5D28 001F5C28 00000000 */   nop
/* 0F5D2C 001F5C2C C701023C */  lui         $2, %hi(TexManager)
/* 0F5D30 001F5C30 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F5D34 001F5C34 98CE040C */  jal         CleanUpTextureList__15CTextureManagerFv
/* 0F5D38 001F5C38 00000000 */   nop
/* 0F5D3C 001F5C3C DB01023C */  lui         $2, %hi(ItemVolumeStep)
/* 0F5D40 001F5C40 10BC4424 */  addiu       $4, $2, %lo(ItemVolumeStep)
/* 0F5D44 001F5C44 94D5080C */  jal         Initialize__13CMenuItemStepFv
/* 0F5D48 001F5C48 00000000 */   nop
/* 0F5D4C 001F5C4C DB01023C */  lui         $2, %hi(MenuWepLevelUp)
/* 0F5D50 001F5C50 E0A84424 */  addiu       $4, $2, %lo(MenuWepLevelUp)
/* 0F5D54 001F5C54 E4DB080C */  jal         CheckSnd__14CWeaponLevelUpFv
/* 0F5D58 001F5C58 00000000 */   nop
/* 0F5D5C 001F5C5C D894828F */  lw          $2, -0x6B28($28)
/* 0F5D60 001F5C60 03004010 */  beqz        $2, .L001F5C70
/* 0F5D64 001F5C64 00000000 */   nop
/* 0F5D68 001F5C68 0F000010 */  b           .L001F5CA8
/* 0F5D6C 001F5C6C 00000000 */   nop
.L001F5C70:
/* 0F5D70 001F5C70 2900023C */  lui         $2, %hi(LIT_963)
/* 0F5D74 001F5C74 002F4224 */  addiu       $2, $2, %lo(LIT_963)
/* 0F5D78 001F5C78 3000A627 */  addiu       $6, $29, 0x30
/* 0F5D7C 001F5C7C 00004378 */  lq          $3, 0x0($2)
/* 0F5D80 001F5C80 100042DC */  ld          $2, 0x10($2)
/* 0F5D84 001F5C84 0000C37C */  sq          $3, 0x0($6)
/* 0F5D88 001F5C88 1000C2FC */  sd          $2, 0x10($6)
/* 0F5D8C 001F5C8C E094828F */  lw          $2, -0x6B20($28)
/* 0F5D90 001F5C90 3400A2AF */  sw          $2, 0x34($29)
/* 0F5D94 001F5C94 C701023C */  lui         $2, %hi(TexManager)
/* 0F5D98 001F5C98 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F5D9C 001F5C9C FFFF0524 */  addiu       $5, $0, -0x1
/* 0F5DA0 001F5CA0 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0F5DA4 001F5CA4 00000000 */   nop
.L001F5CA8:
/* 0F5DA8 001F5CA8 DC94848F */  lw          $4, -0x6B24($28)
/* 0F5DAC 001F5CAC 4867050C */  jal         SndSetBgmVol__Fi
/* 0F5DB0 001F5CB0 00000000 */   nop
/* 0F5DB4 001F5CB4 94FA040C */  jal         InitReadBG__Fv
/* 0F5DB8 001F5CB8 00000000 */   nop
/* 0F5DBC 001F5CBC CC01023C */  lui         $2, %hi(GamePad)
/* 0F5DC0 001F5CC0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F5DC4 001F5CC4 3CAE040C */  jal         AutoRepeatOff__8CGamePadFv
/* 0F5DC8 001F5CC8 00000000 */   nop
/* 0F5DCC 001F5CCC CC01023C */  lui         $2, %hi(GamePad)
/* 0F5DD0 001F5CD0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F5DD4 001F5CD4 4CAE040C */  jal         MenuModeOff__8CGamePadFv
/* 0F5DD8 001F5CD8 00000000 */   nop
/* 0F5DDC 001F5CDC 0000BF7B */  lq          $31, 0x0($29)
/* 0F5DE0 001F5CE0 5000BD27 */  addiu       $29, $29, 0x50
/* 0F5DE4 001F5CE4 0800E003 */  jr          $31
/* 0F5DE8 001F5CE8 00000000 */   nop
/* 0F5DEC 001F5CEC 00000000 */  nop
