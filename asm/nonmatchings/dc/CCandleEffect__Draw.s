.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw__13CCandleEffectFv
/* 63C20 00163B20 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* 63C24 00163B24 3000BF7F */  sq         $31, 0x30($sp)
/* 63C28 00163B28 2000B27F */  sq         $18, 0x20($sp)
/* 63C2C 00163B2C 1000B17F */  sq         $17, 0x10($sp)
/* 63C30 00163B30 0000B07F */  sq         $16, 0x0($sp)
/* 63C34 00163B34 28868070 */  paddub     $16, $4, $0
/* 63C38 00163B38 0800838C */  lw         $3, 0x8($4)
/* 63C3C 00163B3C 04006010 */  beqz       $3, .L00163B50
/* 63C40 00163B40 00000000 */   nop
/* 63C44 00163B44 0000038E */  lw         $3, 0x0($16)
/* 63C48 00163B48 03006014 */  bnez       $3, .L00163B58
/* 63C4C 00163B4C 00000000 */   nop
.L00163B50:
/* 63C50 00163B50 69000010 */  b          .L00163CF8
/* 63C54 00163B54 00000000 */   nop
.L00163B58:
/* 63C58 00163B58 100000C6 */  lwc1       $f0, 0x10($16)
/* 63C5C 00163B5C 4000A0E7 */  swc1       $f0, 0x40($sp)
/* 63C60 00163B60 140000C6 */  lwc1       $f0, 0x14($16)
/* 63C64 00163B64 4400A0E7 */  swc1       $f0, 0x44($sp)
/* 63C68 00163B68 180000C6 */  lwc1       $f0, 0x18($16)
/* 63C6C 00163B6C 4800A0E7 */  swc1       $f0, 0x48($sp)
/* 63C70 00163B70 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 63C74 00163B74 4C00A2AF */  sw         $2, 0x4C($sp)
/* 63C78 00163B78 5000A427 */  addiu      $4, $sp, 0x50
/* 63C7C 00163B7C 6000A527 */  addiu      $5, $sp, 0x60
/* 63C80 00163B80 4000A627 */  addiu      $6, $sp, 0x40
/* 63C84 00163B84 20000CC6 */  lwc1       $f12, 0x20($16)
/* 63C88 00163B88 24000DC6 */  lwc1       $f13, 0x24($16)
/* 63C8C 00163B8C 283E0070 */  paddub     $7, $0, $0
/* 63C90 00163B90 D0B9040C */  jal        MGRotTransPers3DSprite__FPiPiPfffi
/* 63C94 00163B94 00000000 */   nop
/* 63C98 00163B98 57004010 */  beqz       $2, .L00163CF8
/* 63C9C 00163B9C 00000000 */   nop
/* 63CA0 00163BA0 6400A427 */  addiu      $4, $sp, 0x64
/* 63CA4 00163BA4 5400A38F */  lw         $3, 0x54($sp)
/* 63CA8 00163BA8 0000828C */  lw         $2, 0x0($4)
/* 63CAC 00163BAC 23104300 */  subu       $2, $2, $3
/* 63CB0 00163BB0 43100200 */  sra        $2, $2, 1
/* 63CB4 00163BB4 21106200 */  addu       $2, $3, $2
/* 63CB8 00163BB8 000082AC */  sw         $2, 0x0($4)
/* 63CBC 00163BBC 9C00A227 */  addiu      $2, $sp, 0x9C
/* 63CC0 00163BC0 0C8780C7 */  lwc1       $f0, -0x78F4($gp)
/* 63CC4 00163BC4 000040E4 */  swc1       $f0, 0x0($2)
/* 63CC8 00163BC8 8800A327 */  addiu      $3, $sp, 0x88
/* 63CCC 00163BCC F88B82DF */  ld         $2, -0x7408($gp)
/* 63CD0 00163BD0 000062FC */  sd         $2, 0x0($3)
/* 63CD4 00163BD4 8800A393 */  lbu        $3, 0x88($sp)
/* 63CD8 00163BD8 03000530 */  andi       $5, $0, 0x3
/* 63CDC 00163BDC FCFF0224 */  addiu      $2, $0, -0x4
/* 63CE0 00163BE0 24106200 */  and        $2, $3, $2
/* 63CE4 00163BE4 25104500 */  or         $2, $2, $5
/* 63CE8 00163BE8 8800A2A3 */  sb         $2, 0x88($sp)
/* 63CEC 00163BEC 8800A493 */  lbu        $4, 0x88($sp)
/* 63CF0 00163BF0 08000364 */  daddiu     $3, $0, 0x8
/* 63CF4 00163BF4 F3FF0224 */  addiu      $2, $0, -0xD
/* 63CF8 00163BF8 24108200 */  and        $2, $4, $2
/* 63CFC 00163BFC 25104300 */  or         $2, $2, $3
/* 63D00 00163C00 8800A2A3 */  sb         $2, 0x88($sp)
/* 63D04 00163C04 8800A493 */  lbu        $4, 0x88($sp)
/* 63D08 00163C08 00190500 */  sll        $3, $5, 4
/* 63D0C 00163C0C CFFF0224 */  addiu      $2, $0, -0x31
/* 63D10 00163C10 24108200 */  and        $2, $4, $2
/* 63D14 00163C14 25104300 */  or         $2, $2, $3
/* 63D18 00163C18 8800A2A3 */  sb         $2, 0x88($sp)
/* 63D1C 00163C1C 8800A493 */  lbu        $4, 0x88($sp)
/* 63D20 00163C20 40000364 */  daddiu     $3, $0, 0x40
/* 63D24 00163C24 3FFF0224 */  addiu      $2, $0, -0xC1
/* 63D28 00163C28 24108200 */  and        $2, $4, $2
/* 63D2C 00163C2C 25104300 */  or         $2, $2, $3
/* 63D30 00163C30 8800A2A3 */  sb         $2, 0x88($sp)
/* 63D34 00163C34 9000A427 */  addiu      $4, $sp, 0x90
/* 63D38 00163C38 F08B82DF */  ld         $2, -0x7410($gp)
/* 63D3C 00163C3C 000082FC */  sd         $2, 0x0($4)
/* 63D40 00163C40 9400A593 */  lbu        $5, 0x94($sp)
/* 63D44 00163C44 01000364 */  daddiu     $3, $0, 0x1
/* 63D48 00163C48 FEFF0224 */  addiu      $2, $0, -0x2
/* 63D4C 00163C4C 2410A200 */  and        $2, $5, $2
/* 63D50 00163C50 25104300 */  or         $2, $2, $3
/* 63D54 00163C54 9400A2A3 */  sb         $2, 0x94($sp)
/* 63D58 00163C58 B0BB040C */  jal        MGSetGsZBUF__FP9sceGsZbuf
/* 63D5C 00163C5C 00000000 */   nop
/* 63D60 00163C60 04000CC6 */  lwc1       $f12, 0x4($16)
/* 63D64 00163C64 2C44040C */  jal        fptosi
/* 63D68 00163C68 00000000 */   nop
/* 63D6C 00163C6C 07000324 */  addiu      $3, $0, 0x7
/* 63D70 00163C70 23186200 */  subu       $3, $3, $2
/* 63D74 00163C74 03006230 */  andi       $2, $3, 0x3
/* 63D78 00163C78 04006104 */  bgez       $3, .L00163C8C
/* 63D7C 00163C7C 00000000 */   nop
/* 63D80 00163C80 02004010 */  beqz       $2, .L00163C8C
/* 63D84 00163C84 00000000 */   nop
/* 63D88 00163C88 FCFF4224 */  addiu      $2, $2, -0x4
.L00163C8C:
/* 63D8C 00163C8C 40890200 */  sll        $17, $2, 5
/* 63D90 00163C90 83100300 */  sra        $2, $3, 2
/* 63D94 00163C94 40910200 */  sll        $18, $2, 5
/* 63D98 00163C98 8800A427 */  addiu      $4, $sp, 0x88
/* 63D9C 00163C9C E4BB040C */  jal        MGSetGsALPHA__FP10sceGsAlpha
/* 63DA0 00163CA0 00000000 */   nop
/* 63DA4 00163CA4 7000B1AF */  sw         $17, 0x70($sp)
/* 63DA8 00163CA8 7400B2AF */  sw         $18, 0x74($sp)
/* 63DAC 00163CAC 20000224 */  addiu      $2, $0, 0x20
/* 63DB0 00163CB0 7800A2AF */  sw         $2, 0x78($sp)
/* 63DB4 00163CB4 7C00A2AF */  sw         $2, 0x7C($sp)
/* 63DB8 00163CB8 A0B8040C */  jal        GetVif1Packet__Fv
/* 63DBC 00163CBC 00000000 */   nop
/* 63DC0 00163CC0 28264070 */  paddub     $4, $2, $0
/* 63DC4 00163CC4 0800058E */  lw         $5, 0x8($16)
/* 63DC8 00163CC8 7000A627 */  addiu      $6, $sp, 0x70
/* 63DCC 00163CCC 5000A727 */  addiu      $7, $sp, 0x50
/* 63DD0 00163CD0 6000A827 */  addiu      $8, $sp, 0x60
/* 63DD4 00163CD4 9C00A927 */  addiu      $9, $sp, 0x9C
/* 63DD8 00163CD8 E475050C */  jal        set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiP6spRGBA
/* 63DDC 00163CDC 00000000 */   nop
/* 63DE0 00163CE0 F88B8427 */  addiu      $4, $gp, -0x7408
/* 63DE4 00163CE4 E4BB040C */  jal        MGSetGsALPHA__FP10sceGsAlpha
/* 63DE8 00163CE8 00000000 */   nop
/* 63DEC 00163CEC F08B8427 */  addiu      $4, $gp, -0x7410
/* 63DF0 00163CF0 B0BB040C */  jal        MGSetGsZBUF__FP9sceGsZbuf
/* 63DF4 00163CF4 00000000 */   nop
.L00163CF8:
/* 63DF8 00163CF8 3000BF7B */  lq         $31, 0x30($sp)
/* 63DFC 00163CFC 2000B27B */  lq         $18, 0x20($sp)
/* 63E00 00163D00 1000B17B */  lq         $17, 0x10($sp)
/* 63E04 00163D04 0000B07B */  lq         $16, 0x0($sp)
/* 63E08 00163D08 A000BD27 */  addiu      $sp, $sp, 0xA0
/* 63E0C 00163D0C 0800E003 */  jr         $31
/* 63E10 00163D10 00000000 */   nop
/* 63E14 00163D14 00000000 */  nop
/* 63E18 00163D18 00000000 */  nop
/* 63E1C 00163D1C 00000000 */  nop
