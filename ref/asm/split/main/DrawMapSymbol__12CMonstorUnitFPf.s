.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawMapSymbol__12CMonstorUnitFPf
/* 0D7BA0 001D7AA0 80FFBD27 */  addiu       $29, $29, -0x80
/* 0D7BA4 001D7AA4 4000BF7F */  sq          $31, 0x40($29)
/* 0D7BA8 001D7AA8 3000B27F */  sq          $18, 0x30($29)
/* 0D7BAC 001D7AAC 2000B17F */  sq          $17, 0x20($29)
/* 0D7BB0 001D7AB0 1000B07F */  sq          $16, 0x10($29)
/* 0D7BB4 001D7AB4 0400B5E7 */  swc1        $f21, 0x4($29)
/* 0D7BB8 001D7AB8 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0D7BBC 001D7ABC 28968070 */  paddub      $18, $4, $0
/* 0D7BC0 001D7AC0 C701023C */  lui         $2, %hi(TexManager)
/* 0D7BC4 001D7AC4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0D7BC8 001D7AC8 2A00023C */  lui         $2, %hi(LIT_603__2)
/* 0D7BCC 001D7ACC 00CF4524 */  addiu       $5, $2, %lo(LIT_603__2)
/* 0D7BD0 001D7AD0 FFFF0624 */  addiu       $6, $0, -0x1
/* 0D7BD4 001D7AD4 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0D7BD8 001D7AD8 00000000 */   nop
/* 0D7BDC 001D7ADC 288E4070 */  paddub      $17, $2, $0
/* 0D7BE0 001D7AE0 28860070 */  paddub      $16, $0, $0
/* 0D7BE4 001D7AE4 58000010 */  b           .L001D7C48
/* 0D7BE8 001D7AE8 00000000 */   nop
.L001D7AEC:
/* 0D7BEC 001D7AEC 80181000 */  sll         $3, $16, 2
/* 0D7BF0 001D7AF0 21207000 */  addu        $4, $3, $16
/* 0D7BF4 001D7AF4 80180400 */  sll         $3, $4, 2
/* 0D7BF8 001D7AF8 21188300 */  addu        $3, $4, $3
/* 0D7BFC 001D7AFC 00190300 */  sll         $3, $3, 4
/* 0D7C00 001D7B00 21207200 */  addu        $4, $3, $18
/* 0D7C04 001D7B04 0200013C */  lui         $1, (0x20000 >> 16)
/* 0D7C08 001D7B08 21088100 */  addu        $1, $4, $1
/* 0D7C0C 001D7B0C D0E3258C */  lw          $5, -0x1C30($1)
/* 0D7C10 001D7B10 FFFF0324 */  addiu       $3, $0, -0x1
/* 0D7C14 001D7B14 4B00A310 */  beq         $5, $3, .L001D7C44
/* 0D7C18 001D7B18 00000000 */   nop
/* 0D7C1C 001D7B1C 0200013C */  lui         $1, (0x20000 >> 16)
/* 0D7C20 001D7B20 21088100 */  addu        $1, $4, $1
/* 0D7C24 001D7B24 A4E42384 */  lh          $3, -0x1B5C($1)
/* 0D7C28 001D7B28 46006010 */  beqz        $3, .L001D7C44
/* 0D7C2C 001D7B2C 00000000 */   nop
/* 0D7C30 001D7B30 B09D838F */  lw          $3, -0x6250($28)
/* 0D7C34 001D7B34 05006014 */  bnez        $3, .L001D7B4C
/* 0D7C38 001D7B38 00000000 */   nop
/* 0D7C3C 001D7B3C D501013C */  lui         $1, %hi(DebugStatus + 0xC)
/* 0D7C40 001D7B40 6C64238C */  lw          $3, %lo(DebugStatus + 0xC)($1)
/* 0D7C44 001D7B44 04006010 */  beqz        $3, .L001D7B58
/* 0D7C48 001D7B48 00000000 */   nop
.L001D7B4C:
/* 0D7C4C 001D7B4C 01000424 */  addiu       $4, $0, 0x1
/* 0D7C50 001D7B50 08000010 */  b           .L001D7B74
/* 0D7C54 001D7B54 00000000 */   nop
.L001D7B58:
/* 0D7C58 001D7B58 02000324 */  addiu       $3, $0, 0x2
/* 0D7C5C 001D7B5C 0400A314 */  bne         $5, $3, .L001D7B70
/* 0D7C60 001D7B60 00000000 */   nop
/* 0D7C64 001D7B64 01000424 */  addiu       $4, $0, 0x1
/* 0D7C68 001D7B68 02000010 */  b           .L001D7B74
/* 0D7C6C 001D7B6C 00000000 */   nop
.L001D7B70:
/* 0D7C70 001D7B70 28260070 */  paddub      $4, $0, $0
.L001D7B74:
/* 0D7C74 001D7B74 01000324 */  addiu       $3, $0, 0x1
/* 0D7C78 001D7B78 32008314 */  bne         $4, $3, .L001D7C44
/* 0D7C7C 001D7B7C 00000000 */   nop
/* 0D7C80 001D7B80 10350224 */  addiu       $2, $0, 0x3510
/* 0D7C84 001D7B84 18100202 */  mult        $2, $16, $2
/* 0D7C88 001D7B88 21104202 */  addu        $2, $18, $2
/* 0D7C8C 001D7B8C 0100013C */  lui         $1, (0x1FCD0 >> 16)
/* 0D7C90 001D7B90 D0FC2134 */  ori         $1, $1, (0x1FCD0 & 0xFFFF)
/* 0D7C94 001D7B94 21204100 */  addu        $4, $2, $1
/* 0D7C98 001D7B98 5000A527 */  addiu       $5, $29, 0x50
/* 0D7C9C 001D7B9C A000998C */  lw          $25, 0xA0($4)
/* 0D7CA0 001D7BA0 A000398F */  lw          $25, 0xA0($25)
/* 0D7CA4 001D7BA4 09F82003 */  jalr        $25
/* 0D7CA8 001D7BA8 00000000 */   nop
/* 0D7CAC 001D7BAC 808081C7 */  lwc1        $f1, -0x7F80($28)
/* 0D7CB0 001D7BB0 5000A0C7 */  lwc1        $f0, 0x50($29)
/* 0D7CB4 001D7BB4 020D0046 */  mul.s       $f20, $f1, $f0
/* 0D7CB8 001D7BB8 06A30046 */  mov.s       $f12, $f20
/* 0D7CBC 001D7BBC 2C44040C */  jal         fptosi
/* 0D7CC0 001D7BC0 00000000 */   nop
/* 0D7CC4 001D7BC4 808081C7 */  lwc1        $f1, -0x7F80($28)
/* 0D7CC8 001D7BC8 5800A0C7 */  lwc1        $f0, 0x58($29)
/* 0D7CCC 001D7BCC 420D0046 */  mul.s       $f21, $f1, $f0
/* 0D7CD0 001D7BD0 06AB0046 */  mov.s       $f12, $f21
/* 0D7CD4 001D7BD4 2C44040C */  jal         fptosi
/* 0D7CD8 001D7BD8 00000000 */   nop
/* 0D7CDC 001D7BDC 48000224 */  addiu       $2, $0, 0x48
/* 0D7CE0 001D7BE0 7000A2AF */  sw          $2, 0x70($29)
/* 0D7CE4 001D7BE4 60000224 */  addiu       $2, $0, 0x60
/* 0D7CE8 001D7BE8 7400A2AF */  sw          $2, 0x74($29)
/* 0D7CEC 001D7BEC 08000224 */  addiu       $2, $0, 0x8
/* 0D7CF0 001D7BF0 7800A2AF */  sw          $2, 0x78($29)
/* 0D7CF4 001D7BF4 7C00A2AF */  sw          $2, 0x7C($29)
/* 0D7CF8 001D7BF8 06A30046 */  mov.s       $f12, $f20
/* 0D7CFC 001D7BFC 2C44040C */  jal         fptosi
/* 0D7D00 001D7C00 00000000 */   nop
/* 0D7D04 001D7C04 80014224 */  addiu       $2, $2, 0x180
/* 0D7D08 001D7C08 6000A2AF */  sw          $2, 0x60($29)
/* 0D7D0C 001D7C0C 06AB0046 */  mov.s       $f12, $f21
/* 0D7D10 001D7C10 2C44040C */  jal         fptosi
/* 0D7D14 001D7C14 00000000 */   nop
/* 0D7D18 001D7C18 44004224 */  addiu       $2, $2, 0x44
/* 0D7D1C 001D7C1C 6400A2AF */  sw          $2, 0x64($29)
/* 0D7D20 001D7C20 08000224 */  addiu       $2, $0, 0x8
/* 0D7D24 001D7C24 6800A2AF */  sw          $2, 0x68($29)
/* 0D7D28 001D7C28 6C00A2AF */  sw          $2, 0x6C($29)
/* 0D7D2C 001D7C2C D48B848F */  lw          $4, -0x742C($28)
/* 0D7D30 001D7C30 282E2072 */  paddub      $5, $17, $0
/* 0D7D34 001D7C34 6000A627 */  addiu       $6, $29, 0x60
/* 0D7D38 001D7C38 7000A727 */  addiu       $7, $29, 0x70
/* 0D7D3C 001D7C3C 0070050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_
/* 0D7D40 001D7C40 00000000 */   nop
.L001D7C44:
/* 0D7D44 001D7C44 01001026 */  addiu       $16, $16, 0x1
.L001D7C48:
/* 0D7D48 001D7C48 1000032A */  slti        $3, $16, 0x10
/* 0D7D4C 001D7C4C A7FF6014 */  bnez        $3, .L001D7AEC
/* 0D7D50 001D7C50 00000000 */   nop
/* 0D7D54 001D7C54 4000BF7B */  lq          $31, 0x40($29)
/* 0D7D58 001D7C58 3000B27B */  lq          $18, 0x30($29)
/* 0D7D5C 001D7C5C 2000B17B */  lq          $17, 0x20($29)
/* 0D7D60 001D7C60 1000B07B */  lq          $16, 0x10($29)
/* 0D7D64 001D7C64 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 0D7D68 001D7C68 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0D7D6C 001D7C6C 8000BD27 */  addiu       $29, $29, 0x80
/* 0D7D70 001D7C70 0800E003 */  jr          $31
/* 0D7D74 001D7C74 00000000 */   nop
/* 0D7D78 001D7C78 00000000 */  nop
/* 0D7D7C 001D7C7C 00000000 */  nop
