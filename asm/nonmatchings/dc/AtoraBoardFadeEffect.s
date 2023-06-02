.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AtoraBoardFadeEffect__Fv
/* 11D990 0021D890 A0FEBD27 */  addiu      $sp, $sp, -0x160
/* 11D994 0021D894 3000BF7F */  sq         $31, 0x30($sp)
/* 11D998 0021D898 2000B17F */  sq         $17, 0x20($sp)
/* 11D99C 0021D89C 1000B07F */  sq         $16, 0x10($sp)
/* 11D9A0 0021D8A0 C701023C */  lui        $2, %hi(TexManager)
/* 11D9A4 0021D8A4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11D9A8 0021D8A8 2A00023C */  lui        $2, %hi(_1502)
/* 11D9AC 0021D8AC 68EA4524 */  addiu      $5, $2, %lo(_1502)
/* 11D9B0 0021D8B0 FFFF0624 */  addiu      $6, $0, -0x1
/* 11D9B4 0021D8B4 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 11D9B8 0021D8B8 00000000 */   nop
/* 11D9BC 0021D8BC 00004384 */  lh         $3, 0x0($2)
/* 11D9C0 0021D8C0 4000A3A7 */  sh         $3, 0x40($sp)
/* 11D9C4 0021D8C4 02004384 */  lh         $3, 0x2($2)
/* 11D9C8 0021D8C8 4200A3A7 */  sh         $3, 0x42($sp)
/* 11D9CC 0021D8CC 04004384 */  lh         $3, 0x4($2)
/* 11D9D0 0021D8D0 4400A3A7 */  sh         $3, 0x44($sp)
/* 11D9D4 0021D8D4 06004384 */  lh         $3, 0x6($2)
/* 11D9D8 0021D8D8 4600A3A7 */  sh         $3, 0x46($sp)
/* 11D9DC 0021D8DC 08004724 */  addiu      $7, $2, 0x8
/* 11D9E0 0021D8E0 4800A627 */  addiu      $6, $sp, 0x48
/* 11D9E4 0021D8E4 04000524 */  addiu      $5, $0, 0x4
.L0021D8E8:
/* 11D9E8 0021D8E8 0000E48C */  lw         $4, 0x0($7)
/* 11D9EC 0021D8EC 0400E38C */  lw         $3, 0x4($7)
/* 11D9F0 0021D8F0 0800E724 */  addiu      $7, $7, 0x8
/* 11D9F4 0021D8F4 FFFFA524 */  addiu      $5, $5, -0x1
/* 11D9F8 0021D8F8 0000C4AC */  sw         $4, 0x0($6)
/* 11D9FC 0021D8FC 0400C3AC */  sw         $3, 0x4($6)
/* 11DA00 0021D900 0800C624 */  addiu      $6, $6, 0x8
/* 11DA04 0021D904 F8FFA01C */  bgtz       $5, .L0021D8E8
/* 11DA08 0021D908 00000000 */   nop
/* 11DA0C 0021D90C 280043DC */  ld         $3, 0x28($2)
/* 11DA10 0021D910 6800A527 */  addiu      $5, $sp, 0x68
/* 11DA14 0021D914 0000A3FC */  sd         $3, 0x0($5)
/* 11DA18 0021D918 300043DC */  ld         $3, 0x30($2)
/* 11DA1C 0021D91C 7000A3FF */  sd         $3, 0x70($sp)
/* 11DA20 0021D920 7800A327 */  addiu      $3, $sp, 0x78
/* 11DA24 0021D924 380043C4 */  lwc1       $f3, 0x38($2)
/* 11DA28 0021D928 3C0042C4 */  lwc1       $f2, 0x3C($2)
/* 11DA2C 0021D92C 400041C4 */  lwc1       $f1, 0x40($2)
/* 11DA30 0021D930 440040C4 */  lwc1       $f0, 0x44($2)
/* 11DA34 0021D934 000063E4 */  swc1       $f3, 0x0($3)
/* 11DA38 0021D938 040062E4 */  swc1       $f2, 0x4($3)
/* 11DA3C 0021D93C 080061E4 */  swc1       $f1, 0x8($3)
/* 11DA40 0021D940 0C0060E4 */  swc1       $f0, 0xC($3)
/* 11DA44 0021D944 4800438C */  lw         $3, 0x48($2)
/* 11DA48 0021D948 8800A3AF */  sw         $3, 0x88($sp)
/* 11DA4C 0021D94C 4C00438C */  lw         $3, 0x4C($2)
/* 11DA50 0021D950 8C00A3AF */  sw         $3, 0x8C($sp)
/* 11DA54 0021D954 4000A327 */  addiu      $3, $sp, 0x40
/* 11DA58 0021D958 B9006010 */  beqz       $3, .L0021DC40
/* 11DA5C 0021D95C 00000000 */   nop
/* 11DA60 0021D960 0400A490 */  lbu        $4, 0x4($5)
/* 11DA64 0021D964 01000230 */  andi       $2, $0, 0x1
/* 11DA68 0021D968 80180200 */  sll        $3, $2, 2
/* 11DA6C 0021D96C FBFF0224 */  addiu      $2, $0, -0x5
/* 11DA70 0021D970 24108200 */  and        $2, $4, $2
/* 11DA74 0021D974 25104300 */  or         $2, $2, $3
/* 11DA78 0021D978 0400A2A0 */  sb         $2, 0x4($5)
/* 11DA7C 0021D97C 5001A427 */  addiu      $4, $sp, 0x150
/* 11DA80 0021D980 008C82DF */  ld         $2, -0x7400($gp)
/* 11DA84 0021D984 000082FC */  sd         $2, 0x0($4)
/* 11DA88 0021D988 5101A593 */  lbu        $5, 0x151($sp)
/* 11DA8C 0021D98C 80000364 */  daddiu     $3, $0, 0x80
/* 11DA90 0021D990 7FFF0224 */  addiu      $2, $0, -0x81
/* 11DA94 0021D994 2410A200 */  and        $2, $5, $2
/* 11DA98 0021D998 25104300 */  or         $2, $2, $3
/* 11DA9C 0021D99C 5101A2A3 */  sb         $2, 0x151($sp)
/* 11DAA0 0021D9A0 80000224 */  addiu      $2, $0, 0x80
/* 11DAA4 0021D9A4 5001A2A3 */  sb         $2, 0x150($sp)
/* 11DAA8 0021D9A8 18BC040C */  jal        MGSetGsTEXA__FP9sceGsTexa
/* 11DAAC 0021D9AC 00000000 */   nop
/* 11DAB0 0021D9B0 40000224 */  addiu      $2, $0, 0x40
/* 11DAB4 0021D9B4 5E01A2A3 */  sb         $2, 0x15E($sp)
/* 11DAB8 0021D9B8 5D01A2A3 */  sb         $2, 0x15D($sp)
/* 11DABC 0021D9BC 5C01A2A3 */  sb         $2, 0x15C($sp)
/* 11DAC0 0021D9C0 5A01A2A3 */  sb         $2, 0x15A($sp)
/* 11DAC4 0021D9C4 5901A2A3 */  sb         $2, 0x159($sp)
/* 11DAC8 0021D9C8 5801A2A3 */  sb         $2, 0x158($sp)
/* 11DACC 0021D9CC 80000224 */  addiu      $2, $0, 0x80
/* 11DAD0 0021D9D0 5F01B127 */  addiu      $17, $sp, 0x15F
/* 11DAD4 0021D9D4 000022A2 */  sb         $2, 0x0($17)
/* 11DAD8 0021D9D8 5B01B027 */  addiu      $16, $sp, 0x15B
/* 11DADC 0021D9DC 000002A2 */  sb         $2, 0x0($16)
/* 11DAE0 0021D9E0 A000A0AF */  sw         $0, 0xA0($sp)
/* 11DAE4 0021D9E4 A400A0AF */  sw         $0, 0xA4($sp)
/* 11DAE8 0021D9E8 40010324 */  addiu      $3, $0, 0x140
/* 11DAEC 0021D9EC A800A3AF */  sw         $3, 0xA8($sp)
/* 11DAF0 0021D9F0 01000224 */  addiu      $2, $0, 0x1
/* 11DAF4 0021D9F4 AC00A2AF */  sw         $2, 0xAC($sp)
/* 11DAF8 0021D9F8 9000A0AF */  sw         $0, 0x90($sp)
/* 11DAFC 0021D9FC 9400A0AF */  sw         $0, 0x94($sp)
/* 11DB00 0021DA00 9800A3AF */  sw         $3, 0x98($sp)
/* 11DB04 0021DA04 9C00A2AF */  sw         $2, 0x9C($sp)
/* 11DB08 0021DA08 0000A2FF */  sd         $2, 0x0($sp)
/* 11DB0C 0021DA0C D48B848F */  lw         $4, -0x742C($gp)
/* 11DB10 0021DA10 4000A527 */  addiu      $5, $sp, 0x40
/* 11DB14 0021DA14 9000A627 */  addiu      $6, $sp, 0x90
/* 11DB18 0021DA18 A000A727 */  addiu      $7, $sp, 0xA0
/* 11DB1C 0021DA1C 5801A827 */  addiu      $8, $sp, 0x158
/* 11DB20 0021DA20 284E0071 */  paddub     $9, $8, $0
/* 11DB24 0021DA24 5C01AA27 */  addiu      $10, $sp, 0x15C
/* 11DB28 0021DA28 285E4071 */  paddub     $11, $10, $0
/* 11DB2C 0021DA2C 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 11DB30 0021DA30 00000000 */   nop
/* 11DB34 0021DA34 C000A0AF */  sw         $0, 0xC0($sp)
/* 11DB38 0021DA38 C400A0AF */  sw         $0, 0xC4($sp)
/* 11DB3C 0021DA3C 40010424 */  addiu      $4, $0, 0x140
/* 11DB40 0021DA40 C800A4AF */  sw         $4, 0xC8($sp)
/* 11DB44 0021DA44 3D000224 */  addiu      $2, $0, 0x3D
/* 11DB48 0021DA48 CC00A2AF */  sw         $2, 0xCC($sp)
/* 11DB4C 0021DA4C B000A0AF */  sw         $0, 0xB0($sp)
/* 11DB50 0021DA50 01000324 */  addiu      $3, $0, 0x1
/* 11DB54 0021DA54 B400A3AF */  sw         $3, 0xB4($sp)
/* 11DB58 0021DA58 B800A4AF */  sw         $4, 0xB8($sp)
/* 11DB5C 0021DA5C 3C000224 */  addiu      $2, $0, 0x3C
/* 11DB60 0021DA60 BC00A2AF */  sw         $2, 0xBC($sp)
/* 11DB64 0021DA64 0000A3FF */  sd         $3, 0x0($sp)
/* 11DB68 0021DA68 D48B848F */  lw         $4, -0x742C($gp)
/* 11DB6C 0021DA6C 4000A527 */  addiu      $5, $sp, 0x40
/* 11DB70 0021DA70 B000A627 */  addiu      $6, $sp, 0xB0
/* 11DB74 0021DA74 C000A727 */  addiu      $7, $sp, 0xC0
/* 11DB78 0021DA78 5801A827 */  addiu      $8, $sp, 0x158
/* 11DB7C 0021DA7C 284E0071 */  paddub     $9, $8, $0
/* 11DB80 0021DA80 5C01AA27 */  addiu      $10, $sp, 0x15C
/* 11DB84 0021DA84 285E4071 */  paddub     $11, $10, $0
/* 11DB88 0021DA88 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 11DB8C 0021DA8C 00000000 */   nop
/* 11DB90 0021DA90 80000224 */  addiu      $2, $0, 0x80
/* 11DB94 0021DA94 000002A2 */  sb         $2, 0x0($16)
/* 11DB98 0021DA98 000020A2 */  sb         $0, 0x0($17)
/* 11DB9C 0021DA9C E000A0AF */  sw         $0, 0xE0($sp)
/* 11DBA0 0021DAA0 3C000224 */  addiu      $2, $0, 0x3C
/* 11DBA4 0021DAA4 E400A2AF */  sw         $2, 0xE4($sp)
/* 11DBA8 0021DAA8 40010324 */  addiu      $3, $0, 0x140
/* 11DBAC 0021DAAC E800A3AF */  sw         $3, 0xE8($sp)
/* 11DBB0 0021DAB0 EC00A2AF */  sw         $2, 0xEC($sp)
/* 11DBB4 0021DAB4 D000A0AF */  sw         $0, 0xD0($sp)
/* 11DBB8 0021DAB8 3D000224 */  addiu      $2, $0, 0x3D
/* 11DBBC 0021DABC D400A2AF */  sw         $2, 0xD4($sp)
/* 11DBC0 0021DAC0 D800A3AF */  sw         $3, 0xD8($sp)
/* 11DBC4 0021DAC4 3B000224 */  addiu      $2, $0, 0x3B
/* 11DBC8 0021DAC8 DC00A2AF */  sw         $2, 0xDC($sp)
/* 11DBCC 0021DACC 01000224 */  addiu      $2, $0, 0x1
/* 11DBD0 0021DAD0 0000A2FF */  sd         $2, 0x0($sp)
/* 11DBD4 0021DAD4 D48B848F */  lw         $4, -0x742C($gp)
/* 11DBD8 0021DAD8 4000A527 */  addiu      $5, $sp, 0x40
/* 11DBDC 0021DADC D000A627 */  addiu      $6, $sp, 0xD0
/* 11DBE0 0021DAE0 E000A727 */  addiu      $7, $sp, 0xE0
/* 11DBE4 0021DAE4 5801A827 */  addiu      $8, $sp, 0x158
/* 11DBE8 0021DAE8 284E0071 */  paddub     $9, $8, $0
/* 11DBEC 0021DAEC 5C01AA27 */  addiu      $10, $sp, 0x15C
/* 11DBF0 0021DAF0 285E4071 */  paddub     $11, $10, $0
/* 11DBF4 0021DAF4 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 11DBF8 0021DAF8 00000000 */   nop
/* 11DBFC 0021DAFC 000000A2 */  sb         $0, 0x0($16)
/* 11DC00 0021DB00 80000224 */  addiu      $2, $0, 0x80
/* 11DC04 0021DB04 000022A2 */  sb         $2, 0x0($17)
/* 11DC08 0021DB08 0001A0AF */  sw         $0, 0x100($sp)
/* 11DC0C 0021DB0C 14010224 */  addiu      $2, $0, 0x114
/* 11DC10 0021DB10 0401A2AF */  sw         $2, 0x104($sp)
/* 11DC14 0021DB14 40010324 */  addiu      $3, $0, 0x140
/* 11DC18 0021DB18 0801A3AF */  sw         $3, 0x108($sp)
/* 11DC1C 0021DB1C 5A000224 */  addiu      $2, $0, 0x5A
/* 11DC20 0021DB20 0C01A2AF */  sw         $2, 0x10C($sp)
/* 11DC24 0021DB24 F000A0AF */  sw         $0, 0xF0($sp)
/* 11DC28 0021DB28 15010224 */  addiu      $2, $0, 0x115
/* 11DC2C 0021DB2C F400A2AF */  sw         $2, 0xF4($sp)
/* 11DC30 0021DB30 F800A3AF */  sw         $3, 0xF8($sp)
/* 11DC34 0021DB34 59000224 */  addiu      $2, $0, 0x59
/* 11DC38 0021DB38 FC00A2AF */  sw         $2, 0xFC($sp)
/* 11DC3C 0021DB3C 01000224 */  addiu      $2, $0, 0x1
/* 11DC40 0021DB40 0000A2FF */  sd         $2, 0x0($sp)
/* 11DC44 0021DB44 D48B848F */  lw         $4, -0x742C($gp)
/* 11DC48 0021DB48 4000A527 */  addiu      $5, $sp, 0x40
/* 11DC4C 0021DB4C F000A627 */  addiu      $6, $sp, 0xF0
/* 11DC50 0021DB50 0001A727 */  addiu      $7, $sp, 0x100
/* 11DC54 0021DB54 5801A827 */  addiu      $8, $sp, 0x158
/* 11DC58 0021DB58 284E0071 */  paddub     $9, $8, $0
/* 11DC5C 0021DB5C 5C01AA27 */  addiu      $10, $sp, 0x15C
/* 11DC60 0021DB60 285E4071 */  paddub     $11, $10, $0
/* 11DC64 0021DB64 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 11DC68 0021DB68 00000000 */   nop
/* 11DC6C 0021DB6C 80000224 */  addiu      $2, $0, 0x80
/* 11DC70 0021DB70 000022A2 */  sb         $2, 0x0($17)
/* 11DC74 0021DB74 000002A2 */  sb         $2, 0x0($16)
/* 11DC78 0021DB78 2001A0AF */  sw         $0, 0x120($sp)
/* 11DC7C 0021DB7C 6E010424 */  addiu      $4, $0, 0x16E
/* 11DC80 0021DB80 2401A4AF */  sw         $4, 0x124($sp)
/* 11DC84 0021DB84 40010324 */  addiu      $3, $0, 0x140
/* 11DC88 0021DB88 2801A3AF */  sw         $3, 0x128($sp)
/* 11DC8C 0021DB8C 01000224 */  addiu      $2, $0, 0x1
/* 11DC90 0021DB90 2C01A2AF */  sw         $2, 0x12C($sp)
/* 11DC94 0021DB94 1001A0AF */  sw         $0, 0x110($sp)
/* 11DC98 0021DB98 1401A4AF */  sw         $4, 0x114($sp)
/* 11DC9C 0021DB9C 1801A3AF */  sw         $3, 0x118($sp)
/* 11DCA0 0021DBA0 1C01A2AF */  sw         $2, 0x11C($sp)
/* 11DCA4 0021DBA4 0000A2FF */  sd         $2, 0x0($sp)
/* 11DCA8 0021DBA8 D48B848F */  lw         $4, -0x742C($gp)
/* 11DCAC 0021DBAC 4000A527 */  addiu      $5, $sp, 0x40
/* 11DCB0 0021DBB0 1001A627 */  addiu      $6, $sp, 0x110
/* 11DCB4 0021DBB4 2001A727 */  addiu      $7, $sp, 0x120
/* 11DCB8 0021DBB8 5801A827 */  addiu      $8, $sp, 0x158
/* 11DCBC 0021DBBC 284E0071 */  paddub     $9, $8, $0
/* 11DCC0 0021DBC0 5C01AA27 */  addiu      $10, $sp, 0x15C
/* 11DCC4 0021DBC4 285E4071 */  paddub     $11, $10, $0
/* 11DCC8 0021DBC8 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 11DCCC 0021DBCC 00000000 */   nop
/* 11DCD0 0021DBD0 4001A0AF */  sw         $0, 0x140($sp)
/* 11DCD4 0021DBD4 6E010224 */  addiu      $2, $0, 0x16E
/* 11DCD8 0021DBD8 4401A2AF */  sw         $2, 0x144($sp)
/* 11DCDC 0021DBDC 40010324 */  addiu      $3, $0, 0x140
/* 11DCE0 0021DBE0 4801A3AF */  sw         $3, 0x148($sp)
/* 11DCE4 0021DBE4 52000224 */  addiu      $2, $0, 0x52
/* 11DCE8 0021DBE8 4C01A2AF */  sw         $2, 0x14C($sp)
/* 11DCEC 0021DBEC 3001A0AF */  sw         $0, 0x130($sp)
/* 11DCF0 0021DBF0 6F010224 */  addiu      $2, $0, 0x16F
/* 11DCF4 0021DBF4 3401A2AF */  sw         $2, 0x134($sp)
/* 11DCF8 0021DBF8 3801A3AF */  sw         $3, 0x138($sp)
/* 11DCFC 0021DBFC 51000224 */  addiu      $2, $0, 0x51
/* 11DD00 0021DC00 3C01A2AF */  sw         $2, 0x13C($sp)
/* 11DD04 0021DC04 01000224 */  addiu      $2, $0, 0x1
/* 11DD08 0021DC08 0000A2FF */  sd         $2, 0x0($sp)
/* 11DD0C 0021DC0C D48B848F */  lw         $4, -0x742C($gp)
/* 11DD10 0021DC10 4000A527 */  addiu      $5, $sp, 0x40
/* 11DD14 0021DC14 3001A627 */  addiu      $6, $sp, 0x130
/* 11DD18 0021DC18 4001A727 */  addiu      $7, $sp, 0x140
/* 11DD1C 0021DC1C 5801A827 */  addiu      $8, $sp, 0x158
/* 11DD20 0021DC20 284E0071 */  paddub     $9, $8, $0
/* 11DD24 0021DC24 5C01AA27 */  addiu      $10, $sp, 0x15C
/* 11DD28 0021DC28 285E4071 */  paddub     $11, $10, $0
/* 11DD2C 0021DC2C 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 11DD30 0021DC30 00000000 */   nop
/* 11DD34 0021DC34 28260070 */  paddub     $4, $0, $0
/* 11DD38 0021DC38 18BC040C */  jal        MGSetGsTEXA__FP9sceGsTexa
/* 11DD3C 0021DC3C 00000000 */   nop
.L0021DC40:
/* 11DD40 0021DC40 3000BF7B */  lq         $31, 0x30($sp)
/* 11DD44 0021DC44 2000B17B */  lq         $17, 0x20($sp)
/* 11DD48 0021DC48 1000B07B */  lq         $16, 0x10($sp)
/* 11DD4C 0021DC4C 6001BD27 */  addiu      $sp, $sp, 0x160
/* 11DD50 0021DC50 0800E003 */  jr         $31
/* 11DD54 0021DC54 00000000 */   nop
/* 11DD58 0021DC58 00000000 */  nop
/* 11DD5C 0021DC5C 00000000 */  nop
