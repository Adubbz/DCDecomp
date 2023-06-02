.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawPersonalBoardBase__FiiiiiP8CTexturei
/* 130D00 00230C00 10FFBD27 */  addiu      $sp, $sp, -0xF0
/* 130D04 00230C04 A000BF7F */  sq         $31, 0xA0($sp)
/* 130D08 00230C08 9000BE7F */  sq         $fp, 0x90($sp)
/* 130D0C 00230C0C 8000B77F */  sq         $23, 0x80($sp)
/* 130D10 00230C10 7000B67F */  sq         $22, 0x70($sp)
/* 130D14 00230C14 6000B57F */  sq         $21, 0x60($sp)
/* 130D18 00230C18 5000B47F */  sq         $20, 0x50($sp)
/* 130D1C 00230C1C 4000B37F */  sq         $19, 0x40($sp)
/* 130D20 00230C20 3000B27F */  sq         $18, 0x30($sp)
/* 130D24 00230C24 2000B17F */  sq         $17, 0x20($sp)
/* 130D28 00230C28 1000B07F */  sq         $16, 0x10($sp)
/* 130D2C 00230C2C 28968070 */  paddub     $18, $4, $0
/* 130D30 00230C30 BC00A5AF */  sw         $5, 0xBC($sp)
/* 130D34 00230C34 2866C070 */  paddub     $12, $6, $0
/* 130D38 00230C38 285EE070 */  paddub     $11, $7, $0
/* 130D3C 00230C3C 288E0071 */  paddub     $17, $8, $0
/* 130D40 00230C40 28862071 */  paddub     $16, $9, $0
/* 130D44 00230C44 28A64071 */  paddub     $20, $10, $0
/* 130D48 00230C48 BC00A48F */  lw         $4, 0xBC($sp)
/* 130D4C 00230C4C D9FF8325 */  addiu      $3, $12, -0x27
/* 130D50 00230C50 2A188300 */  slt        $3, $4, $3
/* 130D54 00230C54 05006014 */  bnez       $3, .L00230C6C
/* 130D58 00230C58 00000000 */   nop
/* 130D5C 00230C5C FFFF6325 */  addiu      $3, $11, -0x1
/* 130D60 00230C60 2A086400 */  slt        $at, $3, $4
/* 130D64 00230C64 03002010 */  beqz       $at, .L00230C74
/* 130D68 00230C68 00000000 */   nop
.L00230C6C:
/* 130D6C 00230C6C 47000010 */  b          .L00230D8C
/* 130D70 00230C70 00000000 */   nop
.L00230C74:
/* 130D74 00230C74 14000224 */  addiu      $2, $0, 0x14
/* 130D78 00230C78 E000A2AF */  sw         $2, 0xE0($sp)
/* 130D7C 00230C7C 28000224 */  addiu      $2, $0, 0x28
/* 130D80 00230C80 E400A2AF */  sw         $2, 0xE4($sp)
/* 130D84 00230C84 BC00A427 */  addiu      $4, $sp, 0xBC
/* 130D88 00230C88 E000A527 */  addiu      $5, $sp, 0xE0
/* 130D8C 00230C8C E400A627 */  addiu      $6, $sp, 0xE4
/* 130D90 00230C90 283E8071 */  paddub     $7, $12, $0
/* 130D94 00230C94 28466071 */  paddub     $8, $11, $0
/* 130D98 00230C98 A0B7080C */  jal        MenuTextureClip__FRiRiRiii
/* 130D9C 00230C9C 00000000 */   nop
/* 130DA0 00230CA0 09001324 */  addiu      $19, $0, 0x9
/* 130DA4 00230CA4 80000324 */  addiu      $3, $0, 0x80
/* 130DA8 00230CA8 EA00BE27 */  addiu      $fp, $sp, 0xEA
/* 130DAC 00230CAC 0000C3A3 */  sb         $3, 0x0($fp)
/* 130DB0 00230CB0 E900B727 */  addiu      $23, $sp, 0xE9
/* 130DB4 00230CB4 0000E3A2 */  sb         $3, 0x0($23)
/* 130DB8 00230CB8 E800A3A3 */  sb         $3, 0xE8($sp)
/* 130DBC 00230CBC 23187300 */  subu       $3, $3, $19
/* 130DC0 00230CC0 EE00B527 */  addiu      $21, $sp, 0xEE
/* 130DC4 00230CC4 0000A3A2 */  sb         $3, 0x0($21)
/* 130DC8 00230CC8 ED00B627 */  addiu      $22, $sp, 0xED
/* 130DCC 00230CCC 0000C3A2 */  sb         $3, 0x0($22)
/* 130DD0 00230CD0 EC00A3A3 */  sb         $3, 0xEC($sp)
/* 130DD4 00230CD4 EF00B4A3 */  sb         $20, 0xEF($sp)
/* 130DD8 00230CD8 EB00B4A3 */  sb         $20, 0xEB($sp)
/* 130DDC 00230CDC 28A60070 */  paddub     $20, $0, $0
/* 130DE0 00230CE0 27000010 */  b          .L00230D80
/* 130DE4 00230CE4 00000000 */   nop
.L00230CE8:
/* 130DE8 00230CE8 E400A48F */  lw         $4, 0xE4($sp)
/* 130DEC 00230CEC E000A38F */  lw         $3, 0xE0($sp)
/* 130DF0 00230CF0 20000224 */  addiu      $2, $0, 0x20
/* 130DF4 00230CF4 D000A2AF */  sw         $2, 0xD0($sp)
/* 130DF8 00230CF8 D400A3AF */  sw         $3, 0xD4($sp)
/* 130DFC 00230CFC 28000224 */  addiu      $2, $0, 0x28
/* 130E00 00230D00 D800A2AF */  sw         $2, 0xD8($sp)
/* 130E04 00230D04 DC00A4AF */  sw         $4, 0xDC($sp)
/* 130E08 00230D08 BC00A38F */  lw         $3, 0xBC($sp)
/* 130E0C 00230D0C C000B2AF */  sw         $18, 0xC0($sp)
/* 130E10 00230D10 C400A3AF */  sw         $3, 0xC4($sp)
/* 130E14 00230D14 C800A2AF */  sw         $2, 0xC8($sp)
/* 130E18 00230D18 CC00A4AF */  sw         $4, 0xCC($sp)
/* 130E1C 00230D1C A0B8040C */  jal        GetVif1Packet__Fv
/* 130E20 00230D20 00000000 */   nop
/* 130E24 00230D24 01000324 */  addiu      $3, $0, 0x1
/* 130E28 00230D28 0000A3FF */  sd         $3, 0x0($sp)
/* 130E2C 00230D2C 28264070 */  paddub     $4, $2, $0
/* 130E30 00230D30 282E0072 */  paddub     $5, $16, $0
/* 130E34 00230D34 C000A627 */  addiu      $6, $sp, 0xC0
/* 130E38 00230D38 D000A727 */  addiu      $7, $sp, 0xD0
/* 130E3C 00230D3C E800A827 */  addiu      $8, $sp, 0xE8
/* 130E40 00230D40 EC00A927 */  addiu      $9, $sp, 0xEC
/* 130E44 00230D44 28560071 */  paddub     $10, $8, $0
/* 130E48 00230D48 285E2071 */  paddub     $11, $9, $0
/* 130E4C 00230D4C 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 130E50 00230D50 00000000 */   nop
/* 130E54 00230D54 EC00A393 */  lbu        $3, 0xEC($sp)
/* 130E58 00230D58 0000C3A3 */  sb         $3, 0x0($fp)
/* 130E5C 00230D5C 0000E3A2 */  sb         $3, 0x0($23)
/* 130E60 00230D60 E800A3A3 */  sb         $3, 0xE8($sp)
/* 130E64 00230D64 23187300 */  subu       $3, $3, $19
/* 130E68 00230D68 0000A3A2 */  sb         $3, 0x0($21)
/* 130E6C 00230D6C 0000C3A2 */  sb         $3, 0x0($22)
/* 130E70 00230D70 EC00A3A3 */  sb         $3, 0xEC($sp)
/* 130E74 00230D74 FFFF7326 */  addiu      $19, $19, -0x1
/* 130E78 00230D78 28005226 */  addiu      $18, $18, 0x28
/* 130E7C 00230D7C 01009426 */  addiu      $20, $20, 0x1
.L00230D80:
/* 130E80 00230D80 2A189102 */  slt        $3, $20, $17
/* 130E84 00230D84 D8FF6014 */  bnez       $3, .L00230CE8
/* 130E88 00230D88 00000000 */   nop
.L00230D8C:
/* 130E8C 00230D8C A000BF7B */  lq         $31, 0xA0($sp)
/* 130E90 00230D90 9000BE7B */  lq         $fp, 0x90($sp)
/* 130E94 00230D94 8000B77B */  lq         $23, 0x80($sp)
/* 130E98 00230D98 7000B67B */  lq         $22, 0x70($sp)
/* 130E9C 00230D9C 6000B57B */  lq         $21, 0x60($sp)
/* 130EA0 00230DA0 5000B47B */  lq         $20, 0x50($sp)
/* 130EA4 00230DA4 4000B37B */  lq         $19, 0x40($sp)
/* 130EA8 00230DA8 3000B27B */  lq         $18, 0x30($sp)
/* 130EAC 00230DAC 2000B17B */  lq         $17, 0x20($sp)
/* 130EB0 00230DB0 1000B07B */  lq         $16, 0x10($sp)
/* 130EB4 00230DB4 F000BD27 */  addiu      $sp, $sp, 0xF0
/* 130EB8 00230DB8 0800E003 */  jr         $31
/* 130EBC 00230DBC 00000000 */   nop
