.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishingDrawFish__Fv
/* A9B80 001A9A80 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* A9B84 001A9A84 1000BF7F */  sq         $31, 0x10($sp)
/* A9B88 001A9A88 0000B07F */  sq         $16, 0x0($sp)
/* A9B8C 001A9A8C 6893838F */  lw         $3, -0x6C98($gp)
/* A9B90 001A9A90 45006010 */  beqz       $3, .L001A9BA8
/* A9B94 001A9A94 00000000 */   nop
/* A9B98 001A9A98 6C93828F */  lw         $2, -0x6C94($gp)
/* A9B9C 001A9A9C 27004010 */  beqz       $2, .L001A9B3C
/* A9BA0 001A9AA0 00000000 */   nop
/* A9BA4 001A9AA4 A0B8040C */  jal        GetVif1Packet__Fv
/* A9BA8 001A9AA8 00000000 */   nop
/* A9BAC 001A9AAC 6093838F */  lw         $3, -0x6CA0($gp)
/* A9BB0 001A9AB0 01006624 */  addiu      $6, $3, 0x1
/* A9BB4 001A9AB4 C701033C */  lui        $3, %hi(TexManager)
/* A9BB8 001A9AB8 70586424 */  addiu      $4, $3, %lo(TexManager)
/* A9BBC 001A9ABC 282E4070 */  paddub     $5, $2, $0
/* A9BC0 001A9AC0 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* A9BC4 001A9AC4 00000000 */   nop
/* A9BC8 001A9AC8 6C93848F */  lw         $4, -0x6C94($gp)
/* A9BCC 001A9ACC 5493858F */  lw         $5, -0x6CAC($gp)
/* A9BD0 001A9AD0 2404090C */  jal        SetReference__5CFishFP6CFrame
/* A9BD4 001A9AD4 00000000 */   nop
/* A9BD8 001A9AD8 2700023C */  lui        $2, %hi(_643)
/* A9BDC 001A9ADC 60AF4224 */  addiu      $2, $2, %lo(_643)
/* A9BE0 001A9AE0 2000A527 */  addiu      $5, $sp, 0x20
/* A9BE4 001A9AE4 00004278 */  lq         $2, 0x0($2)
/* A9BE8 001A9AE8 0000A27C */  sq         $2, 0x0($5)
/* A9BEC 001A9AEC 2700023C */  lui        $2, %hi(_644)
/* A9BF0 001A9AF0 70AF4224 */  addiu      $2, $2, %lo(_644)
/* A9BF4 001A9AF4 3000A327 */  addiu      $3, $sp, 0x30
/* A9BF8 001A9AF8 00004278 */  lq         $2, 0x0($2)
/* A9BFC 001A9AFC 0000627C */  sq         $2, 0x0($3)
/* A9C00 001A9B00 6C93848F */  lw         $4, -0x6C94($gp)
/* A9C04 001A9B04 DC03090C */  jal        SetPosition__5CFishFPf
/* A9C08 001A9B08 00000000 */   nop
/* A9C0C 001A9B0C 6C93848F */  lw         $4, -0x6C94($gp)
/* A9C10 001A9B10 3000A527 */  addiu      $5, $sp, 0x30
/* A9C14 001A9B14 0004090C */  jal        SetRotation__5CFishFPf
/* A9C18 001A9B18 00000000 */   nop
/* A9C1C 001A9B1C 6C93848F */  lw         $4, -0x6C94($gp)
/* A9C20 001A9B20 1C03090C */  jal        Draw__5CFishFv
/* A9C24 001A9B24 00000000 */   nop
/* A9C28 001A9B28 6C93848F */  lw         $4, -0x6C94($gp)
/* A9C2C 001A9B2C 3C04090C */  jal        DeleteReference__5CFishFv
/* A9C30 001A9B30 00000000 */   nop
/* A9C34 001A9B34 1C000010 */  b          .L001A9BA8
/* A9C38 001A9B38 00000000 */   nop
.L001A9B3C:
/* A9C3C 001A9B3C A0B8040C */  jal        GetVif1Packet__Fv
/* A9C40 001A9B40 00000000 */   nop
/* A9C44 001A9B44 C701033C */  lui        $3, %hi(TexManager)
/* A9C48 001A9B48 70586424 */  addiu      $4, $3, %lo(TexManager)
/* A9C4C 001A9B4C 282E4070 */  paddub     $5, $2, $0
/* A9C50 001A9B50 6093868F */  lw         $6, -0x6CA0($gp)
/* A9C54 001A9B54 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* A9C58 001A9B58 00000000 */   nop
/* A9C5C 001A9B5C B087838F */  lw         $3, -0x7850($gp)
/* A9C60 001A9B60 11006010 */  beqz       $3, .L001A9BA8
/* A9C64 001A9B64 00000000 */   nop
/* A9C68 001A9B68 28860070 */  paddub     $16, $0, $0
/* A9C6C 001A9B6C 0B000010 */  b          .L001A9B9C
/* A9C70 001A9B70 00000000 */   nop
.L001A9B74:
/* A9C74 001A9B74 C0101000 */  sll        $2, $16, 3
/* A9C78 001A9B78 21105000 */  addu       $2, $2, $16
/* A9C7C 001A9B7C 80110200 */  sll        $2, $2, 6
/* A9C80 001A9B80 21105000 */  addu       $2, $2, $16
/* A9C84 001A9B84 00190200 */  sll        $3, $2, 4
/* A9C88 001A9B88 6893828F */  lw         $2, -0x6C98($gp)
/* A9C8C 001A9B8C 21204300 */  addu       $4, $2, $3
/* A9C90 001A9B90 1C03090C */  jal        Draw__5CFishFv
/* A9C94 001A9B94 00000000 */   nop
/* A9C98 001A9B98 01001026 */  addiu      $16, $16, 0x1
.L001A9B9C:
/* A9C9C 001A9B9C 0600032A */  slti       $3, $16, 0x6
/* A9CA0 001A9BA0 F4FF6014 */  bnez       $3, .L001A9B74
/* A9CA4 001A9BA4 00000000 */   nop
.L001A9BA8:
/* A9CA8 001A9BA8 1000BF7B */  lq         $31, 0x10($sp)
/* A9CAC 001A9BAC 0000B07B */  lq         $16, 0x0($sp)
/* A9CB0 001A9BB0 4000BD27 */  addiu      $sp, $sp, 0x40
/* A9CB4 001A9BB4 0800E003 */  jr         $31
/* A9CB8 001A9BB8 00000000 */   nop
/* A9CBC 001A9BBC 00000000 */  nop
