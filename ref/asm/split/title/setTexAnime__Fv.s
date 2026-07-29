.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel setTexAnime__Fv
/* 00FBA0 01DBB8A0 70FFBD27 */  addiu       $29, $29, -0x90
/* 00FBA4 01DBB8A4 6000BF7F */  sq          $31, 0x60($29)
/* 00FBA8 01DBB8A8 5000B37F */  sq          $19, 0x50($29)
/* 00FBAC 01DBB8AC 4000B27F */  sq          $18, 0x40($29)
/* 00FBB0 01DBB8B0 3000B17F */  sq          $17, 0x30($29)
/* 00FBB4 01DBB8B4 2000B07F */  sq          $16, 0x20($29)
/* 00FBB8 01DBB8B8 DD01023C */  lui         $2, %hi(LIT_778__3)
/* 00FBBC 01DBB8BC B0774224 */  addiu       $2, $2, %lo(LIT_778__3)
/* 00FBC0 01DBB8C0 7000A327 */  addiu       $3, $29, 0x70
/* 00FBC4 01DBB8C4 00004278 */  lq          $2, 0x0($2)
/* 00FBC8 01DBB8C8 0000627C */  sq          $2, 0x0($3)
/* 00FBCC 01DBB8CC D48B848F */  lw          $4, -0x742C($28)
/* 00FBD0 01DBB8D0 282E0070 */  paddub      $5, $0, $0
/* 00FBD4 01DBB8D4 2083040C */  jal         sceVif1PkCnt
/* 00FBD8 01DBB8D8 00000000 */   nop
/* 00FBDC 01DBB8DC D48B848F */  lw          $4, -0x742C($28)
/* 00FBE0 01DBB8E0 282E0070 */  paddub      $5, $0, $0
/* 00FBE4 01DBB8E4 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 00FBE8 01DBB8E8 00000000 */   nop
/* 00FBEC 01DBB8EC 7000A227 */  addiu       $2, $29, 0x70
/* 00FBF0 01DBB8F0 D48B848F */  lw          $4, -0x742C($28)
/* 00FBF4 01DBB8F4 00004578 */  lq          $5, 0x0($2)
/* 00FBF8 01DBB8F8 B083040C */  jal         sceVif1PkOpenGifTag
/* 00FBFC 01DBB8FC 00000000 */   nop
/* 00FC00 01DBB900 D48B848F */  lw          $4, -0x742C($28)
/* 00FC04 01DBB904 3F000524 */  addiu       $5, $0, 0x3F
/* 00FC08 01DBB908 28360070 */  paddub      $6, $0, $0
/* 00FC0C 01DBB90C 0A84040C */  jal         sceVif1PkAddGsAD
/* 00FC10 01DBB910 00000000 */   nop
/* 00FC14 01DBB914 D48B848F */  lw          $4, -0x742C($28)
/* 00FC18 01DBB918 B683040C */  jal         sceVif1PkCloseGifTag
/* 00FC1C 01DBB91C 00000000 */   nop
/* 00FC20 01DBB920 D48B848F */  lw          $4, -0x742C($28)
/* 00FC24 01DBB924 A483040C */  jal         sceVif1PkCloseDirectCode
/* 00FC28 01DBB928 00000000 */   nop
/* 00FC2C 01DBB92C D48B848F */  lw          $4, -0x742C($28)
/* 00FC30 01DBB930 0A83040C */  jal         sceVif1PkTerminate
/* 00FC34 01DBB934 00000000 */   nop
/* 00FC38 01DBB938 C701023C */  lui         $2, %hi(TexManager)
/* 00FC3C 01DBB93C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00FC40 01DBB940 DE01023C */  lui         $2, %hi(LIT_798__3)
/* 00FC44 01DBB944 68EB4524 */  addiu       $5, $2, %lo(LIT_798__3)
/* 00FC48 01DBB948 FFFF0624 */  addiu       $6, $0, -0x1
/* 00FC4C 01DBB94C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 00FC50 01DBB950 00000000 */   nop
/* 00FC54 01DBB954 288E4070 */  paddub      $17, $2, $0
/* 00FC58 01DBB958 C701023C */  lui         $2, %hi(TexManager)
/* 00FC5C 01DBB95C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00FC60 01DBB960 DE01023C */  lui         $2, %hi(LIT_799__3)
/* 00FC64 01DBB964 70EB4524 */  addiu       $5, $2, %lo(LIT_799__3)
/* 00FC68 01DBB968 FFFF0624 */  addiu       $6, $0, -0x1
/* 00FC6C 01DBB96C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 00FC70 01DBB970 00000000 */   nop
/* 00FC74 01DBB974 03002012 */  beqz        $17, .L01DBB984_2C1184
/* 00FC78 01DBB978 00000000 */   nop
/* 00FC7C 01DBB97C 03004014 */  bnez        $2, .L01DBB98C_2C118C
/* 00FC80 01DBB980 00000000 */   nop
.L01DBB984_2C1184:
/* 00FC84 01DBB984 39000010 */  b           .L01DBBA6C_2C126C
/* 00FC88 01DBB988 00000000 */   nop
.L01DBB98C_2C118C:
/* 00FC8C 01DBB98C 2800238E */  lw          $3, 0x28($17)
/* 00FC90 01DBB990 FF3F7030 */  andi        $16, $3, 0x3FFF
/* 00FC94 01DBB994 280023DE */  ld          $3, 0x28($17)
/* 00FC98 01DBB998 BA1B0300 */  dsrl        $3, $3, 14
/* 00FC9C 01DBB99C 3F006330 */  andi        $3, $3, 0x3F
/* 00FCA0 01DBB9A0 3C880300 */  dsll32      $17, $3, 0
/* 00FCA4 01DBB9A4 3F881100 */  dsra32      $17, $17, 0
/* 00FCA8 01DBB9A8 2800438C */  lw          $3, 0x28($2)
/* 00FCAC 01DBB9AC FF3F7230 */  andi        $18, $3, 0x3FFF
/* 00FCB0 01DBB9B0 280042DC */  ld          $2, 0x28($2)
/* 00FCB4 01DBB9B4 BA130200 */  dsrl        $2, $2, 14
/* 00FCB8 01DBB9B8 3F004230 */  andi        $2, $2, 0x3F
/* 00FCBC 01DBB9BC 3C980200 */  dsll32      $19, $2, 0
/* 00FCC0 01DBB9C0 3F981300 */  dsra32      $19, $19, 0
/* 00FCC4 01DBB9C4 D0998283 */  lb          $2, -0x6630($28)
/* 00FCC8 01DBB9C8 04004014 */  bnez        $2, .L01DBB9DC_2C11DC
/* 00FCCC 01DBB9CC 00000000 */   nop
/* 00FCD0 01DBB9D0 CC9980AF */  sw          $0, -0x6634($28)
/* 00FCD4 01DBB9D4 01000224 */  addiu       $2, $0, 0x1
/* 00FCD8 01DBB9D8 D09982A3 */  sb          $2, -0x6630($28)
.L01DBB9DC_2C11DC:
/* 00FCDC 01DBB9DC CC998CC7 */  lwc1        $f12, -0x6634($28)
/* 00FCE0 01DBB9E0 2C44040C */  jal         fptosi
/* 00FCE4 01DBB9E4 00000000 */   nop
/* 00FCE8 01DBB9E8 80110200 */  sll         $2, $2, 6
/* 00FCEC 01DBB9EC 8000A0AF */  sw          $0, 0x80($29)
/* 00FCF0 01DBB9F0 8400A2AF */  sw          $2, 0x84($29)
/* 00FCF4 01DBB9F4 40000224 */  addiu       $2, $0, 0x40
/* 00FCF8 01DBB9F8 8800A2AF */  sw          $2, 0x88($29)
/* 00FCFC 01DBB9FC 8C00A2AF */  sw          $2, 0x8C($29)
/* 00FD00 01DBBA00 0000A0FF */  sd          $0, 0x0($29)
/* 00FD04 01DBBA04 0800A0FF */  sd          $0, 0x8($29)
/* 00FD08 01DBBA08 1000A0FF */  sd          $0, 0x10($29)
/* 00FD0C 01DBBA0C D48B848F */  lw          $4, -0x742C($28)
/* 00FD10 01DBBA10 282E4072 */  paddub      $5, $18, $0
/* 00FD14 01DBBA14 28366072 */  paddub      $6, $19, $0
/* 00FD18 01DBBA18 283E0070 */  paddub      $7, $0, $0
/* 00FD1C 01DBBA1C 8000A827 */  addiu       $8, $29, 0x80
/* 00FD20 01DBBA20 284E0072 */  paddub      $9, $16, $0
/* 00FD24 01DBBA24 28562072 */  paddub      $10, $17, $0
/* 00FD28 01DBBA28 285E0070 */  paddub      $11, $0, $0
/* 00FD2C 01DBBA2C 9801050C */  jal         MoveImageTest__FP13sceVif1PacketiiiRC8CRect_i_iiiiii
/* 00FD30 01DBBA30 00000000 */   nop
/* 00FD34 01DBBA34 CC9981C7 */  lwc1        $f1, -0x6634($28)
/* 00FD38 01DBBA38 003F033C */  lui         $3, (0x3F000000 >> 16)
/* 00FD3C 01DBBA3C 00008344 */  mtc1        $3, $f0
/* 00FD40 01DBBA40 00000000 */  nop
/* 00FD44 01DBBA44 40080046 */  add.s       $f1, $f1, $f0
/* 00FD48 01DBBA48 CC9981E7 */  swc1        $f1, -0x6634($28)
/* 00FD4C 01DBBA4C E040033C */  lui         $3, (0x40E00000 >> 16)
/* 00FD50 01DBBA50 00008344 */  mtc1        $3, $f0
/* 00FD54 01DBBA54 00000000 */  nop
/* 00FD58 01DBBA58 36080046 */  c.le.s      $f1, $f0
/* 00FD5C 01DBBA5C 00000000 */  nop
/* 00FD60 01DBBA60 02000145 */  bc1t        .L01DBBA6C_2C126C
/* 00FD64 01DBBA64 00000000 */   nop
/* 00FD68 01DBBA68 CC9980AF */  sw          $0, -0x6634($28)
.L01DBBA6C_2C126C:
/* 00FD6C 01DBBA6C 6000BF7B */  lq          $31, 0x60($29)
/* 00FD70 01DBBA70 5000B37B */  lq          $19, 0x50($29)
/* 00FD74 01DBBA74 4000B27B */  lq          $18, 0x40($29)
/* 00FD78 01DBBA78 3000B17B */  lq          $17, 0x30($29)
/* 00FD7C 01DBBA7C 2000B07B */  lq          $16, 0x20($29)
/* 00FD80 01DBBA80 9000BD27 */  addiu       $29, $29, 0x90
/* 00FD84 01DBBA84 0800E003 */  jr          $31
/* 00FD88 01DBBA88 00000000 */   nop
/* 00FD8C 01DBBA8C 00000000 */  nop
