.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MainDraw__Fv
/* 7B8D0 0017B7D0 D0FBBD27 */  addiu      $sp, $sp, -0x430
/* 7B8D4 0017B7D4 B000BF7F */  sq         $31, 0xB0($sp)
/* 7B8D8 0017B7D8 A000BE7F */  sq         $fp, 0xA0($sp)
/* 7B8DC 0017B7DC 9000B77F */  sq         $23, 0x90($sp)
/* 7B8E0 0017B7E0 8000B67F */  sq         $22, 0x80($sp)
/* 7B8E4 0017B7E4 7000B57F */  sq         $21, 0x70($sp)
/* 7B8E8 0017B7E8 6000B47F */  sq         $20, 0x60($sp)
/* 7B8EC 0017B7EC 5000B37F */  sq         $19, 0x50($sp)
/* 7B8F0 0017B7F0 4000B27F */  sq         $18, 0x40($sp)
/* 7B8F4 0017B7F4 3000B17F */  sq         $17, 0x30($sp)
/* 7B8F8 0017B7F8 2000B07F */  sq         $16, 0x20($sp)
/* 7B8FC 0017B7FC 1800B6E7 */  swc1       $f22, 0x18($sp)
/* 7B900 0017B800 1400B5E7 */  swc1       $f21, 0x14($sp)
/* 7B904 0017B804 1000B4E7 */  swc1       $f20, 0x10($sp)
/* 7B908 0017B808 6C90838F */  lw         $3, -0x6F94($gp)
/* 7B90C 0017B80C 56046014 */  bnez       $3, .L0017C968
/* 7B910 0017B810 00000000 */   nop
/* 7B914 0017B814 7C90828F */  lw         $2, -0x6F84($gp)
/* 7B918 0017B818 06004014 */  bnez       $2, .L0017B834
/* 7B91C 0017B81C 00000000 */   nop
/* 7B920 0017B820 6087828F */  lw         $2, -0x78A0($gp)
/* 7B924 0017B824 F7FF4224 */  addiu      $2, $2, -0x9
/* 7B928 0017B828 0200412C */  sltiu      $at, $2, 0x2
/* 7B92C 0017B82C 05002010 */  beqz       $at, .L0017B844
/* 7B930 0017B830 00000000 */   nop
.L0017B834:
/* 7B934 0017B834 01000224 */  addiu      $2, $0, 0x1
/* 7B938 0017B838 908E82AF */  sw         $2, -0x7170($gp)
/* 7B93C 0017B83C 09000010 */  b          .L0017B864
/* 7B940 0017B840 00000000 */   nop
.L0017B844:
/* 7B944 0017B844 908E80AF */  sw         $0, -0x7170($gp)
/* 7B948 0017B848 7890828F */  lw         $2, -0x6F88($gp)
/* 7B94C 0017B84C 05004010 */  beqz       $2, .L0017B864
/* 7B950 0017B850 00000000 */   nop
/* 7B954 0017B854 288D848F */  lw         $4, -0x72D8($gp)
/* 7B958 0017B858 E890858F */  lw         $5, -0x6F18($gp)
/* 7B95C 0017B85C DCC8050C */  jal        EdThunderEffect__FiP11CEditGround
/* 7B960 0017B860 00000000 */   nop
.L0017B864:
/* 7B964 0017B864 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 7B968 0017B868 ACD4228C */  lw         $2, -0x2B54($at)
/* 7B96C 0017B86C 709082AF */  sw         $2, -0x6F90($gp)
/* 7B970 0017B870 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 7B974 0017B874 B0D4228C */  lw         $2, -0x2B50($at)
/* 7B978 0017B878 749082AF */  sw         $2, -0x6F8C($gp)
/* 7B97C 0017B87C 7090828F */  lw         $2, -0x6F90($gp)
/* 7B980 0017B880 25014014 */  bnez       $2, .L0017BD18
/* 7B984 0017B884 00000000 */   nop
/* 7B988 0017B888 CC90828F */  lw         $2, -0x6F34($gp)
/* 7B98C 0017B88C 0C004010 */  beqz       $2, .L0017B8C0
/* 7B990 0017B890 00000000 */   nop
/* 7B994 0017B894 6090838F */  lw         $3, -0x6FA0($gp)
/* 7B998 0017B898 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7B99C 0017B89C D301023C */  lui        $2, %hi(SkyFrame)
/* 7B9A0 0017B8A0 30574424 */  addiu      $4, $2, %lo(SkyFrame)
/* 7B9A4 0017B8A4 D301023C */  lui        $2, %hi(SunFrame)
/* 7B9A8 0017B8A8 40574524 */  addiu      $5, $2, %lo(SunFrame)
/* 7B9AC 0017B8AC 0891868F */  lw         $6, -0x6EF8($gp)
/* 7B9B0 0017B8B0 0091878F */  lw         $7, -0x6F00($gp)
/* 7B9B4 0017B8B4 E01B6824 */  addiu      $8, $3, 0x1BE0
/* 7B9B8 0017B8B8 E41F060C */  jal        EdDrawSky__FfPP9CFrameVu1PP6CFrameP9CFrameVu1P7CCameraPi
/* 7B9BC 0017B8BC 00000000 */   nop
.L0017B8C0:
/* 7B9C0 0017B8C0 C701023C */  lui        $2, %hi(TexManager)
/* 7B9C4 0017B8C4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7B9C8 0017B8C8 D48B858F */  lw         $5, -0x742C($gp)
/* 7B9CC 0017B8CC 01000624 */  addiu      $6, $0, 0x1
/* 7B9D0 0017B8D0 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 7B9D4 0017B8D4 00000000 */   nop
/* 7B9D8 0017B8D8 D301023C */  lui        $2, %hi(TexAnime)
/* 7B9DC 0017B8DC 605C4424 */  addiu      $4, $2, %lo(TexAnime)
/* 7B9E0 0017B8E0 01000524 */  addiu      $5, $0, 0x1
/* 7B9E4 0017B8E4 5C9C050C */  jal        TexAnime__13CTextureAnimeFi
/* 7B9E8 0017B8E8 00000000 */   nop
/* 7B9EC 0017B8EC E890848F */  lw         $4, -0x6F18($gp)
/* 7B9F0 0017B8F0 A88B060C */  jal        DrawBaseGround__11CEditGroundFv
/* 7B9F4 0017B8F4 00000000 */   nop
/* 7B9F8 0017B8F8 2700023C */  lui        $2, %hi(_1627)
/* 7B9FC 0017B8FC 00944224 */  addiu      $2, $2, %lo(_1627)
/* 7BA00 0017B900 C000A327 */  addiu      $3, $sp, 0xC0
/* 7BA04 0017B904 00004278 */  lq         $2, 0x0($2)
/* 7BA08 0017B908 0000627C */  sq         $2, 0x0($3)
/* 7BA0C 0017B90C 0040023C */  lui        $2, (0x40000000 >> 16)
/* 7BA10 0017B910 00A88244 */  mtc1       $2, $f21
/* 7BA14 0017B914 00A08044 */  mtc1       $0, $f20
/* 7BA18 0017B918 00000000 */  nop
/* 7BA1C 0017B91C 86A50046 */  mov.s      $f22, $f20
/* 7BA20 0017B920 BC90828F */  lw         $2, -0x6F44($gp)
/* 7BA24 0017B924 06004010 */  beqz       $2, .L0017B940
/* 7BA28 0017B928 00000000 */   nop
/* 7BA2C 0017B92C 4040023C */  lui        $2, (0x40400000 >> 16)
/* 7BA30 0017B930 00A88244 */  mtc1       $2, $f21
/* 7BA34 0017B934 00000000 */  nop
/* 7BA38 0017B938 06AD0046 */  mov.s      $f20, $f21
/* 7BA3C 0017B93C 86AD0046 */  mov.s      $f22, $f21
.L0017B940:
/* 7BA40 0017B940 06A30046 */  mov.s      $f12, $f20
/* 7BA44 0017B944 2C44040C */  jal        fptosi
/* 7BA48 0017B948 00000000 */   nop
/* 7BA4C 0017B94C 28964070 */  paddub     $18, $2, $0
/* 7BA50 0017B950 06AB0046 */  mov.s      $f12, $f21
/* 7BA54 0017B954 2C44040C */  jal        fptosi
/* 7BA58 0017B958 00000000 */   nop
/* 7BA5C 0017B95C 288E4070 */  paddub     $17, $2, $0
/* 7BA60 0017B960 06B30046 */  mov.s      $f12, $f22
/* 7BA64 0017B964 2C44040C */  jal        fptosi
/* 7BA68 0017B968 00000000 */   nop
/* 7BA6C 0017B96C 28864070 */  paddub     $16, $2, $0
/* 7BA70 0017B970 06AB0046 */  mov.s      $f12, $f21
/* 7BA74 0017B974 2C44040C */  jal        fptosi
/* 7BA78 0017B978 00000000 */   nop
/* 7BA7C 0017B97C E890848F */  lw         $4, -0x6F18($gp)
/* 7BA80 0017B980 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7BA84 0017B984 01000524 */  addiu      $5, $0, 0x1
/* 7BA88 0017B988 28364072 */  paddub     $6, $18, $0
/* 7BA8C 0017B98C 283E2072 */  paddub     $7, $17, $0
/* 7BA90 0017B990 28460072 */  paddub     $8, $16, $0
/* 7BA94 0017B994 284E4070 */  paddub     $9, $2, $0
/* 7BA98 0017B998 C48B060C */  jal        Draw__11CEditGroundFfiiiii
/* 7BA9C 0017B99C 00000000 */   nop
/* 7BAA0 0017B9A0 BC90828F */  lw         $2, -0x6F44($gp)
/* 7BAA4 0017B9A4 1F004010 */  beqz       $2, .L0017BA24
/* 7BAA8 0017B9A8 00000000 */   nop
/* 7BAAC 0017B9AC 2700023C */  lui        $2, %hi(_1632)
/* 7BAB0 0017B9B0 10944224 */  addiu      $2, $2, %lo(_1632)
/* 7BAB4 0017B9B4 E000A327 */  addiu      $3, $sp, 0xE0
/* 7BAB8 0017B9B8 00004278 */  lq         $2, 0x0($2)
/* 7BABC 0017B9BC 0000627C */  sq         $2, 0x0($3)
/* 7BAC0 0017B9C0 7087828F */  lw         $2, -0x7890($gp)
/* 7BAC4 0017B9C4 D000A427 */  addiu      $4, $sp, 0xD0
/* 7BAC8 0017B9C8 20024524 */  addiu      $5, $2, 0x220
/* 7BACC 0017B9CC 0C86040C */  jal        sceVu0CopyVector
/* 7BAD0 0017B9D0 00000000 */   nop
/* 7BAD4 0017B9D4 4C9180C7 */  lwc1       $f0, -0x6EB4($gp)
/* 7BAD8 0017B9D8 E400A0E7 */  swc1       $f0, 0xE4($sp)
/* 7BADC 0017B9DC D400B027 */  addiu      $16, $sp, 0xD4
/* 7BAE0 0017B9E0 E890848F */  lw         $4, -0x6F18($gp)
/* 7BAE4 0017B9E4 D000ACC7 */  lwc1       $f12, 0xD0($sp)
/* 7BAE8 0017B9E8 00000DC6 */  lwc1       $f13, 0x0($16)
/* 7BAEC 0017B9EC D800AEC7 */  lwc1       $f14, 0xD8($sp)
/* 7BAF0 0017B9F0 D885060C */  jal        GetAlt__11CEditGroundFfff
/* 7BAF4 0017B9F4 00000000 */   nop
/* 7BAF8 0017B9F8 000000E6 */  swc1       $f0, 0x0($16)
/* 7BAFC 0017B9FC E890848F */  lw         $4, -0x6F18($gp)
/* 7BB00 0017BA00 6C87858F */  lw         $5, -0x7894($gp)
/* 7BB04 0017BA04 D000A627 */  addiu      $6, $sp, 0xD0
/* 7BB08 0017BA08 D301023C */  lui        $2, %hi(NowPartsCursorPos)
/* 7BB0C 0017BA0C C0594724 */  addiu      $7, $2, %lo(NowPartsCursorPos)
/* 7BB10 0017BA10 4491888F */  lw         $8, -0x6EBC($gp)
/* 7BB14 0017BA14 E000A927 */  addiu      $9, $sp, 0xE0
/* 7BB18 0017BA18 01000A24 */  addiu      $10, $0, 0x1
/* 7BB1C 0017BA1C CC8F060C */  jal        DrawPartsCursor__11CEditGroundFiPfPfiPfi
/* 7BB20 0017BA20 00000000 */   nop
.L0017BA24:
/* 7BB24 0017BA24 C701023C */  lui        $2, %hi(TexManager)
/* 7BB28 0017BA28 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7BB2C 0017BA2C D48B858F */  lw         $5, -0x742C($gp)
/* 7BB30 0017BA30 02000624 */  addiu      $6, $0, 0x2
/* 7BB34 0017BA34 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 7BB38 0017BA38 00000000 */   nop
/* 7BB3C 0017BA3C D301023C */  lui        $2, %hi(TexAnime)
/* 7BB40 0017BA40 605C4424 */  addiu      $4, $2, %lo(TexAnime)
/* 7BB44 0017BA44 02000524 */  addiu      $5, $0, 0x2
/* 7BB48 0017BA48 5C9C050C */  jal        TexAnime__13CTextureAnimeFi
/* 7BB4C 0017BA4C 00000000 */   nop
/* 7BB50 0017BA50 06A30046 */  mov.s      $f12, $f20
/* 7BB54 0017BA54 2C44040C */  jal        fptosi
/* 7BB58 0017BA58 00000000 */   nop
/* 7BB5C 0017BA5C 28864070 */  paddub     $16, $2, $0
/* 7BB60 0017BA60 06AB0046 */  mov.s      $f12, $f21
/* 7BB64 0017BA64 2C44040C */  jal        fptosi
/* 7BB68 0017BA68 00000000 */   nop
/* 7BB6C 0017BA6C E890848F */  lw         $4, -0x6F18($gp)
/* 7BB70 0017BA70 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7BB74 0017BA74 02000524 */  addiu      $5, $0, 0x2
/* 7BB78 0017BA78 28360072 */  paddub     $6, $16, $0
/* 7BB7C 0017BA7C 283E4070 */  paddub     $7, $2, $0
/* 7BB80 0017BA80 28460070 */  paddub     $8, $0, $0
/* 7BB84 0017BA84 03000924 */  addiu      $9, $0, 0x3
/* 7BB88 0017BA88 C48B060C */  jal        Draw__11CEditGroundFfiiiii
/* 7BB8C 0017BA8C 00000000 */   nop
/* 7BB90 0017BA90 BC90828F */  lw         $2, -0x6F44($gp)
/* 7BB94 0017BA94 1F004010 */  beqz       $2, .L0017BB14
/* 7BB98 0017BA98 00000000 */   nop
/* 7BB9C 0017BA9C 2700023C */  lui        $2, %hi(_1635)
/* 7BBA0 0017BAA0 20944224 */  addiu      $2, $2, %lo(_1635)
/* 7BBA4 0017BAA4 0001A327 */  addiu      $3, $sp, 0x100
/* 7BBA8 0017BAA8 00004278 */  lq         $2, 0x0($2)
/* 7BBAC 0017BAAC 0000627C */  sq         $2, 0x0($3)
/* 7BBB0 0017BAB0 7087828F */  lw         $2, -0x7890($gp)
/* 7BBB4 0017BAB4 F000A427 */  addiu      $4, $sp, 0xF0
/* 7BBB8 0017BAB8 20024524 */  addiu      $5, $2, 0x220
/* 7BBBC 0017BABC 0C86040C */  jal        sceVu0CopyVector
/* 7BBC0 0017BAC0 00000000 */   nop
/* 7BBC4 0017BAC4 4C9180C7 */  lwc1       $f0, -0x6EB4($gp)
/* 7BBC8 0017BAC8 0401A0E7 */  swc1       $f0, 0x104($sp)
/* 7BBCC 0017BACC F400B027 */  addiu      $16, $sp, 0xF4
/* 7BBD0 0017BAD0 E890848F */  lw         $4, -0x6F18($gp)
/* 7BBD4 0017BAD4 F000ACC7 */  lwc1       $f12, 0xF0($sp)
/* 7BBD8 0017BAD8 00000DC6 */  lwc1       $f13, 0x0($16)
/* 7BBDC 0017BADC F800AEC7 */  lwc1       $f14, 0xF8($sp)
/* 7BBE0 0017BAE0 D885060C */  jal        GetAlt__11CEditGroundFfff
/* 7BBE4 0017BAE4 00000000 */   nop
/* 7BBE8 0017BAE8 000000E6 */  swc1       $f0, 0x0($16)
/* 7BBEC 0017BAEC E890848F */  lw         $4, -0x6F18($gp)
/* 7BBF0 0017BAF0 6C87858F */  lw         $5, -0x7894($gp)
/* 7BBF4 0017BAF4 F000A627 */  addiu      $6, $sp, 0xF0
/* 7BBF8 0017BAF8 D301023C */  lui        $2, %hi(NowPartsCursorPos)
/* 7BBFC 0017BAFC C0594724 */  addiu      $7, $2, %lo(NowPartsCursorPos)
/* 7BC00 0017BB00 4491888F */  lw         $8, -0x6EBC($gp)
/* 7BC04 0017BB04 0001A927 */  addiu      $9, $sp, 0x100
/* 7BC08 0017BB08 02000A24 */  addiu      $10, $0, 0x2
/* 7BC0C 0017BB0C CC8F060C */  jal        DrawPartsCursor__11CEditGroundFiPfPfiPfi
/* 7BC10 0017BB10 00000000 */   nop
.L0017BB14:
/* 7BC14 0017BB14 70DD050C */  jal        FishingDrawCheck__Fv
/* 7BC18 0017BB18 00000000 */   nop
/* 7BC1C 0017BB1C 06004010 */  beqz       $2, .L0017BB38
/* 7BC20 0017BB20 00000000 */   nop
/* 7BC24 0017BB24 A0A6060C */  jal        FishingDrawFish__Fv
/* 7BC28 0017BB28 00000000 */   nop
/* 7BC2C 0017BB2C 28260070 */  paddub     $4, $0, $0
/* 7BC30 0017BB30 3CAC060C */  jal        FishLineDraw__Fi
/* 7BC34 0017BB34 00000000 */   nop
.L0017BB38:
/* 7BC38 0017BB38 C701023C */  lui        $2, %hi(TexManager)
/* 7BC3C 0017BB3C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7BC40 0017BB40 D48B858F */  lw         $5, -0x742C($gp)
/* 7BC44 0017BB44 15000624 */  addiu      $6, $0, 0x15
/* 7BC48 0017BB48 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 7BC4C 0017BB4C 00000000 */   nop
/* 7BC50 0017BB50 D301023C */  lui        $2, %hi(TexAnime)
/* 7BC54 0017BB54 605C4424 */  addiu      $4, $2, %lo(TexAnime)
/* 7BC58 0017BB58 15000524 */  addiu      $5, $0, 0x15
/* 7BC5C 0017BB5C 5C9C050C */  jal        TexAnime__13CTextureAnimeFi
/* 7BC60 0017BB60 00000000 */   nop
/* 7BC64 0017BB64 E890848F */  lw         $4, -0x6F18($gp)
/* 7BC68 0017BB68 15000524 */  addiu      $5, $0, 0x15
/* 7BC6C 0017BB6C 888D060C */  jal        DrawWater__11CEditGroundFi
/* 7BC70 0017BB70 00000000 */   nop
/* 7BC74 0017BB74 6087838F */  lw         $3, -0x78A0($gp)
/* 7BC78 0017BB78 0A000224 */  addiu      $2, $0, 0xA
/* 7BC7C 0017BB7C 20006210 */  beq        $3, $2, .L0017BC00
/* 7BC80 0017BB80 00000000 */   nop
/* 7BC84 0017BB84 05000224 */  addiu      $2, $0, 0x5
/* 7BC88 0017BB88 1D006210 */  beq        $3, $2, .L0017BC00
/* 7BC8C 0017BB8C 00000000 */   nop
/* 7BC90 0017BB90 07000224 */  addiu      $2, $0, 0x7
/* 7BC94 0017BB94 1A006210 */  beq        $3, $2, .L0017BC00
/* 7BC98 0017BB98 00000000 */   nop
/* 7BC9C 0017BB9C 09000224 */  addiu      $2, $0, 0x9
/* 7BCA0 0017BBA0 17006210 */  beq        $3, $2, .L0017BC00
/* 7BCA4 0017BBA4 00000000 */   nop
/* 7BCA8 0017BBA8 15006010 */  beqz       $3, .L0017BC00
/* 7BCAC 0017BBAC 00000000 */   nop
/* 7BCB0 0017BBB0 03000224 */  addiu      $2, $0, 0x3
/* 7BCB4 0017BBB4 12006210 */  beq        $3, $2, .L0017BC00
/* 7BCB8 0017BBB8 00000000 */   nop
/* 7BCBC 0017BBBC 0E000224 */  addiu      $2, $0, 0xE
/* 7BCC0 0017BBC0 0F006210 */  beq        $3, $2, .L0017BC00
/* 7BCC4 0017BBC4 00000000 */   nop
/* 7BCC8 0017BBC8 02000224 */  addiu      $2, $0, 0x2
/* 7BCCC 0017BBCC 0C006210 */  beq        $3, $2, .L0017BC00
/* 7BCD0 0017BBD0 00000000 */   nop
/* 7BCD4 0017BBD4 04000224 */  addiu      $2, $0, 0x4
/* 7BCD8 0017BBD8 09006210 */  beq        $3, $2, .L0017BC00
/* 7BCDC 0017BBDC 00000000 */   nop
/* 7BCE0 0017BBE0 10000224 */  addiu      $2, $0, 0x10
/* 7BCE4 0017BBE4 06006210 */  beq        $3, $2, .L0017BC00
/* 7BCE8 0017BBE8 00000000 */   nop
/* 7BCEC 0017BBEC 01000224 */  addiu      $2, $0, 0x1
/* 7BCF0 0017BBF0 03006210 */  beq        $3, $2, .L0017BC00
/* 7BCF4 0017BBF4 00000000 */   nop
/* 7BCF8 0017BBF8 32000010 */  b          .L0017BCC4
/* 7BCFC 0017BBFC 00000000 */   nop
.L0017BC00:
/* 7BD00 0017BC00 1004A427 */  addiu      $4, $sp, 0x410
/* 7BD04 0017BC04 4CBC040C */  jal        MGGetFBuffTex__FP9sceGsTex0
/* 7BD08 0017BC08 00000000 */   nop
/* 7BD0C 0017BC0C 1001A0AF */  sw         $0, 0x110($sp)
/* 7BD10 0017BC10 1401A0AF */  sw         $0, 0x114($sp)
/* 7BD14 0017BC14 80020224 */  addiu      $2, $0, 0x280
/* 7BD18 0017BC18 1801A2AF */  sw         $2, 0x118($sp)
/* 7BD1C 0017BC1C E0000224 */  addiu      $2, $0, 0xE0
/* 7BD20 0017BC20 1C01A2AF */  sw         $2, 0x11C($sp)
/* 7BD24 0017BC24 C701023C */  lui        $2, %hi(TexManager)
/* 7BD28 0017BC28 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7BD2C 0017BC2C 2A00023C */  lui        $2, %hi(_1837_2)
/* 7BD30 0017BC30 88AB4524 */  addiu      $5, $2, %lo(_1837_2)
/* 7BD34 0017BC34 FFFF0624 */  addiu      $6, $0, -0x1
/* 7BD38 0017BC38 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 7BD3C 0017BC3C 00000000 */   nop
/* 7BD40 0017BC40 1804A627 */  addiu      $6, $sp, 0x418
/* 7BD44 0017BC44 280042DC */  ld         $2, 0x28($2)
/* 7BD48 0017BC48 0000C2FC */  sd         $2, 0x0($6)
/* 7BD4C 0017BC4C 1004A427 */  addiu      $4, $sp, 0x410
/* 7BD50 0017BC50 1001A527 */  addiu      $5, $sp, 0x110
/* 7BD54 0017BC54 283E0070 */  paddub     $7, $0, $0
/* 7BD58 0017BC58 28460070 */  paddub     $8, $0, $0
/* 7BD5C 0017BC5C 284E0070 */  paddub     $9, $0, $0
/* 7BD60 0017BC60 84BC040C */  jal        MGMoveImage__FP9sceGsTex0RC8CRect_i_P9sceGsTex0iii
/* 7BD64 0017BC64 00000000 */   nop
/* 7BD68 0017BC68 D301023C */  lui        $2, %hi(MainCamera)
/* 7BD6C 0017BC6C 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 7BD70 0017BC70 2001A527 */  addiu      $5, $sp, 0x120
/* 7BD74 0017BC74 A891040C */  jal        GetRef__7CCameraFPf
/* 7BD78 0017BC78 00000000 */   nop
/* 7BD7C 0017BC7C 2004A427 */  addiu      $4, $sp, 0x420
/* 7BD80 0017BC80 F08B82DF */  ld         $2, -0x7410($gp)
/* 7BD84 0017BC84 000082FC */  sd         $2, 0x0($4)
/* 7BD88 0017BC88 2404A593 */  lbu        $5, 0x424($sp)
/* 7BD8C 0017BC8C 01000364 */  daddiu     $3, $0, 0x1
/* 7BD90 0017BC90 FEFF0224 */  addiu      $2, $0, -0x2
/* 7BD94 0017BC94 2410A200 */  and        $2, $5, $2
/* 7BD98 0017BC98 25104300 */  or         $2, $2, $3
/* 7BD9C 0017BC9C 2404A2A3 */  sb         $2, 0x424($sp)
/* 7BDA0 0017BCA0 B0BB040C */  jal        MGSetGsZBUF__FP9sceGsZbuf
/* 7BDA4 0017BCA4 00000000 */   nop
/* 7BDA8 0017BCA8 E890848F */  lw         $4, -0x6F18($gp)
/* 7BDAC 0017BCAC 0091858F */  lw         $5, -0x6F00($gp)
/* 7BDB0 0017BCB0 D88C060C */  jal        DrawWaterSurface__11CEditGroundFP7CCamera
/* 7BDB4 0017BCB4 00000000 */   nop
/* 7BDB8 0017BCB8 F08B8427 */  addiu      $4, $gp, -0x7410
/* 7BDBC 0017BCBC B0BB040C */  jal        MGSetGsZBUF__FP9sceGsZbuf
/* 7BDC0 0017BCC0 00000000 */   nop
.L0017BCC4:
/* 7BDC4 0017BCC4 E890848F */  lw         $4, -0x6F18($gp)
/* 7BDC8 0017BCC8 15000524 */  addiu      $5, $0, 0x15
/* 7BDCC 0017BCCC 508E060C */  jal        DrawRipple__11CEditGroundFi
/* 7BDD0 0017BCD0 00000000 */   nop
/* 7BDD4 0017BCD4 2804A327 */  addiu      $3, $sp, 0x428
/* 7BDD8 0017BCD8 808782DF */  ld         $2, -0x7880($gp)
/* 7BDDC 0017BCDC 000062FC */  sd         $2, 0x0($3)
/* 7BDE0 0017BCE0 C490828F */  lw         $2, -0x6F3C($gp)
/* 7BDE4 0017BCE4 0C004010 */  beqz       $2, .L0017BD18
/* 7BDE8 0017BCE8 00000000 */   nop
/* 7BDEC 0017BCEC 02001024 */  addiu      $16, $0, 0x2
/* 7BDF0 0017BCF0 1C8D848F */  lw         $4, -0x72E4($gp)
/* 7BDF4 0017BCF4 CC5E050C */  jal        GetConfigData__9CSaveDataFv
/* 7BDF8 0017BCF8 00000000 */   nop
/* 7BDFC 0017BCFC 1800428C */  lw         $2, 0x18($2)
/* 7BE00 0017BD00 02004010 */  beqz       $2, .L0017BD0C
/* 7BE04 0017BD04 00000000 */   nop
/* 7BE08 0017BD08 01001024 */  addiu      $16, $0, 0x1
.L0017BD0C:
/* 7BE0C 0017BD0C 28260072 */  paddub     $4, $16, $0
/* 7BE10 0017BD10 BCC8050C */  jal        EdDrawDOF__Fi
/* 7BE14 0017BD14 00000000 */   nop
.L0017BD18:
/* 7BE18 0017BD18 70DD050C */  jal        FishingDrawCheck__Fv
/* 7BE1C 0017BD1C 00000000 */   nop
/* 7BE20 0017BD20 04004010 */  beqz       $2, .L0017BD34
/* 7BE24 0017BD24 00000000 */   nop
/* 7BE28 0017BD28 01000424 */  addiu      $4, $0, 0x1
/* 7BE2C 0017BD2C 3CAC060C */  jal        FishLineDraw__Fi
/* 7BE30 0017BD30 00000000 */   nop
.L0017BD34:
/* 7BE34 0017BD34 6087838F */  lw         $3, -0x78A0($gp)
/* 7BE38 0017BD38 0E000224 */  addiu      $2, $0, 0xE
/* 7BE3C 0017BD3C 03006214 */  bne        $3, $2, .L0017BD4C
/* 7BE40 0017BD40 00000000 */   nop
/* 7BE44 0017BD44 1C63060C */  jal        EdEventBackSpriteDraw__Fv
/* 7BE48 0017BD48 00000000 */   nop
.L0017BD4C:
/* 7BE4C 0017BD4C 588D80AF */  sw         $0, -0x72A8($gp)
/* 7BE50 0017BD50 6087838F */  lw         $3, -0x78A0($gp)
/* 7BE54 0017BD54 0E000224 */  addiu      $2, $0, 0xE
/* 7BE58 0017BD58 03006214 */  bne        $3, $2, .L0017BD68
/* 7BE5C 0017BD5C 00000000 */   nop
/* 7BE60 0017BD60 E0CC050C */  jal        EdDrawItem__Fv
/* 7BE64 0017BD64 00000000 */   nop
.L0017BD68:
/* 7BE68 0017BD68 6087838F */  lw         $3, -0x78A0($gp)
/* 7BE6C 0017BD6C 0B000224 */  addiu      $2, $0, 0xB
/* 7BE70 0017BD70 4A006210 */  beq        $3, $2, .L0017BE9C
/* 7BE74 0017BD74 00000000 */   nop
/* 7BE78 0017BD78 03000224 */  addiu      $2, $0, 0x3
/* 7BE7C 0017BD7C 47006210 */  beq        $3, $2, .L0017BE9C
/* 7BE80 0017BD80 00000000 */   nop
/* 7BE84 0017BD84 0E000224 */  addiu      $2, $0, 0xE
/* 7BE88 0017BD88 44006210 */  beq        $3, $2, .L0017BE9C
/* 7BE8C 0017BD8C 00000000 */   nop
/* 7BE90 0017BD90 02000224 */  addiu      $2, $0, 0x2
/* 7BE94 0017BD94 41006210 */  beq        $3, $2, .L0017BE9C
/* 7BE98 0017BD98 00000000 */   nop
/* 7BE9C 0017BD9C 10000224 */  addiu      $2, $0, 0x10
/* 7BEA0 0017BDA0 3E006210 */  beq        $3, $2, .L0017BE9C
/* 7BEA4 0017BDA4 00000000 */   nop
/* 7BEA8 0017BDA8 01000224 */  addiu      $2, $0, 0x1
/* 7BEAC 0017BDAC 3B006210 */  beq        $3, $2, .L0017BE9C
/* 7BEB0 0017BDB0 00000000 */   nop
/* 7BEB4 0017BDB4 07000224 */  addiu      $2, $0, 0x7
/* 7BEB8 0017BDB8 06006210 */  beq        $3, $2, .L0017BDD4
/* 7BEBC 0017BDBC 00000000 */   nop
/* 7BEC0 0017BDC0 09000224 */  addiu      $2, $0, 0x9
/* 7BEC4 0017BDC4 03006210 */  beq        $3, $2, .L0017BDD4
/* 7BEC8 0017BDC8 00000000 */   nop
/* 7BECC 0017BDCC 03010010 */  b          .L0017C1DC
/* 7BED0 0017BDD0 00000000 */   nop
.L0017BDD4:
/* 7BED4 0017BDD4 01000224 */  addiu      $2, $0, 0x1
/* 7BED8 0017BDD8 888C82AF */  sw         $2, -0x7378($gp)
/* 7BEDC 0017BDDC 6487848F */  lw         $4, -0x789C($gp)
/* 7BEE0 0017BDE0 A000998C */  lw         $25, 0xA0($4)
/* 7BEE4 0017BDE4 0800398F */  lw         $25, 0x8($25)
/* 7BEE8 0017BDE8 09F82003 */  jalr       $25
/* 7BEEC 0017BDEC 00000000 */   nop
/* 7BEF0 0017BDF0 6487848F */  lw         $4, -0x789C($gp)
/* 7BEF4 0017BDF4 A000998C */  lw         $25, 0xA0($4)
/* 7BEF8 0017BDF8 9000398F */  lw         $25, 0x90($25)
/* 7BEFC 0017BDFC 09F82003 */  jalr       $25
/* 7BF00 0017BE00 00000000 */   nop
/* 7BF04 0017BE04 28960070 */  paddub     $18, $0, $0
/* 7BF08 0017BE08 20000010 */  b          .L0017BE8C
/* 7BF0C 0017BE0C 00000000 */   nop
.L0017BE10:
/* 7BF10 0017BE10 40111200 */  sll        $2, $18, 5
/* 7BF14 0017BE14 21185200 */  addu       $3, $2, $18
/* 7BF18 0017BE18 80100300 */  sll        $2, $3, 2
/* 7BF1C 0017BE1C 21106200 */  addu       $2, $3, $2
/* 7BF20 0017BE20 40190200 */  sll        $3, $2, 5
/* 7BF24 0017BE24 D201023C */  lui        $2, %hi(EdVillager)
/* 7BF28 0017BE28 905B4224 */  addiu      $2, $2, %lo(EdVillager)
/* 7BF2C 0017BE2C 21804300 */  addu       $16, $2, $3
/* 7BF30 0017BE30 6C14028E */  lw         $2, 0x146C($16)
/* 7BF34 0017BE34 2B100200 */  sltu       $2, $0, $2
/* 7BF38 0017BE38 03004010 */  beqz       $2, .L0017BE48
/* 7BF3C 0017BE3C 00000000 */   nop
/* 7BF40 0017BE40 7014028E */  lw         $2, 0x1470($16)
/* 7BF44 0017BE44 2B100200 */  sltu       $2, $0, $2
.L0017BE48:
/* 7BF48 0017BE48 FF004230 */  andi       $2, $2, 0xFF
/* 7BF4C 0017BE4C 0E004010 */  beqz       $2, .L0017BE88
/* 7BF50 0017BE50 00000000 */   nop
/* 7BF54 0017BE54 B011118E */  lw         $17, 0x11B0($16)
/* 7BF58 0017BE58 B01100AE */  sw         $0, 0x11B0($16)
/* 7BF5C 0017BE5C 28260072 */  paddub     $4, $16, $0
/* 7BF60 0017BE60 A000198E */  lw         $25, 0xA0($16)
/* 7BF64 0017BE64 0800398F */  lw         $25, 0x8($25)
/* 7BF68 0017BE68 09F82003 */  jalr       $25
/* 7BF6C 0017BE6C 00000000 */   nop
/* 7BF70 0017BE70 28260072 */  paddub     $4, $16, $0
/* 7BF74 0017BE74 A000198E */  lw         $25, 0xA0($16)
/* 7BF78 0017BE78 9000398F */  lw         $25, 0x90($25)
/* 7BF7C 0017BE7C 09F82003 */  jalr       $25
/* 7BF80 0017BE80 00000000 */   nop
/* 7BF84 0017BE84 B01111AE */  sw         $17, 0x11B0($16)
.L0017BE88:
/* 7BF88 0017BE88 01005226 */  addiu      $18, $18, 0x1
.L0017BE8C:
/* 7BF8C 0017BE8C 0A00422A */  slti       $2, $18, 0xA
/* 7BF90 0017BE90 DFFF4014 */  bnez       $2, .L0017BE10
/* 7BF94 0017BE94 00000000 */   nop
/* 7BF98 0017BE98 888C80AF */  sw         $0, -0x7378($gp)
.L0017BE9C:
/* 7BF9C 0017BE9C 28BE0070 */  paddub     $23, $0, $0
/* 7BFA0 0017BEA0 01001624 */  addiu      $22, $0, 0x1
/* 7BFA4 0017BEA4 03001024 */  addiu      $16, $0, 0x3
/* 7BFA8 0017BEA8 3001B127 */  addiu      $17, $sp, 0x130
/* 7BFAC 0017BEAC 6087838F */  lw         $3, -0x78A0($gp)
/* 7BFB0 0017BEB0 02000224 */  addiu      $2, $0, 0x2
/* 7BFB4 0017BEB4 05006210 */  beq        $3, $2, .L0017BECC
/* 7BFB8 0017BEB8 00000000 */   nop
/* 7BFBC 0017BEBC 90CD050C */  jal        EdSystemMesCheck__Fv
/* 7BFC0 0017BEC0 00000000 */   nop
/* 7BFC4 0017BEC4 02004010 */  beqz       $2, .L0017BED0
/* 7BFC8 0017BEC8 00000000 */   nop
.L0017BECC:
/* 7BFCC 0017BECC 28B60070 */  paddub     $22, $0, $0
.L0017BED0:
/* 7BFD0 0017BED0 48A8050C */  jal        EdCheckViewMode__Fv
/* 7BFD4 0017BED4 00000000 */   nop
/* 7BFD8 0017BED8 02004010 */  beqz       $2, .L0017BEE4
/* 7BFDC 0017BEDC 00000000 */   nop
/* 7BFE0 0017BEE0 28860070 */  paddub     $16, $0, $0
.L0017BEE4:
/* 7BFE4 0017BEE4 6087848F */  lw         $4, -0x78A0($gp)
/* 7BFE8 0017BEE8 0B000224 */  addiu      $2, $0, 0xB
/* 7BFEC 0017BEEC 04008214 */  bne        $4, $2, .L0017BF00
/* 7BFF0 0017BEF0 00000000 */   nop
/* 7BFF4 0017BEF4 288E0070 */  paddub     $17, $0, $0
/* 7BFF8 0017BEF8 0C000010 */  b          .L0017BF2C
/* 7BFFC 0017BEFC 00000000 */   nop
.L0017BF00:
/* 7C000 0017BF00 28960070 */  paddub     $18, $0, $0
/* 7C004 0017BF04 06000010 */  b          .L0017BF20
/* 7C008 0017BF08 00000000 */   nop
.L0017BF0C:
/* 7C00C 0017BF0C 03000324 */  addiu      $3, $0, 0x3
/* 7C010 0017BF10 80101200 */  sll        $2, $18, 2
/* 7C014 0017BF14 21105D00 */  addu       $2, $2, $sp
/* 7C018 0017BF18 300143AC */  sw         $3, 0x130($2)
/* 7C01C 0017BF1C 01005226 */  addiu      $18, $18, 0x1
.L0017BF20:
/* 7C020 0017BF20 0A00422A */  slti       $2, $18, 0xA
/* 7C024 0017BF24 F9FF4014 */  bnez       $2, .L0017BF0C
/* 7C028 0017BF28 00000000 */   nop
.L0017BF2C:
/* 7C02C 0017BF2C 0E000224 */  addiu      $2, $0, 0xE
/* 7C030 0017BF30 03008214 */  bne        $4, $2, .L0017BF40
/* 7C034 0017BF34 00000000 */   nop
/* 7C038 0017BF38 D401023C */  lui        $2, %hi(EdEventInfo)
/* 7C03C 0017BF3C D0D15724 */  addiu      $23, $2, %lo(EdEventInfo)
.L0017BF40:
/* 7C040 0017BF40 6487848F */  lw         $4, -0x789C($gp)
/* 7C044 0017BF44 6001A527 */  addiu      $5, $sp, 0x160
/* 7C048 0017BF48 A000998C */  lw         $25, 0xA0($4)
/* 7C04C 0017BF4C A000398F */  lw         $25, 0xA0($25)
/* 7C050 0017BF50 09F82003 */  jalr       $25
/* 7C054 0017BF54 00000000 */   nop
/* 7C058 0017BF58 6401A327 */  addiu      $3, $sp, 0x164
/* 7C05C 0017BF5C 000061C4 */  lwc1       $f1, 0x0($3)
/* 7C060 0017BF60 2041023C */  lui        $2, (0x41200000 >> 16)
/* 7C064 0017BF64 00008244 */  mtc1       $2, $f0
/* 7C068 0017BF68 00000000 */  nop
/* 7C06C 0017BF6C 00080046 */  add.s      $f0, $f1, $f0
/* 7C070 0017BF70 000060E4 */  swc1       $f0, 0x0($3)
/* 7C074 0017BF74 6001A2C7 */  lwc1       $f2, 0x160($sp)
/* 7C078 0017BF78 C842023C */  lui        $2, (0x42C80000 >> 16)
/* 7C07C 0017BF7C 00088244 */  mtc1       $2, $f1
/* 7C080 0017BF80 00000000 */  nop
/* 7C084 0017BF84 01100146 */  sub.s      $f0, $f2, $f1
/* 7C088 0017BF88 8001A0E7 */  swc1       $f0, 0x180($sp)
/* 7C08C 0017BF8C 000063C4 */  lwc1       $f3, 0x0($3)
/* 7C090 0017BF90 01180146 */  sub.s      $f0, $f3, $f1
/* 7C094 0017BF94 8401A0E7 */  swc1       $f0, 0x184($sp)
/* 7C098 0017BF98 6801A4C7 */  lwc1       $f4, 0x168($sp)
/* 7C09C 0017BF9C 01200146 */  sub.s      $f0, $f4, $f1
/* 7C0A0 0017BFA0 8801A0E7 */  swc1       $f0, 0x188($sp)
/* 7C0A4 0017BFA4 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 7C0A8 0017BFA8 8C01A2AF */  sw         $2, 0x18C($sp)
/* 7C0AC 0017BFAC 00080246 */  add.s      $f0, $f1, $f2
/* 7C0B0 0017BFB0 7001A0E7 */  swc1       $f0, 0x170($sp)
/* 7C0B4 0017BFB4 00080346 */  add.s      $f0, $f1, $f3
/* 7C0B8 0017BFB8 7401A0E7 */  swc1       $f0, 0x174($sp)
/* 7C0BC 0017BFBC 00080446 */  add.s      $f0, $f1, $f4
/* 7C0C0 0017BFC0 7801A0E7 */  swc1       $f0, 0x178($sp)
/* 7C0C4 0017BFC4 7C01A2AF */  sw         $2, 0x17C($sp)
/* 7C0C8 0017BFC8 E890848F */  lw         $4, -0x6F18($gp)
/* 7C0CC 0017BFCC 9001A527 */  addiu      $5, $sp, 0x190
/* 7C0D0 0017BFD0 40000624 */  addiu      $6, $0, 0x40
/* 7C0D4 0017BFD4 7001A727 */  addiu      $7, $sp, 0x170
/* 7C0D8 0017BFD8 28460070 */  paddub     $8, $0, $0
/* 7C0DC 0017BFDC A48A060C */  jal        GetNearParts__11CEditGroundFPP9CMapPartsiP7CBoxVu0P7CBoxVu0
/* 7C0E0 0017BFE0 00000000 */   nop
/* 7C0E4 0017BFE4 28F64070 */  paddub     $fp, $2, $0
/* 7C0E8 0017BFE8 6487848F */  lw         $4, -0x789C($gp)
/* 7C0EC 0017BFEC A8DF040C */  jal        ClearPointLight__10CCharacterFv
/* 7C0F0 0017BFF0 00000000 */   nop
/* 7C0F4 0017BFF4 28960070 */  paddub     $18, $0, $0
/* 7C0F8 0017BFF8 6B000010 */  b          .L0017C1A8
/* 7C0FC 0017BFFC 00000000 */   nop
.L0017C000:
/* 7C100 0017C000 80101200 */  sll        $2, $18, 2
/* 7C104 0017C004 21105D00 */  addu       $2, $2, $sp
/* 7C108 0017C008 90015524 */  addiu      $21, $2, 0x190
/* 7C10C 0017C00C 0000A48E */  lw         $4, 0x0($21)
/* 7C110 0017C010 B000938C */  lw         $19, 0xB0($4)
/* 7C114 0017C014 63006012 */  beqz       $19, .L0017C1A4
/* 7C118 0017C018 00000000 */   nop
/* 7C11C 0017C01C 9002A527 */  addiu      $5, $sp, 0x290
/* 7C120 0017C020 EC69060C */  jal        GetPosition__9CMapPartsFPf
/* 7C124 0017C024 00000000 */   nop
/* 7C128 0017C028 28266072 */  paddub     $4, $19, $0
/* 7C12C 0017C02C 9002A527 */  addiu      $5, $sp, 0x290
/* 7C130 0017C030 B89F040C */  jal        SetPosition__6CFrameFPf
/* 7C134 0017C034 00000000 */   nop
/* 7C138 0017C038 0000A48E */  lw         $4, 0x0($21)
/* 7C13C 0017C03C 9002A527 */  addiu      $5, $sp, 0x290
/* 7C140 0017C040 A000998C */  lw         $25, 0xA0($4)
/* 7C144 0017C044 5800398F */  lw         $25, 0x58($25)
/* 7C148 0017C048 09F82003 */  jalr       $25
/* 7C14C 0017C04C 00000000 */   nop
/* 7C150 0017C050 28266072 */  paddub     $4, $19, $0
/* 7C154 0017C054 9002ACC7 */  lwc1       $f12, 0x290($sp)
/* 7C158 0017C058 9402ADC7 */  lwc1       $f13, 0x294($sp)
/* 7C15C 0017C05C 9802AEC7 */  lwc1       $f14, 0x298($sp)
/* 7C160 0017C060 70A3040C */  jal        SetRotation__6CFrameFfff
/* 7C164 0017C064 00000000 */   nop
/* 7C168 0017C068 289E0070 */  paddub     $19, $0, $0
/* 7C16C 0017C06C 4A000010 */  b          .L0017C198
/* 7C170 0017C070 00000000 */   nop
.L0017C074:
/* 7C174 0017C074 0000A38E */  lw         $3, 0x0($21)
/* 7C178 0017C078 80101300 */  sll        $2, $19, 2
/* 7C17C 0017C07C 21104300 */  addu       $2, $2, $3
/* 7C180 0017C080 3802548C */  lw         $20, 0x238($2)
/* 7C184 0017C084 D801428C */  lw         $2, 0x1D8($2)
/* 7C188 0017C088 42004010 */  beqz       $2, .L0017C194
/* 7C18C 0017C08C 00000000 */   nop
/* 7C190 0017C090 40008012 */  beqz       $20, .L0017C194
/* 7C194 0017C094 00000000 */   nop
/* 7C198 0017C098 1000838E */  lw         $3, 0x10($20)
/* 7C19C 0017C09C 01000224 */  addiu      $2, $0, 0x1
/* 7C1A0 0017C0A0 07006210 */  beq        $3, $2, .L0017C0C0
/* 7C1A4 0017C0A4 00000000 */   nop
/* 7C1A8 0017C0A8 03000224 */  addiu      $2, $0, 0x3
/* 7C1AC 0017C0AC 04006210 */  beq        $3, $2, .L0017C0C0
/* 7C1B0 0017C0B0 00000000 */   nop
/* 7C1B4 0017C0B4 02000224 */  addiu      $2, $0, 0x2
/* 7C1B8 0017C0B8 36006214 */  bne        $3, $2, .L0017C194
/* 7C1BC 0017C0BC 00000000 */   nop
.L0017C0C0:
/* 7C1C0 0017C0C0 2000828E */  lw         $2, 0x20($20)
/* 7C1C4 0017C0C4 33004010 */  beqz       $2, .L0017C194
/* 7C1C8 0017C0C8 00000000 */   nop
/* 7C1CC 0017C0CC 28268072 */  paddub     $4, $20, $0
/* 7C1D0 0017C0D0 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7C1D4 0017C0D4 EC9A050C */  jal        CheckEditEffect__FP16EDIT_EFFECT_INFOf
/* 7C1D8 0017C0D8 00000000 */   nop
/* 7C1DC 0017C0DC 2D004010 */  beqz       $2, .L0017C194
/* 7C1E0 0017C0E0 00000000 */   nop
/* 7C1E4 0017C0E4 2000848E */  lw         $4, 0x20($20)
/* 7C1E8 0017C0E8 A002A527 */  addiu      $5, $sp, 0x2A0
/* 7C1EC 0017C0EC 30008626 */  addiu      $6, $20, 0x30
/* 7C1F0 0017C0F0 58A3040C */  jal        GetWorldPosition__6CFrameFPfPf
/* 7C1F4 0017C0F4 00000000 */   nop
/* 7C1F8 0017C0F8 6001A427 */  addiu      $4, $sp, 0x160
/* 7C1FC 0017C0FC A002A527 */  addiu      $5, $sp, 0x2A0
/* 7C200 0017C100 648D040C */  jal        DistVector__FPfPf
/* 7C204 0017C104 00000000 */   nop
/* 7C208 0017C108 06050046 */  mov.s      $f20, $f0
/* 7C20C 0017C10C 2042023C */  lui        $2, (0x42200000 >> 16)
/* 7C210 0017C110 00008244 */  mtc1       $2, $f0
/* 7C214 0017C114 00000000 */  nop
/* 7C218 0017C118 36A00046 */  c.le.s     $f20, $f0
/* 7C21C 0017C11C 00000000 */  nop
/* 7C220 0017C120 1C000045 */  bc1f       .L0017C194
/* 7C224 0017C124 00000000 */   nop
/* 7C228 0017C128 BE11040C */  jal        rand
/* 7C22C 0017C12C 00000000 */   nop
/* 7C230 0017C130 30000324 */  addiu      $3, $0, 0x30
/* 7C234 0017C134 1A004300 */  div        $0, $2, $3
/* 7C238 0017C138 00000000 */  nop
/* 7C23C 0017C13C 00000000 */  nop
/* 7C240 0017C140 10100000 */  mfhi       $2
/* 7C244 0017C144 00008244 */  mtc1       $2, $f0
/* 7C248 0017C148 00000000 */  nop
/* 7C24C 0017C14C 60008046 */  cvt.s.w    $f1, $f0
/* 7C250 0017C150 A042023C */  lui        $2, (0x42A00000 >> 16)
/* 7C254 0017C154 00008244 */  mtc1       $2, $f0
/* 7C258 0017C158 00000000 */  nop
/* 7C25C 0017C15C 80030146 */  add.s      $f14, $f0, $f1
/* 7C260 0017C160 AC02B4E7 */  swc1       $f20, 0x2AC($sp)
/* 7C264 0017C164 0043023C */  lui        $2, (0x43000000 >> 16)
/* 7C268 0017C168 00888244 */  mtc1       $2, $f17
/* 7C26C 0017C16C A040023C */  lui        $2, (0x40A00000 >> 16)
/* 7C270 0017C170 00608244 */  mtc1       $2, $f12
/* 7C274 0017C174 2042023C */  lui        $2, (0x42200000 >> 16)
/* 7C278 0017C178 00688244 */  mtc1       $2, $f13
/* 7C27C 0017C17C 6487848F */  lw         $4, -0x789C($gp)
/* 7C280 0017C180 A002A527 */  addiu      $5, $sp, 0x2A0
/* 7C284 0017C184 C6730046 */  mov.s      $f15, $f14
/* 7C288 0017C188 06740046 */  mov.s      $f16, $f14
/* 7C28C 0017C18C B8DF040C */  jal        SetPointLight__10CCharacterFPfffffff
/* 7C290 0017C190 00000000 */   nop
.L0017C194:
/* 7C294 0017C194 01007326 */  addiu      $19, $19, 0x1
.L0017C198:
/* 7C298 0017C198 1800622A */  slti       $2, $19, 0x18
/* 7C29C 0017C19C B5FF4014 */  bnez       $2, .L0017C074
/* 7C2A0 0017C1A0 00000000 */   nop
.L0017C1A4:
/* 7C2A4 0017C1A4 01005226 */  addiu      $18, $18, 0x1
.L0017C1A8:
/* 7C2A8 0017C1A8 2A105E02 */  slt        $2, $18, $fp
/* 7C2AC 0017C1AC 94FF4014 */  bnez       $2, .L0017C000
/* 7C2B0 0017C1B0 00000000 */   nop
/* 7C2B4 0017C1B4 6487848F */  lw         $4, -0x789C($gp)
/* 7C2B8 0017C1B8 282E0072 */  paddub     $5, $16, $0
/* 7C2BC 0017C1BC 0A000624 */  addiu      $6, $0, 0xA
/* 7C2C0 0017C1C0 D201023C */  lui        $2, %hi(EdVillager)
/* 7C2C4 0017C1C4 905B4724 */  addiu      $7, $2, %lo(EdVillager)
/* 7C2C8 0017C1C8 28462072 */  paddub     $8, $17, $0
/* 7C2CC 0017C1CC 284EC072 */  paddub     $9, $22, $0
/* 7C2D0 0017C1D0 2856E072 */  paddub     $10, $23, $0
/* 7C2D4 0017C1D4 7CC9050C */  jal        EdDrawCharacter__FP10CCharacteriiP12CNPCharacterPiiP13ED_EVENT_INFO
/* 7C2D8 0017C1D8 00000000 */   nop
.L0017C1DC:
/* 7C2DC 0017C1DC 7490828F */  lw         $2, -0x6F8C($gp)
/* 7C2E0 0017C1E0 81004014 */  bnez       $2, .L0017C3E8
/* 7C2E4 0017C1E4 00000000 */   nop
/* 7C2E8 0017C1E8 7090828F */  lw         $2, -0x6F90($gp)
/* 7C2EC 0017C1EC 7E004014 */  bnez       $2, .L0017C3E8
/* 7C2F0 0017C1F0 00000000 */   nop
/* 7C2F4 0017C1F4 B002A427 */  addiu      $4, $sp, 0x2B0
/* 7C2F8 0017C1F8 3003A527 */  addiu      $5, $sp, 0x330
/* 7C2FC 0017C1FC 2CB7040C */  jal        MGGetPLight__FPA4_fPA4_f
/* 7C300 0017C200 00000000 */   nop
/* 7C304 0017C204 F002A427 */  addiu      $4, $sp, 0x2F0
/* 7C308 0017C208 B002A527 */  addiu      $5, $sp, 0x2B0
/* 7C30C 0017C20C 1086040C */  jal        sceVu0CopyMatrix
/* 7C310 0017C210 00000000 */   nop
/* 7C314 0017C214 4040023C */  lui        $2, (0x40400000 >> 16)
/* 7C318 0017C218 00608244 */  mtc1       $2, $f12
/* 7C31C 0017C21C F002A427 */  addiu      $4, $sp, 0x2F0
/* 7C320 0017C220 D41F060C */  jal        EdLimitShadowLight__FPA4_ff
/* 7C324 0017C224 00000000 */   nop
/* 7C328 0017C228 F002A427 */  addiu      $4, $sp, 0x2F0
/* 7C32C 0017C22C 3003A527 */  addiu      $5, $sp, 0x330
/* 7C330 0017C230 08B7040C */  jal        MGSetPLight__FPA4_fPA4_f
/* 7C334 0017C234 00000000 */   nop
/* 7C338 0017C238 C701023C */  lui        $2, %hi(TexManager)
/* 7C33C 0017C23C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7C340 0017C240 D48B858F */  lw         $5, -0x742C($gp)
/* 7C344 0017C244 16000624 */  addiu      $6, $0, 0x16
/* 7C348 0017C248 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 7C34C 0017C24C 00000000 */   nop
/* 7C350 0017C250 2700023C */  lui        $2, %hi(_1724)
/* 7C354 0017C254 30944224 */  addiu      $2, $2, %lo(_1724)
/* 7C358 0017C258 7003A327 */  addiu      $3, $sp, 0x370
/* 7C35C 0017C25C 00004278 */  lq         $2, 0x0($2)
/* 7C360 0017C260 0000627C */  sq         $2, 0x0($3)
/* 7C364 0017C264 6090838F */  lw         $3, -0x6FA0($gp)
/* 7C368 0017C268 0200013C */  lui        $at, (0x20000 >> 16)
/* 7C36C 0017C26C 21086100 */  addu       $at, $3, $at
/* 7C370 0017C270 EC8320C4 */  lwc1       $f0, -0x7C14($at)
/* 7C374 0017C274 7403A0E7 */  swc1       $f0, 0x374($sp)
/* 7C378 0017C278 0200013C */  lui        $at, (0x20000 >> 16)
/* 7C37C 0017C27C 21086100 */  addu       $at, $3, $at
/* 7C380 0017C280 F08320C4 */  lwc1       $f0, -0x7C10($at)
/* 7C384 0017C284 7803A0E7 */  swc1       $f0, 0x378($sp)
/* 7C388 0017C288 BC90828F */  lw         $2, -0x6F44($gp)
/* 7C38C 0017C28C 1A004010 */  beqz       $2, .L0017C2F8
/* 7C390 0017C290 00000000 */   nop
/* 7C394 0017C294 C701023C */  lui        $2, %hi(TexManager)
/* 7C398 0017C298 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7C39C 0017C29C 2A00023C */  lui        $2, %hi(_1838_2)
/* 7C3A0 0017C2A0 98AB4524 */  addiu      $5, $2, %lo(_1838_2)
/* 7C3A4 0017C2A4 FFFF0624 */  addiu      $6, $0, -0x1
/* 7C3A8 0017C2A8 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 7C3AC 0017C2AC 00000000 */   nop
/* 7C3B0 0017C2B0 280044DC */  ld         $4, 0x28($2)
/* 7C3B4 0017C2B4 28C2040C */  jal        MGBeginDrawShadow__F9sceGsTex0
/* 7C3B8 0017C2B8 00000000 */   nop
/* 7C3BC 0017C2BC 00608044 */  mtc1       $0, $f12
/* 7C3C0 0017C2C0 0100023C */  lui        $2, (0x186A0 >> 16)
/* 7C3C4 0017C2C4 A0864234 */  ori        $2, $2, (0x186A0 & 0xFFFF)
/* 7C3C8 0017C2C8 00008244 */  mtc1       $2, $f0
/* 7C3CC 0017C2CC 00000000 */  nop
/* 7C3D0 0017C2D0 60038046 */  cvt.s.w    $f13, $f0
/* 7C3D4 0017C2D4 E890848F */  lw         $4, -0x6F18($gp)
/* 7C3D8 0017C2D8 01000524 */  addiu      $5, $0, 0x1
/* 7C3DC 0017C2DC F88E060C */  jal        DrawShadow__11CEditGroundFiff
/* 7C3E0 0017C2E0 00000000 */   nop
/* 7C3E4 0017C2E4 20000424 */  addiu      $4, $0, 0x20
/* 7C3E8 0017C2E8 CCC2040C */  jal        MGEndDrawShadow__FUc
/* 7C3EC 0017C2EC 00000000 */   nop
/* 7C3F0 0017C2F0 39000010 */  b          .L0017C3D8
/* 7C3F4 0017C2F4 00000000 */   nop
.L0017C2F8:
/* 7C3F8 0017C2F8 0200013C */  lui        $at, (0x20000 >> 16)
/* 7C3FC 0017C2FC 21086100 */  addu       $at, $3, $at
/* 7C400 0017C300 F483228C */  lw         $2, -0x7C0C($at)
/* 7C404 0017C304 17004018 */  blez       $2, .L0017C364
/* 7C408 0017C308 00000000 */   nop
/* 7C40C 0017C30C C701023C */  lui        $2, %hi(TexManager)
/* 7C410 0017C310 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7C414 0017C314 2A00023C */  lui        $2, %hi(_1838_2)
/* 7C418 0017C318 98AB4524 */  addiu      $5, $2, %lo(_1838_2)
/* 7C41C 0017C31C FFFF0624 */  addiu      $6, $0, -0x1
/* 7C420 0017C320 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 7C424 0017C324 00000000 */   nop
/* 7C428 0017C328 280044DC */  ld         $4, 0x28($2)
/* 7C42C 0017C32C 28C2040C */  jal        MGBeginDrawShadow__F9sceGsTex0
/* 7C430 0017C330 00000000 */   nop
/* 7C434 0017C334 E890848F */  lw         $4, -0x6F18($gp)
/* 7C438 0017C338 282E0070 */  paddub     $5, $0, $0
/* 7C43C 0017C33C 7003ACC7 */  lwc1       $f12, 0x370($sp)
/* 7C440 0017C340 7403ADC7 */  lwc1       $f13, 0x374($sp)
/* 7C444 0017C344 F88E060C */  jal        DrawShadow__11CEditGroundFiff
/* 7C448 0017C348 00000000 */   nop
/* 7C44C 0017C34C 6090828F */  lw         $2, -0x6FA0($gp)
/* 7C450 0017C350 0200013C */  lui        $at, (0x20000 >> 16)
/* 7C454 0017C354 21084100 */  addu       $at, $2, $at
/* 7C458 0017C358 F8832490 */  lbu        $4, -0x7C08($at)
/* 7C45C 0017C35C CCC2040C */  jal        MGEndDrawShadow__FUc
/* 7C460 0017C360 00000000 */   nop
.L0017C364:
/* 7C464 0017C364 6090828F */  lw         $2, -0x6FA0($gp)
/* 7C468 0017C368 0200013C */  lui        $at, (0x20000 >> 16)
/* 7C46C 0017C36C 21084100 */  addu       $at, $2, $at
/* 7C470 0017C370 F483228C */  lw         $2, -0x7C0C($at)
/* 7C474 0017C374 02004228 */  slti       $2, $2, 0x2
/* 7C478 0017C378 17004014 */  bnez       $2, .L0017C3D8
/* 7C47C 0017C37C 00000000 */   nop
/* 7C480 0017C380 C701023C */  lui        $2, %hi(TexManager)
/* 7C484 0017C384 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7C488 0017C388 2A00023C */  lui        $2, %hi(_1838_2)
/* 7C48C 0017C38C 98AB4524 */  addiu      $5, $2, %lo(_1838_2)
/* 7C490 0017C390 FFFF0624 */  addiu      $6, $0, -0x1
/* 7C494 0017C394 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 7C498 0017C398 00000000 */   nop
/* 7C49C 0017C39C 280044DC */  ld         $4, 0x28($2)
/* 7C4A0 0017C3A0 28C2040C */  jal        MGBeginDrawShadow__F9sceGsTex0
/* 7C4A4 0017C3A4 00000000 */   nop
/* 7C4A8 0017C3A8 E890848F */  lw         $4, -0x6F18($gp)
/* 7C4AC 0017C3AC 282E0070 */  paddub     $5, $0, $0
/* 7C4B0 0017C3B0 7403ACC7 */  lwc1       $f12, 0x374($sp)
/* 7C4B4 0017C3B4 7803ADC7 */  lwc1       $f13, 0x378($sp)
/* 7C4B8 0017C3B8 F88E060C */  jal        DrawShadow__11CEditGroundFiff
/* 7C4BC 0017C3BC 00000000 */   nop
/* 7C4C0 0017C3C0 6090828F */  lw         $2, -0x6FA0($gp)
/* 7C4C4 0017C3C4 0200013C */  lui        $at, (0x20000 >> 16)
/* 7C4C8 0017C3C8 21084100 */  addu       $at, $2, $at
/* 7C4CC 0017C3CC FC832490 */  lbu        $4, -0x7C04($at)
/* 7C4D0 0017C3D0 CCC2040C */  jal        MGEndDrawShadow__FUc
/* 7C4D4 0017C3D4 00000000 */   nop
.L0017C3D8:
/* 7C4D8 0017C3D8 B002A427 */  addiu      $4, $sp, 0x2B0
/* 7C4DC 0017C3DC 3003A527 */  addiu      $5, $sp, 0x330
/* 7C4E0 0017C3E0 08B7040C */  jal        MGSetPLight__FPA4_fPA4_f
/* 7C4E4 0017C3E4 00000000 */   nop
.L0017C3E8:
/* 7C4E8 0017C3E8 28960070 */  paddub     $18, $0, $0
/* 7C4EC 0017C3EC 15000010 */  b          .L0017C444
/* 7C4F0 0017C3F0 00000000 */   nop
.L0017C3F4:
/* 7C4F4 0017C3F4 1B004626 */  addiu      $6, $18, 0x1B
/* 7C4F8 0017C3F8 C701023C */  lui        $2, %hi(TexManager)
/* 7C4FC 0017C3FC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7C500 0017C400 D48B858F */  lw         $5, -0x742C($gp)
/* 7C504 0017C404 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 7C508 0017C408 00000000 */   nop
/* 7C50C 0017C40C B0110224 */  addiu      $2, $0, 0x11B0
/* 7C510 0017C410 18804202 */  mult       $16, $18, $2
/* 7C514 0017C414 FC90828F */  lw         $2, -0x6F04($gp)
/* 7C518 0017C418 21205000 */  addu       $4, $2, $16
/* 7C51C 0017C41C 1B004526 */  addiu      $5, $18, 0x1B
/* 7C520 0017C420 14E0040C */  jal        TextureAnime__10CCharacterFi
/* 7C524 0017C424 00000000 */   nop
/* 7C528 0017C428 FC90828F */  lw         $2, -0x6F04($gp)
/* 7C52C 0017C42C 21205000 */  addu       $4, $2, $16
/* 7C530 0017C430 A000998C */  lw         $25, 0xA0($4)
/* 7C534 0017C434 AC00398F */  lw         $25, 0xAC($25)
/* 7C538 0017C438 09F82003 */  jalr       $25
/* 7C53C 0017C43C 00000000 */   nop
/* 7C540 0017C440 01005226 */  addiu      $18, $18, 0x1
.L0017C444:
/* 7C544 0017C444 0400422A */  slti       $2, $18, 0x4
/* 7C548 0017C448 EAFF4014 */  bnez       $2, .L0017C3F4
/* 7C54C 0017C44C 00000000 */   nop
/* 7C550 0017C450 7090828F */  lw         $2, -0x6F90($gp)
/* 7C554 0017C454 65004014 */  bnez       $2, .L0017C5EC
/* 7C558 0017C458 00000000 */   nop
/* 7C55C 0017C45C C701023C */  lui        $2, %hi(TexManager)
/* 7C560 0017C460 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7C564 0017C464 D48B858F */  lw         $5, -0x742C($gp)
/* 7C568 0017C468 18000624 */  addiu      $6, $0, 0x18
/* 7C56C 0017C46C 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 7C570 0017C470 00000000 */   nop
/* 7C574 0017C474 D301023C */  lui        $2, %hi(RunEffect)
/* 7C578 0017C478 60444424 */  addiu      $4, $2, %lo(RunEffect)
/* 7C57C 0017C47C 01000524 */  addiu      $5, $0, 0x1
/* 7C580 0017C480 1C8D050C */  jal        Lighting__10CRunEffectFi
/* 7C584 0017C484 00000000 */   nop
/* 7C588 0017C488 D301023C */  lui        $2, %hi(RunEffect)
/* 7C58C 0017C48C 60444424 */  addiu      $4, $2, %lo(RunEffect)
/* 7C590 0017C490 208D050C */  jal        Draw__10CRunEffectFv
/* 7C594 0017C494 00000000 */   nop
/* 7C598 0017C498 6087848F */  lw         $4, -0x78A0($gp)
/* 7C59C 0017C49C 1100812C */  sltiu      $at, $4, 0x11
/* 7C5A0 0017C4A0 4A002010 */  beqz       $at, .L0017C5CC
/* 7C5A4 0017C4A4 00000000 */   nop
/* 7C5A8 0017C4A8 2A00023C */  lui        $2, %hi(_1840)
/* 7C5AC 0017C4AC B0AB4324 */  addiu      $3, $2, %lo(_1840)
/* 7C5B0 0017C4B0 80100400 */  sll        $2, $4, 2
/* 7C5B4 0017C4B4 21104300 */  addu       $2, $2, $3
/* 7C5B8 0017C4B8 0000428C */  lw         $2, 0x0($2)
/* 7C5BC 0017C4BC 08004000 */  jr         $2
/* 7C5C0 0017C4C0 00000000 */   nop
/* 7C5C4 0017C4C4 7C90828F */  lw         $2, -0x6F84($gp)
/* 7C5C8 0017C4C8 35004014 */  bnez       $2, .L0017C5A0
/* 7C5CC 0017C4CC 00000000 */   nop
/* 7C5D0 0017C4D0 449B050C */  jal        EditEffectStep__Fv
/* 7C5D4 0017C4D4 00000000 */   nop
/* 7C5D8 0017C4D8 D201023C */  lui        $2, %hi(EdWind)
/* 7C5DC 0017C4DC 20B54424 */  addiu      $4, $2, %lo(EdWind)
/* 7C5E0 0017C4E0 8003A527 */  addiu      $5, $sp, 0x380
/* 7C5E4 0017C4E4 30ED040C */  jal        GetWind__5CWindFPf
/* 7C5E8 0017C4E8 00000000 */   nop
/* 7C5EC 0017C4EC 8003A427 */  addiu      $4, $sp, 0x380
/* 7C5F0 0017C4F0 CC92050C */  jal        EffectMacroStep__FPf
/* 7C5F4 0017C4F4 00000000 */   nop
/* 7C5F8 0017C4F8 D301023C */  lui        $2, %hi(RunEffect)
/* 7C5FC 0017C4FC 60444424 */  addiu      $4, $2, %lo(RunEffect)
/* 7C600 0017C500 608E050C */  jal        Step__10CRunEffectFv
/* 7C604 0017C504 00000000 */   nop
/* 7C608 0017C508 48908427 */  addiu      $4, $gp, -0x6FB8
/* 7C60C 0017C50C 01000524 */  addiu      $5, $0, 0x1
/* 7C610 0017C510 7C92050C */  jal        Step__12CEffectGroupFi
/* 7C614 0017C514 00000000 */   nop
/* 7C618 0017C518 2090838F */  lw         $3, -0x6FE0($gp)
/* 7C61C 0017C51C 01000224 */  addiu      $2, $0, 0x1
/* 7C620 0017C520 1F006214 */  bne        $3, $2, .L0017C5A0
/* 7C624 0017C524 00000000 */   nop
/* 7C628 0017C528 2700023C */  lui        $2, %hi(_1754)
/* 7C62C 0017C52C 40944224 */  addiu      $2, $2, %lo(_1754)
/* 7C630 0017C530 9003A327 */  addiu      $3, $sp, 0x390
/* 7C634 0017C534 00004278 */  lq         $2, 0x0($2)
/* 7C638 0017C538 0000627C */  sq         $2, 0x0($3)
/* 7C63C 0017C53C 2700023C */  lui        $2, %hi(_1755)
/* 7C640 0017C540 50944224 */  addiu      $2, $2, %lo(_1755)
/* 7C644 0017C544 A003A327 */  addiu      $3, $sp, 0x3A0
/* 7C648 0017C548 00004278 */  lq         $2, 0x0($2)
/* 7C64C 0017C54C 0000627C */  sq         $2, 0x0($3)
/* 7C650 0017C550 28860070 */  paddub     $16, $0, $0
/* 7C654 0017C554 0F000010 */  b          .L0017C594
/* 7C658 0017C558 00000000 */   nop
.L0017C55C:
/* 7C65C 0017C55C 48908427 */  addiu      $4, $gp, -0x6FB8
/* 7C660 0017C560 9003A527 */  addiu      $5, $sp, 0x390
/* 7C664 0017C564 A003A627 */  addiu      $6, $sp, 0x3A0
/* 7C668 0017C568 0A000724 */  addiu      $7, $0, 0xA
/* 7C66C 0017C56C 28460072 */  paddub     $8, $16, $0
/* 7C670 0017C570 C893050C */  jal        EffectWaterSpray__FP12CEffectGroupPfPfii
/* 7C674 0017C574 00000000 */   nop
/* 7C678 0017C578 9003A1C7 */  lwc1       $f1, 0x390($sp)
/* 7C67C 0017C57C A041023C */  lui        $2, (0x41A00000 >> 16)
/* 7C680 0017C580 00008244 */  mtc1       $2, $f0
/* 7C684 0017C584 00000000 */  nop
/* 7C688 0017C588 00080046 */  add.s      $f0, $f1, $f0
/* 7C68C 0017C58C 9003A0E7 */  swc1       $f0, 0x390($sp)
/* 7C690 0017C590 01001026 */  addiu      $16, $16, 0x1
.L0017C594:
/* 7C694 0017C594 0500022A */  slti       $2, $16, 0x5
/* 7C698 0017C598 F0FF4014 */  bnez       $2, .L0017C55C
/* 7C69C 0017C59C 00000000 */   nop
.L0017C5A0:
/* 7C6A0 0017C5A0 789B050C */  jal        EditEffectStep2__Fv
/* 7C6A4 0017C5A4 00000000 */   nop
/* 7C6A8 0017C5A8 E890848F */  lw         $4, -0x6F18($gp)
/* 7C6AC 0017C5AC 0091858F */  lw         $5, -0x6F00($gp)
/* 7C6B0 0017C5B0 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7C6B4 0017C5B4 48908627 */  addiu      $6, $gp, -0x6FB8
/* 7C6B8 0017C5B8 8491060C */  jal        DrawEffect__11CEditGroundFP13CCameraFollowfP12CEffectGroup
/* 7C6BC 0017C5BC 00000000 */   nop
/* 7C6C0 0017C5C0 48908427 */  addiu      $4, $gp, -0x6FB8
/* 7C6C4 0017C5C4 9892050C */  jal        Draw__12CEffectGroupFv
/* 7C6C8 0017C5C8 00000000 */   nop
.L0017C5CC:
/* 7C6CC 0017C5CC BC90828F */  lw         $2, -0x6F44($gp)
/* 7C6D0 0017C5D0 06004014 */  bnez       $2, .L0017C5EC
/* 7C6D4 0017C5D4 00000000 */   nop
/* 7C6D8 0017C5D8 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7C6DC 0017C5DC D301023C */  lui        $2, %hi(SunFrame)
/* 7C6E0 0017C5E0 40574424 */  addiu      $4, $2, %lo(SunFrame)
/* 7C6E4 0017C5E4 8822060C */  jal        EdDrawLensFlare__FfPP6CFrame
/* 7C6E8 0017C5E8 00000000 */   nop
.L0017C5EC:
/* 7C6EC 0017C5EC 6087838F */  lw         $3, -0x78A0($gp)
/* 7C6F0 0017C5F0 0E000224 */  addiu      $2, $0, 0xE
/* 7C6F4 0017C5F4 2A006214 */  bne        $3, $2, .L0017C6A0
/* 7C6F8 0017C5F8 00000000 */   nop
/* 7C6FC 0017C5FC 7462060C */  jal        EdEventSpriteDraw__Fv
/* 7C700 0017C600 00000000 */   nop
/* 7C704 0017C604 E0A2050C */  jal        EBDraw__Fv
/* 7C708 0017C608 00000000 */   nop
/* 7C70C 0017C60C D401013C */  lui        $at, (0x1D40000 >> 16)
/* 7C710 0017C610 D0D4228C */  lw         $2, -0x2B30($at)
/* 7C714 0017C614 22004010 */  beqz       $2, .L0017C6A0
/* 7C718 0017C618 00000000 */   nop
/* 7C71C 0017C61C B003A427 */  addiu      $4, $sp, 0x3B0
/* 7C720 0017C620 D401023C */  lui        $2, %hi(D_1D3D4E0)
/* 7C724 0017C624 E0D44524 */  addiu      $5, $2, %lo(D_1D3D4E0)
/* 7C728 0017C628 0C86040C */  jal        sceVu0CopyVector
/* 7C72C 0017C62C 00000000 */   nop
/* 7C730 0017C630 C003A0AF */  sw         $0, 0x3C0($sp)
/* 7C734 0017C634 C403A0AF */  sw         $0, 0x3C4($sp)
/* 7C738 0017C638 00280224 */  addiu      $2, $0, 0x2800
/* 7C73C 0017C63C C803A2AF */  sw         $2, 0x3C8($sp)
/* 7C740 0017C640 000E0224 */  addiu      $2, $0, 0xE00
/* 7C744 0017C644 CC03A2AF */  sw         $2, 0x3CC($sp)
/* 7C748 0017C648 B003ACC7 */  lwc1       $f12, 0x3B0($sp)
/* 7C74C 0017C64C 2C44040C */  jal        fptosi
/* 7C750 0017C650 00000000 */   nop
/* 7C754 0017C654 FF005230 */  andi       $18, $2, 0xFF
/* 7C758 0017C658 B403ACC7 */  lwc1       $f12, 0x3B4($sp)
/* 7C75C 0017C65C 2C44040C */  jal        fptosi
/* 7C760 0017C660 00000000 */   nop
/* 7C764 0017C664 FF005130 */  andi       $17, $2, 0xFF
/* 7C768 0017C668 B803ACC7 */  lwc1       $f12, 0x3B8($sp)
/* 7C76C 0017C66C 2C44040C */  jal        fptosi
/* 7C770 0017C670 00000000 */   nop
/* 7C774 0017C674 FF005030 */  andi       $16, $2, 0xFF
/* 7C778 0017C678 BC03ACC7 */  lwc1       $f12, 0x3BC($sp)
/* 7C77C 0017C67C 2C44040C */  jal        fptosi
/* 7C780 0017C680 00000000 */   nop
/* 7C784 0017C684 FF004830 */  andi       $8, $2, 0xFF
/* 7C788 0017C688 C003A427 */  addiu      $4, $sp, 0x3C0
/* 7C78C 0017C68C 282E4072 */  paddub     $5, $18, $0
/* 7C790 0017C690 28362072 */  paddub     $6, $17, $0
/* 7C794 0017C694 283E0072 */  paddub     $7, $16, $0
/* 7C798 0017C698 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* 7C79C 0017C69C 00000000 */   nop
.L0017C6A0:
/* 7C7A0 0017C6A0 6087838F */  lw         $3, -0x78A0($gp)
/* 7C7A4 0017C6A4 02000224 */  addiu      $2, $0, 0x2
/* 7C7A8 0017C6A8 03006210 */  beq        $3, $2, .L0017C6B8
/* 7C7AC 0017C6AC 00000000 */   nop
/* 7C7B0 0017C6B0 7CF6050C */  jal        DrawSysGra__Fv
/* 7C7B4 0017C6B4 00000000 */   nop
.L0017C6B8:
/* 7C7B8 0017C6B8 6087838F */  lw         $3, -0x78A0($gp)
/* 7C7BC 0017C6BC 04000224 */  addiu      $2, $0, 0x4
/* 7C7C0 0017C6C0 12006214 */  bne        $3, $2, .L0017C70C
/* 7C7C4 0017C6C4 00000000 */   nop
/* 7C7C8 0017C6C8 6CF2050C */  jal        ParamDraw__Fv
/* 7C7CC 0017C6CC 00000000 */   nop
/* 7C7D0 0017C6D0 C701023C */  lui        $2, %hi(TexManager)
/* 7C7D4 0017C6D4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7C7D8 0017C6D8 D48B858F */  lw         $5, -0x742C($gp)
/* 7C7DC 0017C6DC D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7C7E0 0017C6E0 9CCC268C */  lw         $6, -0x3364($at)
/* 7C7E4 0017C6E4 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 7C7E8 0017C6E8 00000000 */   nop
/* 7C7EC 0017C6EC D201023C */  lui        $2, %hi(EditNameMes)
/* 7C7F0 0017C6F0 50144424 */  addiu      $4, $2, %lo(EditNameMes)
/* 7C7F4 0017C6F4 6437050C */  jal        Step__6ClsMesFv
/* 7C7F8 0017C6F8 00000000 */   nop
/* 7C7FC 0017C6FC D201023C */  lui        $2, %hi(EditNameMes)
/* 7C800 0017C700 50144424 */  addiu      $4, $2, %lo(EditNameMes)
/* 7C804 0017C704 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* 7C808 0017C708 00000000 */   nop
.L0017C70C:
/* 7C80C 0017C70C 6087838F */  lw         $3, -0x78A0($gp)
/* 7C810 0017C710 02000224 */  addiu      $2, $0, 0x2
/* 7C814 0017C714 0A006210 */  beq        $3, $2, .L0017C740
/* 7C818 0017C718 00000000 */   nop
/* 7C81C 0017C71C 10000224 */  addiu      $2, $0, 0x10
/* 7C820 0017C720 07006210 */  beq        $3, $2, .L0017C740
/* 7C824 0017C724 00000000 */   nop
/* 7C828 0017C728 0E000224 */  addiu      $2, $0, 0xE
/* 7C82C 0017C72C 04006210 */  beq        $3, $2, .L0017C740
/* 7C830 0017C730 00000000 */   nop
/* 7C834 0017C734 04000224 */  addiu      $2, $0, 0x4
/* 7C838 0017C738 18006214 */  bne        $3, $2, .L0017C79C
/* 7C83C 0017C73C 00000000 */   nop
.L0017C740:
/* 7C840 0017C740 C701023C */  lui        $2, %hi(TexManager)
/* 7C844 0017C744 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7C848 0017C748 D48B858F */  lw         $5, -0x742C($gp)
/* 7C84C 0017C74C D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7C850 0017C750 9CCC268C */  lw         $6, -0x3364($at)
/* 7C854 0017C754 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 7C858 0017C758 00000000 */   nop
/* 7C85C 0017C75C D201023C */  lui        $2, %hi(EditMes1)
/* 7C860 0017C760 50B54424 */  addiu      $4, $2, %lo(EditMes1)
/* 7C864 0017C764 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* 7C868 0017C768 00000000 */   nop
/* 7C86C 0017C76C 6087838F */  lw         $3, -0x78A0($gp)
/* 7C870 0017C770 0E000224 */  addiu      $2, $0, 0xE
/* 7C874 0017C774 09006214 */  bne        $3, $2, .L0017C79C
/* 7C878 0017C778 00000000 */   nop
/* 7C87C 0017C77C D201023C */  lui        $2, %hi(EditEventMes1)
/* 7C880 0017C780 D0E44424 */  addiu      $4, $2, %lo(EditEventMes1)
/* 7C884 0017C784 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* 7C888 0017C788 00000000 */   nop
/* 7C88C 0017C78C D201023C */  lui        $2, %hi(EditSystemMes)
/* 7C890 0017C790 102C4424 */  addiu      $4, $2, %lo(EditSystemMes)
/* 7C894 0017C794 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* 7C898 0017C798 00000000 */   nop
.L0017C79C:
/* 7C89C 0017C79C 6087838F */  lw         $3, -0x78A0($gp)
/* 7C8A0 0017C7A0 01000224 */  addiu      $2, $0, 0x1
/* 7C8A4 0017C7A4 05006214 */  bne        $3, $2, .L0017C7BC
/* 7C8A8 0017C7A8 00000000 */   nop
/* 7C8AC 0017C7AC 9C3B080C */  jal        MonsterNameDraw__Fv
/* 7C8B0 0017C7B0 00000000 */   nop
/* 7C8B4 0017C7B4 04000010 */  b          .L0017C7C8
/* 7C8B8 0017C7B8 00000000 */   nop
.L0017C7BC:
/* 7C8BC 0017C7BC FFFF0424 */  addiu      $4, $0, -0x1
/* 7C8C0 0017C7C0 643B080C */  jal        MonsterNameMake__Fi
/* 7C8C4 0017C7C4 00000000 */   nop
.L0017C7C8:
/* 7C8C8 0017C7C8 98CD050C */  jal        EdSystemMesStep__Fv
/* 7C8CC 0017C7CC 00000000 */   nop
/* 7C8D0 0017C7D0 D4CD050C */  jal        EdSystemMesDraw__Fv
/* 7C8D4 0017C7D4 00000000 */   nop
/* 7C8D8 0017C7D8 6087838F */  lw         $3, -0x78A0($gp)
/* 7C8DC 0017C7DC 04000224 */  addiu      $2, $0, 0x4
/* 7C8E0 0017C7E0 4E006214 */  bne        $3, $2, .L0017C91C
/* 7C8E4 0017C7E4 00000000 */   nop
/* 7C8E8 0017C7E8 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7C8EC 0017C7EC D09B228C */  lw         $2, -0x6430($at)
/* 7C8F0 0017C7F0 0200412C */  sltiu      $at, $2, 0x2
/* 7C8F4 0017C7F4 49002010 */  beqz       $at, .L0017C91C
/* 7C8F8 0017C7F8 00000000 */   nop
/* 7C8FC 0017C7FC D201023C */  lui        $2, %hi(EditPartsInfo)
/* 7C900 0017C800 F09B4424 */  addiu      $4, $2, %lo(EditPartsInfo)
/* 7C904 0017C804 6C87858F */  lw         $5, -0x7894($gp)
/* 7C908 0017C808 F467060C */  jal        GetPartsInfo__14CEditPartsInfoFi
/* 7C90C 0017C80C 00000000 */   nop
/* 7C910 0017C810 28864070 */  paddub     $16, $2, $0
/* 7C914 0017C814 41000012 */  beqz       $16, .L0017C91C
/* 7C918 0017C818 00000000 */   nop
/* 7C91C 0017C81C 1800048E */  lw         $4, 0x18($16)
/* 7C920 0017C820 0C00028E */  lw         $2, 0xC($16)
/* 7C924 0017C824 23188200 */  subu       $3, $4, $2
/* 7C928 0017C828 80100300 */  sll        $2, $3, 2
/* 7C92C 0017C82C 21184300 */  addu       $3, $2, $3
/* 7C930 0017C830 80100300 */  sll        $2, $3, 2
/* 7C934 0017C834 21106200 */  addu       $2, $3, $2
/* 7C938 0017C838 80100200 */  sll        $2, $2, 2
/* 7C93C 0017C83C 1A004400 */  div        $0, $2, $4
/* 7C940 0017C840 02008014 */  bnez       $4, .L0017C84C
/* 7C944 0017C844 00000000 */   nop
/* 7C948 0017C848 CD010000 */  break      0, 7
.L0017C84C:
/* 7C94C 0017C84C 12880000 */  mflo       $17
/* 7C950 0017C850 A01C0224 */  addiu      $2, $0, 0x1CA0
/* 7C954 0017C854 D003A2AF */  sw         $2, 0x3D0($sp)
/* 7C958 0017C858 F80B0224 */  addiu      $2, $0, 0xBF8
/* 7C95C 0017C85C D403A2AF */  sw         $2, 0x3D4($sp)
/* 7C960 0017C860 80060224 */  addiu      $2, $0, 0x680
/* 7C964 0017C864 D803A2AF */  sw         $2, 0x3D8($sp)
/* 7C968 0017C868 70000224 */  addiu      $2, $0, 0x70
/* 7C96C 0017C86C DC03A2AF */  sw         $2, 0x3DC($sp)
/* 7C970 0017C870 D003A427 */  addiu      $4, $sp, 0x3D0
/* 7C974 0017C874 14000524 */  addiu      $5, $0, 0x14
/* 7C978 0017C878 2836A070 */  paddub     $6, $5, $0
/* 7C97C 0017C87C 283EA070 */  paddub     $7, $5, $0
/* 7C980 0017C880 80000824 */  addiu      $8, $0, 0x80
/* 7C984 0017C884 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* 7C988 0017C888 00000000 */   nop
/* 7C98C 0017C88C C01C0224 */  addiu      $2, $0, 0x1CC0
/* 7C990 0017C890 E003A2AF */  sw         $2, 0x3E0($sp)
/* 7C994 0017C894 080C0224 */  addiu      $2, $0, 0xC08
/* 7C998 0017C898 E403A2AF */  sw         $2, 0x3E4($sp)
/* 7C99C 0017C89C 40060224 */  addiu      $2, $0, 0x640
/* 7C9A0 0017C8A0 E803A2AF */  sw         $2, 0x3E8($sp)
/* 7C9A4 0017C8A4 50000224 */  addiu      $2, $0, 0x50
/* 7C9A8 0017C8A8 EC03A2AF */  sw         $2, 0x3EC($sp)
/* 7C9AC 0017C8AC E003A427 */  addiu      $4, $sp, 0x3E0
/* 7C9B0 0017C8B0 64000524 */  addiu      $5, $0, 0x64
/* 7C9B4 0017C8B4 2836A070 */  paddub     $6, $5, $0
/* 7C9B8 0017C8B8 283EA070 */  paddub     $7, $5, $0
/* 7C9BC 0017C8BC 80000824 */  addiu      $8, $0, 0x80
/* 7C9C0 0017C8C0 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* 7C9C4 0017C8C4 00000000 */   nop
/* 7C9C8 0017C8C8 C01C0224 */  addiu      $2, $0, 0x1CC0
/* 7C9CC 0017C8CC F003A2AF */  sw         $2, 0x3F0($sp)
/* 7C9D0 0017C8D0 080C0224 */  addiu      $2, $0, 0xC08
/* 7C9D4 0017C8D4 F403A2AF */  sw         $2, 0x3F4($sp)
/* 7C9D8 0017C8D8 00111100 */  sll        $2, $17, 4
/* 7C9DC 0017C8DC F803A2AF */  sw         $2, 0x3F8($sp)
/* 7C9E0 0017C8E0 50000224 */  addiu      $2, $0, 0x50
/* 7C9E4 0017C8E4 FC03A2AF */  sw         $2, 0x3FC($sp)
/* 7C9E8 0017C8E8 F003A427 */  addiu      $4, $sp, 0x3F0
/* 7C9EC 0017C8EC B4000524 */  addiu      $5, $0, 0xB4
/* 7C9F0 0017C8F0 64000624 */  addiu      $6, $0, 0x64
/* 7C9F4 0017C8F4 28000724 */  addiu      $7, $0, 0x28
/* 7C9F8 0017C8F8 80000824 */  addiu      $8, $0, 0x80
/* 7C9FC 0017C8FC 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* 7CA00 0017C900 00000000 */   nop
/* 7CA04 0017C904 28260072 */  paddub     $4, $16, $0
/* 7CA08 0017C908 CC010524 */  addiu      $5, $0, 0x1CC
/* 7CA0C 0017C90C 81010624 */  addiu      $6, $0, 0x181
/* 7CA10 0017C910 80000724 */  addiu      $7, $0, 0x80
/* 7CA14 0017C914 BC64080C */  jal        DrawAtraBuildNum__FP14EDITPARTS_INFOiii
/* 7CA18 0017C918 00000000 */   nop
.L0017C91C:
/* 7CA1C 0017C91C 1826060C */  jal        EdFadeInOut__Fv
/* 7CA20 0017C920 00000000 */   nop
/* 7CA24 0017C924 8090838F */  lw         $3, -0x6F80($gp)
/* 7CA28 0017C928 0E006010 */  beqz       $3, .L0017C964
/* 7CA2C 0017C92C 00000000 */   nop
/* 7CA30 0017C930 0004A0AF */  sw         $0, 0x400($sp)
/* 7CA34 0017C934 0404A0AF */  sw         $0, 0x404($sp)
/* 7CA38 0017C938 00280224 */  addiu      $2, $0, 0x2800
/* 7CA3C 0017C93C 0804A2AF */  sw         $2, 0x408($sp)
/* 7CA40 0017C940 000E0224 */  addiu      $2, $0, 0xE00
/* 7CA44 0017C944 0C04A2AF */  sw         $2, 0x40C($sp)
/* 7CA48 0017C948 0004A427 */  addiu      $4, $sp, 0x400
/* 7CA4C 0017C94C 282E0070 */  paddub     $5, $0, $0
/* 7CA50 0017C950 28360070 */  paddub     $6, $0, $0
/* 7CA54 0017C954 283E0070 */  paddub     $7, $0, $0
/* 7CA58 0017C958 80000824 */  addiu      $8, $0, 0x80
/* 7CA5C 0017C95C 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* 7CA60 0017C960 00000000 */   nop
.L0017C964:
/* 7CA64 0017C964 809080AF */  sw         $0, -0x6F80($gp)
.L0017C968:
/* 7CA68 0017C968 B000BF7B */  lq         $31, 0xB0($sp)
/* 7CA6C 0017C96C A000BE7B */  lq         $fp, 0xA0($sp)
/* 7CA70 0017C970 9000B77B */  lq         $23, 0x90($sp)
/* 7CA74 0017C974 8000B67B */  lq         $22, 0x80($sp)
/* 7CA78 0017C978 7000B57B */  lq         $21, 0x70($sp)
/* 7CA7C 0017C97C 6000B47B */  lq         $20, 0x60($sp)
/* 7CA80 0017C980 5000B37B */  lq         $19, 0x50($sp)
/* 7CA84 0017C984 4000B27B */  lq         $18, 0x40($sp)
/* 7CA88 0017C988 3000B17B */  lq         $17, 0x30($sp)
/* 7CA8C 0017C98C 2000B07B */  lq         $16, 0x20($sp)
/* 7CA90 0017C990 1800B6C7 */  lwc1       $f22, 0x18($sp)
/* 7CA94 0017C994 1400B5C7 */  lwc1       $f21, 0x14($sp)
/* 7CA98 0017C998 1000B4C7 */  lwc1       $f20, 0x10($sp)
/* 7CA9C 0017C99C 3004BD27 */  addiu      $sp, $sp, 0x430
/* 7CAA0 0017C9A0 0800E003 */  jr         $31
/* 7CAA4 0017C9A4 00000000 */   nop
/* 7CAA8 0017C9A8 00000000 */  nop
/* 7CAAC 0017C9AC 00000000 */  nop
