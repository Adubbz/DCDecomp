.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawOtherCharaStatus__Fiiii
/* F4970 001F4870 C0FEBD27 */  addiu      $sp, $sp, -0x140
/* F4974 001F4874 9000BF7F */  sq         $31, 0x90($sp)
/* F4978 001F4878 8000B77F */  sq         $23, 0x80($sp)
/* F497C 001F487C 7000B67F */  sq         $22, 0x70($sp)
/* F4980 001F4880 6000B57F */  sq         $21, 0x60($sp)
/* F4984 001F4884 5000B47F */  sq         $20, 0x50($sp)
/* F4988 001F4888 4000B37F */  sq         $19, 0x40($sp)
/* F498C 001F488C 3000B27F */  sq         $18, 0x30($sp)
/* F4990 001F4890 2000B17F */  sq         $17, 0x20($sp)
/* F4994 001F4894 1000B07F */  sq         $16, 0x10($sp)
/* F4998 001F4898 0C00B7E7 */  swc1       $f23, 0xC($sp)
/* F499C 001F489C 0800B6E7 */  swc1       $f22, 0x8($sp)
/* F49A0 001F48A0 0400B5E7 */  swc1       $f21, 0x4($sp)
/* F49A4 001F48A4 0000B4E7 */  swc1       $f20, 0x0($sp)
/* F49A8 001F48A8 28AEE070 */  paddub     $21, $7, $0
/* F49AC 001F48AC FBFF9024 */  addiu      $16, $4, -0x5
/* F49B0 001F48B0 0300B124 */  addiu      $17, $5, 0x3
/* F49B4 001F48B4 DD00212A */  slti       $at, $17, 0xDD
/* F49B8 001F48B8 02002014 */  bnez       $at, .L001F48C4
/* F49BC 001F48BC 00000000 */   nop
/* F49C0 001F48C0 FFFF3126 */  addiu      $17, $17, -0x1
.L001F48C4:
/* F49C4 001F48C4 D494938F */  lw         $19, -0x6B2C($gp)
/* F49C8 001F48C8 40180600 */  sll        $3, $6, 1
/* F49CC 001F48CC 21387300 */  addu       $7, $3, $19
/* F49D0 001F48D0 1200E384 */  lh         $3, 0x12($7)
/* F49D4 001F48D4 00008344 */  mtc1       $3, $f0
/* F49D8 001F48D8 00000000 */  nop
/* F49DC 001F48DC 20058046 */  cvt.s.w    $f20, $f0
/* F49E0 001F48E0 0600E384 */  lh         $3, 0x6($7)
/* F49E4 001F48E4 00008344 */  mtc1       $3, $f0
/* F49E8 001F48E8 00000000 */  nop
/* F49EC 001F48EC 60058046 */  cvt.s.w    $f21, $f0
/* F49F0 001F48F0 803F033C */  lui        $3, (0x3F800000 >> 16)
/* F49F4 001F48F4 00008344 */  mtc1       $3, $f0
/* F49F8 001F48F8 00000000 */  nop
/* F49FC 001F48FC 34A80046 */  c.lt.s     $f21, $f0
/* F4A00 001F4900 00000000 */  nop
/* F4A04 001F4904 02000045 */  bc1f       .L001F4910
/* F4A08 001F4908 00000000 */   nop
/* F4A0C 001F490C 46050046 */  mov.s      $f21, $f0
.L001F4910:
/* F4A10 001F4910 2118D300 */  addu       $3, $6, $19
/* F4A14 001F4914 40436780 */  lb         $7, 0x4340($3)
/* F4A18 001F4918 A80A0324 */  addiu      $3, $0, 0xAA8
/* F4A1C 001F491C 1818C300 */  mult       $3, $6, $3
/* F4A20 001F4920 21186302 */  addu       $3, $19, $3
/* F4A24 001F4924 0C456824 */  addiu      $8, $3, 0x450C
/* F4A28 001F4928 40190700 */  sll        $3, $7, 5
/* F4A2C 001F492C 23186700 */  subu       $3, $3, $7
/* F4A30 001F4930 C0180300 */  sll        $3, $3, 3
/* F4A34 001F4934 21180301 */  addu       $3, $8, $3
/* F4A38 001F4938 DE006010 */  beqz       $3, .L001F4CB4
/* F4A3C 001F493C 00000000 */   nop
/* F4A40 001F4940 100076C4 */  lwc1       $f22, 0x10($3)
/* F4A44 001F4944 0C006284 */  lh         $2, 0xC($3)
/* F4A48 001F4948 00008244 */  mtc1       $2, $f0
/* F4A4C 001F494C 00000000 */  nop
/* F4A50 001F4950 E0058046 */  cvt.s.w    $f23, $f0
/* F4A54 001F4954 803F023C */  lui        $2, (0x3F800000 >> 16)
/* F4A58 001F4958 00008244 */  mtc1       $2, $f0
/* F4A5C 001F495C 00000000 */  nop
/* F4A60 001F4960 34B80046 */  c.lt.s     $f23, $f0
/* F4A64 001F4964 00000000 */  nop
/* F4A68 001F4968 02000045 */  bc1f       .L001F4974
/* F4A6C 001F496C 00000000 */   nop
/* F4A70 001F4970 C6050046 */  mov.s      $f23, $f0
.L001F4974:
/* F4A74 001F4974 80A00600 */  sll        $20, $6, 2
/* F4A78 001F4978 21109302 */  addu       $2, $20, $19
/* F4A7C 001F497C 04434CC4 */  lwc1       $f12, 0x4304($2)
/* F4A80 001F4980 2C44040C */  jal        fptosi
/* F4A84 001F4984 00000000 */   nop
/* F4A88 001F4988 28964070 */  paddub     $18, $2, $0
/* F4A8C 001F498C 21109302 */  addu       $2, $20, $19
/* F4A90 001F4990 EC424CC4 */  lwc1       $f12, 0x42EC($2)
/* F4A94 001F4994 2C44040C */  jal        fptosi
/* F4A98 001F4998 00000000 */   nop
/* F4A9C 001F499C 28BE4070 */  paddub     $23, $2, $0
/* F4AA0 001F49A0 2900023C */  lui        $2, %hi(_731_6)
/* F4AA4 001F49A4 502E4224 */  addiu      $2, $2, %lo(_731_6)
/* F4AA8 001F49A8 A000A327 */  addiu      $3, $sp, 0xA0
/* F4AAC 001F49AC 00004278 */  lq         $2, 0x0($2)
/* F4AB0 001F49B0 0000627C */  sq         $2, 0x0($3)
/* F4AB4 001F49B4 A000B4E7 */  swc1       $f20, 0xA0($sp)
/* F4AB8 001F49B8 A400B5E7 */  swc1       $f21, 0xA4($sp)
/* F4ABC 001F49BC A800B6E7 */  swc1       $f22, 0xA8($sp)
/* F4AC0 001F49C0 AC00B7E7 */  swc1       $f23, 0xAC($sp)
/* F4AC4 001F49C4 FDFF0226 */  addiu      $2, $16, -0x3
/* F4AC8 001F49C8 00110200 */  sll        $2, $2, 4
/* F4ACC 001F49CC C000A2AF */  sw         $2, 0xC0($sp)
/* F4AD0 001F49D0 FEFF2226 */  addiu      $2, $17, -0x2
/* F4AD4 001F49D4 43100200 */  sra        $2, $2, 1
/* F4AD8 001F49D8 00110200 */  sll        $2, $2, 4
/* F4ADC 001F49DC C400A2AF */  sw         $2, 0xC4($sp)
/* F4AE0 001F49E0 A0030224 */  addiu      $2, $0, 0x3A0
/* F4AE4 001F49E4 C800A2AF */  sw         $2, 0xC8($sp)
/* F4AE8 001F49E8 30000224 */  addiu      $2, $0, 0x30
/* F4AEC 001F49EC CC00A2AF */  sw         $2, 0xCC($sp)
/* F4AF0 001F49F0 FF00A832 */  andi       $8, $21, 0xFF
/* F4AF4 001F49F4 C000A427 */  addiu      $4, $sp, 0xC0
/* F4AF8 001F49F8 14000524 */  addiu      $5, $0, 0x14
/* F4AFC 001F49FC 2836A070 */  paddub     $6, $5, $0
/* F4B00 001F4A00 283EA070 */  paddub     $7, $5, $0
/* F4B04 001F4A04 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* F4B08 001F4A08 00000000 */   nop
/* F4B0C 001F4A0C 5042023C */  lui        $2, (0x42500000 >> 16)
/* F4B10 001F4A10 00008244 */  mtc1       $2, $f0
/* F4B14 001F4A14 00000000 */  nop
/* F4B18 001F4A18 02001446 */  mul.s      $f0, $f0, $f20
/* F4B1C 001F4A1C 03031546 */  div.s      $f12, $f0, $f21
/* F4B20 001F4A20 2C44040C */  jal        fptosi
/* F4B24 001F4A24 00000000 */   nop
/* F4B28 001F4A28 28B64070 */  paddub     $22, $2, $0
/* F4B2C 001F4A2C 00991000 */  sll        $19, $16, 4
/* F4B30 001F4A30 D000B3AF */  sw         $19, 0xD0($sp)
/* F4B34 001F4A34 43101100 */  sra        $2, $17, 1
/* F4B38 001F4A38 00A10200 */  sll        $20, $2, 4
/* F4B3C 001F4A3C D400B4AF */  sw         $20, 0xD4($sp)
/* F4B40 001F4A40 40030224 */  addiu      $2, $0, 0x340
/* F4B44 001F4A44 D800A2AF */  sw         $2, 0xD8($sp)
/* F4B48 001F4A48 20000224 */  addiu      $2, $0, 0x20
/* F4B4C 001F4A4C DC00A2AF */  sw         $2, 0xDC($sp)
/* F4B50 001F4A50 FF00A832 */  andi       $8, $21, 0xFF
/* F4B54 001F4A54 D000A427 */  addiu      $4, $sp, 0xD0
/* F4B58 001F4A58 4F000524 */  addiu      $5, $0, 0x4F
/* F4B5C 001F4A5C 2836A070 */  paddub     $6, $5, $0
/* F4B60 001F4A60 283EA070 */  paddub     $7, $5, $0
/* F4B64 001F4A64 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* F4B68 001F4A68 00000000 */   nop
/* F4B6C 001F4A6C B000B3AF */  sw         $19, 0xB0($sp)
/* F4B70 001F4A70 B400B4AF */  sw         $20, 0xB4($sp)
/* F4B74 001F4A74 00111600 */  sll        $2, $22, 4
/* F4B78 001F4A78 B800A2AF */  sw         $2, 0xB8($sp)
/* F4B7C 001F4A7C 20000224 */  addiu      $2, $0, 0x20
/* F4B80 001F4A80 BC00A2AF */  sw         $2, 0xBC($sp)
/* F4B84 001F4A84 4D000224 */  addiu      $2, $0, 0x4D
/* F4B88 001F4A88 E7000324 */  addiu      $3, $0, 0xE7
/* F4B8C 001F4A8C A5000424 */  addiu      $4, $0, 0xA5
/* F4B90 001F4A90 E88281C7 */  lwc1       $f1, -0x7D18($gp)
/* F4B94 001F4A94 00009644 */  mtc1       $22, $f0
/* F4B98 001F4A98 00000000 */  nop
/* F4B9C 001F4A9C 20008046 */  cvt.s.w    $f0, $f0
/* F4BA0 001F4AA0 34080046 */  c.lt.s     $f1, $f0
/* F4BA4 001F4AA4 00000000 */  nop
/* F4BA8 001F4AA8 04000145 */  bc1t       .L001F4ABC
/* F4BAC 001F4AAC 00000000 */   nop
/* F4BB0 001F4AB0 D6000224 */  addiu      $2, $0, 0xD6
/* F4BB4 001F4AB4 76000324 */  addiu      $3, $0, 0x76
/* F4BB8 001F4AB8 EA000424 */  addiu      $4, $0, 0xEA
.L001F4ABC:
/* F4BBC 001F4ABC FF004530 */  andi       $5, $2, 0xFF
/* F4BC0 001F4AC0 FF006630 */  andi       $6, $3, 0xFF
/* F4BC4 001F4AC4 FF008730 */  andi       $7, $4, 0xFF
/* F4BC8 001F4AC8 FF00A832 */  andi       $8, $21, 0xFF
/* F4BCC 001F4ACC B000A427 */  addiu      $4, $sp, 0xB0
/* F4BD0 001F4AD0 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* F4BD4 001F4AD4 00000000 */   nop
/* F4BD8 001F4AD8 01000226 */  addiu      $2, $16, 0x1
/* F4BDC 001F4ADC 00110200 */  sll        $2, $2, 4
/* F4BE0 001F4AE0 E000A2AF */  sw         $2, 0xE0($sp)
/* F4BE4 001F4AE4 04002226 */  addiu      $2, $17, 0x4
/* F4BE8 001F4AE8 43100200 */  sra        $2, $2, 1
/* F4BEC 001F4AEC 00110200 */  sll        $2, $2, 4
/* F4BF0 001F4AF0 E400A2AF */  sw         $2, 0xE4($sp)
/* F4BF4 001F4AF4 A0030224 */  addiu      $2, $0, 0x3A0
/* F4BF8 001F4AF8 E800A2AF */  sw         $2, 0xE8($sp)
/* F4BFC 001F4AFC 30000224 */  addiu      $2, $0, 0x30
/* F4C00 001F4B00 EC00A2AF */  sw         $2, 0xEC($sp)
/* F4C04 001F4B04 FF00A832 */  andi       $8, $21, 0xFF
/* F4C08 001F4B08 E000A427 */  addiu      $4, $sp, 0xE0
/* F4C0C 001F4B0C 14000524 */  addiu      $5, $0, 0x14
/* F4C10 001F4B10 2836A070 */  paddub     $6, $5, $0
/* F4C14 001F4B14 283EA070 */  paddub     $7, $5, $0
/* F4C18 001F4B18 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* F4C1C 001F4B1C 00000000 */   nop
/* F4C20 001F4B20 5042023C */  lui        $2, (0x42500000 >> 16)
/* F4C24 001F4B24 00008244 */  mtc1       $2, $f0
/* F4C28 001F4B28 00000000 */  nop
/* F4C2C 001F4B2C 02001646 */  mul.s      $f0, $f0, $f22
/* F4C30 001F4B30 03051746 */  div.s      $f20, $f0, $f23
/* F4C34 001F4B34 06A30046 */  mov.s      $f12, $f20
/* F4C38 001F4B38 2C44040C */  jal        fptosi
/* F4C3C 001F4B3C 00000000 */   nop
/* F4C40 001F4B40 04000226 */  addiu      $2, $16, 0x4
/* F4C44 001F4B44 00990200 */  sll        $19, $2, 4
/* F4C48 001F4B48 F000B3AF */  sw         $19, 0xF0($sp)
/* F4C4C 001F4B4C 06002226 */  addiu      $2, $17, 0x6
/* F4C50 001F4B50 43100200 */  sra        $2, $2, 1
/* F4C54 001F4B54 00A10200 */  sll        $20, $2, 4
/* F4C58 001F4B58 F400B4AF */  sw         $20, 0xF4($sp)
/* F4C5C 001F4B5C 40030224 */  addiu      $2, $0, 0x340
/* F4C60 001F4B60 F800A2AF */  sw         $2, 0xF8($sp)
/* F4C64 001F4B64 20000224 */  addiu      $2, $0, 0x20
/* F4C68 001F4B68 FC00A2AF */  sw         $2, 0xFC($sp)
/* F4C6C 001F4B6C FF00A832 */  andi       $8, $21, 0xFF
/* F4C70 001F4B70 F000A427 */  addiu      $4, $sp, 0xF0
/* F4C74 001F4B74 4F000524 */  addiu      $5, $0, 0x4F
/* F4C78 001F4B78 2836A070 */  paddub     $6, $5, $0
/* F4C7C 001F4B7C 283EA070 */  paddub     $7, $5, $0
/* F4C80 001F4B80 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* F4C84 001F4B84 00000000 */   nop
/* F4C88 001F4B88 0001B3AF */  sw         $19, 0x100($sp)
/* F4C8C 001F4B8C 0401B4AF */  sw         $20, 0x104($sp)
/* F4C90 001F4B90 06A30046 */  mov.s      $f12, $f20
/* F4C94 001F4B94 2C44040C */  jal        fptosi
/* F4C98 001F4B98 00000000 */   nop
/* F4C9C 001F4B9C 00110200 */  sll        $2, $2, 4
/* F4CA0 001F4BA0 0801A2AF */  sw         $2, 0x108($sp)
/* F4CA4 001F4BA4 20000224 */  addiu      $2, $0, 0x20
/* F4CA8 001F4BA8 0C01A2AF */  sw         $2, 0x10C($sp)
/* F4CAC 001F4BAC FF00A832 */  andi       $8, $21, 0xFF
/* F4CB0 001F4BB0 0001A427 */  addiu      $4, $sp, 0x100
/* F4CB4 001F4BB4 FF000524 */  addiu      $5, $0, 0xFF
/* F4CB8 001F4BB8 B1000624 */  addiu      $6, $0, 0xB1
/* F4CBC 001F4BBC 49000724 */  addiu      $7, $0, 0x49
/* F4CC0 001F4BC0 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* F4CC4 001F4BC4 00000000 */   nop
/* F4CC8 001F4BC8 05000226 */  addiu      $2, $16, 0x5
/* F4CCC 001F4BCC 00110200 */  sll        $2, $2, 4
/* F4CD0 001F4BD0 1001A2AF */  sw         $2, 0x110($sp)
/* F4CD4 001F4BD4 0A002226 */  addiu      $2, $17, 0xA
/* F4CD8 001F4BD8 43100200 */  sra        $2, $2, 1
/* F4CDC 001F4BDC 00110200 */  sll        $2, $2, 4
/* F4CE0 001F4BE0 1401A2AF */  sw         $2, 0x114($sp)
/* F4CE4 001F4BE4 A0030224 */  addiu      $2, $0, 0x3A0
/* F4CE8 001F4BE8 1801A2AF */  sw         $2, 0x118($sp)
/* F4CEC 001F4BEC 40000224 */  addiu      $2, $0, 0x40
/* F4CF0 001F4BF0 1C01A2AF */  sw         $2, 0x11C($sp)
/* F4CF4 001F4BF4 FF00A832 */  andi       $8, $21, 0xFF
/* F4CF8 001F4BF8 1001A427 */  addiu      $4, $sp, 0x110
/* F4CFC 001F4BFC 14000524 */  addiu      $5, $0, 0x14
/* F4D00 001F4C00 2836A070 */  paddub     $6, $5, $0
/* F4D04 001F4C04 283EA070 */  paddub     $7, $5, $0
/* F4D08 001F4C08 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* F4D0C 001F4C0C 00000000 */   nop
/* F4D10 001F4C10 40101200 */  sll        $2, $18, 1
/* F4D14 001F4C14 21105200 */  addu       $2, $2, $18
/* F4D18 001F4C18 80100200 */  sll        $2, $2, 2
/* F4D1C 001F4C1C 21105200 */  addu       $2, $2, $18
/* F4D20 001F4C20 80100200 */  sll        $2, $2, 2
/* F4D24 001F4C24 1A005700 */  div        $0, $2, $23
/* F4D28 001F4C28 0200E016 */  bnez       $23, .L001F4C34
/* F4D2C 001F4C2C 00000000 */   nop
/* F4D30 001F4C30 CD010000 */  break      0, 7
.L001F4C34:
/* F4D34 001F4C34 12900000 */  mflo       $18
/* F4D38 001F4C38 08000226 */  addiu      $2, $16, 0x8
/* F4D3C 001F4C3C 00810200 */  sll        $16, $2, 4
/* F4D40 001F4C40 2001B0AF */  sw         $16, 0x120($sp)
/* F4D44 001F4C44 0C002226 */  addiu      $2, $17, 0xC
/* F4D48 001F4C48 43100200 */  sra        $2, $2, 1
/* F4D4C 001F4C4C 00890200 */  sll        $17, $2, 4
/* F4D50 001F4C50 2401B1AF */  sw         $17, 0x124($sp)
/* F4D54 001F4C54 40030224 */  addiu      $2, $0, 0x340
/* F4D58 001F4C58 2801A2AF */  sw         $2, 0x128($sp)
/* F4D5C 001F4C5C 20000224 */  addiu      $2, $0, 0x20
/* F4D60 001F4C60 2C01A2AF */  sw         $2, 0x12C($sp)
/* F4D64 001F4C64 FF00A832 */  andi       $8, $21, 0xFF
/* F4D68 001F4C68 2001A427 */  addiu      $4, $sp, 0x120
/* F4D6C 001F4C6C 4F000524 */  addiu      $5, $0, 0x4F
/* F4D70 001F4C70 2836A070 */  paddub     $6, $5, $0
/* F4D74 001F4C74 283EA070 */  paddub     $7, $5, $0
/* F4D78 001F4C78 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* F4D7C 001F4C7C 00000000 */   nop
/* F4D80 001F4C80 3001B0AF */  sw         $16, 0x130($sp)
/* F4D84 001F4C84 3401B1AF */  sw         $17, 0x134($sp)
/* F4D88 001F4C88 00111200 */  sll        $2, $18, 4
/* F4D8C 001F4C8C 3801A2AF */  sw         $2, 0x138($sp)
/* F4D90 001F4C90 20000224 */  addiu      $2, $0, 0x20
/* F4D94 001F4C94 3C01A2AF */  sw         $2, 0x13C($sp)
/* F4D98 001F4C98 FF00A832 */  andi       $8, $21, 0xFF
/* F4D9C 001F4C9C 3001A427 */  addiu      $4, $sp, 0x130
/* F4DA0 001F4CA0 C8000524 */  addiu      $5, $0, 0xC8
/* F4DA4 001F4CA4 EF000624 */  addiu      $6, $0, 0xEF
/* F4DA8 001F4CA8 F2000724 */  addiu      $7, $0, 0xF2
/* F4DAC 001F4CAC 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* F4DB0 001F4CB0 00000000 */   nop
.L001F4CB4:
/* F4DB4 001F4CB4 9000BF7B */  lq         $31, 0x90($sp)
/* F4DB8 001F4CB8 8000B77B */  lq         $23, 0x80($sp)
/* F4DBC 001F4CBC 7000B67B */  lq         $22, 0x70($sp)
/* F4DC0 001F4CC0 6000B57B */  lq         $21, 0x60($sp)
/* F4DC4 001F4CC4 5000B47B */  lq         $20, 0x50($sp)
/* F4DC8 001F4CC8 4000B37B */  lq         $19, 0x40($sp)
/* F4DCC 001F4CCC 3000B27B */  lq         $18, 0x30($sp)
/* F4DD0 001F4CD0 2000B17B */  lq         $17, 0x20($sp)
/* F4DD4 001F4CD4 1000B07B */  lq         $16, 0x10($sp)
/* F4DD8 001F4CD8 0C00B7C7 */  lwc1       $f23, 0xC($sp)
/* F4DDC 001F4CDC 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* F4DE0 001F4CE0 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* F4DE4 001F4CE4 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* F4DE8 001F4CE8 4001BD27 */  addiu      $sp, $sp, 0x140
/* F4DEC 001F4CEC 0800E003 */  jr         $31
/* F4DF0 001F4CF0 00000000 */   nop
/* F4DF4 001F4CF4 00000000 */  nop
/* F4DF8 001F4CF8 00000000 */  nop
/* F4DFC 001F4CFC 00000000 */  nop
