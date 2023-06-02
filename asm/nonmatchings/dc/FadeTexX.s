.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FadeTexX__FiiiiPci
/* 12DAF0 0022D9F0 90FEBD27 */  addiu      $sp, $sp, -0x170
/* 12DAF4 0022D9F4 8000BF7F */  sq         $31, 0x80($sp)
/* 12DAF8 0022D9F8 7000B67F */  sq         $22, 0x70($sp)
/* 12DAFC 0022D9FC 6000B57F */  sq         $21, 0x60($sp)
/* 12DB00 0022DA00 5000B47F */  sq         $20, 0x50($sp)
/* 12DB04 0022DA04 4000B37F */  sq         $19, 0x40($sp)
/* 12DB08 0022DA08 3000B27F */  sq         $18, 0x30($sp)
/* 12DB0C 0022DA0C 2000B17F */  sq         $17, 0x20($sp)
/* 12DB10 0022DA10 1000B07F */  sq         $16, 0x10($sp)
/* 12DB14 0022DA14 28A68070 */  paddub     $20, $4, $0
/* 12DB18 0022DA18 289EA070 */  paddub     $19, $5, $0
/* 12DB1C 0022DA1C 2896C070 */  paddub     $18, $6, $0
/* 12DB20 0022DA20 288EE070 */  paddub     $17, $7, $0
/* 12DB24 0022DA24 28862071 */  paddub     $16, $9, $0
/* 12DB28 0022DA28 C701023C */  lui        $2, %hi(TexManager)
/* 12DB2C 0022DA2C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 12DB30 0022DA30 282E0071 */  paddub     $5, $8, $0
/* 12DB34 0022DA34 FFFF0624 */  addiu      $6, $0, -0x1
/* 12DB38 0022DA38 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 12DB3C 0022DA3C 00000000 */   nop
/* 12DB40 0022DA40 00004384 */  lh         $3, 0x0($2)
/* 12DB44 0022DA44 9000A3A7 */  sh         $3, 0x90($sp)
/* 12DB48 0022DA48 02004384 */  lh         $3, 0x2($2)
/* 12DB4C 0022DA4C 9200A3A7 */  sh         $3, 0x92($sp)
/* 12DB50 0022DA50 04004384 */  lh         $3, 0x4($2)
/* 12DB54 0022DA54 9400A3A7 */  sh         $3, 0x94($sp)
/* 12DB58 0022DA58 06004384 */  lh         $3, 0x6($2)
/* 12DB5C 0022DA5C 9600A3A7 */  sh         $3, 0x96($sp)
/* 12DB60 0022DA60 08004724 */  addiu      $7, $2, 0x8
/* 12DB64 0022DA64 9800A627 */  addiu      $6, $sp, 0x98
/* 12DB68 0022DA68 04000524 */  addiu      $5, $0, 0x4
.L0022DA6C:
/* 12DB6C 0022DA6C 0000E48C */  lw         $4, 0x0($7)
/* 12DB70 0022DA70 0400E38C */  lw         $3, 0x4($7)
/* 12DB74 0022DA74 0800E724 */  addiu      $7, $7, 0x8
/* 12DB78 0022DA78 FFFFA524 */  addiu      $5, $5, -0x1
/* 12DB7C 0022DA7C 0000C4AC */  sw         $4, 0x0($6)
/* 12DB80 0022DA80 0400C3AC */  sw         $3, 0x4($6)
/* 12DB84 0022DA84 0800C624 */  addiu      $6, $6, 0x8
/* 12DB88 0022DA88 F8FFA01C */  bgtz       $5, .L0022DA6C
/* 12DB8C 0022DA8C 00000000 */   nop
/* 12DB90 0022DA90 280043DC */  ld         $3, 0x28($2)
/* 12DB94 0022DA94 B800A527 */  addiu      $5, $sp, 0xB8
/* 12DB98 0022DA98 0000A3FC */  sd         $3, 0x0($5)
/* 12DB9C 0022DA9C 300043DC */  ld         $3, 0x30($2)
/* 12DBA0 0022DAA0 C000A3FF */  sd         $3, 0xC0($sp)
/* 12DBA4 0022DAA4 C800A327 */  addiu      $3, $sp, 0xC8
/* 12DBA8 0022DAA8 380043C4 */  lwc1       $f3, 0x38($2)
/* 12DBAC 0022DAAC 3C0042C4 */  lwc1       $f2, 0x3C($2)
/* 12DBB0 0022DAB0 400041C4 */  lwc1       $f1, 0x40($2)
/* 12DBB4 0022DAB4 440040C4 */  lwc1       $f0, 0x44($2)
/* 12DBB8 0022DAB8 000063E4 */  swc1       $f3, 0x0($3)
/* 12DBBC 0022DABC 040062E4 */  swc1       $f2, 0x4($3)
/* 12DBC0 0022DAC0 080061E4 */  swc1       $f1, 0x8($3)
/* 12DBC4 0022DAC4 0C0060E4 */  swc1       $f0, 0xC($3)
/* 12DBC8 0022DAC8 4800438C */  lw         $3, 0x48($2)
/* 12DBCC 0022DACC D800A3AF */  sw         $3, 0xD8($sp)
/* 12DBD0 0022DAD0 4C00438C */  lw         $3, 0x4C($2)
/* 12DBD4 0022DAD4 DC00A3AF */  sw         $3, 0xDC($sp)
/* 12DBD8 0022DAD8 9000A327 */  addiu      $3, $sp, 0x90
/* 12DBDC 0022DADC 9F006010 */  beqz       $3, .L0022DD5C
/* 12DBE0 0022DAE0 00000000 */   nop
/* 12DBE4 0022DAE4 0400A490 */  lbu        $4, 0x4($5)
/* 12DBE8 0022DAE8 01000230 */  andi       $2, $0, 0x1
/* 12DBEC 0022DAEC 80180200 */  sll        $3, $2, 2
/* 12DBF0 0022DAF0 FBFF0224 */  addiu      $2, $0, -0x5
/* 12DBF4 0022DAF4 24108200 */  and        $2, $4, $2
/* 12DBF8 0022DAF8 25104300 */  or         $2, $2, $3
/* 12DBFC 0022DAFC 0400A2A0 */  sb         $2, 0x4($5)
/* 12DC00 0022DB00 6001A427 */  addiu      $4, $sp, 0x160
/* 12DC04 0022DB04 008C82DF */  ld         $2, -0x7400($gp)
/* 12DC08 0022DB08 000082FC */  sd         $2, 0x0($4)
/* 12DC0C 0022DB0C 6101A593 */  lbu        $5, 0x161($sp)
/* 12DC10 0022DB10 80000364 */  daddiu     $3, $0, 0x80
/* 12DC14 0022DB14 7FFF0224 */  addiu      $2, $0, -0x81
/* 12DC18 0022DB18 2410A200 */  and        $2, $5, $2
/* 12DC1C 0022DB1C 25104300 */  or         $2, $2, $3
/* 12DC20 0022DB20 6101A2A3 */  sb         $2, 0x161($sp)
/* 12DC24 0022DB24 80000224 */  addiu      $2, $0, 0x80
/* 12DC28 0022DB28 6001A2A3 */  sb         $2, 0x160($sp)
/* 12DC2C 0022DB2C 18BC040C */  jal        MGSetGsTEXA__FP9sceGsTexa
/* 12DC30 0022DB30 00000000 */   nop
/* 12DC34 0022DB34 40000224 */  addiu      $2, $0, 0x40
/* 12DC38 0022DB38 6E01A2A3 */  sb         $2, 0x16E($sp)
/* 12DC3C 0022DB3C 6D01A2A3 */  sb         $2, 0x16D($sp)
/* 12DC40 0022DB40 6C01A2A3 */  sb         $2, 0x16C($sp)
/* 12DC44 0022DB44 6A01A2A3 */  sb         $2, 0x16A($sp)
/* 12DC48 0022DB48 6901A2A3 */  sb         $2, 0x169($sp)
/* 12DC4C 0022DB4C 6801A2A3 */  sb         $2, 0x168($sp)
/* 12DC50 0022DB50 1C006012 */  beqz       $19, .L0022DBC4
/* 12DC54 0022DB54 00000000 */   nop
/* 12DC58 0022DB58 80000224 */  addiu      $2, $0, 0x80
/* 12DC5C 0022DB5C 6F01A2A3 */  sb         $2, 0x16F($sp)
/* 12DC60 0022DB60 6B01A2A3 */  sb         $2, 0x16B($sp)
/* 12DC64 0022DB64 F000A0AF */  sw         $0, 0xF0($sp)
/* 12DC68 0022DB68 F400A0AF */  sw         $0, 0xF4($sp)
/* 12DC6C 0022DB6C F800B4AF */  sw         $20, 0xF8($sp)
/* 12DC70 0022DB70 BF010224 */  addiu      $2, $0, 0x1BF
/* 12DC74 0022DB74 FC00A2AF */  sw         $2, 0xFC($sp)
/* 12DC78 0022DB78 E000A0AF */  sw         $0, 0xE0($sp)
/* 12DC7C 0022DB7C E400A0AF */  sw         $0, 0xE4($sp)
/* 12DC80 0022DB80 E800B4AF */  sw         $20, 0xE8($sp)
/* 12DC84 0022DB84 C0010224 */  addiu      $2, $0, 0x1C0
/* 12DC88 0022DB88 EC00A2AF */  sw         $2, 0xEC($sp)
/* 12DC8C 0022DB8C A0B8040C */  jal        GetVif1Packet__Fv
/* 12DC90 0022DB90 00000000 */   nop
/* 12DC94 0022DB94 01000324 */  addiu      $3, $0, 0x1
/* 12DC98 0022DB98 0000A3FF */  sd         $3, 0x0($sp)
/* 12DC9C 0022DB9C 28264070 */  paddub     $4, $2, $0
/* 12DCA0 0022DBA0 9000A527 */  addiu      $5, $sp, 0x90
/* 12DCA4 0022DBA4 E000A627 */  addiu      $6, $sp, 0xE0
/* 12DCA8 0022DBA8 F000A727 */  addiu      $7, $sp, 0xF0
/* 12DCAC 0022DBAC 6801A827 */  addiu      $8, $sp, 0x168
/* 12DCB0 0022DBB0 6C01A927 */  addiu      $9, $sp, 0x16C
/* 12DCB4 0022DBB4 28560071 */  paddub     $10, $8, $0
/* 12DCB8 0022DBB8 285E2071 */  paddub     $11, $9, $0
/* 12DCBC 0022DBBC 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 12DCC0 0022DBC0 00000000 */   nop
.L0022DBC4:
/* 12DCC4 0022DBC4 80000224 */  addiu      $2, $0, 0x80
/* 12DCC8 0022DBC8 6B01B627 */  addiu      $22, $sp, 0x16B
/* 12DCCC 0022DBCC 0000C2A2 */  sb         $2, 0x0($22)
/* 12DCD0 0022DBD0 6F01B527 */  addiu      $21, $sp, 0x16F
/* 12DCD4 0022DBD4 0000A0A2 */  sb         $0, 0x0($21)
/* 12DCD8 0022DBD8 01000224 */  addiu      $2, $0, 0x1
/* 12DCDC 0022DBDC 03000216 */  bne        $16, $2, .L0022DBEC
/* 12DCE0 0022DBE0 00000000 */   nop
/* 12DCE4 0022DBE4 40000224 */  addiu      $2, $0, 0x40
/* 12DCE8 0022DBE8 0000A2A2 */  sb         $2, 0x0($21)
.L0022DBEC:
/* 12DCEC 0022DBEC 1001B4AF */  sw         $20, 0x110($sp)
/* 12DCF0 0022DBF0 1401A0AF */  sw         $0, 0x114($sp)
/* 12DCF4 0022DBF4 1801B3AF */  sw         $19, 0x118($sp)
/* 12DCF8 0022DBF8 BF010224 */  addiu      $2, $0, 0x1BF
/* 12DCFC 0022DBFC 1C01A2AF */  sw         $2, 0x11C($sp)
/* 12DD00 0022DC00 0001B4AF */  sw         $20, 0x100($sp)
/* 12DD04 0022DC04 0401A0AF */  sw         $0, 0x104($sp)
/* 12DD08 0022DC08 0801B3AF */  sw         $19, 0x108($sp)
/* 12DD0C 0022DC0C C0010224 */  addiu      $2, $0, 0x1C0
/* 12DD10 0022DC10 0C01A2AF */  sw         $2, 0x10C($sp)
/* 12DD14 0022DC14 A0B8040C */  jal        GetVif1Packet__Fv
/* 12DD18 0022DC18 00000000 */   nop
/* 12DD1C 0022DC1C 01000324 */  addiu      $3, $0, 0x1
/* 12DD20 0022DC20 0000A3FF */  sd         $3, 0x0($sp)
/* 12DD24 0022DC24 28264070 */  paddub     $4, $2, $0
/* 12DD28 0022DC28 9000A527 */  addiu      $5, $sp, 0x90
/* 12DD2C 0022DC2C 0001A627 */  addiu      $6, $sp, 0x100
/* 12DD30 0022DC30 1001A727 */  addiu      $7, $sp, 0x110
/* 12DD34 0022DC34 6801A827 */  addiu      $8, $sp, 0x168
/* 12DD38 0022DC38 6C01A927 */  addiu      $9, $sp, 0x16C
/* 12DD3C 0022DC3C 28560071 */  paddub     $10, $8, $0
/* 12DD40 0022DC40 285E2071 */  paddub     $11, $9, $0
/* 12DD44 0022DC44 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 12DD48 0022DC48 00000000 */   nop
/* 12DD4C 0022DC4C 0000C0A2 */  sb         $0, 0x0($22)
/* 12DD50 0022DC50 80000224 */  addiu      $2, $0, 0x80
/* 12DD54 0022DC54 0000A2A2 */  sb         $2, 0x0($21)
/* 12DD58 0022DC58 01000224 */  addiu      $2, $0, 0x1
/* 12DD5C 0022DC5C 03000216 */  bne        $16, $2, .L0022DC6C
/* 12DD60 0022DC60 00000000 */   nop
/* 12DD64 0022DC64 40000224 */  addiu      $2, $0, 0x40
/* 12DD68 0022DC68 0000C2A2 */  sb         $2, 0x0($22)
.L0022DC6C:
/* 12DD6C 0022DC6C 3001B2AF */  sw         $18, 0x130($sp)
/* 12DD70 0022DC70 3401A0AF */  sw         $0, 0x134($sp)
/* 12DD74 0022DC74 3801B1AF */  sw         $17, 0x138($sp)
/* 12DD78 0022DC78 BF010224 */  addiu      $2, $0, 0x1BF
/* 12DD7C 0022DC7C 3C01A2AF */  sw         $2, 0x13C($sp)
/* 12DD80 0022DC80 2001B2AF */  sw         $18, 0x120($sp)
/* 12DD84 0022DC84 2401A0AF */  sw         $0, 0x124($sp)
/* 12DD88 0022DC88 2801B1AF */  sw         $17, 0x128($sp)
/* 12DD8C 0022DC8C C0010224 */  addiu      $2, $0, 0x1C0
/* 12DD90 0022DC90 2C01A2AF */  sw         $2, 0x12C($sp)
/* 12DD94 0022DC94 A0B8040C */  jal        GetVif1Packet__Fv
/* 12DD98 0022DC98 00000000 */   nop
/* 12DD9C 0022DC9C 01000324 */  addiu      $3, $0, 0x1
/* 12DDA0 0022DCA0 0000A3FF */  sd         $3, 0x0($sp)
/* 12DDA4 0022DCA4 28264070 */  paddub     $4, $2, $0
/* 12DDA8 0022DCA8 9000A527 */  addiu      $5, $sp, 0x90
/* 12DDAC 0022DCAC 2001A627 */  addiu      $6, $sp, 0x120
/* 12DDB0 0022DCB0 3001A727 */  addiu      $7, $sp, 0x130
/* 12DDB4 0022DCB4 6801A827 */  addiu      $8, $sp, 0x168
/* 12DDB8 0022DCB8 6C01A927 */  addiu      $9, $sp, 0x16C
/* 12DDBC 0022DCBC 28560071 */  paddub     $10, $8, $0
/* 12DDC0 0022DCC0 285E2071 */  paddub     $11, $9, $0
/* 12DDC4 0022DCC4 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 12DDC8 0022DCC8 00000000 */   nop
/* 12DDCC 0022DCCC 20002012 */  beqz       $17, .L0022DD50
/* 12DDD0 0022DCD0 00000000 */   nop
/* 12DDD4 0022DCD4 80000224 */  addiu      $2, $0, 0x80
/* 12DDD8 0022DCD8 0000A2A2 */  sb         $2, 0x0($21)
/* 12DDDC 0022DCDC 0000C2A2 */  sb         $2, 0x0($22)
/* 12DDE0 0022DCE0 21185102 */  addu       $3, $18, $17
/* 12DDE4 0022DCE4 5001A3AF */  sw         $3, 0x150($sp)
/* 12DDE8 0022DCE8 5401A0AF */  sw         $0, 0x154($sp)
/* 12DDEC 0022DCEC 80020224 */  addiu      $2, $0, 0x280
/* 12DDF0 0022DCF0 23105200 */  subu       $2, $2, $18
/* 12DDF4 0022DCF4 23205100 */  subu       $4, $2, $17
/* 12DDF8 0022DCF8 5801A4AF */  sw         $4, 0x158($sp)
/* 12DDFC 0022DCFC BF010224 */  addiu      $2, $0, 0x1BF
/* 12DE00 0022DD00 5C01A2AF */  sw         $2, 0x15C($sp)
/* 12DE04 0022DD04 4001A3AF */  sw         $3, 0x140($sp)
/* 12DE08 0022DD08 4401A0AF */  sw         $0, 0x144($sp)
/* 12DE0C 0022DD0C 4801A4AF */  sw         $4, 0x148($sp)
/* 12DE10 0022DD10 C0010224 */  addiu      $2, $0, 0x1C0
/* 12DE14 0022DD14 4C01A2AF */  sw         $2, 0x14C($sp)
/* 12DE18 0022DD18 A0B8040C */  jal        GetVif1Packet__Fv
/* 12DE1C 0022DD1C 00000000 */   nop
/* 12DE20 0022DD20 01000324 */  addiu      $3, $0, 0x1
/* 12DE24 0022DD24 0000A3FF */  sd         $3, 0x0($sp)
/* 12DE28 0022DD28 28264070 */  paddub     $4, $2, $0
/* 12DE2C 0022DD2C 9000A527 */  addiu      $5, $sp, 0x90
/* 12DE30 0022DD30 4001A627 */  addiu      $6, $sp, 0x140
/* 12DE34 0022DD34 5001A727 */  addiu      $7, $sp, 0x150
/* 12DE38 0022DD38 6801A827 */  addiu      $8, $sp, 0x168
/* 12DE3C 0022DD3C 6C01A927 */  addiu      $9, $sp, 0x16C
/* 12DE40 0022DD40 28560071 */  paddub     $10, $8, $0
/* 12DE44 0022DD44 285E2071 */  paddub     $11, $9, $0
/* 12DE48 0022DD48 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 12DE4C 0022DD4C 00000000 */   nop
.L0022DD50:
/* 12DE50 0022DD50 28260070 */  paddub     $4, $0, $0
/* 12DE54 0022DD54 18BC040C */  jal        MGSetGsTEXA__FP9sceGsTexa
/* 12DE58 0022DD58 00000000 */   nop
.L0022DD5C:
/* 12DE5C 0022DD5C 8000BF7B */  lq         $31, 0x80($sp)
/* 12DE60 0022DD60 7000B67B */  lq         $22, 0x70($sp)
/* 12DE64 0022DD64 6000B57B */  lq         $21, 0x60($sp)
/* 12DE68 0022DD68 5000B47B */  lq         $20, 0x50($sp)
/* 12DE6C 0022DD6C 4000B37B */  lq         $19, 0x40($sp)
/* 12DE70 0022DD70 3000B27B */  lq         $18, 0x30($sp)
/* 12DE74 0022DD74 2000B17B */  lq         $17, 0x20($sp)
/* 12DE78 0022DD78 1000B07B */  lq         $16, 0x10($sp)
/* 12DE7C 0022DD7C 7001BD27 */  addiu      $sp, $sp, 0x170
/* 12DE80 0022DD80 0800E003 */  jr         $31
/* 12DE84 0022DD84 00000000 */   nop
/* 12DE88 0022DD88 00000000 */  nop
/* 12DE8C 0022DD8C 00000000 */  nop
