.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel setTexScroll__Fv__2
/* 017B80 01DC3880 60FFBD27 */  addiu       $29, $29, -0xA0
/* 017B84 01DC3884 6000BF7F */  sq          $31, 0x60($29)
/* 017B88 01DC3888 5000B37F */  sq          $19, 0x50($29)
/* 017B8C 01DC388C 4000B27F */  sq          $18, 0x40($29)
/* 017B90 01DC3890 3000B17F */  sq          $17, 0x30($29)
/* 017B94 01DC3894 2000B07F */  sq          $16, 0x20($29)
/* 017B98 01DC3898 749A81C7 */  lwc1        $f1, -0x658C($28)
/* 017B9C 01DC389C FC42023C */  lui         $2, (0x42FC0000 >> 16)
/* 017BA0 01DC38A0 00008244 */  mtc1        $2, $f0
/* 017BA4 01DC38A4 00000000 */  nop
/* 017BA8 01DC38A8 34080046 */  c.lt.s      $f1, $f0
/* 017BAC 01DC38AC 00000000 */  nop
/* 017BB0 01DC38B0 04000145 */  bc1t        .L01DC38C4_2C90C4
/* 017BB4 01DC38B4 00000000 */   nop
/* 017BB8 01DC38B8 749A80AF */  sw          $0, -0x658C($28)
/* 017BBC 01DC38BC 06000010 */  b           .L01DC38D8_2C90D8
/* 017BC0 01DC38C0 00000000 */   nop
.L01DC38C4_2C90C4:
/* 017BC4 01DC38C4 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 017BC8 01DC38C8 00008244 */  mtc1        $2, $f0
/* 017BCC 01DC38CC 00000000 */  nop
/* 017BD0 01DC38D0 00080046 */  add.s       $f0, $f1, $f0
/* 017BD4 01DC38D4 749A80E7 */  swc1        $f0, -0x658C($28)
.L01DC38D8_2C90D8:
/* 017BD8 01DC38D8 749A8CC7 */  lwc1        $f12, -0x658C($28)
/* 017BDC 01DC38DC 2C44040C */  jal         fptosi
/* 017BE0 01DC38E0 00000000 */   nop
/* 017BE4 01DC38E4 709A82AF */  sw          $2, -0x6590($28)
/* 017BE8 01DC38E8 C701023C */  lui         $2, %hi(TexManager)
/* 017BEC 01DC38EC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 017BF0 01DC38F0 DE01023C */  lui         $2, %hi(LIT_1860)
/* 017BF4 01DC38F4 D8F94524 */  addiu       $5, $2, %lo(LIT_1860)
/* 017BF8 01DC38F8 FFFF0624 */  addiu       $6, $0, -0x1
/* 017BFC 01DC38FC B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 017C00 01DC3900 00000000 */   nop
/* 017C04 01DC3904 28864070 */  paddub      $16, $2, $0
/* 017C08 01DC3908 C701023C */  lui         $2, %hi(TexManager)
/* 017C0C 01DC390C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 017C10 01DC3910 DE01023C */  lui         $2, %hi(LIT_1861)
/* 017C14 01DC3914 E0F94524 */  addiu       $5, $2, %lo(LIT_1861)
/* 017C18 01DC3918 FFFF0624 */  addiu       $6, $0, -0x1
/* 017C1C 01DC391C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 017C20 01DC3920 00000000 */   nop
/* 017C24 01DC3924 03000012 */  beqz        $16, .L01DC3934_2C9134
/* 017C28 01DC3928 00000000 */   nop
/* 017C2C 01DC392C 03004014 */  bnez        $2, .L01DC393C_2C913C
/* 017C30 01DC3930 00000000 */   nop
.L01DC3934_2C9134:
/* 017C34 01DC3934 5E000010 */  b           .L01DC3AB0_2C92B0
/* 017C38 01DC3938 00000000 */   nop
.L01DC393C_2C913C:
/* 017C3C 01DC393C 2800038E */  lw          $3, 0x28($16)
/* 017C40 01DC3940 FF3F7130 */  andi        $17, $3, 0x3FFF
/* 017C44 01DC3944 2800438C */  lw          $3, 0x28($2)
/* 017C48 01DC3948 FF3F7230 */  andi        $18, $3, 0x3FFF
/* 017C4C 01DC394C 280003DE */  ld          $3, 0x28($16)
/* 017C50 01DC3950 BA1B0300 */  dsrl        $3, $3, 14
/* 017C54 01DC3954 3F006330 */  andi        $3, $3, 0x3F
/* 017C58 01DC3958 3C800300 */  dsll32      $16, $3, 0
/* 017C5C 01DC395C 3F801000 */  dsra32      $16, $16, 0
/* 017C60 01DC3960 280043DC */  ld          $3, 0x28($2)
/* 017C64 01DC3964 BA1B0300 */  dsrl        $3, $3, 14
/* 017C68 01DC3968 3F006330 */  andi        $3, $3, 0x3F
/* 017C6C 01DC396C 3C980300 */  dsll32      $19, $3, 0
/* 017C70 01DC3970 3F981300 */  dsra32      $19, $19, 0
/* 017C74 01DC3974 9000A397 */  lhu         $3, 0x90($29)
/* 017C78 01DC3978 FF3F2432 */  andi        $4, $17, 0x3FFF
/* 017C7C 01DC397C 00C00924 */  addiu       $9, $0, -0x4000
/* 017C80 01DC3980 24186900 */  and         $3, $3, $9
/* 017C84 01DC3984 25186400 */  or          $3, $3, $4
/* 017C88 01DC3988 9000A3A7 */  sh          $3, 0x90($29)
/* 017C8C 01DC398C 9000A5DF */  ld          $5, 0x90($29)
/* 017C90 01DC3990 3F000332 */  andi        $3, $16, 0x3F
/* 017C94 01DC3994 B8230300 */  dsll        $4, $3, 14
/* 017C98 01DC3998 F0FF033C */  lui         $3, (0xFFF03FFF >> 16)
/* 017C9C 01DC399C FF3F6834 */  ori         $8, $3, (0xFFF03FFF & 0xFFFF)
/* 017CA0 01DC39A0 2418A800 */  and         $3, $5, $8
/* 017CA4 01DC39A4 25186400 */  or          $3, $3, $4
/* 017CA8 01DC39A8 9000A3FF */  sd          $3, 0x90($29)
/* 017CAC 01DC39AC 9200A397 */  lhu         $3, 0x92($29)
/* 017CB0 01DC39B0 30010764 */  daddiu      $7, $0, 0x130
/* 017CB4 01DC39B4 0FFC0624 */  addiu       $6, $0, -0x3F1
/* 017CB8 01DC39B8 24186600 */  and         $3, $3, $6
/* 017CBC 01DC39BC 25186700 */  or          $3, $3, $7
/* 017CC0 01DC39C0 9200A3A7 */  sh          $3, 0x92($29)
/* 017CC4 01DC39C4 9800A397 */  lhu         $3, 0x98($29)
/* 017CC8 01DC39C8 FF3F4432 */  andi        $4, $18, 0x3FFF
/* 017CCC 01DC39CC 24186900 */  and         $3, $3, $9
/* 017CD0 01DC39D0 25186400 */  or          $3, $3, $4
/* 017CD4 01DC39D4 9800A3A7 */  sh          $3, 0x98($29)
/* 017CD8 01DC39D8 9800A5DF */  ld          $5, 0x98($29)
/* 017CDC 01DC39DC 3F006332 */  andi        $3, $19, 0x3F
/* 017CE0 01DC39E0 B8230300 */  dsll        $4, $3, 14
/* 017CE4 01DC39E4 2418A800 */  and         $3, $5, $8
/* 017CE8 01DC39E8 25186400 */  or          $3, $3, $4
/* 017CEC 01DC39EC 9800A3FF */  sd          $3, 0x98($29)
/* 017CF0 01DC39F0 9A00A397 */  lhu         $3, 0x9A($29)
/* 017CF4 01DC39F4 24186600 */  and         $3, $3, $6
/* 017CF8 01DC39F8 25186700 */  or          $3, $3, $7
/* 017CFC 01DC39FC 9A00A3A7 */  sh          $3, 0x9A($29)
/* 017D00 01DC3A00 709A848F */  lw          $4, -0x6590($28)
/* 017D04 01DC3A04 80000324 */  addiu       $3, $0, 0x80
/* 017D08 01DC3A08 13008310 */  beq         $4, $3, .L01DC3A58_2C9258
/* 017D0C 01DC3A0C 00000000 */   nop
/* 017D10 01DC3A10 23106400 */  subu        $2, $3, $4
/* 017D14 01DC3A14 7000A4AF */  sw          $4, 0x70($29)
/* 017D18 01DC3A18 7400A0AF */  sw          $0, 0x74($29)
/* 017D1C 01DC3A1C 7800A2AF */  sw          $2, 0x78($29)
/* 017D20 01DC3A20 7C00A3AF */  sw          $3, 0x7C($29)
/* 017D24 01DC3A24 0000A0FF */  sd          $0, 0x0($29)
/* 017D28 01DC3A28 0800A0FF */  sd          $0, 0x8($29)
/* 017D2C 01DC3A2C 1000A0FF */  sd          $0, 0x10($29)
/* 017D30 01DC3A30 D48B848F */  lw          $4, -0x742C($28)
/* 017D34 01DC3A34 282E4072 */  paddub      $5, $18, $0
/* 017D38 01DC3A38 28366072 */  paddub      $6, $19, $0
/* 017D3C 01DC3A3C 13000724 */  addiu       $7, $0, 0x13
/* 017D40 01DC3A40 7000A827 */  addiu       $8, $29, 0x70
/* 017D44 01DC3A44 284E2072 */  paddub      $9, $17, $0
/* 017D48 01DC3A48 28560072 */  paddub      $10, $16, $0
/* 017D4C 01DC3A4C 285EE070 */  paddub      $11, $7, $0
/* 017D50 01DC3A50 9801050C */  jal         MoveImageTest__FP13sceVif1PacketiiiRC8CRect_i_iiiiii
/* 017D54 01DC3A54 00000000 */   nop
.L01DC3A58_2C9258:
/* 017D58 01DC3A58 709A838F */  lw          $3, -0x6590($28)
/* 017D5C 01DC3A5C 14006010 */  beqz        $3, .L01DC3AB0_2C92B0
/* 017D60 01DC3A60 00000000 */   nop
/* 017D64 01DC3A64 8000A0AF */  sw          $0, 0x80($29)
/* 017D68 01DC3A68 8400A0AF */  sw          $0, 0x84($29)
/* 017D6C 01DC3A6C 8800A3AF */  sw          $3, 0x88($29)
/* 017D70 01DC3A70 80000224 */  addiu       $2, $0, 0x80
/* 017D74 01DC3A74 8C00A2AF */  sw          $2, 0x8C($29)
/* 017D78 01DC3A78 23104300 */  subu        $2, $2, $3
/* 017D7C 01DC3A7C 0000A2FF */  sd          $2, 0x0($29)
/* 017D80 01DC3A80 0800A0FF */  sd          $0, 0x8($29)
/* 017D84 01DC3A84 1000A0FF */  sd          $0, 0x10($29)
/* 017D88 01DC3A88 D48B848F */  lw          $4, -0x742C($28)
/* 017D8C 01DC3A8C 282E4072 */  paddub      $5, $18, $0
/* 017D90 01DC3A90 28366072 */  paddub      $6, $19, $0
/* 017D94 01DC3A94 13000724 */  addiu       $7, $0, 0x13
/* 017D98 01DC3A98 8000A827 */  addiu       $8, $29, 0x80
/* 017D9C 01DC3A9C 284E2072 */  paddub      $9, $17, $0
/* 017DA0 01DC3AA0 28560072 */  paddub      $10, $16, $0
/* 017DA4 01DC3AA4 285EE070 */  paddub      $11, $7, $0
/* 017DA8 01DC3AA8 9801050C */  jal         MoveImageTest__FP13sceVif1PacketiiiRC8CRect_i_iiiiii
/* 017DAC 01DC3AAC 00000000 */   nop
.L01DC3AB0_2C92B0:
/* 017DB0 01DC3AB0 6000BF7B */  lq          $31, 0x60($29)
/* 017DB4 01DC3AB4 5000B37B */  lq          $19, 0x50($29)
/* 017DB8 01DC3AB8 4000B27B */  lq          $18, 0x40($29)
/* 017DBC 01DC3ABC 3000B17B */  lq          $17, 0x30($29)
/* 017DC0 01DC3AC0 2000B07B */  lq          $16, 0x20($29)
/* 017DC4 01DC3AC4 A000BD27 */  addiu       $29, $29, 0xA0
/* 017DC8 01DC3AC8 0800E003 */  jr          $31
/* 017DCC 01DC3ACC 00000000 */   nop
