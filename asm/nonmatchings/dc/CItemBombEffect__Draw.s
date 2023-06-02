.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw__15CItemBombEffectFP7CCamera
/* D5C30 001D5B30 D0FEBD27 */  addiu      $sp, $sp, -0x130
/* D5C34 001D5B34 9000BF7F */  sq         $31, 0x90($sp)
/* D5C38 001D5B38 8000BE7F */  sq         $fp, 0x80($sp)
/* D5C3C 001D5B3C 7000B77F */  sq         $23, 0x70($sp)
/* D5C40 001D5B40 6000B67F */  sq         $22, 0x60($sp)
/* D5C44 001D5B44 5000B57F */  sq         $21, 0x50($sp)
/* D5C48 001D5B48 4000B47F */  sq         $20, 0x40($sp)
/* D5C4C 001D5B4C 3000B37F */  sq         $19, 0x30($sp)
/* D5C50 001D5B50 2000B27F */  sq         $18, 0x20($sp)
/* D5C54 001D5B54 1000B17F */  sq         $17, 0x10($sp)
/* D5C58 001D5B58 0000B07F */  sq         $16, 0x0($sp)
/* D5C5C 001D5B5C 28AE8070 */  paddub     $21, $4, $0
/* D5C60 001D5B60 2826A070 */  paddub     $4, $5, $0
/* D5C64 001D5B64 A000A527 */  addiu      $5, $sp, 0xA0
/* D5C68 001D5B68 9C91040C */  jal        GetPos__7CCameraFPf
/* D5C6C 001D5B6C 00000000 */   nop
/* D5C70 001D5B70 2001A427 */  addiu      $4, $sp, 0x120
/* D5C74 001D5B74 F88B82DF */  ld         $2, -0x7408($gp)
/* D5C78 001D5B78 000082FC */  sd         $2, 0x0($4)
/* D5C7C 001D5B7C 2001A393 */  lbu        $3, 0x120($sp)
/* D5C80 001D5B80 03000630 */  andi       $6, $0, 0x3
/* D5C84 001D5B84 FCFF0224 */  addiu      $2, $0, -0x4
/* D5C88 001D5B88 24106200 */  and        $2, $3, $2
/* D5C8C 001D5B8C 25104600 */  or         $2, $2, $6
/* D5C90 001D5B90 2001A2A3 */  sb         $2, 0x120($sp)
/* D5C94 001D5B94 2001A593 */  lbu        $5, 0x120($sp)
/* D5C98 001D5B98 08000364 */  daddiu     $3, $0, 0x8
/* D5C9C 001D5B9C F3FF0224 */  addiu      $2, $0, -0xD
/* D5CA0 001D5BA0 2410A200 */  and        $2, $5, $2
/* D5CA4 001D5BA4 25104300 */  or         $2, $2, $3
/* D5CA8 001D5BA8 2001A2A3 */  sb         $2, 0x120($sp)
/* D5CAC 001D5BAC 2001A593 */  lbu        $5, 0x120($sp)
/* D5CB0 001D5BB0 00190600 */  sll        $3, $6, 4
/* D5CB4 001D5BB4 CFFF0224 */  addiu      $2, $0, -0x31
/* D5CB8 001D5BB8 2410A200 */  and        $2, $5, $2
/* D5CBC 001D5BBC 25104300 */  or         $2, $2, $3
/* D5CC0 001D5BC0 2001A2A3 */  sb         $2, 0x120($sp)
/* D5CC4 001D5BC4 2001A593 */  lbu        $5, 0x120($sp)
/* D5CC8 001D5BC8 40000364 */  daddiu     $3, $0, 0x40
/* D5CCC 001D5BCC 3FFF0224 */  addiu      $2, $0, -0xC1
/* D5CD0 001D5BD0 2410A200 */  and        $2, $5, $2
/* D5CD4 001D5BD4 25104300 */  or         $2, $2, $3
/* D5CD8 001D5BD8 2001A2A3 */  sb         $2, 0x120($sp)
/* D5CDC 001D5BDC E4BB040C */  jal        MGSetGsALPHA__FP10sceGsAlpha
/* D5CE0 001D5BE0 00000000 */   nop
/* D5CE4 001D5BE4 2801A427 */  addiu      $4, $sp, 0x128
/* D5CE8 001D5BE8 F08B82DF */  ld         $2, -0x7410($gp)
/* D5CEC 001D5BEC 000082FC */  sd         $2, 0x0($4)
/* D5CF0 001D5BF0 2C01A593 */  lbu        $5, 0x12C($sp)
/* D5CF4 001D5BF4 01000364 */  daddiu     $3, $0, 0x1
/* D5CF8 001D5BF8 FEFF0224 */  addiu      $2, $0, -0x2
/* D5CFC 001D5BFC 2410A200 */  and        $2, $5, $2
/* D5D00 001D5C00 25104300 */  or         $2, $2, $3
/* D5D04 001D5C04 2C01A2A3 */  sb         $2, 0x12C($sp)
/* D5D08 001D5C08 B0BB040C */  jal        MGSetGsZBUF__FP9sceGsZbuf
/* D5D0C 001D5C0C 00000000 */   nop
/* D5D10 001D5C10 28860070 */  paddub     $16, $0, $0
/* D5D14 001D5C14 8D000010 */  b          .L001D5E4C
/* D5D18 001D5C18 00000000 */   nop
.L001D5C1C:
/* D5D1C 001D5C1C 80881000 */  sll        $17, $16, 2
/* D5D20 001D5C20 21203502 */  addu       $4, $17, $21
/* D5D24 001D5C24 A000838C */  lw         $3, 0xA0($4)
/* D5D28 001D5C28 01000224 */  addiu      $2, $0, 0x1
/* D5D2C 001D5C2C 86006214 */  bne        $3, $2, .L001D5E48
/* D5D30 001D5C30 00000000 */   nop
/* D5D34 001D5C34 6400828C */  lw         $2, 0x64($4)
/* D5D38 001D5C38 83004004 */  bltz       $2, .L001D5E48
/* D5D3C 001D5C3C 00000000 */   nop
/* D5D40 001D5C40 281E0072 */  paddub     $3, $16, $0
/* D5D44 001D5C44 0300022A */  slti       $2, $16, 0x3
/* D5D48 001D5C48 02004014 */  bnez       $2, .L001D5C54
/* D5D4C 001D5C4C 00000000 */   nop
/* D5D50 001D5C50 03000324 */  addiu      $3, $0, 0x3
.L001D5C54:
/* D5D54 001D5C54 C0180300 */  sll        $3, $3, 3
/* D5D58 001D5C58 2800023C */  lui        $2, %hi(uvTable$1129)
/* D5D5C 001D5C5C 10EB4224 */  addiu      $2, $2, %lo(uvTable$1129)
/* D5D60 001D5C60 21104300 */  addu       $2, $2, $3
/* D5D64 001D5C64 0000428C */  lw         $2, 0x0($2)
/* D5D68 001D5C68 80F10200 */  sll        $fp, $2, 6
/* D5D6C 001D5C6C 2800023C */  lui        $2, %hi(uvTable$1129 + 0x4)
/* D5D70 001D5C70 14EB4224 */  addiu      $2, $2, %lo(uvTable$1129 + 0x4)
/* D5D74 001D5C74 21104300 */  addu       $2, $2, $3
/* D5D78 001D5C78 0000428C */  lw         $2, 0x0($2)
/* D5D7C 001D5C7C 80B90200 */  sll        $23, $2, 6
/* D5D80 001D5C80 00911000 */  sll        $18, $16, 4
/* D5D84 001D5C84 21A0B202 */  addu       $20, $21, $18
/* D5D88 001D5C88 000081C6 */  lwc1       $f1, 0x0($20)
/* D5D8C 001D5C8C A000A0C7 */  lwc1       $f0, 0xA0($sp)
/* D5D90 001D5C90 01000146 */  sub.s      $f0, $f0, $f1
/* D5D94 001D5C94 B000A0E7 */  swc1       $f0, 0xB0($sp)
/* D5D98 001D5C98 B400A227 */  addiu      $2, $sp, 0xB4
/* D5D9C 001D5C9C 000040AC */  sw         $0, 0x0($2)
/* D5DA0 001D5CA0 08009626 */  addiu      $22, $20, 0x8
/* D5DA4 001D5CA4 080081C6 */  lwc1       $f1, 0x8($20)
/* D5DA8 001D5CA8 A800A0C7 */  lwc1       $f0, 0xA8($sp)
/* D5DAC 001D5CAC 01000146 */  sub.s      $f0, $f0, $f1
/* D5DB0 001D5CB0 B800B327 */  addiu      $19, $sp, 0xB8
/* D5DB4 001D5CB4 000060E6 */  swc1       $f0, 0x0($19)
/* D5DB8 001D5CB8 B000A427 */  addiu      $4, $sp, 0xB0
/* D5DBC 001D5CBC 282E8070 */  paddub     $5, $4, $0
/* D5DC0 001D5CC0 9285040C */  jal        sceVu0Normalize
/* D5DC4 001D5CC4 00000000 */   nop
/* D5DC8 001D5CC8 21183502 */  addu       $3, $17, $21
/* D5DCC 001D5CCC 500060C4 */  lwc1       $f0, 0x50($3)
/* D5DD0 001D5CD0 20008046 */  cvt.s.w    $f0, $f0
/* D5DD4 001D5CD4 0040023C */  lui        $2, (0x40000000 >> 16)
/* D5DD8 001D5CD8 00108244 */  mtc1       $2, $f2
/* D5DDC 001D5CDC 00000000 */  nop
/* D5DE0 001D5CE0 1A100046 */  mula.s     $f2, $f0
/* D5DE4 001D5CE4 A040023C */  lui        $2, (0x40A00000 >> 16)
/* D5DE8 001D5CE8 00088244 */  mtc1       $2, $f1
/* D5DEC 001D5CEC 00009044 */  mtc1       $16, $f0
/* D5DF0 001D5CF0 00000000 */  nop
/* D5DF4 001D5CF4 20008046 */  cvt.s.w    $f0, $f0
/* D5DF8 001D5CF8 C2080046 */  mul.s      $f3, $f1, $f0
/* D5DFC 001D5CFC 5C080046 */  madd.s     $f1, $f1, $f0
/* D5E00 001D5D00 B000A0C7 */  lwc1       $f0, 0xB0($sp)
/* D5E04 001D5D04 02000146 */  mul.s      $f0, $f0, $f1
/* D5E08 001D5D08 B000A0E7 */  swc1       $f0, 0xB0($sp)
/* D5E0C 001D5D0C 500060C4 */  lwc1       $f0, 0x50($3)
/* D5E10 001D5D10 20008046 */  cvt.s.w    $f0, $f0
/* D5E14 001D5D14 02100046 */  mul.s      $f0, $f2, $f0
/* D5E18 001D5D18 40180046 */  add.s      $f1, $f3, $f0
/* D5E1C 001D5D1C 000060C6 */  lwc1       $f0, 0x0($19)
/* D5E20 001D5D20 02000146 */  mul.s      $f0, $f0, $f1
/* D5E24 001D5D24 000060E6 */  swc1       $f0, 0x0($19)
/* D5E28 001D5D28 B000A1C7 */  lwc1       $f1, 0xB0($sp)
/* D5E2C 001D5D2C 000080C6 */  lwc1       $f0, 0x0($20)
/* D5E30 001D5D30 00080046 */  add.s      $f0, $f1, $f0
/* D5E34 001D5D34 C000A0E7 */  swc1       $f0, 0xC0($sp)
/* D5E38 001D5D38 28168072 */  paddub     $2, $20, $0
/* D5E3C 001D5D3C 040041C4 */  lwc1       $f1, 0x4($2)
/* D5E40 001D5D40 B400A227 */  addiu      $2, $sp, 0xB4
/* D5E44 001D5D44 000040C4 */  lwc1       $f0, 0x0($2)
/* D5E48 001D5D48 00000146 */  add.s      $f0, $f0, $f1
/* D5E4C 001D5D4C C400A0E7 */  swc1       $f0, 0xC4($sp)
/* D5E50 001D5D50 000061C6 */  lwc1       $f1, 0x0($19)
/* D5E54 001D5D54 0000C0C6 */  lwc1       $f0, 0x0($22)
/* D5E58 001D5D58 00080046 */  add.s      $f0, $f1, $f0
/* D5E5C 001D5D5C C800A0E7 */  swc1       $f0, 0xC8($sp)
/* D5E60 001D5D60 803F023C */  lui        $2, (0x3F800000 >> 16)
/* D5E64 001D5D64 CC00A2AF */  sw         $2, 0xCC($sp)
/* D5E68 001D5D68 780061C4 */  lwc1       $f1, 0x78($3)
/* D5E6C 001D5D6C B400A0C6 */  lwc1       $f0, 0xB4($21)
/* D5E70 001D5D70 020B0046 */  mul.s      $f12, $f1, $f0
/* D5E74 001D5D74 43630246 */  div.s      $f13, $f12, $f2
/* D5E78 001D5D78 D000A427 */  addiu      $4, $sp, 0xD0
/* D5E7C 001D5D7C E000A527 */  addiu      $5, $sp, 0xE0
/* D5E80 001D5D80 C000A627 */  addiu      $6, $sp, 0xC0
/* D5E84 001D5D84 283E0070 */  paddub     $7, $0, $0
/* D5E88 001D5D88 D0B9040C */  jal        MGRotTransPers3DSprite__FPiPiPfffi
/* D5E8C 001D5D8C 00000000 */   nop
/* D5E90 001D5D90 01000324 */  addiu      $3, $0, 0x1
/* D5E94 001D5D94 2C004314 */  bne        $2, $3, .L001D5E48
/* D5E98 001D5D98 00000000 */   nop
/* D5E9C 001D5D9C E000A28F */  lw         $2, 0xE0($sp)
/* D5EA0 001D5DA0 F000A2AF */  sw         $2, 0xF0($sp)
/* D5EA4 001D5DA4 D400A28F */  lw         $2, 0xD4($sp)
/* D5EA8 001D5DA8 F400A2AF */  sw         $2, 0xF4($sp)
/* D5EAC 001D5DAC D800A28F */  lw         $2, 0xD8($sp)
/* D5EB0 001D5DB0 F800A2AF */  sw         $2, 0xF8($sp)
/* D5EB4 001D5DB4 DC00A28F */  lw         $2, 0xDC($sp)
/* D5EB8 001D5DB8 FC00A2AF */  sw         $2, 0xFC($sp)
/* D5EBC 001D5DBC D000A28F */  lw         $2, 0xD0($sp)
/* D5EC0 001D5DC0 0001A2AF */  sw         $2, 0x100($sp)
/* D5EC4 001D5DC4 E400A28F */  lw         $2, 0xE4($sp)
/* D5EC8 001D5DC8 0401A2AF */  sw         $2, 0x104($sp)
/* D5ECC 001D5DCC E800A28F */  lw         $2, 0xE8($sp)
/* D5ED0 001D5DD0 0801A2AF */  sw         $2, 0x108($sp)
/* D5ED4 001D5DD4 EC00A28F */  lw         $2, 0xEC($sp)
/* D5ED8 001D5DD8 0C01A2AF */  sw         $2, 0x10C($sp)
/* D5EDC 001D5DDC 1001BEAF */  sw         $fp, 0x110($sp)
/* D5EE0 001D5DE0 1401B7AF */  sw         $23, 0x114($sp)
/* D5EE4 001D5DE4 40000224 */  addiu      $2, $0, 0x40
/* D5EE8 001D5DE8 1801A2AF */  sw         $2, 0x118($sp)
/* D5EEC 001D5DEC 1C01A2AF */  sw         $2, 0x11C($sp)
/* D5EF0 001D5DF0 C701023C */  lui        $2, %hi(TexManager)
/* D5EF4 001D5DF4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* D5EF8 001D5DF8 2A00023C */  lui        $2, %hi(_1169_2)
/* D5EFC 001D5DFC B8CE4524 */  addiu      $5, $2, %lo(_1169_2)
/* D5F00 001D5E00 FFFF0624 */  addiu      $6, $0, -0x1
/* D5F04 001D5E04 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* D5F08 001D5E08 00000000 */   nop
/* D5F0C 001D5E0C 28964070 */  paddub     $18, $2, $0
/* D5F10 001D5E10 21103502 */  addu       $2, $17, $21
/* D5F14 001D5E14 8C004CC4 */  lwc1       $f12, 0x8C($2)
/* D5F18 001D5E18 5044040C */  jal        fptoui
/* D5F1C 001D5E1C 00000000 */   nop
/* D5F20 001D5E20 D48B848F */  lw         $4, -0x742C($gp)
/* D5F24 001D5E24 282E4072 */  paddub     $5, $18, $0
/* D5F28 001D5E28 1001A627 */  addiu      $6, $sp, 0x110
/* D5F2C 001D5E2C D000A727 */  addiu      $7, $sp, 0xD0
/* D5F30 001D5E30 F000A827 */  addiu      $8, $sp, 0xF0
/* D5F34 001D5E34 0001A927 */  addiu      $9, $sp, 0x100
/* D5F38 001D5E38 E000AA27 */  addiu      $10, $sp, 0xE0
/* D5F3C 001D5E3C 285E4070 */  paddub     $11, $2, $0
/* D5F40 001D5E40 1C75050C */  jal        set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* D5F44 001D5E44 00000000 */   nop
.L001D5E48:
/* D5F48 001D5E48 01001026 */  addiu      $16, $16, 0x1
.L001D5E4C:
/* D5F4C 001D5E4C 0500022A */  slti       $2, $16, 0x5
/* D5F50 001D5E50 72FF4014 */  bnez       $2, .L001D5C1C
/* D5F54 001D5E54 00000000 */   nop
/* D5F58 001D5E58 28260070 */  paddub     $4, $0, $0
/* D5F5C 001D5E5C E4BB040C */  jal        MGSetGsALPHA__FP10sceGsAlpha
/* D5F60 001D5E60 00000000 */   nop
/* D5F64 001D5E64 28260070 */  paddub     $4, $0, $0
/* D5F68 001D5E68 B0BB040C */  jal        MGSetGsZBUF__FP9sceGsZbuf
/* D5F6C 001D5E6C 00000000 */   nop
/* D5F70 001D5E70 9000BF7B */  lq         $31, 0x90($sp)
/* D5F74 001D5E74 8000BE7B */  lq         $fp, 0x80($sp)
/* D5F78 001D5E78 7000B77B */  lq         $23, 0x70($sp)
/* D5F7C 001D5E7C 6000B67B */  lq         $22, 0x60($sp)
/* D5F80 001D5E80 5000B57B */  lq         $21, 0x50($sp)
/* D5F84 001D5E84 4000B47B */  lq         $20, 0x40($sp)
/* D5F88 001D5E88 3000B37B */  lq         $19, 0x30($sp)
/* D5F8C 001D5E8C 2000B27B */  lq         $18, 0x20($sp)
/* D5F90 001D5E90 1000B17B */  lq         $17, 0x10($sp)
/* D5F94 001D5E94 0000B07B */  lq         $16, 0x0($sp)
/* D5F98 001D5E98 3001BD27 */  addiu      $sp, $sp, 0x130
/* D5F9C 001D5E9C 0800E003 */  jr         $31
/* D5FA0 001D5EA0 00000000 */   nop
/* D5FA4 001D5EA4 00000000 */  nop
/* D5FA8 001D5EA8 00000000 */  nop
/* D5FAC 001D5EAC 00000000 */  nop
