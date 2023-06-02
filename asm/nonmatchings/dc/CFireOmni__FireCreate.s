.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FireCreate__9CFireOmniFv
/* 618C0 001617C0 20FFBD27 */  addiu      $sp, $sp, -0xE0
/* 618C4 001617C4 4000BF7F */  sq         $31, 0x40($sp)
/* 618C8 001617C8 3000B27F */  sq         $18, 0x30($sp)
/* 618CC 001617CC 2000B17F */  sq         $17, 0x20($sp)
/* 618D0 001617D0 1000B07F */  sq         $16, 0x10($sp)
/* 618D4 001617D4 28968070 */  paddub     $18, $4, $0
/* 618D8 001617D8 C701023C */  lui        $2, %hi(TexManager)
/* 618DC 001617DC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 618E0 001617E0 2A00023C */  lui        $2, %hi(_259_2)
/* 618E4 001617E4 C0A04524 */  addiu      $5, $2, %lo(_259_2)
/* 618E8 001617E8 FFFF0624 */  addiu      $6, $0, -0x1
/* 618EC 001617EC B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 618F0 001617F0 00000000 */   nop
/* 618F4 001617F4 A1004010 */  beqz       $2, .L00161A7C
/* 618F8 001617F8 00000000 */   nop
/* 618FC 001617FC 06004384 */  lh         $3, 0x6($2)
/* 61900 00161800 01000224 */  addiu      $2, $0, 0x1
/* 61904 00161804 54006214 */  bne        $3, $2, .L00161958
/* 61908 00161808 00000000 */   nop
/* 6190C 0016180C 0C004CC6 */  lwc1       $f12, 0xC($18)
/* 61910 00161810 2C44040C */  jal        fptosi
/* 61914 00161814 00000000 */   nop
/* 61918 00161818 03005030 */  andi       $16, $2, 0x3
/* 6191C 0016181C 04004104 */  bgez       $2, .L00161830
/* 61920 00161820 00000000 */   nop
/* 61924 00161824 02000012 */  beqz       $16, .L00161830
/* 61928 00161828 00000000 */   nop
/* 6192C 0016182C FCFF1026 */  addiu      $16, $16, -0x4
.L00161830:
/* 61930 00161830 83880200 */  sra        $17, $2, 2
/* 61934 00161834 C701023C */  lui        $2, %hi(TexManager)
/* 61938 00161838 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 6193C 0016183C 2A00023C */  lui        $2, %hi(_260_2)
/* 61940 00161840 C8A04524 */  addiu      $5, $2, %lo(_260_2)
/* 61944 00161844 FFFF0624 */  addiu      $6, $0, -0x1
/* 61948 00161848 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 6194C 0016184C 00000000 */   nop
/* 61950 00161850 D000A327 */  addiu      $3, $sp, 0xD0
/* 61954 00161854 280042DC */  ld         $2, 0x28($2)
/* 61958 00161858 000062FC */  sd         $2, 0x0($3)
/* 6195C 0016185C 80111000 */  sll        $2, $16, 6
/* 61960 00161860 8000A2AF */  sw         $2, 0x80($sp)
/* 61964 00161864 80111100 */  sll        $2, $17, 6
/* 61968 00161868 8400A2AF */  sw         $2, 0x84($sp)
/* 6196C 0016186C 40000224 */  addiu      $2, $0, 0x40
/* 61970 00161870 8800A2AF */  sw         $2, 0x88($sp)
/* 61974 00161874 8C00A2AF */  sw         $2, 0x8C($sp)
/* 61978 00161878 7000A0AF */  sw         $0, 0x70($sp)
/* 6197C 0016187C 7400A0AF */  sw         $0, 0x74($sp)
/* 61980 00161880 80000224 */  addiu      $2, $0, 0x80
/* 61984 00161884 7800A2AF */  sw         $2, 0x78($sp)
/* 61988 00161888 7C00A2AF */  sw         $2, 0x7C($sp)
/* 6198C 0016188C 08004CC6 */  lwc1       $f12, 0x8($18)
/* 61990 00161890 2C44040C */  jal        fptosi
/* 61994 00161894 00000000 */   nop
/* 61998 00161898 6000A0AF */  sw         $0, 0x60($sp)
/* 6199C 0016189C 6400A2AF */  sw         $2, 0x64($sp)
/* 619A0 001618A0 80000324 */  addiu      $3, $0, 0x80
/* 619A4 001618A4 6800A3AF */  sw         $3, 0x68($sp)
/* 619A8 001618A8 40000224 */  addiu      $2, $0, 0x40
/* 619AC 001618AC 6C00A2AF */  sw         $2, 0x6C($sp)
/* 619B0 001618B0 5000A0AF */  sw         $0, 0x50($sp)
/* 619B4 001618B4 5400A0AF */  sw         $0, 0x54($sp)
/* 619B8 001618B8 5800A3AF */  sw         $3, 0x58($sp)
/* 619BC 001618BC 5C00A3AF */  sw         $3, 0x5C($sp)
/* 619C0 001618C0 C701023C */  lui        $2, %hi(TexManager)
/* 619C4 001618C4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 619C8 001618C8 2A00023C */  lui        $2, %hi(_261_2)
/* 619CC 001618CC D0A04524 */  addiu      $5, $2, %lo(_261_2)
/* 619D0 001618D0 FFFF0624 */  addiu      $6, $0, -0x1
/* 619D4 001618D4 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 619D8 001618D8 00000000 */   nop
/* 619DC 001618DC 28864070 */  paddub     $16, $2, $0
/* 619E0 001618E0 C701023C */  lui        $2, %hi(TexManager)
/* 619E4 001618E4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 619E8 001618E8 2A00023C */  lui        $2, %hi(_259_2)
/* 619EC 001618EC C0A04524 */  addiu      $5, $2, %lo(_259_2)
/* 619F0 001618F0 FFFF0624 */  addiu      $6, $0, -0x1
/* 619F4 001618F4 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 619F8 001618F8 00000000 */   nop
/* 619FC 001618FC 7000A327 */  addiu      $3, $sp, 0x70
/* 61A00 00161900 0000A3FF */  sd         $3, 0x0($sp)
/* 61A04 00161904 8000A327 */  addiu      $3, $sp, 0x80
/* 61A08 00161908 0800A3FF */  sd         $3, 0x8($sp)
/* 61A0C 0016190C D000A397 */  lhu        $3, 0xD0($sp)
/* 61A10 00161910 FF3F6530 */  andi       $5, $3, 0x3FFF
/* 61A14 00161914 D000A3DF */  ld         $3, 0xD0($sp)
/* 61A18 00161918 3C1B0300 */  dsll32     $3, $3, 12
/* 61A1C 0016191C BE1E0300 */  dsrl32     $3, $3, 26
/* 61A20 00161920 3C300300 */  dsll32     $6, $3, 0
/* 61A24 00161924 3F300600 */  dsra32     $6, $6, 0
/* 61A28 00161928 D200A397 */  lhu        $3, 0xD2($sp)
/* 61A2C 0016192C BC1D0300 */  dsll32     $3, $3, 22
/* 61A30 00161930 BE3E0300 */  dsrl32     $7, $3, 26
/* 61A34 00161934 D48B848F */  lw         $4, -0x742C($gp)
/* 61A38 00161938 28460072 */  paddub     $8, $16, $0
/* 61A3C 0016193C 5000A927 */  addiu      $9, $sp, 0x50
/* 61A40 00161940 6000AA27 */  addiu      $10, $sp, 0x60
/* 61A44 00161944 285E4070 */  paddub     $11, $2, $0
/* 61A48 00161948 6089050C */  jal        blendTextuer__FP13sceVif1PacketiiiP8CTextureRC8CRect_i_RC8CRect_i_P8CTextureRC8CRect_i_RC8CRect_i_
/* 61A4C 0016194C 00000000 */   nop
/* 61A50 00161950 4A000010 */  b          .L00161A7C
/* 61A54 00161954 00000000 */   nop
.L00161958:
/* 61A58 00161958 C701023C */  lui        $2, %hi(TexManager)
/* 61A5C 0016195C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 61A60 00161960 2A00023C */  lui        $2, %hi(_260_2)
/* 61A64 00161964 C8A04524 */  addiu      $5, $2, %lo(_260_2)
/* 61A68 00161968 FFFF0624 */  addiu      $6, $0, -0x1
/* 61A6C 0016196C B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 61A70 00161970 00000000 */   nop
/* 61A74 00161974 D800A327 */  addiu      $3, $sp, 0xD8
/* 61A78 00161978 280042DC */  ld         $2, 0x28($2)
/* 61A7C 0016197C 000062FC */  sd         $2, 0x0($3)
/* 61A80 00161980 0C004CC6 */  lwc1       $f12, 0xC($18)
/* 61A84 00161984 2C44040C */  jal        fptosi
/* 61A88 00161988 00000000 */   nop
/* 61A8C 0016198C 80110200 */  sll        $2, $2, 6
/* 61A90 00161990 C000A0AF */  sw         $0, 0xC0($sp)
/* 61A94 00161994 C400A2AF */  sw         $2, 0xC4($sp)
/* 61A98 00161998 40000224 */  addiu      $2, $0, 0x40
/* 61A9C 0016199C C800A2AF */  sw         $2, 0xC8($sp)
/* 61AA0 001619A0 CC00A2AF */  sw         $2, 0xCC($sp)
/* 61AA4 001619A4 B000A0AF */  sw         $0, 0xB0($sp)
/* 61AA8 001619A8 B400A0AF */  sw         $0, 0xB4($sp)
/* 61AAC 001619AC 80000224 */  addiu      $2, $0, 0x80
/* 61AB0 001619B0 B800A2AF */  sw         $2, 0xB8($sp)
/* 61AB4 001619B4 BC00A2AF */  sw         $2, 0xBC($sp)
/* 61AB8 001619B8 08004CC6 */  lwc1       $f12, 0x8($18)
/* 61ABC 001619BC 2C44040C */  jal        fptosi
/* 61AC0 001619C0 00000000 */   nop
/* 61AC4 001619C4 A000A0AF */  sw         $0, 0xA0($sp)
/* 61AC8 001619C8 A400A2AF */  sw         $2, 0xA4($sp)
/* 61ACC 001619CC 80000324 */  addiu      $3, $0, 0x80
/* 61AD0 001619D0 A800A3AF */  sw         $3, 0xA8($sp)
/* 61AD4 001619D4 40000224 */  addiu      $2, $0, 0x40
/* 61AD8 001619D8 AC00A2AF */  sw         $2, 0xAC($sp)
/* 61ADC 001619DC 9000A0AF */  sw         $0, 0x90($sp)
/* 61AE0 001619E0 9400A0AF */  sw         $0, 0x94($sp)
/* 61AE4 001619E4 9800A3AF */  sw         $3, 0x98($sp)
/* 61AE8 001619E8 9C00A3AF */  sw         $3, 0x9C($sp)
/* 61AEC 001619EC C701023C */  lui        $2, %hi(TexManager)
/* 61AF0 001619F0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 61AF4 001619F4 2A00023C */  lui        $2, %hi(_261_2)
/* 61AF8 001619F8 D0A04524 */  addiu      $5, $2, %lo(_261_2)
/* 61AFC 001619FC FFFF0624 */  addiu      $6, $0, -0x1
/* 61B00 00161A00 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 61B04 00161A04 00000000 */   nop
/* 61B08 00161A08 28864070 */  paddub     $16, $2, $0
/* 61B0C 00161A0C C701023C */  lui        $2, %hi(TexManager)
/* 61B10 00161A10 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 61B14 00161A14 2A00023C */  lui        $2, %hi(_259_2)
/* 61B18 00161A18 C0A04524 */  addiu      $5, $2, %lo(_259_2)
/* 61B1C 00161A1C FFFF0624 */  addiu      $6, $0, -0x1
/* 61B20 00161A20 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 61B24 00161A24 00000000 */   nop
/* 61B28 00161A28 B000A327 */  addiu      $3, $sp, 0xB0
/* 61B2C 00161A2C 0000A3FF */  sd         $3, 0x0($sp)
/* 61B30 00161A30 C000A327 */  addiu      $3, $sp, 0xC0
/* 61B34 00161A34 0800A3FF */  sd         $3, 0x8($sp)
/* 61B38 00161A38 D800A397 */  lhu        $3, 0xD8($sp)
/* 61B3C 00161A3C FF3F6530 */  andi       $5, $3, 0x3FFF
/* 61B40 00161A40 D800A3DF */  ld         $3, 0xD8($sp)
/* 61B44 00161A44 3C1B0300 */  dsll32     $3, $3, 12
/* 61B48 00161A48 BE1E0300 */  dsrl32     $3, $3, 26
/* 61B4C 00161A4C 3C300300 */  dsll32     $6, $3, 0
/* 61B50 00161A50 3F300600 */  dsra32     $6, $6, 0
/* 61B54 00161A54 DA00A397 */  lhu        $3, 0xDA($sp)
/* 61B58 00161A58 BC1D0300 */  dsll32     $3, $3, 22
/* 61B5C 00161A5C BE3E0300 */  dsrl32     $7, $3, 26
/* 61B60 00161A60 D48B848F */  lw         $4, -0x742C($gp)
/* 61B64 00161A64 28460072 */  paddub     $8, $16, $0
/* 61B68 00161A68 9000A927 */  addiu      $9, $sp, 0x90
/* 61B6C 00161A6C A000AA27 */  addiu      $10, $sp, 0xA0
/* 61B70 00161A70 285E4070 */  paddub     $11, $2, $0
/* 61B74 00161A74 6089050C */  jal        blendTextuer__FP13sceVif1PacketiiiP8CTextureRC8CRect_i_RC8CRect_i_P8CTextureRC8CRect_i_RC8CRect_i_
/* 61B78 00161A78 00000000 */   nop
.L00161A7C:
/* 61B7C 00161A7C 4000BF7B */  lq         $31, 0x40($sp)
/* 61B80 00161A80 3000B27B */  lq         $18, 0x30($sp)
/* 61B84 00161A84 2000B17B */  lq         $17, 0x20($sp)
/* 61B88 00161A88 1000B07B */  lq         $16, 0x10($sp)
/* 61B8C 00161A8C E000BD27 */  addiu      $sp, $sp, 0xE0
/* 61B90 00161A90 0800E003 */  jr         $31
/* 61B94 00161A94 00000000 */   nop
/* 61B98 00161A98 00000000 */  nop
/* 61B9C 00161A9C 00000000 */  nop
