.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMapSymbol__12CMonstorUnitFPf
/* D7BA0 001D7AA0 80FFBD27 */  addiu      $sp, $sp, -0x80
/* D7BA4 001D7AA4 4000BF7F */  sq         $31, 0x40($sp)
/* D7BA8 001D7AA8 3000B27F */  sq         $18, 0x30($sp)
/* D7BAC 001D7AAC 2000B17F */  sq         $17, 0x20($sp)
/* D7BB0 001D7AB0 1000B07F */  sq         $16, 0x10($sp)
/* D7BB4 001D7AB4 0400B5E7 */  swc1       $f21, 0x4($sp)
/* D7BB8 001D7AB8 0000B4E7 */  swc1       $f20, 0x0($sp)
/* D7BBC 001D7ABC 28968070 */  paddub     $18, $4, $0
/* D7BC0 001D7AC0 C701023C */  lui        $2, %hi(TexManager)
/* D7BC4 001D7AC4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* D7BC8 001D7AC8 2A00023C */  lui        $2, %hi(_603_2)
/* D7BCC 001D7ACC 00CF4524 */  addiu      $5, $2, %lo(_603_2)
/* D7BD0 001D7AD0 FFFF0624 */  addiu      $6, $0, -0x1
/* D7BD4 001D7AD4 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* D7BD8 001D7AD8 00000000 */   nop
/* D7BDC 001D7ADC 288E4070 */  paddub     $17, $2, $0
/* D7BE0 001D7AE0 28860070 */  paddub     $16, $0, $0
/* D7BE4 001D7AE4 58000010 */  b          .L001D7C48
/* D7BE8 001D7AE8 00000000 */   nop
.L001D7AEC:
/* D7BEC 001D7AEC 80181000 */  sll        $3, $16, 2
/* D7BF0 001D7AF0 21207000 */  addu       $4, $3, $16
/* D7BF4 001D7AF4 80180400 */  sll        $3, $4, 2
/* D7BF8 001D7AF8 21188300 */  addu       $3, $4, $3
/* D7BFC 001D7AFC 00190300 */  sll        $3, $3, 4
/* D7C00 001D7B00 21207200 */  addu       $4, $3, $18
/* D7C04 001D7B04 0200013C */  lui        $at, (0x20000 >> 16)
/* D7C08 001D7B08 21088100 */  addu       $at, $4, $at
/* D7C0C 001D7B0C D0E3258C */  lw         $5, -0x1C30($at)
/* D7C10 001D7B10 FFFF0324 */  addiu      $3, $0, -0x1
/* D7C14 001D7B14 4B00A310 */  beq        $5, $3, .L001D7C44
/* D7C18 001D7B18 00000000 */   nop
/* D7C1C 001D7B1C 0200013C */  lui        $at, (0x20000 >> 16)
/* D7C20 001D7B20 21088100 */  addu       $at, $4, $at
/* D7C24 001D7B24 A4E42384 */  lh         $3, -0x1B5C($at)
/* D7C28 001D7B28 46006010 */  beqz       $3, .L001D7C44
/* D7C2C 001D7B2C 00000000 */   nop
/* D7C30 001D7B30 B09D838F */  lw         $3, -0x6250($gp)
/* D7C34 001D7B34 05006014 */  bnez       $3, .L001D7B4C
/* D7C38 001D7B38 00000000 */   nop
/* D7C3C 001D7B3C D501013C */  lui        $at, (0x1D5646C >> 16)
/* D7C40 001D7B40 6C64238C */  lw         $3, (0x1D5646C & 0xFFFF)($at)
/* D7C44 001D7B44 04006010 */  beqz       $3, .L001D7B58
/* D7C48 001D7B48 00000000 */   nop
.L001D7B4C:
/* D7C4C 001D7B4C 01000424 */  addiu      $4, $0, 0x1
/* D7C50 001D7B50 08000010 */  b          .L001D7B74
/* D7C54 001D7B54 00000000 */   nop
.L001D7B58:
/* D7C58 001D7B58 02000324 */  addiu      $3, $0, 0x2
/* D7C5C 001D7B5C 0400A314 */  bne        $5, $3, .L001D7B70
/* D7C60 001D7B60 00000000 */   nop
/* D7C64 001D7B64 01000424 */  addiu      $4, $0, 0x1
/* D7C68 001D7B68 02000010 */  b          .L001D7B74
/* D7C6C 001D7B6C 00000000 */   nop
.L001D7B70:
/* D7C70 001D7B70 28260070 */  paddub     $4, $0, $0
.L001D7B74:
/* D7C74 001D7B74 01000324 */  addiu      $3, $0, 0x1
/* D7C78 001D7B78 32008314 */  bne        $4, $3, .L001D7C44
/* D7C7C 001D7B7C 00000000 */   nop
/* D7C80 001D7B80 10350224 */  addiu      $2, $0, 0x3510
/* D7C84 001D7B84 18100202 */  mult       $2, $16, $2
/* D7C88 001D7B88 21104202 */  addu       $2, $18, $2
/* D7C8C 001D7B8C 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* D7C90 001D7B90 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* D7C94 001D7B94 21204100 */  addu       $4, $2, $at
/* D7C98 001D7B98 5000A527 */  addiu      $5, $sp, 0x50
/* D7C9C 001D7B9C A000998C */  lw         $25, 0xA0($4)
/* D7CA0 001D7BA0 A000398F */  lw         $25, 0xA0($25)
/* D7CA4 001D7BA4 09F82003 */  jalr       $25
/* D7CA8 001D7BA8 00000000 */   nop
/* D7CAC 001D7BAC 808081C7 */  lwc1       $f1, -0x7F80($gp)
/* D7CB0 001D7BB0 5000A0C7 */  lwc1       $f0, 0x50($sp)
/* D7CB4 001D7BB4 020D0046 */  mul.s      $f20, $f1, $f0
/* D7CB8 001D7BB8 06A30046 */  mov.s      $f12, $f20
/* D7CBC 001D7BBC 2C44040C */  jal        fptosi
/* D7CC0 001D7BC0 00000000 */   nop
/* D7CC4 001D7BC4 808081C7 */  lwc1       $f1, -0x7F80($gp)
/* D7CC8 001D7BC8 5800A0C7 */  lwc1       $f0, 0x58($sp)
/* D7CCC 001D7BCC 420D0046 */  mul.s      $f21, $f1, $f0
/* D7CD0 001D7BD0 06AB0046 */  mov.s      $f12, $f21
/* D7CD4 001D7BD4 2C44040C */  jal        fptosi
/* D7CD8 001D7BD8 00000000 */   nop
/* D7CDC 001D7BDC 48000224 */  addiu      $2, $0, 0x48
/* D7CE0 001D7BE0 7000A2AF */  sw         $2, 0x70($sp)
/* D7CE4 001D7BE4 60000224 */  addiu      $2, $0, 0x60
/* D7CE8 001D7BE8 7400A2AF */  sw         $2, 0x74($sp)
/* D7CEC 001D7BEC 08000224 */  addiu      $2, $0, 0x8
/* D7CF0 001D7BF0 7800A2AF */  sw         $2, 0x78($sp)
/* D7CF4 001D7BF4 7C00A2AF */  sw         $2, 0x7C($sp)
/* D7CF8 001D7BF8 06A30046 */  mov.s      $f12, $f20
/* D7CFC 001D7BFC 2C44040C */  jal        fptosi
/* D7D00 001D7C00 00000000 */   nop
/* D7D04 001D7C04 80014224 */  addiu      $2, $2, 0x180
/* D7D08 001D7C08 6000A2AF */  sw         $2, 0x60($sp)
/* D7D0C 001D7C0C 06AB0046 */  mov.s      $f12, $f21
/* D7D10 001D7C10 2C44040C */  jal        fptosi
/* D7D14 001D7C14 00000000 */   nop
/* D7D18 001D7C18 44004224 */  addiu      $2, $2, 0x44
/* D7D1C 001D7C1C 6400A2AF */  sw         $2, 0x64($sp)
/* D7D20 001D7C20 08000224 */  addiu      $2, $0, 0x8
/* D7D24 001D7C24 6800A2AF */  sw         $2, 0x68($sp)
/* D7D28 001D7C28 6C00A2AF */  sw         $2, 0x6C($sp)
/* D7D2C 001D7C2C D48B848F */  lw         $4, -0x742C($gp)
/* D7D30 001D7C30 282E2072 */  paddub     $5, $17, $0
/* D7D34 001D7C34 6000A627 */  addiu      $6, $sp, 0x60
/* D7D38 001D7C38 7000A727 */  addiu      $7, $sp, 0x70
/* D7D3C 001D7C3C 0070050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_
/* D7D40 001D7C40 00000000 */   nop
.L001D7C44:
/* D7D44 001D7C44 01001026 */  addiu      $16, $16, 0x1
.L001D7C48:
/* D7D48 001D7C48 1000032A */  slti       $3, $16, 0x10
/* D7D4C 001D7C4C A7FF6014 */  bnez       $3, .L001D7AEC
/* D7D50 001D7C50 00000000 */   nop
/* D7D54 001D7C54 4000BF7B */  lq         $31, 0x40($sp)
/* D7D58 001D7C58 3000B27B */  lq         $18, 0x30($sp)
/* D7D5C 001D7C5C 2000B17B */  lq         $17, 0x20($sp)
/* D7D60 001D7C60 1000B07B */  lq         $16, 0x10($sp)
/* D7D64 001D7C64 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* D7D68 001D7C68 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* D7D6C 001D7C6C 8000BD27 */  addiu      $sp, $sp, 0x80
/* D7D70 001D7C70 0800E003 */  jr         $31
/* D7D74 001D7C74 00000000 */   nop
/* D7D78 001D7C78 00000000 */  nop
/* D7D7C 001D7C7C 00000000 */  nop
